<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng nhập</title>
</head>
<body>
	<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="active"> Đăng nhập </h2>

    <!-- Login Form -->
    <form action="j_spring_security_check" id="formLogin" method="post">
      <input type="text" id="login" class="fadeIn second" name="j_username" placeholder="Tên đăng nhập">
      <input type="text" id="password" class="fadeIn third" name="j_password" placeholder="Mật khẩu">
      <input type="submit" class="fadeIn fourth" value="Log In">
    </form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
    <a class="titleFooter">Bạn đã có tài khoản?</a>
      <a class="underlineHover" href="<c:url value='/dang-ky'/>">Đăng Ký?</a>
    </div>

  </div>
</div>
</body>
</html>