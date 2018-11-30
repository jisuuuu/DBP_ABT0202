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
<title>�α��� ������</title>


</head>
<body>


<h1>A+ �޴� ���ø�</h1>


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





<!-- �α����� ������ ��� exception ��ü�� ����� ���� �޽����� ��� -->
        <c:if test="${loginFailed}">
	  	  <br><font color="red"><c:out value="${exception.getMessage()}" /></font><br>
	    </c:if>
	    
<div class="container">	    
	<h1>�α��� ������</h1>

	<div class="form">

		<div id="sendmessage">Thank you!</div>
		
		<form action="<c:url value='/user/login' />" method="post" role="form" class="contactForm">
			<div class="form-group">
				<input type="text" name="user_id" class="form-control input-text"
					id="user_id" placeholder="Id" data-rule="minlen:4"
					data-msg="Please enter your Id" />
				<div class="validation"></div>
			</div>
			<div class="form-group">
				<input type="password" class="form-control input-text" name="password"
					id="password" placeholder="password" data-rule="password"
					data-msg="Please enter Your password" />
				<div class="validation"></div>
			</div>


			<div class="text-center">
				<button type="submit" class="input-btn">Login</button>
			</div>
		</form>
	</div>
		
</div>
</body>
</html>