$().ready(function(){

    var $available_seats = $('.available');
    var $form_append = $('#formulario_seats');
    $('#n-entradas').focusout(function(){
        var entradas = $(this).val();

        if ( entradas>0 && entradas<=$available_seats.length ){
            $('.seats_input').remove();
            for (var i=0; i<entradas;i++){
                input = $('<input>');
                input.addClass('seats_input');
                input.attr('type','hidden');

                $form_append.append(input);
            }
        }
        else{
            alert ('Mal numero de entradas');

        }

    });

    $available_seats.click(function(){

    });
});