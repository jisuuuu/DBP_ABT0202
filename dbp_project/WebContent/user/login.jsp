<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String curUserId = (String) session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, maximum-scale=1">

<title>에받템 Login</title>

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


</head>
<body>


	<nav class="main-nav-outer" id="test">
		<div class="container">
			<ul class="main-nav">
				<li><a href="<c:url value='/main/main' />">에받템</a></li>
				<li><a href="<c:url value='/user/list' />">사용자리스트</a></li>
				<li><a href="<c:url value='/boot' />">부트스트랩 원본</a></li>
				<li class="small-logo">
					<a href="<c:url value='/main/main' />"><img src="<c:url value='/img/small-logo.png' />" alt=""></a>
				</li>
				<li><a href="<c:url value='/post/create/form' />">글작성</a></li>

				<!-- 로그인여부에 따라서 다름 -->
				<c:choose>
					<c:when test='${sessionScope.user eq null}'>
						<li><a href="<c:url value='/user/register/form' />">Sign
								Up</a></li>
						<li><a href="<c:url value='/user/login/form' />">Login</a></li>
					</c:when>
					<c:otherwise>
						<li><a><%=curUserId%>&nbsp;님</a></li>
						<li><a href="<c:url value='/user/logout' />">Logout</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
			<a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
		</div>
	</nav>

	<section class="business-talking">
		<div class="container">
			<h2>"A+" 받는 템플릿</h2>
		</div>
	</section>

	<div class="container">

		<section class="main-section team" id="team">
			<!--main-section alabaster-start-->
			<div class="container">
				<div class="row">
					<div class="col-lg-7 col-sm-8 featured-work">

						<!-- 로그인이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
						<c:if test="${loginFailed}">
							<br>
							<h2>
								<font color="red"><i class="fa fa-magic"></i>
								<c:out value="${exception.getMessage()}" /></font>
							</h2>
							<br>
						</c:if>
					</div>
				</div>

				<div class="col-lg-6 col-sm-5 wow fadeInUp delay-05s">
					<div class="form">

						<form action="<c:url value='/user/login' />" method="post" role="form" class="contactForm" >
							<div class="form-group">
								<input type="text" name="user_id" class="form-control input-text col-lg-6" id="user_id" placeholder="Id"
									data-rule="minlen:4" data-msg="Please enter your Id" />
								<div class="validation"></div>
							</div>


							<div class="form-group">
								<input type="password" class="form-control input-text " name="password" id="password" placeholder="password"
									data-rule="password" data-msg="Please enter Your password" />
								<div class="validation"></div>
							</div>


							<button type="submit" class="input-btn">Login</button>
						</form>
					</div>
				</div>


			</div>

		</section>
		
		
		
	</div>
	
</body>
</html>