<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>个人主页</title>
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/site.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/main.css" />
		<link rel="stylesheet" href="css/myinfo.css" />
		<link rel="stylesheet" href="css/fileinput.css" />
		<link rel="shortcut icon" href="img/favicon.png">
	</head>

	<body class="home-template">
		<div class="site-notice">
			<a href=""><em>JobComing~</em></a>
		</div>
		<header class="site-header jumbotron">
			<c:choose>
		  	<c:when test="${empty sessionScope.user}">
				<div class="site-nav">
					<a href="login.jsp">登录</a> <span>/</span>
					<a href="register.jsp">注册</a>
				</div>
			</c:when>
			<c:otherwise>
				<div class="site-nav">
					<a>${sessionScope.user.userName}</a> <span>/</span>
					<a href="MainPageServlet">首页</a>
				</div>
			</c:otherwise>
		  </c:choose>
			<div class="container">
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<form class="" role="search">
							<div class="form-group">
								<input type="text" class="form-control search clearable" placeholder="搜索兼职/单位/地点">
								<i class="glyphicon glyphicon-search"></i>
								<!--这个是键盘按下的时候搜索的ajax异步显示信息-->
									<ul class="list-group" id="hide-info">
										<li class="list-group-item">
											<a href="">java</a>
										</li>
										<li class="list-group-item">
											<a href="">java</a>
										</li>
										<li class="list-group-item">
											<a href="">java</a>
										</li>
									</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
		</header>
		<div class="container">
			<div class="row">
				<div class="col-md-2 myinfo visible-lg visible-md">
					<div class="list-group">
						<a href="info1.jsp" class="list-group-item active">我的信息</a>
						<a href="info2.jsp" class="list-group-item">参与记录</a>
						<a href="info3.jsp" class="list-group-item">分享记录</a>
						<a href="MainPageServlet" class="list-group-item">返回首页</a>
					</div>
				</div>
				<div class="col-md-10 myinfo">
					<ul class="nav nav-tabs">
						<li class="active bar">
							<a href="info1.jsp">我的信息</a>
						</li>
						<li class="bar">
							<a href="info2.jsp">参与记录</a>
						</li>
						<li class="bar">
							<a href="info3.jsp">分享记录</a>
						</li>
					</ul>
					<table class="table table1">
						<tbody>
							<tr>
								<td>
									<c:choose>
									  <c:when test="${ empty sessionScope.user.headPicture}">
									  	   <img src="img/public.png"style="width: 60px;height: 60px;" class="img-thumbnail">
									  </c:when>
									  <c:otherwise>
									      <img src="${sessionScope.user.headPicture}" style="width: 60px;height: 60px;" class="img-thumbnail">
									   </c:otherwise>
									</c:choose>
								</td>
								<td>
									<a style="display: block; margin-top: 20px;" data-toggle="modal" data-target="#modifyInfo">
										<span class="glyphicon glyphicon-cog"></span>设置信息
									</a>
								</td>
							</tr>
							<tr>
								<td class="txt">用户昵称</td>
								<td>${sessionScope.user.userName}</td>
							</tr>
							<tr>
								<td class="txt">性别</td>
								<td>${sessionScope.user.sex}</td>
							</tr>
							<tr>
								<td class="txt">年龄</td>
								<td>${requestScope.age}</td>
							</tr>
							<tr>
								<td class="txt">邮箱</td>
								<td>${sessionScope.user.email}</td>
							</tr>
							<tr>
								<td class="txt">手机</td>
								<td>${sessionScope.user.phone}</td>
							</tr>
							<tr>
								<td class="txt">信誉</td>
								<td>${sessionScope.user.score}</td>
							</tr>
						</tbody>
					</table>			
				</div>
			</div>
		</div>

		<!--个人信息修改的模态框-->
		<div class="modal fade" id="modifyInfo" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<form role="form" action="ModifyPersonServlet" method="post" class="login-form" enctype="multipart/form-data">
						<div class="modal-header">
							<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
							<h4 class="modal-title" id="myModalLabel">个人信息修改</h4>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="sr-only" for="form-username">Username</label>
								<input type="text" name="username" value="${sessionScope.user.userName}" readonly="readonly" class="form-username form-control" id="form-username">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-email">Email</label>
								<input type="text" name="email" value="${sessionScope.user.email}" readonly="readonly" class="form-username form-control" id="form-email">
							</div>
							<div class="form-group">
								<label class="sr-only" for="form-phone">Phone</label>
								<input type="text" name="email" value="${sessionScope.user.phone}" readonly="readonly" class="form-username form-control" id="form-email">
							</div>
							<div class="form-group">
								<label class="control-label">头像选择</label>
								<input id="input-2" name="image" type="file" class="file" multiple data-show-upload="false" data-show-caption="true">
							</div>
							<!-- <div class="form-group" style="margin-bottom: 60px;">
								<div class="radio col-xs-4 col-sm-3">
									<label>
										<input type="radio" name="sex" id="male" value="男" checked="checked">
									</label>
									<span><img src="img/male.png" class="img-responsive" style="width: 20px; height:20px;display: inline-block;margin-top: -2px;"></span>
								</div>
								<div class="radio col-xs-4 col-sm-3" style="margin-top: 10px;">
									<label>
										<input type="radio" name="sex" id="female" value="女">
									</label>
									<span><img src="img/female.png" class="img-responsive" style="width: 20px; height:20px;display: inline-block;margin-top: -2px;"></span>
								</div>
							</div>
							 -->
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
							<button type="submit" class="btn btn-primary">修改信息</button>
						</div>
					</form>
				</div>
			</div>
		</div>
		<!--个人信息修改的模态框-->

		<script src="js/jquery.js"></script>
		<script src="js/bootstrap.js"></script>
		<script src="js/fileinput.js"></script>
		<script src="js/search.js"></script>
	</body>
</html>