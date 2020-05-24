<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set> 
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title>库存列表</title>
		<link rel="stylesheet" />
		<link rel="stylesheet" href="${ctx }/static/css/Site.css" />
		<link rel="stylesheet" href="${ctx }/static/css/zy.all.css" />
		<link rel="stylesheet" href="${ctx }/static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/css/amazeui.min.css" />
	  <link rel="stylesheet" href="${ctx }/static/css/admin.css" />
		<link rel="stylesheet" href="${ctx }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ctx }/static/css/pagination.css" />
	</head>

	<body>
		<div class="dvcontent">

			<div>
				<!--tab start-->
				<div class="tabs">
					<div class="hd">
						<ul>
							<li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">库存管理</li>
							 <li class="" style="box-sizing: initial;-webkit-box-sizing: initial;">添加商品</li>
						</ul>
					</div>
					<div class="bd">
						<ul style="display: block;padding: 20px;">
							<li>
								<!--分页显示角色信息 start-->
								<div id="dv1">
									<table class="table" id="tbRecord">
										<thead>
											<tr>
												<th>库存编号</th>
												<th>商品名称</th>
												<th>商品分类</th>
												<th>商品数量</th>
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											
										</tbody>
									</table>
									<%-- <div id="div_pagination_bottom">
							            <nav aria-label="Page navigation">
							                <ul class="pagination">
							                     <li>
							                         <a href="${ctx}/stock/getStockList?currpage=${pageInfo.pageNum-1}"
							                           aria-label="Previous">
							                             <span aria-hidden="true">&laquo;</span>
							                         </a>
							                     </li>
							                     <c:forEach items="${pageInfo.navigatepageNums }" var="page_Num">
							                         <c:if test="${page_Num == pageInfo.pageNum }">
							                             <li class="active"><a href="#" style="margin-top: 7px;">${ page_Num}</a></li>
							                        </c:if>
							                         <c:if test="${page_Num != pageInfo.pageNum }">
							                            <li>
							                                 <a style="margin-top: 7px;" href="${ctx}/stock/getStockList?currpage=${ page_Num}">${ page_Num}</a>
							                            </li>
							                        </c:if>
							                     </c:forEach>
							                    <li>
							                        <a href="${ctx}/stock/getStockList?currpage=${pageInfo.pageNum+1}"
							                            aria-label="Next">
							                             <span aria-hidden="true">&raquo;</span>
							                         </a>
							                    </li>
							                </ul>
							            </nav>
							        </div> --%>
								</div>
								<!--分页显示角色信息 end-->
							</li>
						</ul>
						<ul class="theme-popbod dform" style="display: none;">
								<div class="am-cf admin-main" style="padding-top: 0px;">
			<!-- content start -->
			
	<div class="am-cf admin-main" style="padding-top: 0px;">
		<!-- content start -->
		<div class="admin-content">
			<div class="admin-content-body">
				
				<div class="am-g">
					<div class="am-u-sm-12 am-u-md-4 am-u-md-push-8">
						
					</div>
					<div class="am-u-sm-12 am-u-md-8 am-u-md-pull-4"
						style="padding-top: 30px;">
						<form class="am-form am-form-horizontal"
							action="" method="post" id="submitForm">
							<div class="am-form-group">
								<label for="productName" class="am-u-sm-3 am-form-label">
									商品名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="productName" required
										placeholder="商品名称" name="productName">
										<small>10字以内...</small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="typeId" class="am-u-sm-3 am-form-label">
								分类</label>
								<div class="am-u-sm-9">
									<select name="typeId" id="typeId1" required>
									</select> <small>群组</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="productNum" class="am-u-sm-3 am-form-label">
									商品数量</label>
								<div class="am-u-sm-9">
									<input type="number" id="productNum" required
										placeholder="商品数量" name="productNum">
										<small>10字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="remarks" class="am-u-sm-3 am-form-label">
									备注</label>
								<div class="am-u-sm-9">
									<textarea class="" rows="5" id="remarks" name="remarks"
										placeholder="输入备注"></textarea>
									<small>250字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input type="submit" class="am-btn am-btn-success" value="添加分类" onclick="btn_save()"/>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		
		</div>
		<!-- content end -->
	</div>
							<!--添加 end-->
						</ul>
					</div>
				</div>
				<!--tab end-->

			</div>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel">
						修改库存信息
					</h4>
				</div>
				<div class="modal-body">
					<form class="am-form am-form-horizontal"
						id="updateForm" method="post">
						<!-- 修改时需要所以到id列的数据,这里设置为隐藏域 -->
						<input type="hidden" name="sid" id="sid" value=""/>
						<div class="am-form-group">
								<label for="editProductName" class="am-u-sm-3 am-form-label">
									商品名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="editProductName" required
										placeholder="商品名称" name="productName">
										<small>10字以内...</small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="typeId" class="am-u-sm-3 am-form-label">
								分类</label>
								<div class="am-u-sm-9">
									<select name="typeId" id="typeId2" required>
									</select> <small>群组</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="editProductNum" class="am-u-sm-3 am-form-label">
									商品数量</label>
								<div class="am-u-sm-9">
									<input type="number" id="editProductNum" required
										placeholder="商品数量" name="productNum">
										<small>10字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="editRemarks" class="am-u-sm-3 am-form-label">
									备注</label>
								<div class="am-u-sm-9">
									<textarea class="" rows="5" id="editRemarks" name="remarks"
										placeholder="输入备注"></textarea>
									<small>250字以内...</small>
								</div>
							</div>
					</form>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">关闭
					</button>
					<button type="button" class="btn btn-primary" onclick="but_update()">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
			
			 <script src="${ctx }/static/js/jquery.min.js" type="text/javascript"></script>
              <script src="${ctx }/static/js/plugs/Jqueryplugs.js" type="text/javascript"></script>
              <script src="${ctx }/static/js/_layout.js"></script>
             <script src="${ctx }/static/js/plugs/jquery.SuperSlide.source.js"></script>
             <script type="text/javascript" src="${ctx }/static/js/bootstrap.min.js"></script>
			<script type="text/javascript" src="${ctx }/static/js/jquery.pagination.js"></script>
			<script>
				var num = 1;
				$(function() {

				 $(".tabs").slide({ trigger: "click" });
				 // 页面一打开的时候就去获得所有的数据
				 $.get("${ctx}/stock/getStockList",function(data){
					 console.log(data);
					 // 将数据设置到页面的table中，遍历json数组，将数据设置到页面元素中
					 $(data.list).each(function(){
						 var newTr = "<tr>"+
								"<td>"+this.sid+"</td>"+
								"<td>"+this.productName+"</td>"+
								"<td>"+this.type.typeName+"</td>"+
								"<td>"+this.productNum+"</td>"+
								'<td class="edit"><button onclick="btn_edit('+this.sid+')" data-toggle="modal" data-target="#myModal"><i class="icon-edit bigger-120"></i>编辑</button></td>'+
								'<td class="delete"><button onclick="btn_delete('+this.sid+')"><i class="icon-trash bigger-120"></i>删除</button></td>'+
							"</tr>";
						// 将创建的新行添加到表格中
						$("#tbRecord").find("tbody").append(newTr);
					 });
					 // 将分页div的内容拼接到这个位置
					 /* var pageDiv = '<div id="div_pagination_bottom">'+
							            '<nav aria-label="Page navigation">'+
					                '<ul class="pagination">'+
					                     "<li>"+
					                         '<a href="${ctx}/stock/getStockList?currpage='+${data.pageNum-1}+'"'+
					                           'aria-label="Previous">'+
					                             '<span aria-hidden="true">&laquo;</span>'+
					                         "</a>"+
					                     "</li>"+
					                     $(data.navigatepageNums).each(function(i){
					                    	 "<li>"+
			                                 '<a style="margin-top: 7px;" href="${ctx}/type/getList?currpage='+${data.pageNum}'+">'+${data.pageNum}+'</a>'+
			                            "</li>"+
					                     }) 
					                    "<li>"+
					                        '<a href="${ctx}/stock/getStockList?currpage='+${data.pageNum+1}+'"'+
					                            'aria-label="Next">'+
					                             '<span aria-hidden="true">&raquo;</span>'+
					                         "</a>"+
					                    "</li>"+
					                "</ul>"+
					            "</nav>"+
					        '</div>';
		        	$("#tbRecord").after(pageDiv); */
				 });
				 
				 // 获得所有的分类信息
				 $.get("${ctx}/stock/getTypeList",function(data){
					 console.log(data);
					 // 将数据设置到页面的table中，遍历json数组，将数据设置到页面元素中
					 $("#typeId1").append("<option value='0'>请选择分类</option>");
					 $("#typeId2").append("<option value='0'>请选择分类</option>");
					 $(data).each(function(){
						 var option = "<option value='"+this.tid+"'>"+this.typeName+"</option>";
						// 将创建的列表项添加到下拉列表中
						$("#typeId1").append(option);
						$("#typeId2").append(option);
					 });
				 });

				});

	
				var btn_save = function() {
					//alert($("#submitForm").serialize());
					$.ajax({
						type: "post",
						url: "${ctx}/stock/addStock",
						data: $("#submitForm").serialize(),
						success: function(data) {
							alert(data.result);
							if(data.result > 0) {
								$.jq_Alert({
									message: "添加成功",
									btnOktext: "确认",
									dialogModal: true,
									btnOkClick: function() {
										location.reload();
									}
								});
							}
						},
						error:function(t){
							alert(t);
						}
					});
					
				}

				// 点击编辑按钮后方法
				var btn_edit = function(id) {
					// 请求根据id查找到当前实体的方法
					$.get("${ctx}/stock/findById",{id:id},function(data){
						console.log(data);
						// 将数据设置到模态框中
						window.setTimeout(function(){
							$("#sid").val(data.sid);
							$("#editProductName").val(data.productName);
							$("#editProductNum").val(data.productNum);
							// 分类默认显示原来的分类名称
							 $.get("${ctx}/stock/getTypeList",function(data1){
								 $(data1).each(function(i){// i代表的是下标，下标从0开始
									 if(data.typeId==this.tid){
										 $("#typeId2").find("option").eq(i+1).attr("selected","selected");
									 }
								 });
							 });
							$("#editRemarks").val(data.remarks);
						},500);
					});
				}
				
				// 删除的方法
				var btn_delete = function(id) {
					$.get("${ctx}/stock/deleteStock",{id:id},function(data){
						if(data.result > 0){
							$.jq_Confirm({
								message: "您确定要删除吗?",
								btnOkClick: function() {
									// 刷新页面
									location.reload();
								}
							});
						}
					});
				}
				
				var but_update = function(){
					$.post("${ctx}/stock/updateStock",$("#updateForm").serialize(),function(data){
						if(data.result > 0){
							// 让模态框隐藏
							$("#myModal").modal("hide");
							$.jq_Confirm({
								message: "修改成功",
								btnOkClick: function() {
									// 刷新页面
									location.reload();
								}
							});
						}
					});
				}
				
			</script>

		</div>
	</body>

</html>