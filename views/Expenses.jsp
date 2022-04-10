<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<title>المصروفات</title>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
<%@include file="Template.jsp" %>
</head>
<body background="${pageContext.request.contextPath}/resources/img/banner-background.jpg">
<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 20%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="modal" data-target="#expensesModal">مصروف جديد</button>
		</div>

		<div class="ExpensesTable" style="width: 1000px; margin-top: 2%;">

			<div
				style="width: 1000px; position: relative; height: 400px; overflow: auto;">
				<table class="table table-hover table-dark">
					<thead>
						<tr>
							<th scope="col">ملاحظات</th>
							<th scope="col">السعر</th>
							<th scope="col">الموظف</th>
							<th scope="col">المصروف</th>
							<th scope="col">تاريخ اليوم</th>
							<th scope="col">التسلسل</th>
						</tr>
					</thead>
					<tbody id="myTable" style="overflow: scroll;">
						<c:forEach items="${allExp}" var="aExp">
							<tr>
								<td>${aExp.notes}</td>
								<td>${aExp.price}</td>
								<td>${aExp.emp}</td>
								<td>${aExp.ex_name}</td>
								<td>${aExp.date_entry}</td>
								<th scope="row">${aExp.id}</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<form:form class="addExpenses" action="Expenses" method="post"
			modelAttribute="exp">
			<div class="modal fade" id="expensesModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">اضافة صرف
								جديد</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">تاريخ
									الصرف</label>
								<form:input class="form-control" path="date_entry" type="date"
									value="${date}" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">المصروف</label>
								<form:input class="form-control" path="Ex_name" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الموظف</label>
								<form:input class="form-control" path="emp" type="text"
									value="${name.e.name}" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">المبلغ</label>
								<form:input class="form-control" path="price" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">ملاحظات</label>
								<form:textarea class="form-control" path="Notes" type="text"
									value="" />
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">إلغاء</button>
							<button type="submit" class="btn btn-primary">حفظ</button>
						</div>
					</div>
				</div>
			</div>
		</form:form>

	</div>
</body>
</html>