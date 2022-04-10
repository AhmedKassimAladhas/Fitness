<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix = "x" uri = "http://java.sun.com/jsp/jstl/xml" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>    
<!DOCTYPE html>
<html >
<head>
<meta charset="utf-8">
<title>حسابات اليوم</title>

<link href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css" rel="stylesheet">
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
<%@include file="Template.jsp" %>
</head>
<body background="${pageContext.request.contextPath}/resources/img/71jk2TsQG4L._AC_SL1468_.jpg">
<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 20%; visibility: ${buttonAcc};">
			<button class="btn btn-primary btn-lg" type="button" 
				data-toggle="modal" data-target="#accModal">إنهاء حسابات اليوم</button>
		</div>

		<div class="AccTable" style="width: 1000px; margin-top: 2%; visibility: ${tableAcc};">

			<div
				style="width: 1000px; position: relative; height: 400px; overflow: auto;">
				<table class="table table-hover table-dark">
					<thead>
						<tr>
							<th scope="col">ملاحظات</th>
							<th scope="col">الاجمالي</th>
							<th scope="col">المصروفات</th>
							<th scope="col">تدريب بدون اشتراك</th>
							<th scope="col">البيع</th>
							<th scope="col">الاشتراكات</th>
							<th scope="col">تاريخ اليوم</th>
							<th scope="col">الموظف</th>
							<th scope="col">التسلسل</th>
						</tr>
					</thead>
					<tbody id="myTable" style="overflow: scroll;">
						<c:forEach items="${allAcc}" var="aAcc">
							<tr>
								<td>${aAcc.notes}</td>
								<td>${aAcc.total}</td>
								<td>${aAcc.expense}</td>
								<td>${aAcc.trainingToday}</td>
								<td>${aAcc.prod}</td>
								<td>${aAcc.subscrip}</td>
								<td>${aAcc.date_today}</td>
								<td>${aAcc.emp}</td>
								<th scope="row">${aAcc.id}</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<form:form class="endAcc" action="EndToday" method="post"
			modelAttribute="acc">
			<div class="modal fade" id="accModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">انهاء حسابات اليوم</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">الموظف</label>
								<form:input class="form-control" path="Emp" type="text"
									value="${name.e.name}" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">تاريخ
									اليوم</label>
								<form:input class="form-control" path="Date_today" type="date"
									value="${date}" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الاشتراكات</label>
								<form:input class="form-control" path="Subscrip" type="text"
									value="${sub}" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">البيع</label>
								<form:input class="form-control" path="Prod" type="text"
									value="${sell}" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">تدريب بدون اشتراك</label>
								<form:input class="form-control" path="trainingToday" type="text"
									value="${today}" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">المصروفات</label>
								<form:input class="form-control" path="Expense" type="text"
									value="${exp}" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الاجمالي</label>
								<form:input class="form-control" path="Total" type="text"
									value="${tot}" readonly="true"/>
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