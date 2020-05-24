<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
     <c:set value="${pageContext.request.contextPath }" var="ctx"></c:set>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/Site.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/zy.all.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/amazeui.min.css" />
		<link rel="stylesheet" href="${pageContext.request.contextPath }/static/css/admin.css" />
	</head>
	<body>
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
							id="updateForm" action="" method="get">
						<c:set value="${users }" var="users"></c:set>
						<input type="hidden" value="${loginUser.uid }" name="uid">
							<div class="am-form-group">
								<label for="password" class="am-u-sm-3 am-form-label">
								原密码</label>
								<div class="am-u-sm-9">
									<input type="text" id="password" required
										placeholder="原密码" name="password" value="${loginUser.userpassword }">
										<small>原密码...</small>
								</div>
							</div>
							<div class="am-form-group">
								<label for="userpassword" class="am-u-sm-3 am-form-label">
								新密码</label>
								<div class="am-u-sm-9">
									<input type="text" id="userpassword" required
										placeholder="新密码" name="userpassword" value="">
										<small>新密码...</small>
								</div>
							</div>
							<div class="am-form-group">
								<div class="am-u-sm-9 am-u-sm-push-3">
									<input type="button" class="am-btn am-btn-success" value="修改"  
									 onclick="but_update()"/>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
			<footer class="admin-content-footer">
			<hr>
			<p class="am-padding-left"></p>
			</footer>
		</div>
		<!-- content end -->
	</div>
							<!-- end-->
			 <script src="${ctx }/static/js/jquery.min.js" type="text/javascript"></script>
              <script src="${ctx }/static/js/plugs/Jqueryplugs.js" type="text/javascript"></script>
              <script src="${ctx }/static/js/_layout.js"></script>
             <script src="${ctx }/static/js/plugs/jquery.SuperSlide.source.js"></script>
              <script src="${ctx }/static/js/jquery.pagination.js"></script>
             <script type="text/javascript" src="${ctx }/static/js/bootstrap.min.js"></script>	
							
						<script type="text/javascript">
						
				
						var but_update = function(){
							$.post("${ctx}/updatePassword",$("#updateForm").serialize(),function(data){
								
								//alert(data.result);
								if(data.result > 0){
									alert("修改成功");
									window.open("${ctx}/loginOut");  
								}
							});
						}
						
						
						
						</script>	
							
			
							
	</body>
</html>
