<#assign menu="article">
<#assign submenu="update_article">
<#include "/manage/head.ftl">
<!--main content start-->
<style type="text/css">
    .imgDiv {
        display: inline-block;
        position: relative;
		padding-bottom: 10px;
    }

    .imgDiv .delete {
        position:absolute;
        width:20px;
        height:20px;
        right:0px;
        top:0px;
        z-index:100;
		display: none;
    }
</style>
<script type="text/javascript">
	$(document).ready(init);
	function init() {
		$(".imgDiv").mouseenter(function () {
			$(this).find(".delete").show();
		});

		$(".imgDiv").mouseleave(function () {
			$(this).find(".delete").hide();
		});

	}

    $(document).ready(function(){
        $(".delete").click(function(){
            var mediaId = $(this).prev().attr("data-item");
            $.ajax({
				url:'${BASE_PATH}/manage/media/delete_media.json',
				type:'POST',
				async:'true',
				data:{
				    mediaId:mediaId
				},
				timeout:5000,
                dataType:'json',
				success:function(result){
				    if(result.result){
				        window.location.reload();
					}else{
				        alert("删除失败");
					}
				}

			});
            //htmlobj=$.ajax({url:"/jquery/test1.txt",async:false});
            //$("#myDiv").html(htmlobj.responseText);
        });
    });
</script>

<section id="main-content">
	<section class="wrapper">
		<!-- page start-->
		<form id="update_article_form" class="form-horizontal" action="${BASE_PATH}/manage/article/update.json"  autocomplete="off"  method="post"
			enctype="multipart/form-data">
			<fieldset>
		<div class="row">
			<input type="hidden" name="articleId" value="${article.articleId}">
			<div class="col-lg-12">
				<section class="panel">
					<header class="panel-heading"> 
						修改产品
					</header>
					<div class="panel-body">
	                      <div class="form-group" <#if folderId=3> style="display: none" </#if>>
	                          <label class="col-sm-2 col-sm-2 control-label">图片</label>
                              <div class="col-sm-10">
								  <#list mediaList as media>
									  <div class="imgDiv">
										  <img src="${BASE_PATH}/${media.path}" data-item="${media.mediaId}" alt="img04" style="height:120px;"/>
										  <img src="${BASE_PATH}/static/manage/img/delete.png" class="delete"/>
									  </div>
								  </#list>
	                          	<input type="file" name="file" id="file" multiple="multiple" >
	                          </div>
	                      </div>
 						<#if folderId=3>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">新闻中文标题</label>
							<div class="col-sm-10">
								<input type="text" style="font-size:15px;width: 300px;" class="form-control" name="title" value="${article.title!}"
									   placeholder="" id="title" >
								</input>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-sm-2 control-label">新闻英文标题</label>
							<div class="col-sm-10">
								<input type="text" style="font-size:15px;width: 300px;" class="form-control" name="etitle"value="${article.etitle!}"
									   placeholder="" id="etitle" >
								</input>
							</div>
						</div>
 						</#if>

                        <div class="form-group" style="display: none">
                            <label class="col-sm-2 col-sm-2 control-label">HeadLineId</label>
                            <div class="col-sm-10">
                                <input type="text" style="font-size:15px;width: 300px;" class="form-control" name="headlineId"
                                       placeholder="headlineId" id="headlineId" value="<#if headlineId??>${headlineId}</#if>">
                                </input>
                            </div>
                        </div>

                        <div class="form-group" style="display: none">
                          <label class="col-sm-2 col-sm-2 control-label">目录</label>
                          <div class="col-sm-10">
                              <select class="form-control" name="folderId" style="font-size:15px;width: 300px;">
                              		<#list folderAll as folder>
			                   			<#if folder.owner == "yes">
			                        	<option value="${folder.folderId}" <#if folder.folderId==article.folderId>selected</#if>>
			                        	${folder.pathName}
			                        	</option>
			                        	</#if>
			                        </#list>
	                            </select>			
                          </div>
                        </div>
						<div class="form-group" style="display: none">
                          <label class="col-sm-2 col-sm-2 control-label">摘要</label>
                          <div class="col-sm-10">
                              <input type="text" style="font-size:15px;" class="form-control" name="summary"
                              	placeholder="摘要" id="name" value="${article.summary!}">
                              </input>
                          </div>
                        </div>
						<div class="form-group">
                              <label class="col-sm-2 col-sm-2 control-label">中文内容</label>
                              <div class="col-sm-10">
                                  <script id="content" name="content" type="text/plain"
										style="width: 100%; height: 600px;">${article.content!}</script>
								  <script type="text/javascript">
									var contentEditor;
									$(function() {
										contentEditor = UE.getEditor('content');
									});
								  </script>
                              </div>
                        </div>
                        <div class="form-group">
                            <label class="col-sm-2 col-sm-2 control-label">英文内容</label>
                            <div class="col-sm-10">
                                <script id="econtent" name="econtent" type="text/plain"
                                        style="width: 100%; height: 600px;">${article.econtent!}</script>
                                <script type="text/javascript">
                                var contentEditor;
                                $(function() {
                                    contentEditor = UE.getEditor('econtent');
                                });
                                </script>
                            </div>
                        </div>

                        <div class="form-group">
                          <label class="col-sm-2 col-sm-2 control-label">发布时间</label>
                          <div class="col-sm-10">
                              <input type="text" data-link-format="yyyy-mm-dd" data-date-format="yyyy-MM-dd" style="font-size:15px;" class="js_create_time" name="createTime"
                              	placeholder="发布时间" id="createTime" value="${article.createTime?string("yyyy-MM-dd")}" readonly>
                              </input>
                          </div>
                        </div>

                        <div class="form-group">
                          <label class="col-sm-2 col-sm-2 control-label">文章状态</label>
                          <div class="col-sm-10" style="margin-bottom:10px;">
                          	<input name="status" value="display" type="radio" <#if article.status=="display" || article.status=="init">checked</#if>> 显示
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="status" value="hidden" type="radio" <#if article.status=="hidden">checked</#if>> 隐藏
                          </div>
                        </div>
                        <div class="form-group" style="display: none">
                          <label class="col-sm-2 col-sm-2 control-label">是否需要登录</label>
                          <div class="col-sm-10" style="margin-bottom:10px;">
                          	<input name="login" value="no" type="radio" <#if article.login=="no">checked</#if>> 不需要登录
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<input name="login" value="yes" type="radio"  <#if article.login=="yes">checked</#if>> 需要登录
                          </div>
                        </div>

                        <div class="form-group">
                      	  <div class="col-lg-offset-2 col-lg-10">
                          <button class="btn btn-shadow btn-primary" type="submit">发布</button>
                          </div>
                      </div>
					</div>
				</section>
				<!-- section class="panel">
					<header class="panel-heading"> 附件 </header>
					<div class="panel-body">
						<div id="attachment"></div>
						<button id="file_upload"  class="btn btn-shadow btn-info" type="button"><i class="icon-cloud-upload"></i> 添加附件</button>
					</div>
				</section -->					
			</div>
		</div>
		</fieldset>
		</form>
		<!-- page end-->
	</section>
</section>
<!--main content end-->
<script type="text/javascript">
var kindId = ${article.articleId};
var kind = "article";
$.extend({
	getAttachment:function(){
		$.getJSON("${BASE_PATH}/manage/attachment/list.json?kindId="+kindId+"&v="+Math.random(),function(data){
			$('#attachment').html("");
			$.addAttachment(data.attachmentList);
		});
	},
	addAttachment:function(list){
		var html = '<table class="table"><thead><tr><th>文件名</th><th>大小</th><th>操作</th></tr></thead><tbody>';
		for(i=0;i<list.length;i++){
			var attachment = list[i];
			html += '<tr>';
			html += '<td>'+attachment.name+'</td>';
			html += '<td>'+attachment.size+'</td><td>';
			html += '<a href="javascript:void(0);" title="删除" name="'+attachment.name+'" class="btn btn-danger btn-xs js_delete" attachmentId="'+attachment.attachmentId+'">删除</a> ';
			html += '</td></tr>';
		}
		html += '</tbody></table>';
		$('#attachment').prepend(html);
		$('#attachment .js_delete').click(function(){
			var file = $(this);
			bootbox.confirm("是否要删除【"+$(this).attr("name")+"】文件？", function(result) {
				if (result) {
					$.post("${BASE_PATH}/manage/attachment/delete.json",{'attachmentId':file.attr("attachmentId")},function(data){
						if(data.result){
							$.getAttachment();
						}
					},"json");
				}
			});		
		});
		$('#attachment .js_picture').click(function(){
			$.post("${BASE_PATH}/manage/article/update_picture.json",{'attachmentId':$(this).attr("attachmentId"),'status':$(this).attr("status")},function(data){
				if(data.result){
					$.getAttachment();
				}
			},"json");
		});
		$('#attachment .js_link').click(function(){
			var attachmentId = $(this).attr("attachmentId");
			bootbox.prompt("为此附件增加链接", function(result) {
				if (result !="") {
					$.post("${BASE_PATH}/manage/attachment/update_link.json",{'attachmentId':attachmentId,'link':result},function(data){
						if(data.result){
							$.getAttachment();
						}
					},"json");					
				} 
			});			
		});
	}
});
$(function(){
	$('#update_article_form').ajaxForm({
			dataType : 'json',
			success : function(data) {
				if (data.result) {
					bootbox.alert("保存成功，将刷新页面", function() {
						window.location.reload();
						
					});
				}else{
					showErrors($('#add_article_form'),data.errors);
				}
			}
		});
	$('#file_upload').uploadify({
		'buttonText'  		: 	'请选择文件',
        'swf'         		: 	'${BASE_PATH}/static/manage/assets/uploadify/uploadify.swf',
        'uploader'    		: 	'${BASE_PATH}/manage/attachment/upload.json;jsessionid=${JSESSIONID}',
        'formData'  		: 	{'kindId':kindId,'kind':kind},
        'fileObjName'		: 	'file',
        'fileTypeExts' 		: 	'*.*',
        'method'			:	'post',
        'onUploadSuccess' 	: 	function(file, data, response) {
        	$.getAttachment();
        }
	});
	$.getAttachment();
	$('.js_create_time').datetimepicker({
        language:  'zh-CN',
        format: "yyyy-mm-dd",
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });	
});
</script>
<#include "/manage/foot.ftl">
