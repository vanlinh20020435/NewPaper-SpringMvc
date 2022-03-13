<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@include file="/common/taglib.jsp"%>
<c:url var="loginURL" value="/dang-nhap"/>
<c:url var="signUpURL" value="/dang-ky"/>
<c:url var="userAPI" value="/api/user"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Đăng Ký</title>
</head>
<body>
	<div class="wrapper fadeInDown">
  <div id="formContent">
    <!-- Tabs Titles -->
    <h2 class="active"> Đăng ký </h2>

    <!-- Login Form -->
   <form:form class="form-horizontal" role="form" id="formSubmit" modelAttribute="model">
      <div class="form-group">
     	 <input type="text" id="login" class="fadeIn second" name="fullName" placeholder="Tên Đầy Đủ">
      </div>
   	  <div class="form-group">
     	 <input type="text" id="login" class="fadeIn second" name="userName" placeholder="Tên Đăng Nhập">
      </div>
      <div class="form-group">
    	  <input type="text" id="password" class="fadeIn third" name="password" placeholder="Mật Khẩu">
      </div>
      <input type="submit" id="btnSignUp" class="fadeIn fourth" value="Đăng Ký">
    </form:form>

    <!-- Remind Passowrd -->
    <div id="formFooter">
    <a class="titleFooter">Bạn đã có tài khoản?</a>
      <a class="underlineHover" href="<c:url value='/dang-nhap'/>">Đăng Nhập?</a>
    </div>

  </div>
</div>
<script>
$('#btnSignUp').click(function (e) {
    e.preventDefault();
    var data = {};
    var formData = $('#formSubmit').serializeArray();
    $.each(formData, function (i, v) {
        data[""+v.name+""] = v.value;
    });
    addUser(data);
   
});

function addUser(data) {
	$.ajax({
        url: '${userAPI}',
        type: 'POST',
        contentType: 'application/json',
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (result) {
        	window.location.href = "${loginURL}";
        },
        error: function (error) {
        	window.location.href = "${signUpURL}";
        }
    });
}
</script>
</body>
</html>