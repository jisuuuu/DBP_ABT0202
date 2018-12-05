<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="model.Post" %>
<%@page import="java.util.*" %>
<%@page import="model.User" %>
<%@page import="model.service.UserManager" %>
<%@page import="model.service.UserNotFoundException" %>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
	String curUserId = (String)session.getAttribute("user");
 	Post post = (Post)request.getAttribute("post");
%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

	<link href='https://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,800italic,700italic,600italic,400italic,300italic,800,700,600' rel='stylesheet' type='text/css'>

	<link rel=stylesheet href="<c:url value='/css/style.css' />" type="text/css">
	<link href="<c:url value='/css/bootstrap.css' />" rel="stylesheet" type="text/css">
	<link rel=stylesheet href="<c:url value='/css/font-awesome.css' />" type="text/css">
	<link rel=stylesheet href="<c:url value='/css/responsive.css' />" type="text/css">
	<link rel=stylesheet href="<c:url value='/css/magnific-popup.css' />" type="text/css">
	<link rel=stylesheet href="<c:url value='/css/animate.css' />" type="text/css">
	
	
	<script type="text/javascript" src="<c:url value='/js/jquery.1.8.3.min.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/bootstrap.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery-scrolltofixed.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.easing.1.3.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/jquery.isotope.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/wow.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/classie.js' />"></script>
	<script type="text/javascript" src="<c:url value='/js/magnific-popup.js' />"></script>

	<title>에받템</title>
</head>
<body>

	<nav class="main-nav-outer" id="test">
		<div class="container">
			<ul class="main-nav">
				<li><a href="<c:url value='/main/main' />">에받템</a></li>
				<li><a href="<c:url value='/user/list' />">사용자리스트</a></li>
				<li><a href="<c:url value='/boot' />">부트스트랩 원본</a></li>
				<li class="small-logo">
					<a href="<c:url value='/main/main' />"><img src="<c:url value='/img/small-blogo.png' />" alt=""></a>
				</li>
				<li><a href="<c:url value='/post/create/form' />">글작성</a></li>
				
				<!-- 로그인여부에 따라서 다름 -->
				<%
    				UserManager manager = UserManager.getInstance();
    				User us = manager.findUser(curUserId);
    			%>
				<c:choose>
    				<c:when test='${sessionScope.user eq null}'>
    					<li><a href="<c:url value='/user/register/form' />">Sign Up</a></li>
      					<li><a href="<c:url value='/user/login/form' />">Login</a></li>
    				</c:when>
    				<c:otherwise>
      					<li><a href="<c:url value='/user/mypage'><c:param name='user_id' value='<%=us.getUser_id() %>'/></c:url>"><%=curUserId%>&nbsp;님</a></li>
      					<li><a href="<c:url value='/user/logout' />">Logout</a></li>
    				</c:otherwise>
    			</c:choose>

			</ul>
			<a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
		</div>
	</nav>
	
	
	
	

<section class="main-section alabaster">
		<!--main-section alabaster-start-->
		<div class="container">
			<div class="row">
			
			
			
			<div class="drow">
			
			
				<div class="col-sm-12">
					<div class="dtitle">
						<h1><%=post.getTitle()%></h1>
						[<%=post.getUsage() %>] &nbsp; <i class="fa fa-dashboard"></i> Down Count | <%=post.getDown_count() %>
					</div>
				</div>
  				
  				
  				
  				<div class="col-sm-6">
					<div class="dimg">
						<img src="<c:url value='/img/${post.thumnail}' />" alt="이미지를 찾을 수 없습니다"/> 
					</div>
				</div>
				<div class="col-sm-4 ">
					<div class="dwriter">
						<h4><i class="fa fa-pencil" aria-hidden="true"></i> <b><%=post.getConsumer_id() %></b></h4>
						<%=post.getUpload_date() %>
						<br>
						<c:choose>
    					<c:when test="${post.file_link eq null}">
        					<a class="link2 delay-1s servicelink" href="<c:url value='/templet/${post.post_file}' />">다운로드</a>
    					</c:when>
    					<c:otherwise>
    						<a class="link2 delay-1s servicelink" href="${post.file_link}" target="_blank">링크로 이동</a>
    					</c:otherwise>
					</c:choose>  	
							
					</div>
						
						
						
					<div class="dcon">
						<%=post.getContent() %>
					</div>
				</div>
  				
  				
  				
			</div>
			
			
			
			
			
			
			
			
				
			</div>
		</div>
	</section>
	
	
	
	
	
	
	
	

</body>
</html>