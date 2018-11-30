<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%
	String curUserId = (String)session.getAttribute("user");
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

	<title>에받템 글작성</title>
</head>
<body>

	<nav class="main-nav-outer" id="test">
		<div class="container">
			<ul class="main-nav">
				<li><a href="<c:url value='/main/main' />">에받템</a></li>
				<li><a href="<c:url value='/user/list' />">사용자리스트</a></li>
				<li><a href="<c:url value='/boot' />">부트스트랩 원본</a></li>
				<li class="small-logo">
					<a href="<c:url value='/main/main' />"><img src="<c:url value='/img/blogo.png' />" alt=""></a>
				</li>
				<li><a href="<c:url value='/post/create/form' />">글작성</a></li>
				
				<!-- 로그인여부에 따라서 다름 -->
				<c:choose>
    				<c:when test='${sessionScope.user eq null}'>
    					<li><a href="<c:url value='/user/register/form' />">Sign Up</a></li>
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
			
			<div class="container">
				<div class="row">
					<form action="<c:url value='/post/create' />" method="post" role="form" class="contactForm">
					
						<div class="form-group">
  							<label for="useage"> Usage list:</label>
  							<select class="form-control" name="usage" id="usage">
    							<option>u1</option>
    							<option>u2</option>
   								<option>u3</option>
    							<option>u4</option>
  							</select>
						</div>
					
						<div class="form-group">
							<input type="text" name="post_title" class="form-control input-text" id="post_title"
								placeholder="제목입력" data-rule="maxlen:15"
								data-msg="Please enter Post Title" />
							<div class="validation"></div>
						</div>
			
						<div class="form-group">
  							<textarea class="form-control" rows="10" id="post_content" name="post_content"></textarea>
						</div>
						
						<div class="form-group">
							<input type="text" name="file_link" class="form-control input-text" id="file_link"
								placeholder="file link"
								data-msg="Please enter File Link" />
							<div class="validation"></div>
						</div>
						
						<div class="form-group">
							<input type="text" name="file" class="form-control input-text" id="file" />
							<div class="validation"></div>
						</div>
				
			
						<div class="text-center">
							<button type="submit" class="input-btn">작성완료</button>
						</div>
					</form>
				</div>
			</div>

		</section>
		
	</div>
	
	
</body>
</html>