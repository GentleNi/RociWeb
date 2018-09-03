$(()=>{
    region = function(x_r, r1, r2){
        /*
        x_r: 背景图片中心位置比例
        r1: 背景图片长宽
        r2: 容器长宽
        */
        x_t = x_r * r1
        return (x_t-r2/2)/(r1-r2) * 100
    }

    innerHeight = window.innerHeight
    innerWidth = document.body.clientWidth


    $('.fix-nav').each(function(idx) {
        width = $(this).width()
        height = $(this).height()
        x_r = $(this).attr('data-x') / 100
        y_r = $(this).attr('data-y') / 100
        wh_r = $(this).attr('data-r')
        if (innerWidth < 500 & innerHeight > innerWidth) {
            if (wh_r > width/height) {
                $(this).css('background-position-y', '50%')
                $(this).css('background-position-x', region(x_r, height*wh_r, width) + '%')
            }
            else {
                $(this).css('background-position-x', '50%')
                $(this).css('background-position-y', region(y_r, width/wh_r, height) + '%')
            }
        }
        else {
            $(this).css('background-position', '50%')
            $(this).css('background-size', 'cover')
        }
        
    })

    $('#footer a').bind('mouseenter', () => {
        $('#footer a').css('opacity', 0.6)
    })

    $('#footer a').bind('mouseleave', () => {
        $('#footer a').css('opacity', 1)
    })
})