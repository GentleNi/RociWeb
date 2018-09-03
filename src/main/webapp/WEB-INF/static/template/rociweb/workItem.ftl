<#--
<h1>${article.articleId}</h1>
<h1>${article.title}</h1>
<h1>${article.createTime?string("yyyy-MM-dd")}</h1>
<h1>${article.summary}</h1>
${article.content}
-->

<head xmlns="http://www.w3.org/1999/html">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1">
    <title>ROCI</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/site.css">
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/font.css">
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/main.css">
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/workitem.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/slideout/1.0.1/slideout.min.js"></script>
</head>

<body>
<div class="top-content">
    <div class="title-nav-wrapper fix-nav" data-x="${toolbar.tWidth!}" data-y="${toolbar.tHeight!}" data-r="${toolbar.tRatio!}"
         style="background-image: url('${BASE_PATH}/${toolbar.topbar!}');" data-index="0">
        <h1 data-content-field="site-title" class="site-title">
            <a href="${BASE_PATH}/" id="top">
                <img src="${TEMPLATE_BASE_PATH}/images/logo/logo-white.png"
                    class="logo"
                    alt="ROCI | DESIGN">
            </a>
        </h1>
        <!-- <a class="icon-menu" id="mobileMenu"></a> -->
        <!--MAIN NAVIGATION-->
        <div id="desktopNav" data-content-field="navigation-mainNav" data-annotation-alignment="bottom left">
            <nav class="main-nav">
                <div class="nav-wrapper">
                    <ul class="cf">
                        <li class="gallery-collection">
                            <a href="${BASE_PATH}/">
                                <span>TOP</span>
                            </a>
                        </li>
                        <li class="page-collection active-link">
                            <a href="${BASE_PATH}/article/works">
                                <span>WORKS</span>
                            </a>
                        </li>
                        <!--todo-->
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
                                <a href="${BASE_PATH}/article/change_lan/${article.path}"><i class="iconfont lang lang-flag zh ">&#xe7a0;</i></a>
                                <i class="iconfont" style="font-size:1.5em;color:#fff;margin: 0 -8px;">&#xe610;</i>
                                <a href="${BASE_PATH}/article/change_lan/${article.path}"><i class="iconfont lang lang-flag en">&#xe79c;</i></a>                                    
                            </span>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <div class="mobile-menu">
            <a href="${BASE_PATH}/article/change_lan/${article.path}"><i class="iconfont lang lang-flag zh ">&#xe7a0;</i></a>
            <i class="iconfont" style="font-size:1.5em;color:#fff;margin: 0 -8px;">&#xe610;</i>
            <a href="${BASE_PATH}/article/change_lan/${article.path}"><i class="iconfont lang lang-flag en">&#xe79c;</i></a>                                    
            <i class="iconfont" style="color:#fff;font-size:1.5em;display: block;">&#xe6a9;</i>
        </div>
    </div>
    <div class="wrapper">
        <div class="carousel">
            <!-- <div class="arrow-content"> -->
            <!-- <i class="iconfont arrow prev">&#xe65f;</i> -->
            <i class="iconfont arrow prev"></i>
            
            <!-- </div> -->
            <!-- <div class="arrow-content" style="float:right;"> -->
            <!-- <i class="iconfont arrow next">&#xe615;</i> -->
            <i class="iconfont arrow next"></i>            
            <!-- </div> -->
            <ul class="slides-img">
                 <#list mediaList as media>
                     <#if media_index = 0>
                        <li data-index="${media_index!}">
                            <img src="${BASE_PATH}/${media.path!}" alt="">
                        </li>
                     </#if>
                     <#if media_index !=0>
                        <li data-index="${media_index}">
                            <img src="${BASE_PATH}/${media.path!}" alt="">
                        </li>
                     </#if>
                 </#list>
            </ul>
            <!-- <span class="arrow previous-slide" style="top: 335px;"></span> -->
            <!-- <a href="#" class="btn next"><img src="images/next.png" alt=""></a> -->
        </div>
        <div class="info">
            <#if article??>
                <#if  Session["language"]?exists>
                   <#if Session["language"] == "zh-CN">
                       ${article.content!}
                   </#if>
                   <#if Session["language"] == "en">
                       ${article.econtent!}
                   </#if>
                </#if>
            </#if>

        </div>
    </div>

    <footer id="footer" class="fix-nav" data-x="${toolbar.fWidth!}" data-y="${toolbar.fHeight!}" data-r="${toolbar.tRatio!}"
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
                <li class="gallery-collection">
                    <a href="${BASE_PATH}/">
                        <span>TOP</span>
                    </a>
                </li>
                <li class="page-collection active-link">
                    <a href="${BASE_PATH}/article/works">
                        <span>WORKS</span>
                    </a>
                </li>
                <!--todo-->
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
    function loadImg() {
      var h = $('.slides-img > li').eq(0).height()
        if(h < 10) {
            setTimeout(loadImg, 1000)
        }
        else {
          $('.slides-img').height($('.slides-img > li').eq(0).height())
        }
    }
    function initScreen() {
        innerHeight = window.innerHeight
        innerWidth = document.body.clientWidth
        $('.site-title').css('display', 'table-cell')
        if (innerWidth < 768 ) {
            $('.mobile-menu').css('display', 'table-cell')
            $('.wrapper').width('90%')
        } else {
            $('.mobile-menu').css('display', 'none')
            $('.wrapper').width('72%')
        }
        $('.wrapper').width($('.wrapper').width() - 30)
        $('.slides-img > li').width($('.wrapper').width())
        $('.slides-img').width($('.slides-img > li').eq(0).width() * $('.slides-img > li').length)
        $('.slides-img').height($('.slides-img > li').eq(0).height())
        // setTimeout(function() {
        //   $('.slides-img').height($('.slides-img > li').eq(0).height())
        // }, 3000)
        loadImg()
    }
    $('.slides-img > li').width($('.wrapper').width())
    $('.slides-img').width($('.slides-img > li').eq(0).width() * $('.slides-img > li').length)
    initScreen()
    // window.onresize = initScreen
    // document.body.onresize= initScreen
    window.addEventListener("resize",initScreen);
</script>
<script type="text/javascript" >
    var lan="${language}";
    if(lan == "zh-CN"){
        $(".zh").addClass("active-lang");
    }else{
        $(".en").addClass("active-lang");
    }

</script>
</body>

</html>
