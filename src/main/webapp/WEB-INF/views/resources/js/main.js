(function ($) {
    "use strict";

    // Spinner
    var spinner = function () {
        setTimeout(function () {
            if ($('#spinner').length > 0) {
                $('#spinner').removeClass('show');
            }
        }, 1);
    };
    spinner();
    
    
    // Initiate the wowjs
    new WOW().init();


    // Sticky Navbar
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.sticky-top').addClass('shadow-sm').css('top', '0px');
        } else {
            $('.sticky-top').removeClass('shadow-sm').css('top', '-100px');
        }
    });
    
    
    // Back to top button
    $(window).scroll(function () {
        if ($(this).scrollTop() > 300) {
            $('.back-to-top').fadeIn('slow');
        } else {
            $('.back-to-top').fadeOut('slow');
        }
    });
    $('.back-to-top').click(function () {
        $('html, body').animate({scrollTop: 0}, 1500, 'easeInOutExpo');
        return false;
    });


    // Facts counter
    $('[data-toggle="counter-up"]').counterUp({
        delay: 10,
        time: 2000
    });


    // Date and time picker
    $('.date').datetimepicker({
        format: 'L'
    });
    $('.time').datetimepicker({
        format: 'LT'
    });


    // Header carousel
    $(".header-carousel").owlCarousel({
        autoplay: true,
        smartSpeed: 1500,
        loop: true,
        nav: false,
        dots: true,
        items: 1,
        dotsData: true,
    });


    // Testimonials carousel
    $('.testimonial-carousel').owlCarousel({
        autoplay: true,
        smartSpeed: 1000,
        loop: true,
        nav: false,
        dots: true,
        items: 1,
        dotsData: true,
    });
    
    // Scrolling Navbar
    $(document).ready(function(){
     var currentPosition = parseInt($(".quickmenu").css("top"));
     $(window).scroll(function() {
       var position = $(window).scrollTop(); 
       $(".quickmenu").stop().animate({"top":position+currentPosition+"px"},1000);
     });
   });
   
   /* Set the width of the sidebar to 250px and the left margin of the page content to 250px */
   function openNav() {
     document.getElementById("mySidebar").style.width = "250px";
     document.getElementById("main").style.marginLeft = "250px";
   }
   
   /* Set the width of the sidebar to 0 and the left margin of the page content to 0 */
   function closeNav() {
     document.getElementById("mySidebar").style.width = "0";
     document.getElementById("main").style.marginLeft = "0";
   }
   

    
})(jQuery);
