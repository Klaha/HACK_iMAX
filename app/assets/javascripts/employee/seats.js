$(function(){

    var $available_seats = $('.available');
    //var $form_append = $('#formulario_seats');
    var tickets=0;
    var clickeds=0;
    var ticketsN=0;
    var $clicked_seats;
    var $todo = $('#what-to-do');
    var $buttom_submit = $('#submit_button');
    var $userinputs = $('#user-inputs');
    var $inputTickets1 = $('#tickets-1');
    var $inputTickets2 = $('#tickets-2');
    var $seatsdiv = $('#seats-div');
    //console.log($('#n-tickets'));

    $('#n-tickets').on('keyup',function(){
        tickets = $(this).val();
        clickeds=0;
        //console.log($(this));
        $clicked_seats = $('.seat_clicked');

        if (!$userinputs.hasClass('hidden'))
            $userinputs.addClass('hidden');

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

            if ($seatsdiv.hasClass('hidden'))
                $seatsdiv.removeClass('hidden');

        }
        else{
            $todo.text('Indique el número de entradas.');
            if (!$inputTickets1.hasClass('hidden'))
                $inputTickets1.addClass('hidden');
            if (!$inputTickets2.hasClass('hidden'))
                $inputTickets2.addClass('hidden');

            if (!$seatsdiv.hasClass('hidden'))
                $seatsdiv.addClass('hidden');


            //alert ('Mal numero de tickets');
        }

    });


    $('#input-tickets1').keyup(function(){
        ticketsN = $(this).val();
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
            clickeds--;
            $buttom_submit.attr('type','button');
            $this.removeClass('seat_clicked');
            $this.addClass('available');
            $todo.text('Seleccione los asientos deseados.');
            if (!$userinputs.hasClass('hidden'))
                $userinputs.addClass('hidden');

            if ($inputTickets1.hasClass('hidden')){
                $inputTickets1.removeClass('hidden');
                $inputTickets2.removeClass('hidden');
            }



        } else if (clickeds<tickets){

            if ($this.hasClass('available') && (ticketsN>=0 && ticketsN<=tickets)){
                $this.removeClass('available');
                $this.addClass('seat_clicked');
                clickeds++;
                var res = [];
                if (clickeds==tickets){
                    $buttom_submit.attr('type','submit');
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
                    $userinputs.removeClass('hidden');
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
                    console.log(ticketsN);
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

    var $userNameInput = $('#name-user-input');
    var $userCiInput = $('#ci-user-input');

    $userNameInput.keyup(function(){
        console.log('ci');
        if ($userCiInput.val()!=""){
            if ($buttom_submit.hasClass('hidden'))
                $buttom_submit.removeClass('hidden');
        }
        else
        if (!$buttom_submit.hasClass('hidden'))
            $buttom_submit.addClass('hidden');


    });

    $userCiInput.keyup(function(){
        console.log('ci');
        if ($userNameInput.val()!=""){
            if ($buttom_submit.hasClass('hidden'))
                $buttom_submit.removeClass('hidden');
        }
        else
        if (!$buttom_submit.hasClass('hidden'))
            $buttom_submit.addClass('hidden');


    });

//    continue...


});