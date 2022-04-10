<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--  pageEncoding="ISO-8859-1" isELIgnored="false"%> --%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<title></title>
<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script>
	function startTime() {
		var today = new Date();
		var h = today.getHours();
		var m = today.getMinutes();
		var s = today.getSeconds();
		
		m = checkTime(m);
		s = checkTime(s);		
		document.getElementById('txt').innerHTML = 
			h+":"+m+":"+s;
		t = setTimeout(function(){startTime()},500);
	}
	
	function checkTime(i)
	{
		if(i<10)
		{
			i = "0" + i;
		}
		return i;
	}
</script>

</head>

<body onload="startTime()">
<header>
<div class="fixed-top">
  <nav class="navbar navbar-dark bg-primary" style="height: 60px;">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
				
      			<c:set var = "now" value = "<%=new java.util.Date()%>" />
      				<h4><var id="txt"></var> &nbsp; <fmt:formatDate value = "${now}" 
         				type = "date"  dateStyle = "long" />
         			</h4>	
									
					<a class="btn btn-secondary btn-sm" href="logout" 
					style="">
					<img src="${pageContext.request.contextPath}/resources/img/logout-left-30px.png" width="20" height="20" alt="">
					خروج
					</a>										
				
  </nav>
  <div class="collapse" id="navbarToggleExternalContent" style="width: 200px; height: 700px;">
    <div class="bg-primary "  style="width: 200px; height: 700px;">
   
   <div class="card text-white bg-primary">
  
  <img style="height: 80px; width: 198px;; display: block;" src="${pageContext.request.contextPath}/resources/img/logo2.jpg" class="card-img-top" alt="Card image">
  <div class="card-body">
  
  
    <h6 class="card-text" align="right"><label>${name.e.name}</label>&nbsp;&nbsp;&nbsp; مرحبا </h6>
  
    <h6 class="card-text" align="center" style="color: silver;"> ${name.e.job} </h6>
  </div>
</div>
   
    <div class="accordion" id="accordionExample" style="width: 200px;">

  <div class="list-group-vertical">
      
        <a class="btn btn-primary btn-lg btn-block" style="width: 200px;"  href="Index">
        <img src="${pageContext.request.contextPath}/resources/img/home_page_30px.png" width="20" height="20" alt="">
          الصفحة الرئيسية 
        </a>
      	<a href="Training" class="btn btn-primary btn-lg btn-block" style="width: 200px;" >
      	<img src="${pageContext.request.contextPath}/resources/img/icons8_deadlift_30px.png" width="20" height="20" alt="">
      	تدريبات اليوم
      	</a>
  </div>
  
  <div class="btn-group-vertical">
    
    
        <button class="btn btn-primary " style="width: 200px;" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
        <img src="${pageContext.request.contextPath}/resources/img/icons8_down_button_30px.png" width="20" height="20" alt="">
          &nbsp;التسجيلات
        </button>
   
    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
      
      <div class="list-group" style="width: 200px;" align="center">       
        <a href="Customers" class="list-group-item" style="text-decoration: none;">تسجيل عميل</a>
      <c:if test="${name.grants!='مستخدم'}">
        <a href="Employees" class="list-group-item" style="text-decoration: none;" >تسجيل موظف</a>
        <a href="Product" class="list-group-item" style="text-decoration: none;">تسجيل منتجات للبيع</a>
        <a href="Sections" class="list-group-item" style="text-decoration: none;">تسجيل أقسام</a>
        <a href="Dates" class="list-group-item" style="text-decoration: none;">تسجيل مواعيد التدريبات</a>
      </c:if>  
      </div>
      
    </div>
  </div>
  <div class="btn-group-vertical">
  
        <button class="btn btn-primary " style="width: 200px;" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          <img src="${pageContext.request.contextPath}/resources/img/icons8_down_button_30px.png" width="20" height="20" alt="">
          الاشتراكات
        </button>
    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
        
	  <div class="list-group" style="width: 200px;" align="center">       
        <a href="NewSubscriptions" class="list-group-item" style="text-decoration: none;" >تسجيل اشتراك</a>
        <a href="RenewSubscriptions" class="list-group-item" style="text-decoration: none;">تجديد اشتراك</a>
        <a href="FollowUp" class="list-group-item" style="text-decoration: none;">العملاء والاشتراكات</a>
      </div>
      
    </div>
  </div>
  <div class="btn-group-vertical">
  
        <button class="btn btn-primary " style="width: 200px;" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
         <img src="${pageContext.request.contextPath}/resources/img/icons8_down_button_30px.png" width="20" height="20" alt="">
         &nbsp;&nbsp;الحسابات
        </button>
    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
     
      <div class="list-group" style="width: 200px;" align="center">       
        <a href="Expenses" class="list-group-item" style="text-decoration: none;" >المصروفات</a>
        <a href="Sell" class="list-group-item" style="text-decoration: none;">بيع منتج</a>
        <a href="EndToday" class="list-group-item" style="text-decoration: none;">تقفيل حساب اليوم</a>
      <c:if test="${name.grants!='مستخدم'}">  
        <a href="Accounts" class="list-group-item" style="text-decoration: none;">مراجعة الحسابات</a>
      </c:if>
      </div>
    
    </div>
  </div>
</div>
         
    </div>
  </div>
  
</div>
</header>
</body>
</html>