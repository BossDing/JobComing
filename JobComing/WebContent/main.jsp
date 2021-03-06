<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="time" uri="/WEB-INF/time.tld"%>
<!DOCTYPE html>
<html lang="zh-CN">

	<head>
		<meta charset="utf-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width,initial-scale=1">
		<title>主界面</title>
		<link href="css/bootstrap.css" rel="stylesheet">
		<link href="css/site.min.css" rel="stylesheet">
		<link rel="stylesheet" href="css/main.css" />
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
					<a href="PersonInforServlet.do">${sessionScope.user.userName}</a> <span>/</span>
					<a href="ReleaseJob.do?action=reach">发布兼职</a>
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
										
										
										
										
									</ul>
							</div>
						</form>
					</div>
				</div>
			</div>
		</header>

		<div class="container mycontainer">
			<div class="row">
				<div class="col-md-9">
					<div class="mostused-packages well hidden-xs hidden-sm">
						<div>
							<span>兼职地点：</span>
							<a class="current">全国</a>
							<a href="MainPageServlet?mcityName=南京市" class="active">南京</a>
							<a href="MainPageServlet?mcityName=杭州市" class="active">杭州</a>
							<a href="MainPageServlet?mcityName=上海市" class="active">上海</a>
							<a href="MainPageServlet?mcityName=北京市" class="active">北京</a>
							<a href="MainPageServlet?mcityName=深圳市" class="active">深圳</a>
							<a href="MainPageServlet?mcityName=广州市" class="active">广州</a>
							<a href="MainPageServlet?mcityName=成都市" class="active">成都</a>
							<a href="MainPageServlet?mcityName=苏州市" class="active">苏州</a>
							<a href="MainPageServlet?mcityName=长沙市" class="active">长沙</a>
							<a href="city.jsp" style="float: right;">更多<i class="caret"></i></a>
							<div class="sep5" style="height: 20px;"></div>
							<span>兼职形式：</span>
							<a class="ser-kind">所有</a>
							
							<c:forEach items="${requestScope.kindList}" var="kind">								
								<a href="MainPageServlet?mjobKindId=${kind.jobKindId}" class="active">
									<c:out value="${kind.jobKindName }"></c:out>
								</a>
							</c:forEach>						
							<div class="sep5" style="height: 20px;"></div>
							<span>开始时间：</span>
							<a class="ser-kind">不限</a>
							<a href="" class="active">周一</a>
							<a href="" class="active">周二</a>
							<a href="" class="active">周三</a>
							<a href="" class="active">周四</a>
							<a href="" class="active">周五</a>
							<a href="" class="active">周六</a>
							<a href="" class="active">周日</a>
						</div>
					</div>
					
					<div class="mostused-packages well hidden-xs hidden-sm" style="padding: 0px;height: 46px;">
						<div class="page-sel">
							<span>排序方式：</span>
							<a class="ser-kind">默认</a>
							<a href="MainPageServlet?action=new" class="active">最新</a>
						</div>
						<div class="page-sel2">
							<a href="" class="prev"></a>
							<span style="color: #00b38a;">1</span> <span>/ 12</span>
							<a href="" class="next"></a>
						</div>
					</div>

					<main class="packages-list-container" id="all-packages">
						<ul class="list-group">
							<c:forEach items="${sessionScope.jobList}" var="jobshow">
								<li class="list-group-item">
									<table style="border: 0px;width: 100%;">
										<tbody>
											<tr>
												<td width="55" valign="top" align="center">
													<c:choose>
									 					 <c:when test="${ empty jobshow.user.headPicture}">
									  	 			    	 <img src="img/public.png"style="width: 60px;height: 60px;" class="img-thumbnail">
									 				 	</c:when>
									 					 <c:otherwise>
									    				 	 <img src="${jobshow.user.headPicture}" style="width: 60px;height: 60px;" class="img-thumbnail">
									  					 </c:otherwise>
													</c:choose>
												</td>
												<td width="10"></td>
												<td width="auto" valign="middle">
													<span class="item_title"> 
														<a href="" style="color: #00b38a;">[<c:out value="${jobshow.jobKind.jobKindName }"></c:out>]</a>
														<a href="DetailJobPServlet.do?jobPublishId=${jobshow.jobPublish.jobPublishId}" style="color: #4d5256;"><c:out value="${jobshow.jobPublish.workDescribe }"></c:out></a>
													</span>
													<div class="sep5" style="height: 1px;"></div>
	
													<span style="font-size: 11px; color: #ccc;">		
														<a href="#">
															发布人
														</a> &nbsp;•&nbsp; 
														<strong>
															<a href="#" style="color: #4d5256;">
																<c:out value="${jobshow.user.userName }"></c:out>
															</a>
														</strong> &nbsp;•&nbsp; 
												 	 <c:set var="time" value="${jobshow.jobPublish.jobPublishTime}"/>
														<small>${time:getTimeBefore(time)}</small>
													</span>
													<div class="sep5" style="height: 1px;"></div>
													<span style="font-size: 11px; color: #ccc;"> 
														<a href="#">
															地点
														</a> &nbsp;•&nbsp; 
														<small><c:out value="${jobshow.location }"></c:out></small>
													</span>
												</td>
												<td width="160" valign="top" align="left" class="hidden-xs">
													<span style="font-size: 11px; color: #ccc;"> 
														<a href="#">
															开始
														</a> &nbsp;•&nbsp; 
														<small><c:out value="${jobshow.jobPublish.workBeginTime }"></c:out></small>
													</span>
													<div class="sep5" style="height: 1px;"></div>
													<span style="font-size: 11px; color: #ccc;"> 
														<a href="#">
															结束
														</a> &nbsp;•&nbsp; 
														<small><c:out value="${jobshow.jobPublish.workOverTime }"></c:out></small>
													</span>
												</td>
												<td width="60" valign="top" class="hidden-xs" style="position: relative;">
													<a class="count_livid" style="float:right;margin-right: 10px; font-size: 25px;" data-pre="0">
														<span class="glyphicon glyphicon-envelope"></span>
													</a>
													<div class="clearfix"></div>
													<p class="my_pre">预约成功</p>
												</td>
											</tr>
										</tbody>
									</table>
								</li>													
							</c:forEach>							
						</ul>
						 <ul class="pagination pull-right">
						 	<li><a href="#">&laquo;</a></li>
						 	<c:choose>
						 		
						 		<c:when test="${requestScope.cp le 3}">						 			
									<li <c:if test="${requestScope.cp eq 1}">class="active"</c:if>><a href="MainPageServlet?cp=1">1</a></li>
									<li <c:if test="${requestScope.cp eq 2}">class="active"</c:if>><a href="MainPageServlet?cp=2">2</a></li>
									<li <c:if test="${requestScope.cp eq 3}">class="active"</c:if>><a href="MainPageServlet?cp=3">3</a></li>
									<li><a href="MainPageServlet?cp=4">4</a></li>
									<li><a href="MainPageServlet?cp=5">5</a></li>
						 		</c:when>
						 		<c:when test="${ requestScope.cp gt 3}">						 			
									<li><a href="MainPageServlet?cp=${requestScope.cp-2}">${requestScope.cp-2}</a></li>
									<li ><a href="MainPageServlet?cp=${requestScope.cp-1}">${requestScope.cp-1}</a></li>
									<li class="active"><a  href="MainPageServlet?cp=${requestScope.cp}">${requestScope.cp}</a></li>
									<li><a href="MainPageServlet?cp=${requestScope.cp+1}">${requestScope.cp+1}</a></li>
									<li><a href="MainPageServlet?cp=${requestScope.cp+2}">${requestScope.cp+2}</a></li>
						 		</c:when>
						 		
						 	</c:choose>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</main>
				</div>
				<div class="col-md-3 adv visible-md visible-lg" style="padding-right: 0px;">
					<div class="panel panel-default">
					    <div class="panel-heading">
					       	<span class="glyphicon glyphicon-fire"></span>&nbsp;今&nbsp;日&nbsp;兼&nbsp;职&nbsp;推&nbsp;送
					    </div>
					     <ul class="list-group">
					     	<c:forEach var="hotjob" items="${sessionScope.hotList}">
					        <li class="list-group-item">
					        	<a >${hotjob.location } </a>&nbsp;
					        	<a >[${hotjob.jobKind.jobKindName}]</a>&nbsp;
					        	<a href="DetailJobPServlet.do?jobPublishId=${hotjob.jobPublish.jobPublishId }">
					        		<span class="glyphicon glyphicon-map-marker"></span>
					        		&nbsp;${hotjob.jobPublish.detailAddress}
					        		<span style="font-weight: bold;">...</span>
					        	</a>
					        </li>
					        </c:forEach>
					    </ul>
					    
					</div>
					
					<div class="panel panel-default">
					    <div class="panel-heading">
					       	<span class="glyphicon glyphicon-apple"></span>&nbsp;最&nbsp;近&nbsp;浏&nbsp;览&nbsp;记&nbsp;录
					    </div>
					     <ul class="list-group">
					     	<c:choose>
					     		<c:when test="${fn:length(requestScope.recordList)<6}">
							     	<c:forEach var="rcordList" items="${requestScope.recordList }">
							        <li class="list-group-item">
							        	<a href="">${rcordList.location }</a>&nbsp;
							        	<a href="">[${rcordList.jobKind.jobKindName}]</a>&nbsp;
							        	<a href="DetailJobPServlet.do?jobPublishId=${rcordList.jobPublish.jobPublishId }">
							        		<span class="glyphicon glyphicon-map-marker"></span>
							        		&nbsp;${rcordList.jobPublish.detailAddress}
							        		<span style="font-weight: bold;">...</span>
							        	</a>
							        </li>
					      		  </c:forEach>
					          </c:when>
					         <c:otherwise>
					         		<c:forEach  begin="0" end="5" step="1" var="rcordList" items="${requestScope.recordList }">
							        <li class="list-group-item">
							        	<a href="">${rcordList.location }</a>&nbsp;
							        	<a href="">[${rcordList.jobKind.jobKindName}]</a>&nbsp;
							        	<a href="DetailJobPServlet.do?jobPublishId=${rcordList.jobPublish.jobPublishId }">
							        		<span class="glyphicon glyphicon-map-marker"></span>
							        		&nbsp;${rcordList.jobPublish.detailAddress}
							        		<span style="font-weight: bold;">...</span>
							        	</a>
							        </li>
					      		  </c:forEach>
					         </c:otherwise>
					        </c:choose>
					    </ul>
					</div>
				</div>
			</div>
		</div>

		<div id="product-fk">
			<div id="feedback-icon">
				<div class="fb-icon"></div>
				<span>用户反馈</span>
			</div>
		</div>
		
		<iframe id="webchat7moor" src="chat.jsp" style="display: none; margin: 0px; padding: 0px; width: 320px; height: 542px; border-width: 0px; border-radius: 3px; transition: height 0.5s ease-out; z-index: 99999; bottom: 0px; right: 0px; position: fixed;"></iframe>
		<script type="text/javascript" src="js/jquery.js" ></script>
		<script type="text/javascript" src="js/bootstrap.js" ></script>
		<script src="js/search.js"></script>
		<script>
			$(".fb-icon").click(function(){
				$("#webchat7moor").css("display","block");
			})
			$(".count_livid").click(function(){
				var temp = $(this);
				var dattr = $(this).attr("data-pre");
				if(dattr=="0"){
					temp.next().next().fadeIn(500)
					.animate({
						top:"30px"
					},500).fadeOut(500);	
				}
				temp.attr("data-pre","1");
			})
		</script>
	</body>
</html>