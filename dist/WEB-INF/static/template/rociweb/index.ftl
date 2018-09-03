<#--
<h1>Welcome!</h1>
<#list headlineList as headLine>
    <p>${headLine.name}&nbsp;&nbsp;${headLine.picture}&nbsp;&nbsp;<a href="${BASE_PATH}/article/${headLine.url}">${headLine.url}</a>&nbsp;&nbsp;${headLine.createTime?string("yyyy-MM-dd")}</p>
</#list>-->

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1">
    <title>ROCI</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/site.css">
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/font.css">
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/main.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slideout/1.0.1/slideout.min.js"></script>

</head>

<body style="height: -webkit-fill-available;">
<div class="top-content">
    <div class="title-nav-wrapper fix-nav" data-x="${toolbar.tWidth!}" data-y="${toolbar.tHeight!}" data-r="${toolbar.tRatio!}"
         style="background-image: url('${BASE_PATH}/${toolbar.topbar!}');" data-index="0">
        <h1 data-content-field="site-title" class="site-title">
            <a href="${BASE_PATH}/" id="top">
                <img src="${TEMPLATE_BASE_PATH}/images/logo/logo-white.png"
                class="logo"
                    alt="ROCI | DESIGN">
            </a>
            <!-- <i class="iconfont">&#xe7a0;</i> -->
        </h1>
        <!-- <a class="icon-menu" id="mobileMenu"></a> -->
        <!--MAIN NAVIGATION-->
        <div id="desktopNav" data-content-field="navigation-mainNav" data-annotation-alignment="bottom left">
            <nav class="main-nav">
                <div class="nav-wrapper">
                    <ul class="cf">
                        <li class="gallery-collection active-link">
                            <a href="${BASE_PATH}/">
                                <span>TOP</span>
                            </a>
                        </li>
                        <li class="page-collection">
                            <a href="${BASE_PATH}/article/works">
                                <span>WORKS</span>
                            </a>
                        </li>
                        <li class="page-collection">
                            <a href="${BASE_PATH}/article/news">
                                <span>NEWS</span>
                            </a>
                        </li>
                        <li class="page-collection">
                            <a href="${BASE_PATH}/article/about">
                                <span>ABOUT</span>
                            </a>
                        </li>
                        <li class="page-collection">
                                <span class="lang-span">
                                   <a href="${BASE_PATH}/change_lan"><i class="iconfont lang lang-flag zh">&#xe7a0;</i></a>
                                   <i class="iconfont" style="font-size:1.5em;color:#fff;margin: 0 -8px;">&#xe610;</i>
                                   <a href="${BASE_PATH}/change_lan"><i class="iconfont lang lang-flag en">&#xe79c;</i></a>
                                </span>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="mobile-menu">
            <a href="${BASE_PATH}/change_lan"><i class="iconfont lang lang-flag zh">&#xe7a0;</i></a>
            <i class="iconfont" style="font-size:1.5em;color:#fff;margin: 0 -8px;">&#xe610;</i>
            <a href="${BASE_PATH}/change_lan"><i class="iconfont lang lang-flag en">&#xe79c;</i></a>
            <i class="iconfont" style="color:#fff;font-size:1.5em;display: block;">&#xe6a9;</i>
        </div>
    </div>
    <div class="wrapper">
        <div class="carousel">
            <!-- <div class="arrow-content"> -->
            <i class="iconfont arrow prev">&#xe65f;</i>
            <!-- </div> -->
            <!-- <div class="arrow-content" style="float:right;"> -->
            <i class="iconfont arrow next">&#xe615;</i>
            <!-- </div> -->
            <ul class="slides-img">
                <#list headlineList as headLine>
                    <li data-x="${headLine.width!}" data-y="${headLine.height!}" data-r="${headLine.ratio!}" data-index="0" class="show fix-nav" style="background-image: url('${BASE_PATH}/${headLine.picture}');"></li>
                </#list>
            </ul>
            <!-- <span class="arrow previous-slide" style="top: 335px;"></span> -->
            <!-- <a href="#" class="btn next"><img src="images/next.png" alt=""></a> -->
        </div>
    </div>
    <footer id="footer" class="fix-nav" data-x="${toolbar.fWidth!}" data-y="${toolbar.fHeight!}" data-r="${toolbar.fRatio!}"
            style="background-image: url('${BASE_PATH}/${toolbar.footbar!}');" data-index="0">
        <div class="back-to-top-link">
            <a href="#top">
                <span class="arrow"></span>Top</a>
        </div>
        <div class="footer-wrapper">
            <div id="secondaryNav" data-content-field="navigation-secondaryNav">

            </div>
            <div class="sqs-layout sqs-grid-12 columns-12" data-layout-label="Footer Content" data-type="block-field" data-updated-on="1428255459064"
                 id="footerBlocks">
                <div class="row sqs-row">
                    <div class="col sqs-col-12 span-12">
                        <div class="sqs-block html-block sqs-block-html" data-block-type="2">
                            <div class="sqs-block-content">
                                <p class="text-align-center">Copyright (C) 2015&nbsp;DESIGN FOR ROCI All Rights Reserved.</p>
                            </div>
                        </div>
                        <div class="sqs-block socialaccountlinks-v2-block sqs-block-socialaccountlinks-v2" data-block-type="54">
                            <div class="sqs-block-content">

                                <div class="sqs-svg-icon--outer social-icon-alignment-center social-icons-color-white social-icons-size-medium social-icons-shape-circle social-icons-style-knockout">
                                    <nav class="sqs-svg-icon--list">
                                        <a href="http://www.facebook.com/100000892790429" target="_blank" class="sqs-svg-icon--wrapper facebook">
                                            <div>
                                                <svg class="sqs-svg-icon--social" viewBox="0 0 64 64">
                                                    <use class="sqs-use--icon" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#facebook-icon">
                                                        <svg id="facebook-icon" viewBox="0 0 64 64" width="100%" height="100%">
                                                            <path d="M34.1,47V33.3h4.6l0.7-5.3h-5.3v-3.4c0-1.5,0.4-2.6,2.6-2.6l2.8,0v-4.8c-0.5-0.1-2.2-0.2-4.1-0.2 c-4.1,0-6.9,2.5-6.9,7V28H24v5.3h4.6V47H34.1z"></path>
                                                        </svg>
                                                    </use>
                                                    <use class="sqs-use--mask" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#facebook-mask">
                                                        <svg id="facebook-mask" viewBox="0 0 64 64" width="100%" height="100%">
                                                            <path d="M0,0v64h64V0H0z M39.6,22l-2.8,0c-2.2,0-2.6,1.1-2.6,2.6V28h5.3l-0.7,5.3h-4.6V47h-5.5V33.3H24V28h4.6V24 c0-4.6,2.8-7,6.9-7c2,0,3.6,0.1,4.1,0.2V22z"></path>
                                                        </svg>
                                                    </use>
                                                </svg>
                                            </div>
                                        </a>
                                        <a href="https://twitter.com/d_kitagawa" target="_blank" class="sqs-svg-icon--wrapper twitter">
                                            <div>
                                                <svg class="sqs-svg-icon--social" viewBox="0 0 64 64">
                                                    <use class="sqs-use--icon" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#twitter-icon">
                                                        <svg id="twitter-icon" viewBox="0 0 64 64" width="100%" height="100%">
                                                            <path d="M48,22.1c-1.2,0.5-2.4,0.9-3.8,1c1.4-0.8,2.4-2.1,2.9-3.6c-1.3,0.8-2.7,1.3-4.2,1.6 C41.7,19.8,40,19,38.2,19c-3.6,0-6.6,2.9-6.6,6.6c0,0.5,0.1,1,0.2,1.5c-5.5-0.3-10.3-2.9-13.5-6.9c-0.6,1-0.9,2.1-0.9,3.3 c0,2.3,1.2,4.3,2.9,5.5c-1.1,0-2.1-0.3-3-0.8c0,0,0,0.1,0,0.1c0,3.2,2.3,5.8,5.3,6.4c-0.6,0.1-1.1,0.2-1.7,0.2c-0.4,0-0.8,0-1.2-0.1 c0.8,2.6,3.3,4.5,6.1,4.6c-2.2,1.8-5.1,2.8-8.2,2.8c-0.5,0-1.1,0-1.6-0.1c2.9,1.9,6.4,2.9,10.1,2.9c12.1,0,18.7-10,18.7-18.7 c0-0.3,0-0.6,0-0.8C46,24.5,47.1,23.4,48,22.1z"></path>
                                                        </svg>
                                                    </use>
                                                    <use class="sqs-use--mask" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#twitter-mask">
                                                        <svg id="twitter-mask" viewBox="0 0 64 64" width="100%" height="100%">
                                                            <path d="M0,0v64h64V0H0z M44.7,25.5c0,0.3,0,0.6,0,0.8C44.7,35,38.1,45,26.1,45c-3.7,0-7.2-1.1-10.1-2.9 c0.5,0.1,1,0.1,1.6,0.1c3.1,0,5.9-1,8.2-2.8c-2.9-0.1-5.3-2-6.1-4.6c0.4,0.1,0.8,0.1,1.2,0.1c0.6,0,1.2-0.1,1.7-0.2 c-3-0.6-5.3-3.3-5.3-6.4c0,0,0-0.1,0-0.1c0.9,0.5,1.9,0.8,3,0.8c-1.8-1.2-2.9-3.2-2.9-5.5c0-1.2,0.3-2.3,0.9-3.3 c3.2,4,8.1,6.6,13.5,6.9c-0.1-0.5-0.2-1-0.2-1.5c0-3.6,2.9-6.6,6.6-6.6c1.9,0,3.6,0.8,4.8,2.1c1.5-0.3,2.9-0.8,4.2-1.6 c-0.5,1.5-1.5,2.8-2.9,3.6c1.3-0.2,2.6-0.5,3.8-1C47.1,23.4,46,24.5,44.7,25.5z"></path>
                                                        </svg>
                                                    </use>
                                                </svg>
                                            </div>
                                        </a>
                                        <a href="http://instagram.com/d_kitagawa" target="_blank" class="sqs-svg-icon--wrapper instagram">
                                            <div>
                                                <svg class="sqs-svg-icon--social" viewBox="0 0 64 64">
                                                    <use class="sqs-use--icon" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#instagram-icon">
                                                        <svg id="instagram-icon" viewBox="0 0 64 64" width="100%" height="100%">
                                                            <path d="M46.91,25.816c-0.073-1.597-0.326-2.687-0.697-3.641c-0.383-0.986-0.896-1.823-1.73-2.657c-0.834-0.834-1.67-1.347-2.657-1.73c-0.954-0.371-2.045-0.624-3.641-0.697C36.585,17.017,36.074,17,32,17s-4.585,0.017-6.184,0.09c-1.597,0.073-2.687,0.326-3.641,0.697c-0.986,0.383-1.823,0.896-2.657,1.73c-0.834,0.834-1.347,1.67-1.73,2.657c-0.371,0.954-0.624,2.045-0.697,3.641C17.017,27.415,17,27.926,17,32c0,4.074,0.017,4.585,0.09,6.184c0.073,1.597,0.326,2.687,0.697,3.641c0.383,0.986,0.896,1.823,1.73,2.657c0.834,0.834,1.67,1.347,2.657,1.73c0.954,0.371,2.045,0.624,3.641,0.697C27.415,46.983,27.926,47,32,47s4.585-0.017,6.184-0.09c1.597-0.073,2.687-0.326,3.641-0.697c0.986-0.383,1.823-0.896,2.657-1.73c0.834-0.834,1.347-1.67,1.73-2.657c0.371-0.954,0.624-2.045,0.697-3.641C46.983,36.585,47,36.074,47,32S46.983,27.415,46.91,25.816z M44.21,38.061c-0.067,1.462-0.311,2.257-0.516,2.785c-0.272,0.7-0.597,1.2-1.122,1.725c-0.525,0.525-1.025,0.85-1.725,1.122c-0.529,0.205-1.323,0.45-2.785,0.516c-1.581,0.072-2.056,0.087-6.061,0.087s-4.48-0.015-6.061-0.087c-1.462-0.067-2.257-0.311-2.785-0.516c-0.7-0.272-1.2-0.597-1.725-1.122c-0.525-0.525-0.85-1.025-1.122-1.725c-0.205-0.529-0.45-1.323-0.516-2.785c-0.072-1.582-0.087-2.056-0.087-6.061s0.015-4.48,0.087-6.061c0.067-1.462,0.311-2.257,0.516-2.785c0.272-0.7,0.597-1.2,1.122-1.725c0.525-0.525,1.025-0.85,1.725-1.122c0.529-0.205,1.323-0.45,2.785-0.516c1.582-0.072,2.056-0.087,6.061-0.087s4.48,0.015,6.061,0.087c1.462,0.067,2.257,0.311,2.785,0.516c0.7,0.272,1.2,0.597,1.725,1.122c0.525,0.525,0.85,1.025,1.122,1.725c0.205,0.529,0.45,1.323,0.516,2.785c0.072,1.582,0.087,2.056,0.087,6.061S44.282,36.48,44.21,38.061z M32,24.297c-4.254,0-7.703,3.449-7.703,7.703c0,4.254,3.449,7.703,7.703,7.703c4.254,0,7.703-3.449,7.703-7.703C39.703,27.746,36.254,24.297,32,24.297z M32,37c-2.761,0-5-2.239-5-5c0-2.761,2.239-5,5-5s5,2.239,5,5C37,34.761,34.761,37,32,37z M40.007,22.193c-0.994,0-1.8,0.806-1.8,1.8c0,0.994,0.806,1.8,1.8,1.8c0.994,0,1.8-0.806,1.8-1.8C41.807,22.999,41.001,22.193,40.007,22.193z"></path>
                                                        </svg>
                                                    </use>
                                                    <use class="sqs-use--mask" xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#instagram-mask">
                                                        <svg id="instagram-mask" viewBox="0 0 64 64" width="100%" height="100%">
                                                            <path d="M43.693,23.153c-0.272-0.7-0.597-1.2-1.122-1.725c-0.525-0.525-1.025-0.85-1.725-1.122c-0.529-0.205-1.323-0.45-2.785-0.517c-1.582-0.072-2.056-0.087-6.061-0.087s-4.48,0.015-6.061,0.087c-1.462,0.067-2.257,0.311-2.785,0.517c-0.7,0.272-1.2,0.597-1.725,1.122c-0.525,0.525-0.85,1.025-1.122,1.725c-0.205,0.529-0.45,1.323-0.516,2.785c-0.072,1.582-0.087,2.056-0.087,6.061s0.015,4.48,0.087,6.061c0.067,1.462,0.311,2.257,0.516,2.785c0.272,0.7,0.597,1.2,1.122,1.725s1.025,0.85,1.725,1.122c0.529,0.205,1.323,0.45,2.785,0.516c1.581,0.072,2.056,0.087,6.061,0.087s4.48-0.015,6.061-0.087c1.462-0.067,2.257-0.311,2.785-0.516c0.7-0.272,1.2-0.597,1.725-1.122s0.85-1.025,1.122-1.725c0.205-0.529,0.45-1.323,0.516-2.785c0.072-1.582,0.087-2.056,0.087-6.061s-0.015-4.48-0.087-6.061C44.143,24.476,43.899,23.682,43.693,23.153z M32,39.703c-4.254,0-7.703-3.449-7.703-7.703s3.449-7.703,7.703-7.703s7.703,3.449,7.703,7.703S36.254,39.703,32,39.703z M40.007,25.793c-0.994,0-1.8-0.806-1.8-1.8c0-0.994,0.806-1.8,1.8-1.8c0.994,0,1.8,0.806,1.8,1.8C41.807,24.987,41.001,25.793,40.007,25.793z M0,0v64h64V0H0z M46.91,38.184c-0.073,1.597-0.326,2.687-0.697,3.641c-0.383,0.986-0.896,1.823-1.73,2.657c-0.834,0.834-1.67,1.347-2.657,1.73c-0.954,0.371-2.044,0.624-3.641,0.697C36.585,46.983,36.074,47,32,47s-4.585-0.017-6.184-0.09c-1.597-0.073-2.687-0.326-3.641-0.697c-0.986-0.383-1.823-0.896-2.657-1.73c-0.834-0.834-1.347-1.67-1.73-2.657c-0.371-0.954-0.624-2.044-0.697-3.641C17.017,36.585,17,36.074,17,32c0-4.074,0.017-4.585,0.09-6.185c0.073-1.597,0.326-2.687,0.697-3.641c0.383-0.986,0.896-1.823,1.73-2.657c0.834-0.834,1.67-1.347,2.657-1.73c0.954-0.371,2.045-0.624,3.641-0.697C27.415,17.017,27.926,17,32,17s4.585,0.017,6.184,0.09c1.597,0.073,2.687,0.326,3.641,0.697c0.986,0.383,1.823,0.896,2.657,1.73c0.834,0.834,1.347,1.67,1.73,2.657c0.371,0.954,0.624,2.044,0.697,3.641C46.983,27.415,47,27.926,47,32C47,36.074,46.983,36.585,46.91,38.184z M32,27c-2.761,0-5,2.239-5,5s2.239,5,5,5s5-2.239,5-5S34.761,27,32,27z"></path>
                                                        </svg>
                                                    </use>
                                                </svg>
                                            </div>
                                        </a>
                                    </nav>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
</div>
<div class="mobile-menu-bar">
    <nav class="main-nav">
        <div class="nav-wrapper">
            <ul class="mobile-menu-items">
                <li class="gallery-collection active-link">
                    <a href="${BASE_PATH}/">
                        <span>TOP</span>
                    </a>
                </li>
                <li class="page-collection">
                    <a href="${BASE_PATH}/article/works">
                        <span>WORKS</span>
                    </a>
                </li>
                <li class="page-collection">
                <!--todo-->
                    <a href="${BASE_PATH}/article/news">
                        <span>NEWS</span>
                    </a>
                </li>
                <li class="page-collection">
                    <a href="${BASE_PATH}/article/about">
                        <span>ABOUT</span>
                    </a>
                </li>
            </ul>
        </div>
    </nav>
</div>
<script src="https://cdn.bootcss.com/jquery/2.0.0/jquery.min.js"></script>
<script src="${TEMPLATE_BASE_PATH}/scripts/mobileMenu.js"></script>
<script src="${TEMPLATE_BASE_PATH}/scripts/carouse.js"></script>
<script src="${TEMPLATE_BASE_PATH}/scripts/lang.js"></script>
<script src="${TEMPLATE_BASE_PATH}/scripts/nav.js"></script>


<script>
    var innerHeight = $(window.top).height()
    var innerWidth = document.body.clientWidth
    var $carouselBox = $('.carousel'),
            $arrow = $('.arrow');

    // 初始化
    region = function(x_r, r1, r2){
        /*
        x_r: 背景图片中心位置比例
        r1: 背景图片长宽
        r2: 容器长宽
        */
        x_t = x_r * r1
        return (x_t-r2/2)/(r1-r2) * 100
    }

    var initScreen = function () {
        innerHeight = $(window.top).height()
        innerWidth = document.body.clientWidth
        $carouselBox.width(innerWidth)
        $arrow.css('padding-top', innerHeight / 2.2 + 'px')
        $arrow.css('width', innerWidth / 2.5 + 'px')
        $('.site-title').css('display', 'table-cell')
        $carouselBox.height(innerHeight - $('.title-nav-wrapper').outerHeight())
        $('.slides-img > li').width(innerWidth)
        $('.slides-img').width(innerWidth * $('.slides-img > li').length)

        if (innerWidth < 500 & innerHeight > innerWidth) {
            $('.mobile-menu').css('display', 'table-cell')
        } else {
            $('.mobile-menu').css('display', 'none')
        }

        slide_width = $('.slides-img > li').width()
        slide_height = $('.slides-img > li').height()
        contain_wh = slide_width/slide_height
        $('.slides-img > li').each(function(idx) {slide_width
            x_r = $(this).attr('data-x') / 100
            y_r = $(this).attr('data-y') / 100
            wh_r = $(this).attr('data-r')
            if (innerWidth < 768 & innerHeight > innerWidth) {
                if (wh_r > contain_wh) {
                    $(this).css('background-position-y', '50%')
                    $(this).css('background-position-x', region(x_r, slide_height*wh_r, slide_width) + '%')
                }
                else {
                    $(this).css('background-position-x', '50%')
                    $(this).css('background-position-y', region(y_r, slide_width/wh_r, slide_height) + '%')
                }
            }
            else {
                $(this).css('background-position', '50%')
                $(this).css('background-size', 'cover')
            }

        })
    }

    $carouselBox.height(innerHeight - $('.title-nav-wrapper').outerHeight())
    $('.slides-img > li').width(innerWidth)
    $('.slides-img').width(innerWidth * $('.slides-img > li').length)
    initScreen()
    
    window.onresize = initScreen
    document.body.onresize= initScreen
    window.addEventListener("resize",initScreen);
</script>
<script type="text/javascript">
    var lan="${language}";
    if(lan == "zh-CN"){
        $(".zh").addClass("active-lang");
    }else{
        $(".en").addClass("active-lang");
    }
</script>
</body>

</html>