<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.User" %>
<%@page import="model.service.UserManager" %>
<%@page import="model.service.UserNotFoundException" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked") 
	List<User> userList = (List<User>)request.getAttribute("userList");
	String curUserId = (String)request.getAttribute("curUserId");
%>
<html>
<head>
<title>사용자 관리</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<link rel=stylesheet href="<c:url value='/css/user.css' />" type="text/css">
</head>
<body bgcolor=#FFFFFF text=#000000 leftmargin=0 topmargin=0 marginwidth=0 marginheight=0>

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
    
    <%
    	UserManager manager = UserManager.getInstance();
    	User us = manager.findUser(curUserId);
    %>
   
   <c:choose>
    	<c:when test='${sessionScope.user eq null}'>
    		<li><a href="<c:url value='/user/register/form' />"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      		<li><a href="<c:url value='/user/login/form' />"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    	</c:when>
    	<c:otherwise>
      		<li><a href="<c:url value='/user/mypage'><c:param name='user_id' value='<%=us.getUser_id() %>'/></c:url>"><span class="glyphicon glyphicon-user"></span><%=curUserId%>&nbsp;님</a></li>
      		<li><a href="<c:url value='/user/logout' />"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
    	</c:otherwise>
    </c:choose>
    </ul>
  </div>
</nav>


<br>
<table style="width:100%">
  <tr>
  	<td width="20"></td>
    <td>
    	<a href="<c:url value='/user/logout' />">로그아웃(&nbsp;<%=curUserId%>&nbsp;)</a> 
    	<a href="<c:url value='/' />">메인으로&nbsp;</a>
    </td>
  </tr>
  <tr><td>&nbsp;</td><td>&nbsp;</td></tr>
  <tr>
	<td width="20"></td>
	<td>
	  <table>
		<tr>
		  <td bgcolor="f4f4f4" height="22">&nbsp;&nbsp;<b>사용자 관리 - 리스트</b>&nbsp;&nbsp;</td>
		</tr>
	  </table>  
	  <br>		  
	  <table style="background-color: YellowGreen">
		<tr>
		  <td width="190" align="center" bgcolor="E6ECDE" height="22">사용자 ID</td>
		  <td width="200" align="center" bgcolor="E6ECDE">닉네임</td>
		  <td width="200" align="center" bgcolor="E6ECDE">포인트</td>
		  <td width="200" align="center" bgcolor="E6ECDE">관심사</td>
		</tr>
<%
	if (userList != null) {	
	  Iterator<User> userIter = userList.iterator();
	
	  //사용자 리스트를 클라이언트에게 보여주기 위하여 출력.
	  while ( userIter.hasNext() ) {
		User user = (User)userIter.next();
%>		  	
		<tr>
		  <td width="190" align="center" bgcolor="ffffff" height="20">
			<%=user.getUser_id()%>
		  </td>
		  <td width="200" bgcolor="ffffff" style="padding-left: 10">
			<a href="<c:url value='/user/view'>
					   <c:param name='userId' value='<%=user.getUser_id()%>'/>
			 		 </c:url>">
			  <%=user.getNickname()%></a>
		  </td>
		  <td width="200" align="center" bgcolor="ffffff" height="20">
			  <%=user.getTotal_point()%>
		  </td>
		  <td width="200" align="center" bgcolor="ffffff" height="20">
			  <%=user.getInterest1() %>
			  <%
			  	if (user.getInterest2() != null)
			  		out.print(user.getInterest2() + " ");
			  	if (user.getInterest3() != null)
			  		out.print(user.getInterest3());
			  %>
		  </td>
		</tr>
<%
	  }
	}
%>	  	
	  </table>	  	 
	  <br>   
	  
	</td>
  </tr>
</table>  
</body>
</html>