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
                                        <a href="https://weibo.com/3672668710/manage " target="_blank" class="sqs-svg-icon--wrapper instagram foot-link">
                                            <!-- <i class="iconfont">&#xe618;</i> -->
                                            <img src="${TEMPLATE_BASE_PATH}/images/logo/weibo.png" alt="weibo" style="height: 32px;">
                                        </a>
                                        <a href="https://mp.weixin.qq.com/s/fToQLkCQ017WECrRpugQMw  " target="_blank" class="sqs-svg-icon--wrapper instagram foot-link">
                                            <!-- <i class="iconfont">&#xe63f;</i> -->
                                            <img src="${TEMPLATE_BASE_PATH}/images/logo/wechat.png" alt="wechat" style="height: 32px;">
                                        </a>
                                        <a href="https://www.instagram.com/roci_design/ " target="_blank" class="sqs-svg-icon--wrapper instagram foot-link">
                                            <!-- <i class="iconfont">&#xe6c0;</i> -->
                                            <img src="${TEMPLATE_BASE_PATH}/images/logo/ins.png" alt="ins" style="height: 32px;">
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

        if(window.innerWidth > document.body.clientWidth) {
           innerWidth =  document.body.clientWidth;
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