<#assign menu="headline">
<#assign submenu="add_headline">
<#include "/manage/head.ftl">
<style type="text/css">
    .m-bot15 {
        margin-bottom: 5px;
    }
    .form-control {
        border: 1px solid #E2E2E4;
        box-shadow: none;
        color: #C2C2C2;
    }
    .input-lg {
        border-radius: 6px;
        font-size: 15px;
        height: 40px;
        line-height: 1.33;
        padding: 9px 15px；
    }
</style>
		<!--main content start-->
		<section id="main-content">
            <section class="wrapper">
                <!-- page start-->
                <div class="row">
                    <div class="col-lg-12">
                        <section class="panel">
                            <header class="panel-heading">
                                添加头图（图片尺寸：宽${width}px，高${height}px）
                            </header>
                            <div class="panel-body">
                                <form id="addFolder_form" method="post" class="form-horizontal" autocomplete="off" action="${BASE_PATH}/manage/headline/add.json"
                                      enctype="multipart/form-data">
                                    <fieldset>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">选择图片</label>
                                            <div class="col-sm-10">
                                                <input type="file" name="file"
                                                       id="file" >
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">高度百分比 (0-100)</label>
                                            <div class="col-sm-10">
                                                <input type="text" style="font-size:15px;width: 600px;" class="form-control" name="height"
                                                       placeholder="" id="folderName" >
                                                </input>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">宽度百分比 (0-100)</label>
                                            <div class="col-sm-10">
                                                <input style="font-size:15px;width: 600px;"
                                                       class="form-control" name="width" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">中文名称</label>
                                            <div class="col-sm-10">
                                                <input style="font-size:15px;width: 600px;"
                                                       class="form-control" name="name" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label class="col-sm-2 col-sm-2 control-label">英文名称</label>
                                            <div class="col-sm-10">
                                                <input style="font-size:15px;width: 600px;"
                                                       class="form-control" name="ename" placeholder="">
                                            </div>
                                        </div>
                                        <div class="form-group" style="display: none">
                                            <label class="col-sm-2 col-sm-2 control-label">url</label>
                                            <div class="col-sm-10">
                                                <input style="font-size:15px;width: 600px;"
                                                       class="form-control" name="url" placeholder="ss" value="">
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <div class="col-lg-offset-2 col-lg-10">
                                                <button class="btn btn-danger" type="submit">保存</button>
                                            </div>
                                        </div>
                                    </fieldset>
                                </form>
                            </div>
                        </section>
                    </div>
                </div>
                <!-- page end-->
            </section>
        </section>
		<!--main content end-->
<script type="text/javascript">
    $(function() {
        $('#addFolder_form').ajaxForm({
            dataType : 'json',
            success : function(data) {
                if (data.result) {
                    bootbox.alert("保存成功，将刷新页面", function() {
                        window.location.reload();

                    });
                }else{
                    showErrors($('#addFolder_form'),data.errors);
                }
            }
        });
    });
</script>
<#include "/manage/foot.ftl">