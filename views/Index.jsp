<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1" --%>
<%--  pageEncoding="ISO-8859-1" isELIgnored="false"%> --%>
<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>الصفحة الرئيسية</title>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>


<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/fitness-background.jpg">

	<div class="container-fluid" align="right" style="margin-top: 6%;">

		<div>
			<div class="row">
				<div class="col-sm-4">
					<div class="card" style="background-color: #d4453e;">
						<div class="card-body">
							<h5 class="card-title" align="center" style="font-weight: bold;">
								<span class="badge badge-light">${custNumNotSub}</span>&nbsp;&nbsp;
								عدد العملاء بدون اشتراك
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
									alt="num" src="${pageContext.request.contextPath}/resources/img/icons8_weightlifting_80px.png">
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card" style="background-color: #c62922;">
						<div class="card-body">
							<h5 class="card-title" align="center" style="font-weight: bold;">
								<span class="badge badge-light">${custNumSub}</span>&nbsp;&nbsp;
								عدد المشتركين
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
									alt="num" src="${pageContext.request.contextPath}/resources/img/icons8_weightlifting_80px.png">
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card" style="background-color: #990b0b;">
						<div class="card-body">
							<h5 class="card-title" align="center" style="font-weight: bold;">
								<span class="badge badge-light">${allCustNum}</span>&nbsp;&nbsp;
								عدد عملائنا
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
									alt="num" src="${pageContext.request.contextPath}/resources/img/icons8_weightlifting_80px.png">
							</h5>
						</div>
					</div>
				</div>
			</div>
		</div>

		<div style="margin-top: 3%;">
			<div class="row">
				<div class="col-sm-4">
					<div class="card" style="background-color: #26568e;">
						<div class="card-body">
							<h5 class="card-title" align="center" style="font-weight: bold;">
								<span class="badge badge-light">${numCustNotSubToday}</span>&nbsp;&nbsp;
								عدد المتدربين بدون إشتراك
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
									alt="num" src="${pageContext.request.contextPath}/resources/img/icons8_bench_press_80px.png">
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card" style="background-color: #14457a;">
						<div class="card-body">
							<h5 class="card-title" align="center" style="font-weight: bold;">
								<span class="badge badge-light">${numCustSubToday}</span>&nbsp;&nbsp;
								عدد المتدربين بإشتراك
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
									alt="num" src="${pageContext.request.contextPath}/resources/img/icons8_bench_press_80px.png">
							</h5>
						</div>
					</div>
				</div>
				<div class="col-sm-4">
					<div class="card" style="background-color: #062b56;">
						<div class="card-body">
							<h5 class="card-title" style="font-weight: bold;" align="center">
								<span class="badge badge-light">${numAllTriningToday}</span>&nbsp;&nbsp;
								عدد المتدربين اليوم
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <img
									alt="num" src="${pageContext.request.contextPath}/resources/img/icons8_bench_press_80px.png">
							</h5>


						</div>
					</div>
				</div>
			</div>
		</div>

		<div style="margin-top: 2%; " align="right">

			<div class="col-sm-5" >
				<div class="card" style="background-color: #065356;">
					<div class="card-body">
						<h6 class="card-title" align="center" style="font-weight: bold;">
							<span class="badge badge-light">${numAllSubToday}</span>
							&nbsp;&nbsp; عدد الاشتراكات المنتهي اليوم
						</h6>
						<div style="height: 150px;   overflow: scroll;">
						<div class="list-group">
							<c:forEach items="${subEndToday}" var="cust">
							<h6  class="list-group-item "> ${cust.cust.name} </h6>
							</c:forEach>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>



</body>
</html>