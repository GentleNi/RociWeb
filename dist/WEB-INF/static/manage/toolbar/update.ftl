<#assign menu="folder"> <#assign submenu="update_folder"> <#include
"/manage/head.ftl">
<style type="text/css">
</style>
<!--main content start-->
<section id="main-content">
	<section class="wrapper">
	  <!-- page start-->
	  <div class="row">
	      <div class="col-lg-12">
	          <section class="panel">
	              <header class="panel-heading">
	                	 顶栏和底栏
	              </header>
	              <div class="panel-body">
	                  <form id="update_headline_form" method="post" class="form-horizontal" autocomplete="off" action="${BASE_PATH}/manage/toolbar/update.json"
	                  	enctype="multipart/form-data">
	                  	<fieldset>
	                      <div class="form-group">
	                          <label class="col-sm-2 col-sm-2 control-label">顶栏图片</label>
	                          <div class="col-sm-10">
	                            <img src="<#if toolbar??>${BASE_PATH}/${toolbar.topbar!}</#if>" alt="img04" style="height:80px; width: 800px">
	                          	<input type="file" name="topbar"
	                              	id="topbar" >
	                          </div>
	                      </div>

                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">底栏图片</label>
                                <div class="col-sm-10">
                                    <img src="<#if toolbar??>${BASE_PATH}/${toolbar.footbar!}</#if>" alt="img04" style="height:120px; width: 800px">
                                    <input type="file" name="footbar"
                                           id="footbar" >
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">顶栏高度百分比 (0-100)</label>
                                <div class="col-sm-10">
                                    <input type="text" style="font-size:15px;width: 600px;" class="form-control" name="t_height"
                                           placeholder="" id="t_height" value="${toolbar.tHeight!}" >
                                    </input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">顶栏宽度百分比 (0-100)</label>
                                <div class="col-sm-10">
                                    <input type="text" style="font-size:15px;width: 600px;" class="form-control" name="t_width"
                                           placeholder="" id="t_width" value="${toolbar.tWidth!}" >
                                    </input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">底栏高度百分比 (0-100)</label>
                                <div class="col-sm-10">
                                    <input type="text" style="font-size:15px;width: 600px;" class="form-control" name="f_height"
                                           placeholder="" id="f_height" value="${toolbar.fHeight!}" >
                                    </input>
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-sm-2 col-sm-2 control-label">底栏宽度百分比 (0-100)</label>
                                <div class="col-sm-10">
                                    <input type="text" style="font-size:15px;width: 600px;" class="form-control" name="f_width"
                                           placeholder="" id="f_height" value="${toolbar.fWidth!}" >
                                    </input>
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
		$('#update_headline_form').ajaxForm({
			dataType : 'json',
			beforeSerialize: function($form, options) {
			},			
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
					});
				}else{
					showErrors($('#update_folder_form'),data.errors);
				}
			}
		});
	});	
</script>
<#include "/manage/foot.ftl">
