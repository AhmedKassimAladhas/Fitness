<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org"
xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta charset="utf-8">
<title>تسجيل دخول</title>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js">
	
</script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js">
	
</script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>		
</head>
<body background="${pageContext.request.contextPath}/resources/img/loginPic.jpg">

   

<form  action="Index" method="Post" class="needs-validation" novalidate>
<div class="jumbotron shadow p-3 mb-5  rounded" 
	style="margin-top:  268.09px; margin-left: 671.36px; width: 566.99px; height: 250px; 
	background-image: url('${pageContext.request.contextPath}/resources/img/loginFrame.jpg'); "> 
   
    <br>
    <div class="form-groub">
<!--       <label for="validationCustom01">اسم المستخدم</label> -->
      <input style="text-align: right;" type="text" class="form-control" id="Username" name="Username" 
       placeholder="اسم المستخدم" value="" required>
      <div class="invalid-feedback" align="right">
        !يجب ادخال اسم المستخدم
      </div>
    </div>
    <br>
    <div class="form-groub">    
<!--       <label for="validationCustom02">كلمة المرور</label> -->
      <input style="text-align: right;" type="Password" class="form-control" id="Password" name="Password" 
       placeholder="كلمة المرور" value="" required>
      <div class="invalid-feedback" align="right">
        !يجب ادخال كلمة المرور
      </div>
    </div>
    <br>
  <button class="btn btn-primary  btn-block" type="submit">تسجيل دخول</button>
  
  <div class="form-groub" style="margin-top: 1%;">
   <c:if test="${error=='خطأ'}">
   <div class="alert alert-dismissable alert-danger" align="center"> 
		 !خطأ في اسم المستخدم او كلمة المرور
   </div> 
  	</c:if>
   </div>	
 </div> 
</form>

</body>
</html>