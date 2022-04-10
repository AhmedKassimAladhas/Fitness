<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>مواعيد التدريبات</title>

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
		$('#deleteDatesModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var aid = button.data('aid') // Extract info from data-* attributes
			var nid = button.data('nid')
			var num = button.data('num')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #num').text(num)
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
			modal.find('.modal-body #Number').val(da)
			modal.find('.modal-body #da').val(np)
			modal.find('.modal-body #da').text(np)
			modal.find('.modal-body #time_start').val(pr)
			modal.find('.modal-body #time_end').val(cu)
			modal.find('.modal-body #Notes').val(no)
		})
	});
</script>

<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/Men_crossfit.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 20%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="modal" data-target="#dateModal">اضافة ميعاد</button>
		</div>

		<div class="dateTable" style="width: 1000px; margin-top: 2%;">

			<input class="form-control" id="myInput" type="text"
				placeholder="Search.." style="margin-top: 8px;"><br>

			<div
				style="width: 1000px; position: relative; height: 400px; overflow: auto;">
				<table class="table table-hover table-dark">
					<thead>
						<tr>
							<th scope="col"></th>
							<th scope="col">ملاحظات</th>
							<th scope="col">ساعة الانتهاء</th>
							<th scope="col">ساعة البدء</th>
							<th scope="col">اليوم</th>
							<th scope="col">رقم الميعاد</th>
							<th scope="col">التسلسل</th>
						</tr>
					</thead>
					<tbody id="myTable" style="overflow: scroll;">
						<c:forEach items="${allDate}" var="aDate">
							<tr>
								<td>
									<a 	title="حذف" style="cursor: pointer;" 
										data-toggle="modal" data-target="#deleteDatesModel"
										data-aid="${aDate.id}" data-nid="${aDate.day}"
										data-num="${aDate.number}">
										<img src="${pageContext.request.contextPath}/resources/img/icons8_trash_26px.png" width="30" height="30" alt="">
									</a>
									&nbsp;&nbsp;
									<a title="تعديل" style="cursor: pointer;"
										data-toggle="modal" data-target="#editModal"
										data-i="${aDate.id}" data-da="${aDate.number}"
										data-np="${aDate.day}" data-pr="${aDate.time_start}"
										data-cu="${aDate.time_end}" data-no="${aDate.notes}">
										<img src="${pageContext.request.contextPath}/resources/img/icons8_edit_30px_2.png" width="30" height="30" alt="">
										</a>
								</td>
								<td>${aDate.notes}</td>
								<td>${aDate.time_end}</td>
								<td>${aDate.time_start}</td>
								<td>${aDate.day}</td>
								<td>${aDate.number}</td>
								<th scope="row">${aDate.id}</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>

		<form:form class="addDate" action="Dates" method="post"
    		modelAttribute="date" >
			<div class="modal fade" id="dateModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">اضافة ميعاد
								جديد</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">رقم
									الميعاد</label>
								<form:input class="form-control" path="Number" type="number"
									value="" />
										
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">اليوم</label>
								<form:select class="form-control form-control-sm" path="day">
									<form:option value="السبت"></form:option>
									<form:option value="الاحد"></form:option>
									<form:option value="الاثنان"></form:option>
									<form:option value="الثلاثاء"></form:option>
									<form:option value="الاربعاء"></form:option>
									<form:option value="الخميس"></form:option>
									<form:option value="الجمعة"></form:option>
								</form:select>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">ساعة
									البدء</label>
								<form:input class="form-control" path="time_start" type="time"
									value="" />
										
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">ساعة
									الانتهاء</label>
								<form:input class="form-control" path="time_end" type="time"
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

		<form:form class="editDate" action="Dates" method="put"
			modelAttribute="date">
			<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">تعديل بيانات</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">التسلسل</label>
								<form:input class="form-control" path="id" type="text"
									value="" id="id" readonly="true"/>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">رقم
									الميعاد</label>
								<form:input class="form-control" path="Number" type="number"
									value="" id="Number" />
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">اليوم</label>
								<form:select class="form-control form-control-sm" path="day">
									<optgroup hidden="true" label="">
									<form:option value="" id="da"></form:option>
									</optgroup>
									<form:option value="السبت"></form:option>
									<form:option value="الاحد"></form:option>
									<form:option value="الاثنان"></form:option>
									<form:option value="الثلاثاء"></form:option>
									<form:option value="الاربعاء"></form:option>
									<form:option value="الخميس"></form:option>
									<form:option value="الجمعة"></form:option>
								</form:select>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">ساعة
									البدء</label>
								<form:input class="form-control" path="time_start" type="time"
									value="" id="time_start" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">ساعة
									الانتهاء</label>
								<form:input class="form-control" path="time_end" type="time"
									value="" id="time_end" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">ملاحظات</label>
								<form:textarea class="form-control" path="Notes" type="text"
									value="" id="Notes" />
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

		<form:form class="deleteDate" action="Dates" method="delete">
			<div class="modal fade" id="deleteDatesModel" tabindex="-1"
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
							 <label id="nid"></label> :هل تريد
							حذف ميعاد رقم <label id="num"></label> ليوم<input type="hidden" id="cid" name="id" />
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