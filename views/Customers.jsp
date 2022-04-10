<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>العملاء</title>

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
			});
</script>

<script>
	$(document).ready(function() {
		
		$('#editModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var userID = button.data('i') // Extract info from data-* attributes
			var userName = button.data('na')
			var userp = button.data('ph1')
			var userp2 = button.data('ph2')
			var userad = button.data('ad')
			var userge = button.data('ge')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #id').val(userID);
			modal.find('.modal-body #name').val(userName)
			modal.find('.modal-body #phone').val(userp)
			modal.find('.modal-body #phone2').val(userp2)
			modal.find('.modal-body #address').val(userad)
			modal.find('.modal-body #gender').val(userge)
			modal.find('.modal-body #gender').text(userge)
		})
$('#bodyModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var cui = button.data('cui') // Extract info from data-* attributes
			var cna = button.data('cna')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #cname').val(cna)
			modal.find('.modal-body #cnid').val(cui)
		})		
	});
</script>
<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/header-home.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 40%;">
			<a class="btn btn-outline-primary btn-lg" href="Training">تدريبات اليوم</a>
			&nbsp;
			<a class="btn btn-outline-primary btn-lg" href="NewSubscriptions">تسجيل اشتراك جديد</a>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="modal" data-target="#custModal">اضافة العملاء</button>
		</div>

		<div class="custTable" style="width: 1000px; margin-top: 2%;">
			<input class="form-control" id="myInput" type="text"
				placeholder="Search.."> <br>
			<div
				style="width: 1000px; position: relative; height: 400px; overflow: auto;">
				<table class="table table-hover table-dark">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">نوع الجنس</th>
							<th scope="col">العنوان</th>
							<th scope="col">الموبايل 2</th>
							<th scope="col">الموبايل 1</th>
							<th scope="col">اسم العميل</th>
							<th scope="col">التسلسل</th>
						</tr>
					</thead>
					<tbody id="myTable" style="overflow: scroll;">
						<c:forEach items="${allCust}" var="aCust">
							<tr>
								<td>
									<button type="button" class="btn btn-warning btn-xs"
										data-toggle="modal" data-target="#bodyModel"
										data-cui="${aCust.cid}" data-cna="${aCust.name}">اضافة قياسات الجسم</button>
									&nbsp;&nbsp;
									<a title="تعديل" style="cursor: pointer;"
										data-toggle="modal" data-target="#editModal"
										data-i="${aCust.cid}" data-na="${aCust.name}"
										data-ph1="${aCust.phone}" data-ph2="${aCust.phone2}"
										data-ad="${aCust.address}" data-ge="${aCust.gender}">
										<img src="${pageContext.request.contextPath}/resources/img/icons8_edit_30px_2.png" width="30" height="30" alt="">
										</a>
								</td>
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

		<form:form class="addCustm" action="Customers" method="post"
			modelAttribute="cust">
			<div class="modal fade" id="custModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">تسجيل عميل
								جديد</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">الاسم</label>
								<form:input class="form-control" path="Name" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الموبايل1</label>
								<form:input class="form-control" path="Phone" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الموبايل2</label>
								<form:input class="form-control" path="Phone2" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">العنوان</label>
								<form:input class="form-control" path="Address" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">نوع
									الجنس</label>
								<form:select class="form-control form-control-sm" path="Gender">
									<form:option value="ذكر">ذكر</form:option>
									<form:option value="انثى">انثى</form:option>
								</form:select>
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

		<form:form class="editCust" action="Customers" method="put"
			modelAttribute="cust">
			<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">تعديل بيانات
								عميل</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">التسلسل</label>
								<form:input class="form-control" path="cid" type="text" value=""
									readonly="true" id="id" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الاسم</label>
								<form:input class="form-control" path="Name" type="text"
									value="" id="name" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الموبايل1</label>
								<form:input class="form-control" path="Phone" type="text"
									value="" id="phone" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الموبايل2</label>
								<form:input class="form-control" path="Phone2" type="text"
									value="" id="phone2" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">العنوان</label>
								<form:input class="form-control" path="Address" type="text"
									value="" id="address" />
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">نوع
									الجنس</label>
								<form:select class="form-control form-control-sm" path="Gender">
									<optgroup hidden="true">
										<form:option id="gender" value=""></form:option>
									</optgroup>
									<form:option value="ذكر">ذكر</form:option>
									<form:option value="انثى">انثى</form:option>
								</form:select>
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

		

		<form:form class="bodyCustm" action="Body" method="post">
			<div class="modal fade" id="bodyModel" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">قياسات الجسم</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">تاريخ اليوم</label>
								<input class="form-control" name="Today_date" type="date"
									value="${date}" readonly="readonly" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">العمر</label>
								<input class="form-control" name="Age" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الطول</label>
								<input class="form-control" name="Hight" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الوزن</label>
								<input class="form-control" name="Weight" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">نسبة الدهون</label>
								<input class="form-control" name="Fats" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">نسبة العضلات</label>
								<input class="form-control" name="Muscles" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">السعرات الحرارية</label>
								<input class="form-control" name="Calories" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">العميل</label>
								<input class="form-control" id="cname" type="text"
									value="" readonly="readonly"/>
								<input class="form-control" id="cnid" name="c" type="hidden"
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