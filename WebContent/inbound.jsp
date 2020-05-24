<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
    <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
<!DOCTYPE html>
<html>

	<head>
		<meta charset="UTF-8">
		<title></title>
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
				<div class="tabs" style="margin: 30px;">
					<div class="hd">
						<ul>
							<li class="on" style="box-sizing: initial;-webkit-box-sizing: initial;">入库记录</li>
							 <li class="" style="box-sizing: initial;-webkit-box-sizing: initial;">商品入库</li>
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
												<th>编号</th>
												<th>商品名称</th>
												<th>商品分类</th>
												<th>入库数量 </th>
												<th>入库日期</th>
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
										<c:forEach items="${pageInfo.list }" var="inbound">
											<tr>
												<td>${inbound.inId }</td>
												<td>${inbound.productName }</td>
												<td>${inbound.type.typeName }</td>
												<td>${inbound.wareNum}</td>
												<td>
												<fmt:formatDate value="${inbound.wareDate }" pattern="yyyy-MM-dd"/>
												</td>
												<td class="edit"><button onclick="btn_edit(${inbound.inId })"><i class="icon-edit bigger-120" data-toggle="modal" data-target="#myModal"></i>编辑</button></td>
												<td class="delete"><button onclick="btn_delete(${inbound.inId })"><i class="icon-trash bigger-120"></i>删除</button></td>
											</tr>
									</c:forEach>
										</tbody>
									</table>
										<div id="div_pagination_bottom">
            <nav aria-label="Page navigation">
                <ul class="pagination">
                     <li>
                         <a href="${ctx}/inbound/getInboundList?currpage=${pageInfo.pageNum-1}"
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
                                 <a style="margin-top: 7px;" href="${ctx}/inbound/getInboundList?currpage=${ page_Num}">${ page_Num}</a>
                            </li>
                        </c:if>
                     </c:forEach>
                    <li>
                        <a href="${ctx}/inbound/getInboundList?currpage=${pageInfo.pageNum+1}"
                            aria-label="Next">
                             <span aria-hidden="true">&raquo;</span>
                         </a>
                    </li>
                </ul>
            </nav>
        </div>	
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
							action="addInbound" method="post" id="submitForm">
							<div class="am-form-group">
								<label for="typeId" class="am-u-sm-3 am-form-label">
								分类</label>
								<div class="am-u-sm-9">
									<select name="typeId" id="typeId" required>
									<option value="0">请选择</option> 
									<c:forEach items="${list1}" var="type">
										<option value="${type.tid }">${type.typeName }</option> 
									</c:forEach>
									</select> <small>分类</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="productName" id="productName" class="am-u-sm-3 am-form-label">
							商品名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="productName" required
										placeholder="商品名称" name="productName">
										<small>10字以内...</small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="wareNum" class="am-u-sm-3 am-form-label">
									数量</label>
								<div class="am-u-sm-9">
									<input type="number" id="wareNum" required
										placeholder="数量" name="wareNum">
										<small>数量</small>
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
									<input type="submit" class="am-btn am-btn-success" value="添加分类" />
								</div>
							</div>
						</form>
					</div>
				</div>
			
		</div>
		<!-- content end -->
	</div>
							<!--添加 end-->
							<!--end-->
						</ul>
					</div>
				</div>
				<!--tab end-->
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
						id="updateForm" action="#" method="post">
						<input id="inId" type="hidden" name="inId">
						<div class="am-form-group">
								<label for="eproductName" class="am-u-sm-3 am-form-label">
									商品名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="eproductName" required
										placeholder="商品名称" name="productName">
										<small>10字以内...</small>
								</div>
							</div>
							
							<div class="am-form-group">
								<label for="typeId" class="am-u-sm-3 am-form-label">
								分类</label>
								<div class="am-u-sm-9">
									<select name="typeId" id="typeId2" required>
									<option value="0">请选择</option>
									
									
									<c:forEach items="${list1}" var="type">
										<option value="${type.tid }" <c:if test="${type.tid == inId.inId}"></c:if>>${type.typeName }</option> 
									</c:forEach>									
									</select> <small>群组</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="eproductNum" class="am-u-sm-3 am-form-label">
									商品数量</label>
								<div class="am-u-sm-9">
									<input type="number" id="eproductNum" required
										placeholder="商品数量" name="wareNum">
								</div>
							</div>
							<div class="am-form-group">
								<label for="eremarks" class="am-u-sm-3 am-form-label">
									备注</label>
								<div class="am-u-sm-9">
									<textarea class="" rows="5" id="eremarks" name="remarks"
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
					<button type="button" class="btn btn-primary"  onclick="but_update()">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
			</div>

			
			 <script src="${ctx }/static/js/jquery.min.js" type="text/javascript"></script>
              <script src="${ctx }/static/js/plugs/Jqueryplugs.js" type="text/javascript"></script>
              <script src="${ctx }/static/js/_layout.js"></script>
             <script src="${ctx }/static/js/plugs/jquery.SuperSlide.source.js"></script>
              <script src="${ctx }/static/js/jquery.pagination.js"></script>
             <script type="text/javascript" src="${ctx }/static/js/bootstrap.min.js"></script>
			<script>
				var num = 1;
				$(function() {

				 $(".tabs").slide({ trigger: "click" });

				});

	
				var btn_save = function() {
					var pid = $("#RawMaterialsTypePageId  option:selected").val();
					var name = $("#RawMaterialsTypeName").val();
					var desc = $("#RawMaterialsTypeDescription").val();
					var ramark = $("#Ramark").val();
					$.ajax({
						type: "post",
						url: "/RawMaterialsType/AddRawMaterialsType",
						data: { name: name, pid: pid, desc: desc, ramark: ramark },
						success: function(data) {
							if(data > 0) {
								$.jq_Alert({
									message: "添加成功",
									btnOktext: "确认",
									dialogModal: true,
									btnOkClick: function() {
										//$("#RawMaterialsTypeName").val("");
										//$("#RawMaterialsTypeDescription").val("");
										//$("#Ramark").val("");                           
										//page1();
										location.reload();

									}
								});
							}
						}
					});
					alert(t);
				}

				
				

				
				
				
				var btn_edit = function(id) {
					$.jq_Panel({
						url: "/RawMaterialsType/EditRawMaterialsType?id=" + id,
						title: "编辑分类",
						dialogModal: true,
						iframeWidth: 500,
						iframeHeight: 400
					});
				}
				//点击编辑按钮
				var btn_edit = function(id) {
					//请求
					$.get("${ctx}/inbound/findById",{id:id},function(data){
						//alert(data);
						console.log(data);
						//将数据获取到模态框
						window.setTimeout(function(){
							$("#inId").val(data.inId);
							$("#eproductName").val(data.productName);
							$("#eproductNum").val(data.wareNum);
							$("#typeId2").val(data.typeId);
							//分类默认显示原来的分类名称
							$("#eremarks").val(data.remarks);
						},500);
					});
				}
				
				
				var but_update = function(){
					$.post("${ctx}/inbound/updateInbound",$("#updateForm").serialize(),function(data){
						$("#myModal").modal("hide");
						if(data.result > 0){
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
				
				var btn_delete = function(id) {
					$.get("${ctx}/inbound/deleteInbound",{id:id},function(data){
						if(data.result>0){
							$.jq_Confirm({
								message: "您确定要删除吗?",
								btnOkClick: function() {
									//刷新页面
									window.location.reload();
								}
							});
						}
					});
					
				}
				
				
				
				
				
			</script>

		</div>
	</body>

</html>