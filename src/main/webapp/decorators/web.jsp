<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <!-- Basic -->
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    
    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">
    
    <title><dec:title default="Trang chủ" /></title>

    <!-- css -->
<%-- 	<link href="<c:url value='/template/web/bootstrap/css/bootstrap.css' />" rel="stylesheet" type="text/css" media="all"/> --%>
<%-- 	<link href="<c:url value='/template/web/css/style.css' />" rel="stylesheet" type="text/css" media="all"/> --%>
	
	<link rel="shortcut icon" href="<c:url value='/template/web/images/favicon.ico'/>" type="image/x-icon" />
    <link rel="apple-touch-icon" href="<c:url value='/template/web/images/apple-touch-icon.png'/>">
    
    <!-- Design fonts -->
    <link href="https://fonts.googleapis.com/css?family=Ubuntu:300,400,400i,500,700" rel="stylesheet"> 
    <link href="https://fonts.googleapis.com/css?family=Roboto:300,400,400i,500,700,900" rel="stylesheet"> 

    <!-- Bootstrap core CSS -->
    <link href="<c:url value='/template/web/css/bootstrap.css' />" rel="stylesheet" type="text/css" media="all"/>

    <!-- FontAwesome Icons core CSS -->
    <link href="<c:url value='/template/web/css/font-awesome.min.css' />" rel="stylesheet" type="text/css" media="all"/>

    <!-- Custom styles for this template -->
    <link href="<c:url value='/template/web/css/web.css' />" rel="stylesheet" type="text/css" media="all"/>

    <!-- Responsive styles for this template -->
    <link href="<c:url value='/template/web/css/responsive.css' />" rel="stylesheet" type="text/css" media="all"/>

    <!-- Colors for this template -->
    <link href="<c:url value='/template/web/css/colors.css' />" rel="stylesheet" type="text/css" media="all"/>

    
</head>
<body>
 	<div id="wrapper">
	<!-- header -->
    <%@ include file="/common/web/header.jsp" %>
    <!-- header -->
    
    <div class="container">
    	<dec:body/>
    </div>

	<!-- footer -->
	<%@ include file="/common/web/footer.jsp" %>
	<!-- footer -->
	</div>
	
<%-- 	<script type="text/javascript" src="<c:url value='/template/web/jquery/jquery.min.js' />"></script> --%>
<%--     <script type="text/javascript" src="<c:url value='/template/web/bootstrap/js/bootstrap.bundle.min.js' />"></script> --%>

	<script src="<c:url value='/template/web/js/jquery.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/tether.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/template/web/js/custom.js'/>"></script>
	
</body>
</html>