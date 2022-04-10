<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>الحسابات</title>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>

<script type="text/javascript">
	$(document).ready(
			function() {
				$("#accInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#accTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
				$("#expInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#expTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
				$("#sellInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#sellTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
				$("#todayInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#todayTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
				$("#subInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#subTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>

<script>
	$(document).ready(function() {
		$('#returnSellModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var sid = button.data('sid') // Extract info from data-* attributes
			var sprod = button.data('sprod')
			var sdate = button.data('sdate')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #prod').text(sprod)
			modal.find('.modal-body #dat').text(sdate)
			modal.find('.modal-body #id').val(sid)
		})
	});
</script>
<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/61y85CP0bGL._AC_SL1100_.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 85%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#subCollapse"
				aria-expanded="false" aria-controls="#subCollapse">الاشتراكات</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#trainingCollapse"
				aria-expanded="false" aria-controls="#trainingCollapse">تدريب
				بدون اشتراك</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#sellCollapse"
				aria-expanded="false" aria-controls="#sellCollapse">البيع</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#expCollapse"
				aria-expanded="false" aria-controls="#expCollapse">المصروفات</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#accTodayCollapse"
				aria-expanded="false" aria-controls="#accTodayCollapse">حسابات
				اليومية</button>
		</div>

		<div align="right" id="accordionExample2" style="margin-top: 1%;">

			<div class="btn-group">
				<div id="accTodayCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="accTodayTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="accInput" type="date"
							placeholder="Search.." value=""> <br>
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
							<tbody id="accTable" style="overflow: scroll;">
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
			</div>

			<div class="btn-group">
				<div id="expCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="expTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="expInput" type="date"
							placeholder="Search.." value=""> <br>
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
							<tbody id="expTable" style="overflow: scroll;">
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
			</div>

			<div class="btn-group">
				<div id="sellCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="sellTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="sellInput" type="date"
							placeholder="Search.." value=""> <br>
						<table class="table table-hover table-dark">
							<thead>
								<tr>
									<th scope="col"></th>
									<th scope="col">ملاحظات</th>
									<th scope="col">الاجمالي</th>
									<th scope="col">الخصم</th>
									<th scope="col">العدد</th>
									<th scope="col">السعر</th>
									<th scope="col">المنتج</th>
									<th scope="col">الموظف</th>
									<th scope="col">تاريخ اليوم</th>
									<th scope="col">التسلسل</th>
								</tr>
							</thead>
							<tbody id="sellTable" style="overflow: scroll;">
								<c:forEach items="${allSell}" var="aSell">
									<tr>
										<td>
											<button type="button" class="btn btn-outline-info btn-xs"
												data-toggle="modal" data-target="#returnSellModel"
												data-sid="${aSell.id}" data-sdate="${aSell.date_sell}"
												data-sprod="${aSell.prod.name_Prod}">
												استرجاع المنتج</button>
										</td>
										<td>${aSell.notes}</td>
										<td>${aSell.total}</td>
										<td>${aSell.discount}</td>
										<td>${aSell.count}</td>
										<td>${aSell.price}</td>
										<td>${aSell.prod.name_Prod}</td>
										<td>${aSell.emp}</td>
										<td>${aSell.date_sell}</td>
										<th scope="row">${aSell.id}</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<form:form class="returnSell" action="Sell" method="delete">
						<div class="modal fade" id="returnSellModel" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">تأكيد  استرجاع المنتج</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										 <label id="prod"></label> &nbsp; : هل تريد استرجاع المنتج<br>
										    <label id="dat"></label> &nbsp; : بتاريخ
										 <input
											type="hidden" id="id" name="id" />
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">إلغاء</button>
										<button type="submit" class="btn btn-primary">إسترجاع</button>
									</div>
								</div>
							</div>
						</div>
					</form:form>

				</div>
			</div>

			<div class="btn-group">
				<div id="trainingCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="TrainingTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="todayInput" type="date"
							placeholder="Search.." value=""> <br>
						<table class="table table-hover table-dark">
							<thead>
								<tr>
									<th scope="col">السعر</th>
									<th scope="col">الموبايل</th>
									<th scope="col">الاسم</th>
									<th scope="col">الاشتراك</th>
									<th scope="col">التاريخ</th>
									<th scope="col">التسلسل</th>
								</tr>
							</thead>
							<tbody id="todayTable" style="overflow: scroll;">
								<c:forEach items="${allToday}" var="atoday">
									<tr>
										<td>${atoday.price}</td>
										<td>${atoday.phone}</td>
										<td>${atoday.name}</td>
										<td>${atoday.subscrip}</td>
										<td>${atoday.date}</td>
										<th scope="row">${atoday.id}</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>

			<div class="btn-group">
				<div id="subCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="SubTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="subInput" type="date"
							placeholder="Search.." value=""> <br>
						<table class="table table-hover table-dark">
							<thead>
								<tr>
									<th scope="col">حالة الاشتراك</th>
									<th scope="col">السعر</th>
									<th scope="col">عدد مرات التدريب</th>
									<th scope="col">عدد الحصص</th>
									<th scope="col">تاريخ الانتهاء</th>
									<th scope="col">تاريخ البدء</th>
									<th scope="col">نوع الاشتراك</th>
									<th scope="col">اسم العميل</th>
									<th scope="col">التسلسل</th>
								</tr>
							</thead>
							<tbody id="subTable">
								<c:forEach items="${allSub}" var="aSub">
									<tr>
										<td>${aSub.expiry}</td>
										<td>${aSub.price}</td>
										<td>${aSub.countDone}</td>
										<td>${aSub.count}</td>
										<td>${aSub.date_end}</td>
										<td>${aSub.date_start}</td>
										<td>${aSub.sec.sec_name}</td>
										<td>${aSub.cust.name}</td>
										<th scope="row">${aSub.id}</th>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

				</div>
			</div>
		</div>
	</div>
</body>
</html>