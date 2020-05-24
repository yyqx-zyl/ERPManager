<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set value="${pageContext.request.contextPath }" var="ctx"></c:set> 

		<link rel="stylesheet" href="${ctx }/static/css/Site.css" />
		<link rel="stylesheet" href="${ctx }/static/css/zy.all.css" />
		<link rel="stylesheet" href="${ctx }/static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${ctx }/static/css/amazeui.min.css" />
		<link rel="stylesheet" href="${ctx }/static/css/admin.css" />
		<link rel="stylesheet" href="${ctx }/static/css/bootstrap.css" />
		<link rel="stylesheet" href="${ctx }/static/css/pagination.css" />
		<div class="dvcontent">

			<div>
				<!--tab start-->
				<div class="tabs">
					<div class="hd">
						<ul style="">
							<li style="box-sizing: initial;-webkit-box-sizing: initial;" class="on">查看分类</li>
							<li class="" style="box-sizing: initial;-webkit-box-sizing: initial;">添加分类</li>
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
												<th>分类编号</th>
												<th>分类名称</th>
												<th>分类描述</th>
												<th>备注</th>
												<th>编辑</th>
												<th>删除</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${pageInfo.list }" var="type">
												<tr>
													<td>${type.tid }</td>
													<td>${type.typeName }</td>
													<td>${type.typeDescribe }</td>
													<td>${type.typeNotes }</td>
													<td class="edit"><button onclick="btn_edit(${type.tid })" data-toggle="modal" data-target="#myModal"><i class="icon-edit bigger-120"></i>编辑</button></td>
													<td class="delete"><button onclick="btn_delete(${type.tid })"><i class="icon-trash bigger-120"></i>删除</button></td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
										<div id="div_pagination_bottom">
							            <nav aria-label="Page navigation">
							                <ul class="pagination">
							                     <li>
							                         <a href="${ctx}/type/getList?currpage=${pageInfo.pageNum-1}"
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
							                                 <a style="margin-top: 7px;" href="${ctx}/type/getList?currpage=${ page_Num}">${ page_Num}</a>
							                            </li>
							                        </c:if>
							                     </c:forEach>
							                    <li>
							                        <a href="${ctx}/type/getList?currpage=${pageInfo.pageNum+1}"
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
							action="addType" method="post">
						
							<div class="am-form-group">
								<label for="user-name" class="am-u-sm-3 am-form-label">
									分类名称</label>
								<div class="am-u-sm-9">
									<input type="text" id="user-name" required
										placeholder="分类名称" name="typeName">
										<small>10字以内...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="user-intro" class="am-u-sm-3 am-form-label">
									备注</label>
								<div class="am-u-sm-9">
									<textarea class="" rows="5" id="user-intro" name="typeNotes"
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
		
		</div>
		<!-- content end -->
	</div>
							<!-- end-->
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
						修改分类信息
					</h4>
				</div>
				<div class="modal-body">
					<form class="am-form am-form-horizontal"
						id="updateForm" method="post">
						<input type="hidden" name="tid" id="tid" value=""/>
						<div class="am-form-group">
							<label for="editTypeName" class="am-u-sm-3 am-form-label">
								分类名称</label>
							<div class="am-u-sm-9">
								<input type="text" id="editTypeName" required
									placeholder="分类名称" name="typeName" value="">
									<small>10字以内...</small>
							</div>
						</div>
						<div class="am-form-group">
							<label for="editTypeDescribe" class="am-u-sm-3 am-form-label">
								分类描述</label>
							<div class="am-u-sm-9">
								<textarea class="" rows="5" id="editTypeDescribe" name="typeDescribe"
									placeholder="输入分类描述"></textarea>
								<small>250字以内...</small>
							</div>
						</div>
						<div class="am-form-group">
							<label for="editTypeNotes" class="am-u-sm-3 am-form-label">
								备注</label>
							<div class="am-u-sm-9">
								<textarea class="" rows="5" id="editTypeNotes" name="typeNotes"
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
					<button type="button" class="btn btn-primary" id="butUpdate">
						提交更改
					</button>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	<!-- </div> -->
			
			<script src="${ctx }/static/js/jquery.min.js" type="text/javascript"></script>
              <script src="${ctx }/static/js/plugs/Jqueryplugs.js" type="text/javascript"></script>
              <%-- <script src="${ctx }/static/js/_layout.js"></script>--%>
             <script src="${ctx }/static/js/plugs/jquery.SuperSlide.source.js"></script>
             <script type="text/javascript" src="${ctx }/static/js/bootstrap.min.js"></script>
             <script type="text/javascript" src="${ctx }/static/js/jquery.pagination.js"></script>
			<script type="text/javascript">
				var num = 1;
				$(function() {

				 	$(".tabs").slide({ trigger: "click" });
					$.ajax({
						url:"${ctx}/type/getList",
						type:"GET",
						error:function(e){
							alert(e);
						}
					});
					
					$("#butUpdate").click(function(){
						// 获得表单中的数据,获得表单中的所有数据
						//alert($("#updateForm").serialize());
						$.post("${ctx}/type/updateType",$("#updateForm").serialize(),function(data){
							console.log(data.result)
							// 让模态框隐藏
							$("#myModal").modal("hide");
							if(data.result > 0){
								$.jq_Alert({
									message: "修改成功",
									btnOkClick: function() {
										// 使用Ajax去请求后台的数据
										window.location.reload();
									}
								});
							}else{
								$.jq_Alert({
									message: "修改失败",
									btnOkClick: function() {
										// 使用Ajax去请求后台的数据
										window.location.reload();
									}
								});
							}
						})
					});
					
					
					/* $("#butUpdate").click(function(){
						$.ajax({
							url:"${ctx}/type/updateType",
							type:"POST",
							data:$("#updateForm").serialize(),// 获得提交表单的所有数据
							success:function(data){
								if(data.result > 0){
									window.setTimeout(function(){
										$.jq_Alert({
											message: "修改成功",
											btnOkClick: function() {
												window.location.reload();
												// 使用Ajax去请求后台的数据
											}
										});
									},500);
								}
							}
						});
					});*/
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
							if(data.result > 0) {
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
					// 使用ajax去获得后台的数据，并执行操作
					// 先去根据id查找到这一条数据，得到一条分类数据，它就是一个实体类对象
					// 在后台就返回一个JSON对象，在页面上来进行处理
					/* $.ajax({
						url:"${ctx}/type/findById"，
						type:"GET",
						data:{id:id},
						dataType:"json",
						success:function(data){
							alert(data);
							console.log(data);
						}
					}); */
					
					$.get("${ctx}/type/findById",{id:id},function(data){
						/* alert(data);
						console.log(data); */
						// 将这个json对象中的数据设置到页面上
						window.setTimeout(function(){
							$("#tid").val(data.tid);
							$("#editTypeName").val(data.typeName);
							$("#editTypeDescribe").val(data.typeDescribe);
							$("#editTypeNotes").val(data.typeNotes);
						},1000)
					});
				}
				
				var btn_delete = function(id) {
					$.jq_Confirm({
						message: "您确定要删除吗?",
						btnOkClick: function() {
							$.ajax({
								type: "post",
								url: "${ctx}/type/delType",
								data: { id: id },
								dataType:"json",
								success: function(data) {
									if(data.result > 0) {
										$.jq_Alert({
											message: "删除成功",
											btnOkClick: function() {
												window.location.reload();
												// 使用Ajax去请求后台的数据
											}
										});
									}
								}
							});
						}
					});
				}
			</script>

		</div>
