<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="model.User" %>
<%@page import="model.service.UserManager" %>
<%@page import="model.service.UserNotFoundException" %>
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

</head>
<body>
   <nav class="main-nav-outer" id="test">
      <div class="container">
         <ul class="main-nav">
            <li><a href="<c:url value='/main/main' />">������</a></li>
            <li><a href="<c:url value='/user/list' />">����ڸ���Ʈ</a></li>
            <li><a href="<c:url value='/boot' />">��Ʈ��Ʈ�� ����</a></li>
            <li class="small-logo">
               <a href="<c:url value='/main/main' />"><img src="<c:url value='/img/small-blogo.png' />" alt=""></a>
            </li>
            <li><a href="<c:url value='/post/create/form' />">���ۼ�</a></li>

            <!-- �α��ο��ο� ���� �ٸ� -->
            <c:choose>
               <c:when test='${sessionScope.user eq null}'>
                  <li><a href="<c:url value='/user/register/form' />">Sign
                        Up</a></li>
                  <li><a href="<c:url value='/user/login/form' />">Login</a></li>
               </c:when>
               <c:otherwise>
                  <li><a><%=curUserId%>&nbsp;��</a></li>
                  <li><a href="<c:url value='/user/logout' />">Logout</a></li>
               </c:otherwise>
            </c:choose>

         </ul>
         <a class="res-nav_click" href="#"><i class="fa fa-bars"></i></a>
      </div>
   </nav>
   
   <section class="main-section client-part" id="client">
      <!--main-section client-part-start-->
      <div class="container">
         <b class="quote-right wow fadeInDown delay-03"><i class="fa fa-quote-right"></i></b>
         <div class="row">
            <div class="col-lg-12">
               <p class="client-part-haead wow fadeInDown delay-05">ȸ���������ּż� �����մϴ�!</p>
               </br></br></br>
            </div>
         </div>
         <ul class="client wow fadeIn delay-05s">
            <li><a class="link delay-1s servicelink" href="<c:url value='/user/login/form' />">�α���</a></li>
            <li><a class="link delay-1s servicelink" href="<c:url value='/' />">��������</a></li>
            </br>
         </ul>
      </div>
   </section>

   <footer class="footer">
      <div class="container">
         <div class="footer-logo"><a href="#"><img src="<c:url value='/img/blogo.png' />" alt=""></a></div>
         <span class="copyright">&copy; TEAM ABT All Rights Reserved</span>
         <div class="credits">   
            �������ڴ��б� �����ͺ��̽����α׷���<br>�ں��� ���ҿ� ������
         </div>
      </div>
   </footer>

</body>
</html>