<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>منتجات للبيع</title>

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
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#myInput2").on(
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
		$('#deleteProdModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var aid = button.data('aid') // Extract info from data-* attributes
			var nid = button.data('nid')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #nid').text(nid)
			modal.find('.modal-body #cid').val(aid)
		})
		$('#editModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var id = button.data('i') // Extract info from data-* attributes
			var da = button.data('da')
			var np = button.data('np')
			var pr = button.data('pr')
			var cu = button.data('cu')
			var no = button.data('no')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #id').val(id);
			modal.find('.modal-body #date_entry').val(da)
			modal.find('.modal-body #Name_Prod').val(np)
			modal.find('.modal-body #Price').val(pr)
			modal.find('.modal-body #Count').val(cu)
			modal.find('.modal-body #Notes').val(no)
		})
	});
</script>

<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/banner-background.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 20%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="modal" data-target="#prodModal">اضافة منتج</button>
		</div>

		<div class="prodTable" style="width: 1000px; margin-top: 2%;">

			<div class="btn-group btn-group-justified" style="margin-right: 2%;">
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios"
						id="exampleRadios1" value="" data-toggle="collapse"
						data-target="#searchdate"> <label
						class="form-check-label" for="exampleRadios1"> بحث
						بالتاريخ </label>
				</div>
				&nbsp;&nbsp;&nbsp;&nbsp;
				<div class="form-check">
					<input class="form-check-input" type="radio" name="exampleRadios"
						id="exampleRadios2" value="" data-toggle="collapse"
						data-target="#searchall"> <label class="form-check-label"
						for="exampleRadios2"> بحث </label>
				</div>
			</div>
			<div id="accordionExample2">
				<div class="collapse" data-parent="#accordionExample2"
					id="searchall">
					<input class="form-control" id="myInput" type="text"
						placeholder="Search.." style="margin-top: 8px;">
				</div>
				<div class="collapse" data-parent="#accordionExample2"
					id="searchdate">
					<input class="form-control" id="myInput2" type="date"
						placeholder="Search.." style="margin-top: 8px;">
				</div>
			</div>
			<br>
			<div
				style="width: 1000px; position: relative; height: 400px; overflow: auto;">
				<table class="table table-hover table-dark">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">ملاحظات</th>
							<th scope="col">العدد الموجود</th>
							<th scope="col">السعر</th>
							<th scope="col">اسم المنتج</th>
							<th scope="col">تاريخ الشراء</th>
							<th scope="col">التسلسل</th>
						</tr>
					</thead>
					<tbody id="myTable" style="overflow: scroll;">
						<c:forEach items="${allprod}" var="aProd">
							<tr>
								<td>
									<a title="حذف" style="cursor: pointer;"
										data-toggle="modal" data-target="#deleteProdModel"
										data-aid="${aProd.ID}" data-nid="${aProd.name_Prod}">
									<img src="${pageContext.request.contextPath}/resources/img/icons8_trash_26px.png" width="30" height="30" alt="">
									</a>
									&nbsp;&nbsp;
									<a title="تعديل" style="cursor: pointer;"
										data-toggle="modal" data-target="#editModal"
										data-i="${aProd.ID}" data-da="${aProd.date_entry}"
										data-np="${aProd.name_Prod}" data-pr="${aProd.price}"
										data-cu="${aProd.count}" data-no="${aProd.notes}">
										<img src="${pageContext.request.contextPath}/resources/img/icons8_edit_30px_2.png" width="30" height="30" alt="">
										</a>
								</td>
								<td>${aProd.notes}</td>
								<td>${aProd.count}</td>
								<td>${aProd.price}</td>
								<td>${aProd.name_Prod}</td>
								<td>${aProd.date_entry}</td>
								<th scope="row">${aProd.ID}</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<form:form class="addProd" action="Product" method="post"
			modelAttribute="prod">
			<div class="modal fade" id="prodModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">اضافة منتج
								جديد</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">تاريخ
									الشراء</label>
								<form:input class="form-control" path="date_entry" type="date"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">اسم
									المنتج</label>
								<form:input class="form-control" path="Name_Prod" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">السعر</label>
								<form:input class="form-control" path="Price" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">العدد
									الموجود</label>
								<form:input class="form-control" path="Count" type="text"
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

		<form:form class="editprod" action="Product" method="put"
			modelAttribute="prod">
			<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">تعديل بيانات
								المنتج</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">التسلسل</label>
								<form:input class="form-control" path="ID" type="text" value=""
									readonly="true" id="id" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">تاريخ
									الشراء</label>
								<form:input class="form-control" path="date_entry"
									name="date_entry" type="date" value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">اسم
									المنتج</label>
								<form:input class="form-control" path="Name_Prod"
									name="Name_Prod" type="text" value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">السعر</label>
								<form:input class="form-control" path="Price" name="Price"
									type="text" value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">العدد
									الموجود</label>
								<form:input class="form-control" path="Count" name="Count"
									type="text" value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">ملاحظات</label>
								<form:textarea class="form-control" path="Notes" name="Notes"
									type="text" value="" />
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

		<form:form class="deleteProd" action="Product" method="delete">
			<div class="modal fade" id="deleteProdModel" tabindex="-1"
				role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">تأكيد حذف</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<label id="nid"></label> :هل تريد حذف المنتج <input type="hidden"
								id="cid" name="id" />
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">إلغاء</button>
							<button type="submit" class="btn btn-primary">حذف</button>
						</div>
					</div>
				</div>
			</div>
		</form:form>

	</div>
</body>
</html>