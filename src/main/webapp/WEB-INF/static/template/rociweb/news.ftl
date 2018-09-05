<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge,chrome=1">
    <title>ROCI</title>
    <meta charset="utf-8" />
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/site.css">
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/font.css">
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/main.css">
    <link rel="stylesheet" href="${TEMPLATE_BASE_PATH}/styles/news.css">
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
                            <li class="page-collection">
                                <a href="${BASE_PATH}/article/works">
                                    <span>WORKS</span>
                                </a>
                            </li>
                            <li class="page-collection active-link">
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
                                    <a href="${BASE_PATH}/article/change_lan/news"><i class="iconfont lang lang-flag zh ">&#xe7a0;</i></a>
                                    <i class="iconfont" style="font-size:1.5em;color:#fff;margin: 0 -8px;">&#xe610;</i>
                                    <a href="${BASE_PATH}/article/change_lan/news"><i class="iconfont lang lang-flag en">&#xe79c;</i></a>
                                </span>
                            </li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="mobile-menu">
                <a href="${BASE_PATH}/article/change_lan/news"><i class="iconfont lang lang-flag zh ">&#xe7a0;</i></a>
                <i class="iconfont" style="font-size:1.5em;color:#fff;margin: 0 -8px;">&#xe610;</i>
                <a href="${BASE_PATH}/article/change_lan/news"><i class="iconfont lang lang-flag en">&#xe79c;</i></a>
                <i class="iconfont" style="color:#fff;font-size:1.5em;display: block;">&#xe6a9;</i>
            </div>
        </div>
        <div class="wrapper">
        <#list newsList?sort_by("createTime")?reverse  as newsItem>
            <div class="wrapper-item">                
<#--            <div class="image-content">
                    <img src="${TEMPLATE_BASE_PATH}/images/top-07.png" alt="">
                </div>-->
                <div class="info">
                    <div class="sqs-block html-block sqs-block-html" data-block-type="2">
                        <div class="sqs-block-content">
                            <#if  Session["language"]?exists>
                                <#if Session["language"] == "zh-CN">
                                    <p>
                                        <strong>${newsItem.title!}</strong>
                                        </br>${newsItem.createTime?string("yyyy-MM-dd hh:mm")}
                                    </p>
                                    ${newsItem.content!}
                                </#if>
                                <#if Session["language"] == "en">
                                    <p>
                                        <strong>${newsItem.etitle!}</strong>
                                        </br>${newsItem.createTime?string("yyyy-MM-dd hh:mm")}
                                    </p>
                                    ${newsItem.econtent!}
                                </#if>
                            </#if>

                        </div>
                    </div>
                </div>
                <div class="hr-content">
                    <hr>
                </div>
            </div>
        </#list>
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
                    <li class="page-collection">
                        <a href="${BASE_PATH}/article/works">
                            <span>WORKS</span>
                        </a>
                    </li>
                    <li class="page-collection active-link">
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
        function initScreen() {
            innerHeight = window.innerHeight
            innerWidth = document.body.clientWidth
            $('.site-title').css('display', 'table-cell')
            if (innerWidth < 768) {
                $('.mobile-menu').css('display', 'table-cell')
                $('.wrapper').width('90%')
            // } else if (innerWidth < 1600){
            //     $('.mobile-menu').css('display', 'none')
            //     $('.wrapper').width('72%')
            } else {
                $('.mobile-menu').css('display', 'none')
                $('.wrapper').width('72%')
            }
        }
        initScreen()
        window.onresize = initScreen
        document.body.onresize= initScreen
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
