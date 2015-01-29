$(function(){

    var $available_seats = $('.available');
    //var $form_append = $('#formulario_seats');
    var tickets=0;
    var clickeds=0;
    var $clicked_seats;
    //console.log($('#n-tickets'));
    $('#n-tickets').on('focusout',function(){
        tickets = $(this).val();
        clickeds=0;
        //console.log($(this));
        $clicked_seats = $('.seat_clicked');

        $.each($clicked_seats,function(i,val){
           //console.log($(val));
            var $seat = $(val);
            $seat.removeClass('seat_clicked');
            $seat.addClass('available');

        });


        if ( tickets>0 && tickets<=$available_seats.length ){

            //vieja solución con muchos inputs

            //$('.seats_input').remove();
            //for (var i=0; i<tickets;i++){
            //    input = $('<input>');
            //    input.addClass('seats_input');
            //    input.attr('type','hidden');
            //
            //    $form_append.append(input);
            //}
        }
        else{
            alert ('Mal numero de tickets');

        }

    });
    var $buttom_submit = $('#submit_button');
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
        } else if (clickeds<tickets){

            if ($this.hasClass('available')){
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
                        straux+=res[i]+",";
                    }
                    straux+=res[i];
                    $('#seats_arr').val(straux);
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
                alert('Clickea un asiento válido');
                //console.log($this);
            }
        }
        else{
            alert('ya seleccionó la cantidad de entradas deseadas');
        }
    });
});