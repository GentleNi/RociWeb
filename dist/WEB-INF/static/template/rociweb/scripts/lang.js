$(() => {
    var lang_en = '&#xe79c;',
        lang_zh = '&#xe7a0;'
    $lang = $('.lang-flag')
    $lang.on('click', () => {
        $lang.toggleClass('zh en')
        $lang.html($lang.hasClass('zh') ? lang_zh : lang_en)
    })
})