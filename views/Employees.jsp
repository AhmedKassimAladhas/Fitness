<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>الموظفين</title>

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
							$("#myTable2 tr").filter(
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
		$('#exampleModal3').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var empID = button.data('id') // Extract info from data-* attributes
			var empName = button.data('name')
			var empJob = button.data('job')
			var empPh = button.data('ph')
			var empSal = button.data('sal')

			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #id').val(empID);
			modal.find('.modal-body #Name').val(empName)
			modal.find('.modal-body #Job').text(empJob)
			modal.find('.modal-body #Job').val(empJob)
			modal.find('.modal-body #Phone').val(empPh)
			modal.find('.modal-body #Salary').val(empSal)
		})
		$('#deleteModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var did = button.data('did') // Extract info from data-* attributes
			var deid = button.data('deid')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #did').text(did)
			modal.find('.modal-body #deid').val(deid)
		})
		$('#editModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var userID = button.data('i') // Extract info from data-* attributes
			var userName = button.data('us')
			var userp = button.data('pa')
			var userg = button.data('gr')
			var usere = button.data('e')
			var userei = button.data('ei')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #i').val(userID);
			modal.find('.modal-body #u').val(userName)
			modal.find('.modal-body #p').val(userp)
			modal.find('.modal-body #g').val(userg)
			modal.find('.modal-body #e').val(usere)
			modal.find('.modal-body #ei').val(userei)
			modal.find('.modal-body #g').text(userg)
		})
		$('#deleteUserModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var did = button.data('did') // Extract info from data-* attributes
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #dUid').text(did)
			modal.find('.modal-body #dUid').val(did)
		})
	});
</script>

<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/myshtsy-press-pose-atlet.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 85%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#collapseOne2"
				aria-expanded="false" aria-controls="collapseOne2">حسابات
				المستخدمين</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#collapseTow2"
				aria-expanded="false" aria-controls="collapseTow2">
				الموظفين</button>
		</div>

		<div align="right" id="accordionExample2" style="margin-top: 1%;">

			<div class="btn-group">
				<div id="collapseOne2" class="collapse"
					 data-parent="#accordionExample2">

					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#exampleModal2">انشاء حساب لمستخدم</button>

					<div class="usersTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="myInput" type="text"
							placeholder="Search.."> <br>
						<div
							style="width: 1000px; position: relative; height: 400px; overflow: auto;">
							<table class="table table-hover table-dark">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">الموظف</th>
										<th scope="col">الصلاحيات</th>
										<th scope="col">كلمة المرور</th>
										<th scope="col">اسم المستخدم</th>
										<th scope="col">التسلسل</th>
									</tr>
								</thead>
								<tbody id="myTable" style="overflow: scroll;">
									<c:forEach items="${allUsers}" var="aUser">
										<tr>
											<td>
												<a title="حذف" style="cursor: pointer;"
													data-toggle="modal" data-target="#deleteUserModel"
													data-did="${aUser.ID}">
													<img src="${pageContext.request.contextPath}/resources/img/icons8_trash_26px.png" width="30" height="30" alt="">
													</a>
													&nbsp;&nbsp;
												<a title="تعديل" style="cursor: pointer;"
													data-toggle="modal" data-target="#editModal"
													data-i="${aUser.ID}" data-us="${aUser.username}"
													data-pa="${aUser.password}" data-gr="${aUser.grants}"
													data-e="${aUser.e.name}" data-ei="${aUser.e.ID}">
													<img src="${pageContext.request.contextPath}/resources/img/icons8_edit_30px_2.png" width="30" height="30" alt="">
													</a>
											</td>
											<td>${aUser.e.name}</td>
											<td>${aUser.grants}</td>
											<td>${aUser.password}</td>
											<td>${aUser.username}</td>
											<th scope="row">${aUser.ID}</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<form:form class="addUsers" action="Users" method="post">
						<div class="modal fade" id="exampleModal2" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalScrollableTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-scrollable" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">انشاء حساب
											جديد</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label class="control-label" for="focusedInput">اسم
												المستخدم</label> <input class="form-control" name="Username"
												type="text" value="">
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">كلمة
												المرور</label> <input class="form-control" name="Password"
												type="text" value="">
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">الصلاحيات</label>
											<select class="form-control form-control-sm" name="Grants">
												<option value="مدير">مدير</option>
												<option value="مستخدم">مستخدم</option>
											</select>
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">الموظف</label>
											<select class="form-control form-control-sm" name="e">
												<c:forEach items="${allEmp}" var="aEmp">
													<option value="${aEmp.ID}">${aEmp.name}</option>
												</c:forEach>
											</select>
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

					<form:form class="editUser" action="Users" method="put">
						<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-scrollable" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">تعديل الحساب</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label class="control-label" for="focusedInput">التسلسل</label>
											<input class="form-control" name="ID" id="i" value=""
												readonly="readonly">
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">
											اسم المستخدم</label> <input class="form-control" name="Username" id="u"
												value="">
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">
											كلمة المرور</label> <input class="form-control" id="p" name="Password">
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">الصلاحيات</label>
											<select class="form-control form-control-sm" name="Grants">
												<optgroup label="" hidden="true">
													<option value="" id="g"></option>
												</optgroup>
												<option value="مدير">مدير</option>
												<option value="مستخدم">مستخدم</option>
											</select>
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">الموظف</label>
											<input type="hidden" id="ei" name="e"> <input
												class="form-control" id="e" readonly="readonly">
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

					<form:form class="deleteUsers" action="Users" method="delete">
						<div class="modal fade" id="deleteUserModel" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
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
										<label id="dUid"></label> :هل تريد حذف الحساب رقم <input
											type="hidden" id="dUid" name="dUid" />
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

			</div>

			<div class="btn-group">
				<div id="collapseTow2" class="collapse"
					data-parent="#accordionExample2">

					<button type="button" class=" btn btn-success " data-toggle="modal"
						data-target="#exampleModal">تسجيل موظف جديد</button>

					<div class="EmpTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="myInput2" type="text"
							placeholder="Search.." value=""> <br>
						<div
							style="width: 1000px; position: relative; height: 400px; overflow: auto;">
							<table class="table table-hover table-dark">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">المرتب</th>
										<th scope="col">الموبايل</th>
										<th scope="col">الوظيفة</th>
										<th scope="col">الاسم</th>
										<th scope="col">التسلسل</th>
									</tr>
								</thead>
								<tbody id="myTable2">
									<c:forEach items="${allEmp}" var="aEmp">
										<tr>
											<td>
												<a title="حذف" style="cursor: pointer;"
													data-toggle="modal" data-target="#deleteModel"
													data-did="${aEmp.name}" data-deid="${aEmp.ID}">
													<img src="${pageContext.request.contextPath}/resources/img/icons8_trash_26px.png" width="30" height="30" alt="">
													</a>
													&nbsp;&nbsp;
												<a title="تعديل" style="cursor: pointer;"
													data-toggle="modal" data-target="#exampleModal3"
													data-id="${aEmp.ID}" data-name="${aEmp.name}"
													data-job="${aEmp.job}" data-ph="${aEmp.phone}"
													data-sal="${aEmp.salary}">
													<img src="${pageContext.request.contextPath}/resources/img/icons8_edit_30px_2.png" width="30" height="30" alt="">
													</a>
											</td>
											<td>${aEmp.salary}</td>
											<td>${aEmp.phone}</td>
											<td>${aEmp.job}</td>
											<td>${aEmp.name}</td>
											<th scope="row">${aEmp.ID}</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<form:form class="addEmp" action="Employees" method="post"
						modelAttribute="emp">
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalScrollableTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-scrollable" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">موظف جديد</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label class="control-label" for="focusedInput">اسم
												الموظف</label>
											<form:input class="form-control" path="Name"
												id="focusedInput" type="text" value="" />
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">الوظيفة</label>
											<form:select class="form-control form-control-sm" path="Job"
												id="typeofres">
												<form:option value="مدرب"></form:option>
												<form:option value="مدير"></form:option>
											</form:select>
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">الموبايل</label>
											<form:input class="form-control" path="Phone"
												id="focusedInput" type="text" value="" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">المرتب</label>
											<form:input class="form-control" path="Salary"
												id="focusedInput" type="text" value="" />
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

					<form:form class="deletForm" action="Employees" method="delete">
						<div class="modal fade" id="deleteModel" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
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
										<label id="did"></label> :هل تريد حذف الموظف <input
											type="hidden" id="deid" name="deid" />
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

					<form:form class="EditForm" action="Employees" method="put">
						<div class="modal fade" id="exampleModal3" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalScrollableTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-scrollable" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">موظف جديد</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label class="control-label" for="focusedInput">التسلسل</label>
											<input class="form-control" id="id" name="id" type="text"
												value="" readonly="readonly" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">اسم
												الموظف</label> <input class="form-control" id="Name" name="Name"
												type="text" value="" />
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">الوظيفة</label>
											<select class="form-control form-control-sm " name="Job">
												<optgroup label="" hidden="true">
													<option class="font-weight-bolder text-muted" value=""
														id="Job"></option>
												</optgroup>
												<option value="مدرب كمال اجسام">مدرب كمال اجسام</option>
												<option value="مدرب  لياقة">مدرب لياقة</option>
												<option value="مدير">مدير</option>
											</select>
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">الموبايل</label>
											<input class="form-control" id="Phone" name="Phone"
												type="text" value="" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">المرتب</label>
											<input class="form-control" id="Salary" name="Salary"
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

				</div>

			</div>

		</div>
	</div>
</body>
</html>