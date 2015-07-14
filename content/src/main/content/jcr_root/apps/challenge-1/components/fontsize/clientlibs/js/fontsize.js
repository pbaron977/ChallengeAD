jQuery(function($) {
$(document).ready(function() {
    $('#fontplus').click(function(){   
        currentSize= parseInt($('#content').css('font-size')) + 2;
            if(currentSize<=20)
                $('#content').css('font-size', currentSize);
    }); 
    $('#fontminus').click(function(){   
        currentSize= parseInt($('#content').css('font-size')) - 2;
            if(currentSize>=12)
                $('#content').css('font-size', currentSize);
    });
});
});