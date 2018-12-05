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
<title>ȸ������ From</title>


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


	<h1>ȸ������</h1>
	<div class="form">

		<div id="sendmessage">ȸ�������� ���ּż� �����մϴ�!</div>

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

				var maxChecked = 3;   //���ð��� ����
				var totalChecked = 0; // ���� ��

				function CountChecked(field) {
    				if (field.checked)
        				totalChecked += 1;
    				else
       					totalChecked -= 1;

    				if (totalChecked > maxChecked) {
        				alert ("�ִ� 3�� ������ �����մϴ�.");
    					field.checked = false;
    					totalChecked -= 1;
    				}
    
				}

				function ResetCount(){
    				totalChecked = 0;
				}

			</script>
			
			�ִ� <script>document.write(maxChecked);</script>������ ������ �� �ֽ��ϴ�.
			<div class="form-group">
				<input type="checkbox" name="interest" value="red" onclick=CountChecked(this)> ����
				<input type="checkbox" name="interest" value="orange" onclick=CountChecked(this)> ��Ȳ
				<input type="checkbox" name="interest" value="yellow" onclick=CountChecked(this)> ���<br>
				<input type="checkbox" name="interest" value="green" onclick=CountChecked(this)> �ʷ�
				<input type="checkbox" name="interest" value="blue" onclick=CountChecked(this)> �Ķ�
				<input type="checkbox" name="interest" value="purple" onclick=CountChecked(this)> ����<br>
				<input type="checkbox" name="interest" value="gray" onclick=CountChecked(this)> ȸ��
				<input type="checkbox" name="interest" value="pink" onclick=CountChecked(this)> ��ũ
				<input type="checkbox" name="interest" value="black" onclick=CountChecked(this)> ����<br>
				<input type="checkbox" name="interest" value="white" onclick=CountChecked(this)> ���
				<input type="checkbox" name="interest" value="navy" onclick=CountChecked(this)> ���̺�
				<input type="checkbox" name="interest" value="lime" onclick=CountChecked(this)> ����<br>
				<div class="validation"></div>
			</div>


			<div class="text-center">
				<button type="submit" class="btn btn-success">Sign</button>
			</div>
		</form>
	</div>



</body>
</html>