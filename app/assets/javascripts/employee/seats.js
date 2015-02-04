$(function(){

    var $available_seats = $('.available');
    //var $form_append = $('#formulario_seats');
    var tickets=0;
    var clicked_times=0;
    var ticketsN=0;
    var $clicked_seats;
    var $todo = $('#what-to-do');
    var $button_submit = $('#submit_button');
    var $user_inputs = $('#user-inputs');
    var $inputTickets1 = $('#tickets-1');
    var $inputTickets2 = $('#tickets-2');
    var $seats_div = $('#seats-div');
    //console.log($('#n-tickets'));

    $('#n-tickets').on('change',function(){
        tickets = parseInt($(this).val());
        clicked_times=0;
        //console.log($(this));
        $clicked_seats = $('.seat_clicked');

        if (!$user_inputs.hasClass('hidden'))
            $user_inputs.addClass('hidden');

        $.each($clicked_seats,function(i,val){
            //console.log($(val));
            var $seat = $(val);
            $seat.removeClass('seat_clicked');
            $seat.addClass('available');

        });


        if ( tickets>0 && tickets<=$available_seats.length ){

            $todo.text('Seleccione los asientos deseados.');
            if ($inputTickets1.hasClass('hidden'))
                $inputTickets1.removeClass('hidden');
            if ($inputTickets2.hasClass('hidden'))
                $inputTickets2.removeClass('hidden');
            $('#input-tickets1').val(tickets);
            ticketsN = tickets;
            $('#p-tickets1').text(0);

            if ($seats_div.hasClass('hidden'))
                $seats_div.removeClass('hidden');

        }
        else{
            $todo.text('Indique el número de entradas.');
            if (!$inputTickets1.hasClass('hidden'))
                $inputTickets1.addClass('hidden');
            if (!$inputTickets2.hasClass('hidden'))
                $inputTickets2.addClass('hidden');

            if (!$seats_div.hasClass('hidden'))
                $seats_div.addClass('hidden');


            //alert ('Mal numero de tickets');
        }

    });


    $('#input-tickets1').on('change',function(){
        ticketsN = parseInt($(this).val());
        if ( ticketsN>=0 && ticketsN<=tickets){
            $todo.text('Seleccione los asientos deseados.');
            $('#p-tickets1').text(tickets - ticketsN);
        }
        else
        {
            $todo.text('Corrija número de entradas Normales.');
        }

    });


    $available_seats.click(function(){
        var $this = $(this);
        //if (clickeds<tickets && $buttom_submit.attr('type')!='button')
        //    $buttom_submit.attr('type','button');

        if (tickets==0)
            alert('indique cantidad de entradas');
        else if ($this.hasClass('seat_clicked')){
            clicked_times--;
            //$button_submit.attr('type','button');
            $this.removeClass('seat_clicked');
            $this.addClass('available');
            $todo.text('Seleccione los asientos deseados.');
            if (!$user_inputs.hasClass('hidden'))
                $user_inputs.addClass('hidden');

            if ($inputTickets1.hasClass('hidden')){
                $inputTickets1.removeClass('hidden');
                $inputTickets2.removeClass('hidden');
            }



        } else if (clicked_times<tickets){

            if ($this.hasClass('available') && (ticketsN>=0 && ticketsN<=tickets)){
                $this.removeClass('available');
                $this.addClass('seat_clicked');
                clicked_times++;
                var res = [];
                if (clicked_times==tickets){
                    //$button_submit.attr('type','submit');
                    $clicked_seats = $('.seat_clicked');
                    $.each($clicked_seats,function(i,val){
                        res.push($(val).attr('id'));
                    });
                    var i;
                    var straux = "";
                    for (i=0;i<res.length-1;i++){

                        straux+=res[i].split('seat-')[1]+' ';
                    }
                    straux+=res[i].split('seat-')[1];
                    //res = straux.split('seat-')
                    $('#seats_arr').val(straux);
                    //console.log(straux);

                    $todo.text('Indique Datos de Usuario más abajo.');
                    $user_inputs.removeClass('hidden');

                    if ($select_payment.val()=='credit_card'){
                        if ($div_card_payment.hasClass('hidden'))
                            $div_card_payment.removeClass('hidden');

                    }
                    else
                    {
                        if (!$div_card_payment.hasClass('hidden'))
                            $div_card_payment.addClass('hidden');

                    }

                    var price = parseFloat($('#price-shows').text());
                    $('#sub-entradas-N').text('Entradas normales: '+price+' x '+
                    ticketsN+
                    ' = '+
                    price*ticketsN);
                    $('#sub-entradas-E').text('Entradas con Descuento: '+
                    (tickets-ticketsN) +
                    ' x ' +
                    price *0.5 +
                    ' = '+
                    ((tickets-ticketsN)*price)*0.5 );
                    //console.log(ticketsN);
                    $('#total-entradas').text((price*ticketsN)+(price*(tickets-ticketsN))*0.5);
                    if (!$inputTickets1.hasClass('hidden')){
                        $inputTickets1.addClass('hidden');
                        $inputTickets2.addClass('hidden');
                    }
                    //console.log(ticketsN);
                    $('#ticketsN-id').val(ticketsN);

                }
                //console.log(res);

                //if($buttom_submit.attr('type')=="submit"){
                //
                //}
                //else{
                //
                //}
            }
            else{
                if (!(ticketsN>=0 && ticketsN<=tickets))
                    $todo.text('Acomode la cantidad de Entradas básicas para seguir clickeando asientos');
                else
                    alert('Clickea un asiento válido');
                //console.log($this);
            }
        }
        else{
            alert('ya seleccionó la cantidad de entradas deseadas');
        }
    });

// USER INPUTS
    var $userNameInput = $('#name-user-input');
    var $userCiInput = $('#ci-user-input');

    $userNameInput.keyup(function(){
        //console.log('ci');
        if ($userCiInput.val()!=""){
            if ($button_submit.hasClass('hidden') )
                $button_submit.removeClass('hidden');
        }
        else
        if (!$button_submit.hasClass('hidden'))
            $button_submit.addClass('hidden');


    });

    $userCiInput.keyup(function(){
        //console.log('ci');
        if ($userNameInput.val()!=""){
            if ($button_submit.hasClass('hidden') )
                $button_submit.removeClass('hidden');
        }
        else
        if (!$button_submit.hasClass('hidden'))
            $button_submit.addClass('hidden');


    });
    // USER INPUTS END

    //PAYMENT
    var $select_payment=$('#payment_method');
    var $div_card_payment = $('#div-credit-card');
    $select_payment.on("change",function(){
        if ($select_payment.val()=='credit_card'){
            if ($div_card_payment.hasClass('hidden'))
                $div_card_payment.removeClass('hidden');

        }
        else
        {
            if (!$div_card_payment.hasClass('hidden'))
                $div_card_payment.addClass('hidden');

        }
    });


    var $card_fields = $('.credit_card_field');
    var $message_payment = $('#danger-payment');
    $button_submit.on('click',function(){
        if (!$div_card_payment.hasClass('hidden')){
            var count = 0;
            $.each($card_fields,function(i,val) {
                if (count==0){
                    if ($(val).val()==""){
                        count++;
                    }
                }
            });
            if (count==0){
                $button_submit.attr('type','submit');
                $button_submit.trigger('click');
            }
            else{
                $message_payment.text('Faltan Campos de tarjeta de crédito');
            }
        }
        else{
            $button_submit.attr('type','submit');
            $button_submit.trigger('click');
        }
    });

});

//var $card1 = $('#card_number_id');
//var $card2 = $('#card_name_id');
//var $card3 = $('#card_exp_month');
//var $card4 = $('#card_exp_year');
////var aux=0, aux2=0;
//var auxarr = [];
//auxarr.push($card1);
//auxarr.push($card2);
//auxarr.push($card3);
//auxarr.push($card4);
//
// var $card1 = $('#card_number_id');
    //var $card2 = $('#card_name_id');
    //var $card3 = $('#card_exp_month');
    //var $card4 = $('#card_exp_year');
    //var aux=0, aux2=0;
//    //
//    //$card1.onkeyup(function(){
//    //    if ($card1.val().length==10){
//    //        aux++;
//    //        aux2++;
//    //        if (aux==4)
//    //            if ($button_submit.hasClass('hidden'))
//    //                $button_submit.removeClass('hidden');
//    //
//    //    }
//    //    else{
//    //        if (aux2!=0){
//    //            aux2--;
//    //            aux--;
//    //        }
//    //    }
//    //
//    //});
//    //$card2.onkeyup(function(){
//    //    if ($card2.val()!=""){
//    //        aux++;
//    //        aux2++;
//    //        if (aux==4){
//    //            if ($button_submit.hasClass('hidden'))
//    //                $button_submit.removeClass('hidden');
//    //        }
//    //        else{
//    //            if (!$button_submit.hasClass('hidden'))
//    //                $button_submit.addClass('hidden');
//    //        }
//    //    }
//    //    else{
//    //        if (aux2!=0){
//    //            aux2--;
//    //            aux--;
//    //        }
//    //    }
//    //});
//    //$card3.onkeyup(function(){
//    //
//    //});
//    //$card4.onkeyup(function(){
//    //
//    //});
//
//    // PAYMENT END
//
//    // continue...
//
//});