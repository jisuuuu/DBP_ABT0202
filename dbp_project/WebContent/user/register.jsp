<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String curUserId = (String)session.getAttribute("user");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">


<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<title>회원가입 From</title>


</head>
<body>


<h1>A+ 받는 템플릿</h1>


<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<c:url value='/' />">에 받 템</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="<c:url value='/user/list' />">사용자리스트</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
    
   
   <c:choose>
    	<c:when test='${sessionScope.user eq null}'>
    		<li><a href="<c:url value='/user/register/form' />"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      		<li><a href="<c:url value='/user/login/form' />"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	</c:when>
    	<c:otherwise>
      		<li><a><span class="glyphicon glyphicon-user"></span> <%=curUserId%>&nbsp;님</a></li>
      		<li><a href="<c:url value='/user/logout' />"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    	</c:otherwise>
    </c:choose>
    </ul>
  </div>
</nav>


	<h1>회원가입</h1>
	<div class="form">

		<div id="sendmessage">회원가입을 해주셔서 감사합니다!</div>

		<form action="<c:url value='/user/register' />" method="post" role="form" class="contactForm">
			<div class="form-group">
				<input type="text" name="user_id" class="form-control input-text" id="user_id"
					placeholder="Id" data-rule="minlen:4"
					data-msg="Please enter your Id" />
				<div class="validation"></div>
			</div>
			<div class="form-group">
				<input type="password" class="form-control input-text"
					name="password" id="password" placeholder="Password"
					data-rule="password" data-msg="Please enter Your password" />
				<div class="validation"></div>
			</div>
			<div class="form-group">
				<input type="text" class="form-control input-text" name="nickname"
					id="nickname" placeholder="Nickname"
					data-msg="Please enter Your nickname" />
				<div class="validation"></div>
			</div>
			
			<script language=Javascript>

				var maxChecked = 3;   //선택가능 갯수
				var totalChecked = 0; // 설정 끝

				function CountChecked(field) {
    				if (field.checked)
        				totalChecked += 1;
    				else
       					totalChecked -= 1;

    				if (totalChecked > maxChecked) {
        				alert ("최대 3개 까지만 가능합니다.");
    					field.checked = false;
    					totalChecked -= 1;
    				}
    
				}

				function ResetCount(){
    				totalChecked = 0;
				}

			</script>
			
			최대 <script>document.write(maxChecked);</script>까지만 선택할 수 있습니다.
			<div class="form-group">
				<input type="checkbox" name="interest" value="red" onclick=CountChecked(this)> 빨강
				<input type="checkbox" name="interest" value="orange" onclick=CountChecked(this)> 주황
				<input type="checkbox" name="interest" value="yellow" onclick=CountChecked(this)> 노랑<br>
				<input type="checkbox" name="interest" value="green" onclick=CountChecked(this)> 초록
				<input type="checkbox" name="interest" value="blue" onclick=CountChecked(this)> 파랑
				<input type="checkbox" name="interest" value="purple" onclick=CountChecked(this)> 보라<br>
				<input type="checkbox" name="interest" value="gray" onclick=CountChecked(this)> 회색
				<input type="checkbox" name="interest" value="pink" onclick=CountChecked(this)> 핑크
				<input type="checkbox" name="interest" value="black" onclick=CountChecked(this)> 검정<br>
				<input type="checkbox" name="interest" value="white" onclick=CountChecked(this)> 흰색
				<input type="checkbox" name="interest" value="navy" onclick=CountChecked(this)> 네이비
				<input type="checkbox" name="interest" value="lime" onclick=CountChecked(this)> 라임<br>
				<div class="validation"></div>
			</div>


			<div class="text-center">
				<button type="submit" class="btn btn-success">Sign</button>
			</div>
		</form>
	</div>



</body>
</html>