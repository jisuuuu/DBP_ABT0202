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

<!-- �������� �ּ�ȭ�� �ֽ� CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- �ΰ����� �׸� -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- �������� �ּ�ȭ�� �ֽ� �ڹٽ�ũ��Ʈ -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<title>���ۼ�</title>
</head>
<body>

<h1>A+ �޴� ���ø�</h1>

<!--  �׺���̼ǹ� -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="<c:url value='/' />">�� �� ��</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
      <li><a href="<c:url value='/user/list' />">����ڸ���Ʈ</a></li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right">
    
   
   <c:choose>
    	<c:when test='${sessionScope.user eq null}'>
    		<li><a href="<c:url value='/user/register/form' />"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      		<li><a href="<c:url value='/user/login/form' />"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	</c:when>
    	<c:otherwise>
      		<li><a><span class="glyphicon glyphicon-user"></span> <%=curUserId%>&nbsp;��</a></li>
      		<li><a href="<c:url value='/user/logout' />"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    	</c:otherwise>
    </c:choose>
    </ul>
  </div>
</nav>

<h2>���ۼ� ������</h2>

<form action="<c:url value='/post/create' />" method="post" role="form" class="contactForm">
			<div class="form-group">
				<input type="text" name="post_title" class="form-control input-text" id="user_id"
					placeholder="post_title" data-rule="maxlen:10"
					data-msg="Please enter Post Title" />
				<div class="validation"></div>
			</div>
			
			<div class="form-group">
  				<textarea class="form-control" rows="5" id="post_content" name="Post_content"></textarea>
			</div>
				
			
			


			<div class="text-center">
				<button type="submit" class="input-btn">�ۼ��Ϸ�</button>
			</div>
		</form>

</body>
</html>