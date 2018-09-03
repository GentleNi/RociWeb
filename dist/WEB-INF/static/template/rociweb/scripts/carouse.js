$(() => {
    var $carouselBox = $('.carousel'),
            $slidesUl = $('.slides-img'),
            $slidesLi = $('.slides-img > li'),
            $slidesNum = $slidesLi.length;
        $index = 1;
        $lock = true;
    var $arrow = $('.arrow') || undefined,
        $next = $('.arrow.next') || undefined,
        $prev = $('.arrow.prev') || undefined;

    $slidesLi.eq($slidesNum - 1).clone().insertBefore($slidesLi.eq(0))
    $slidesUl.append($slidesLi.eq(0).clone())
    $slidesLi = $('.slides-img > li')
    $slidesNum = $slidesLi.length

    auto();

    $slidesLi.each(function (idx) {
        $(this).css('left', $(this).width() * (idx - 1))
    })

    function next() {
        move(-1 * $slidesLi.eq(0).width())
        // $index ++
    }

    function prev() {
        move($slidesLi.eq(0).width())
        // $index --
    }
    function move(pos) {
        if (!$lock) return
        $lock = false
        setTimeout(() => {
            $lock = true
        }, 1000)
        if ($index == 0) {
            tmpidx = $index + $slidesNum-1

            $slidesLi.each(function (idx) {
                // $(this).css('left', $(this).position().left - $slidesUl.width())

                val = (idx - tmpidx) * $(this).width()
                $(this).css('left', val)
            })
            $index += $slidesNum-2
        }
        if ($index == $slidesNum - 1) {
            $slidesLi.each(function (idx) {
                // $(this).css('left', $(this).position().left + $slidesUl.width())

                tmpidx = $index - $slidesNum+1
                val = (idx - tmpidx) * $(this).width()
                $(this).css('left', val)
            })
            $index -= $slidesNum-2
        }
        $slidesLi.each(function (idx) {
            // val = ($(this).position().left + pos) % $(this).width() == 0 ? ($(this).position().left + pos) : (($(this).position().left + pos) - ($(this).position().left + pos) % $(this).width())
            // $(this).animate({left : ($(this).position().left + pos)})
            // console.log('val',val)
            val = (idx - $index) * $(this).width()
            $(this).animate({left : val})
        })
        
        pos > 0 ? $index -- : $index ++
    }

    function play($idx = 0) {
        if (!$lock) return;
        $lock = false;
        $slidesLi.eq($index).slideUp(1500);
        $slidesLi.eq($idx).slideUp(1500, function () {
            $lock = true;
        })
        $index = $idx;
    }
    if($next)
        $next.on('click', function (e) {
            e.preventDefault();
            next();
        })
    if($prev)
        $prev.on('click', function (e) {
            e.preventDefault();
            prev();
        })

    function auto() {
        check = setInterval(next, 1500);
    }

    function fix() {
        setTimeout(function() {next()}, 50)
    }
    window.onresize = fix
    document.body.onresize= fix
    window.addEventListener("resize",fix);
})