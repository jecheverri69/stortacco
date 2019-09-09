$(document).ready(function () {
    var altura = 100;
    if ($(window).scrollTop() > altura) {
        $('.nav').addClass('snav');
        $('.navlogoBL').addClass('snavlogoBL');
        $('.navlogoVT').addClass('snavlogoVT');
        $('.navuls').addClass('snavuls');
    } else {
        $('.nav').removeClass('snav');
        $('.navlogoBL').removeClass('snavlogoBL');
        $('.navlogoVT').removeClass('snavlogoVT');
        $('.navuls').removeClass('snavuls');
    }
    
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > altura) {
            $('.nav').addClass('snav');
            $('.navlogoBL').addClass('snavlogoBL');
            $('.navlogoVT').addClass('snavlogoVT');
            $('.navuls').addClass('snavuls');
        } else {
            $('.nav').removeClass('snav');
            $('.navlogoBL').removeClass('snavlogoBL');
            $('.navlogoVT').removeClass('snavlogoVT');
            $('.navuls').removeClass('snavuls');
        }
    });
});

$(document).ready(function(){
    var cambio = $("#togglemenu");
    cambio.click(function(){
       $(".navmodu").toggleClass("navactivo");
    });
});