$(function() {
    var $mobileMenu = $('.mobile-menu>i:last')
    var mobileMenuBar = function () {
        $('.top-content').stop(true, false).animate({
            "left": -0.8 * innerWidth
        }, 300);
        $('.top-content').css('height', innerHeight + 'px')
        $('.top-content').css('overflow', 'hidden')
        $('.mobile-menu-bar').css('display', 'block')
        $('.mobile-menu-bar').css('width', 0.8 * innerWidth + 'px')

    }
    var hideMobileMenuBar = function () {
        $('.top-content').stop(true, false).animate({
            "left": 0
        }, 300);
        $('.top-content').css('height', 'auto')
        setTimeout(function () {
            $('.mobile-menu-bar').css('display', 'none')
        }, 300)
    }

    $mobileMenu.on('click', function () {
        if ($('.top-content').css('left') == '0px') {
            mobileMenuBar()
        } else {
            hideMobileMenuBar()
        }
    })
})
