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
				<figure class="col-lg-5 col-sm-4 wow fadeInLeft">
				
				<img src="<c:url value='/img/${post.thumnail}' />" alt="no!"/> 
				
				
				</figure>
				<div class="col-lg-7 col-sm-8 featured-work">
					<h2><%=post.getTitle()%></h2>
					<P class="padding-b"><%=post.getContent() %> <br>Writer :: <%=post.getConsumer_id() %></P>
					<div class="featured-box">
						<div class="featured-box-col1 wow fadeInRight delay-02s">
							<i class="fa fa-magic"></i>
						</div>
						<div class="featured-box-col2 wow fadeInRight delay-02s">
							<h3>UPLOAD DATE</h3>
							<p><%=post.getUpload_date() %> </p>
						</div>
					</div>
					<div class="featured-box">
						<div class="featured-box-col1 wow fadeInRight delay-04s">
							<i class="fa fa-gift"></i>
						</div>
						<div class="featured-box-col2 wow fadeInRight delay-04s">
							<h3>USAGE</h3>
							<p><%=post.getUsage() %> </p>
						</div>
					</div>
					<div class="featured-box">
						<div class="featured-box-col1 wow fadeInRight delay-06s">
							<i class="fa fa-dashboard"></i>
						</div>
						<div class="featured-box-col2 wow fadeInRight delay-06s">
							<h3>DOWN COUNT</h3>
							<p><%=post.getDown_count() %></p>
						</div>
					</div>
					<a class="Learn-More" href="#">Learn More</a>
				</div>
			</div>
		</div>
	</section>
	
	
	
	
	
	
	
	

</body>
</html>