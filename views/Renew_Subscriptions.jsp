<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>تجديد اشتراك</title>

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
				$("#myInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#myTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
</script>

<script>
	$(document).ready(function() {
		$('#addnewModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var cna = button.data('cna') // Extract info from data-* attributes
			var cui = button.data('cui')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #ciname').val(cna)
			modal.find('.modal-body #cin').val(cui)
		})
		$("#pric").change(function() {
			var select = $("#pric option:selected").attr("data-pc");
			$("#price").val(select)
		})
	});
</script>

<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/header-home.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 25%;">

			<a class="btn btn-outline-primary btn-lg" href="NewSubscriptions">الاشتراكات</a>
		</div>

		<div align="right" style="margin-top: 1%;">

			<div class="SecTable" style="width: 1000px; margin-top: 2%;">
				<input class="form-control" id="myInput" type="text"
					placeholder="Search.."> <br>
				<div
					style="width: 1000px; position: relative; height: 400px; overflow: auto;">
					<table class="table table-hover table-dark">
						<thead>
							<tr>
								<th scope="col"></th>
								<th scope="col">اخر اشتراك انتهى</th>
								<th scope="col">عدد الاشتراكات</th>
								<th scope="col">نوع الجنس</th>
								<th scope="col">العنوان</th>
								<th scope="col">الموبايل 2</th>
								<th scope="col">الموبايل 1</th>
								<th scope="col">اسم العميل</th>
								<th scope="col">التسلسل</th>
							</tr>
						</thead>
						<tbody id="myTable" style="overflow: scroll;">
							<c:forEach items="${allcust}" var="aCust">
								<tr>
									<td>
										<button type="button" class="btn btn-warning btn-xs"
											data-toggle="modal" data-target="#addnewModal"
											data-cui="${aCust.cid}" data-cna="${aCust.name}">تجديد
											الاشتراك</button>
									</td>
									<td>${aCust.sub_end}</td>
									<td>${aCust.subscrip_Number}</td>
									<td>${aCust.gender}</td>
									<td>${aCust.address}</td>
									<td>${aCust.phone2}</td>
									<td>${aCust.phone}</td>
									<td>${aCust.name}</td>
									<th scope="row">${aCust.cid}</th>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>

			<form:form class="addNewSub" action="RenewSubscriptions"
				method="post">
				<div class="modal fade" id="addnewModal" tabindex="-1" role="dialog"
					aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
					<div class="modal-dialog modal-dialog-scrollable" role="document">
						<div class="modal-content">
							<div class="modal-header">
								<h5 class="modal-title" id="exampleModalLabel">تجديد
									الاشتراك</h5>
								<button type="button" class="close" data-dismiss="modal"
									aria-label="Close">
									<span aria-hidden="true">&times;</span>
								</button>
							</div>

							<div class="modal-body">
								<div class="form-group">
									<label class="control-label" for="focusedInput">العميل</label>
									<input class="form-control" id="ciname" type=text value=""
										readonly="readonly" /> <input class="form-control"
										name="cust" id="cin" type="hidden" value="" />
								</div>
								<div class="form-group">
									<label for="message-text" class="col-form-label">نوع
										الاشتراك</label> <select class="form-control form-control-sm"
										name="sec" id="pric">
										<option value=""></option>
										<c:forEach items="${allSec}" var="asec">

											<option value="${asec.id}"
												data-pc="${asec.offer!='يوجد'?asec.price:asec.offer_price}">${asec.sec_name}</option>

										</c:forEach>
									</select>
								</div>
								<div class="form-group"></div>
								<div class="form-group">
									<label class="control-label" for="focusedInput">تاريخ
										بدء الاشتراك</label> <input class="form-control" name="date_start"
										type="date" value="" />
								</div>
								<div class="form-group">
									<label class="control-label" for="focusedInput">تاريخ
										انتهاء الاشتراك</label> <input class="form-control" name="date_end"
										type="date" value="" />
								</div>
								<div class="form-group">
									<label class="control-label" for="focusedInput">عدد
										ايام التدريب</label> <input class="form-control" name="count"
										type="number" value="" />
								</div>
								<div class="form-group">
									<label class="control-label" for="focusedInput">السعر</label> <input
										class="form-control" name="price" type="text" id="price"
										value="" readonly="readonly" />
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
	</div>
</body>
</html>