<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>متابعة العملاء والاشتراكات</title>

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
				$("#trainingInput").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#trainingTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
				$("#trainingInput2").on(
						"keyup",
						function() {
							var value = $(this).val().toLowerCase();
							$("#trainingTable tr").filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});
						});
			});
</script>

<script>
	$(document).ready(
			function() {
				$('#bodyModel').on(
						'show.bs.modal',
						function(event) {
							var button = $(event.relatedTarget) // Button that triggered the modal
							// 			var cna = button.data('cna') // Extract info from data-* attributes
							// 			var cui = button.data('cui')
							var value = button.data('cna').toLowerCase();
							var modal = $(this)
							modal.find('.modal-body #bodyTable tr').filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});

							modal.find('.modal-title #bcust').text(value)
							// 			modal.find('.modal-body #cin').val(cui)
						})
						$('#bodyTodayModel').on(
						'show.bs.modal',
						function(event) {
							var button = $(event.relatedTarget) // Button that triggered the modal
							// 			var cna = button.data('cna') // Extract info from data-* attributes
							// 			var cui = button.data('cui')
							var value = button.data('cna').toLowerCase();
							var modal = $(this)
							modal.find('.modal-body #bodyTable tr').filter(
									function() {
										$(this).toggle(
												$(this).text().toLowerCase()
														.indexOf(value) > -1)
									});

							modal.find('.modal-title #bcust').text(value)
							// 			modal.find('.modal-body #cin').val(cui)
						})
				// 		$("#pric").change(function() {
				// 			var select = $("#pric option:selected").attr("data-pc");
				// 			$("#bcust").val(select)
				// 		})
				$('#deleteCustModel').on('show.bs.modal', function(event) {
					var button = $(event.relatedTarget) // Button that triggered the modal
					var aid = button.data('aid') // Extract info from data-* attributes
					var nid = button.data('nid')
					// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
					// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
					var modal = $(this)
					modal.find('.modal-body #nid').text(nid)
					modal.find('.modal-body #cid').val(aid)
				})
				$('#deleteSubModel').on('show.bs.modal', function(event) {
					var button = $(event.relatedTarget) // Button that triggered the modal
					var nam = button.data('nam') // Extract info from data-* attributes
					var oid = button.data('oid')
					// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
					// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
					var modal = $(this)
					modal.find('.modal-body #nam').text(nam)
					modal.find('.modal-body #sid').val(oid)
				})
			});
</script>

<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/fitness-background.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 85%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#trainingCollapse"
				aria-expanded="false" aria-controls="#trainingCollapse">التدريبات</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#subCollapse"
				aria-expanded="false" aria-controls="#subCollapse">الاشتراكات</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#custCollapse"
				aria-expanded="false" aria-controls="#custCollapse">العملاء</button>
		</div>

		<div align="right" id="accordionExample2" style="margin-top: 1%;">

			<div class="btn-group">
				<div id="custCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="custTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="myInput" type="text" value=""
							placeholder="Search.."> <br>
						<div
							style="width: 1000px; position: relative; height: 400px; overflow: auto;">
							<table class="table table-hover table-dark">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">اخر اشتراك</th>
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
												<button type="button" class="btn btn-warning btn-xs" id="bc"
													data-cna="${aCust.name}" data-toggle="modal"
													data-target="#bodyModel">قياسات الجسم</button>
													&nbsp;
											<c:if test="${name.grants!='مستخدم'}">		
												<a title="حذف" style="cursor: pointer;"
													data-toggle="modal" data-target="#deleteCustModel"
													data-aid="${aCust.cid}" data-nid="${aCust.name}">
													<img src="${pageContext.request.contextPath}/resources/img/icons8_trash_26px.png" width="30" height="30" alt="">
													</a>
											</c:if>
											</td>
											<td>${aCust.last_sub}</td>
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

					<div class="modal fade" id="bodyModel" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-scrollable modal-xl"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<div align="left">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<h5 class="modal-title" id="exampleModalLabel">
										<span id="bcust"></span> : قياسات الجسم لـ
									</h5>
								</div>
								<div class="modal-body">
									<table class="table table-hover table-dark">
										<thead>
											<tr>
												<th scope="col">معدل الحرق</th>
												<th scope="col">العضلات</th>
												<th scope="col">الدهون</th>
												<th scope="col">الوزن</th>
												<th scope="col">الطول</th>
												<th scope="col">العمر</th>
												<th scope="col">التاريخ</th>
												<th scope="col">اسم العميل</th>
												<th scope="col">التسلسل</th>
											</tr>
										</thead>
										<tbody id="bodyTable" style="overflow: scroll;">
											<c:forEach items="${allbody}" var="aBody">
												<tr>
													<td>${aBody.calories}</td>
													<td>${aBody.muscles}</td>
													<td>${aBody.fats}</td>
													<td>${aBody.weight}</td>
													<td>${aBody.hight}</td>
													<td>${aBody.age}</td>
													<td>${aBody.today_date}</td>
													<td>${aBody.c.name}</td>
													<th scope="row">${aBody.ID}</th>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">إلغاء</button>
								</div>
							</div>
						</div>
					</div>

					<form:form class="deleteCustm" action="FollowUp" method="delete">
						<div class="modal fade" id="deleteCustModel" tabindex="-1"
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
										<label id="nid"></label> :هل تريد حذف العميل <input
											type="hidden" id="cid" name="cid" />
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
				<div id="subCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="SubTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="myInput2" type="text"
							placeholder="Search.." value=""> <br>
						<div
							style="width: 1000px; position: relative; height: 400px; overflow: auto;">
							<table class="table table-hover table-dark">
								<thead>
									<tr>
										<th scope="col"></th>
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
								<tbody id="myTable2">
									<c:forEach items="${allSub}" var="aSub">
										<tr>
											<td>
											<c:if test="${name.grants!='مستخدم'}">
												<a title="حذف" style="cursor: pointer;"
													data-toggle="modal" data-target="#deleteSubModel"
													data-nam="${aSub.cust.name}" data-oid="${aSub.id}">
													<img src="${pageContext.request.contextPath}/resources/img/icons8_trash_26px.png" width="30" height="30" alt="">
													</a>
											</c:if>
											</td>
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

					<form:form class="deletSub" action="NewSubscriptions"
						method="delete">
						<div class="modal fade" id="deleteSubModel" tabindex="-1"
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
										<label id="nam"></label> :هل تريد حذف الاشتراك الخاص بـ <input
											type="hidden" id="sid" name="sid" />
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
				<div id="trainingCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="TrainingTable" style="width: 1000px; margin-top: 2%;">

						<div class="btn-group btn-group-justified"
							style="margin-right: 2%;">
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="exampleRadios" id="exampleRadios1" value=""
									data-toggle="collapse" data-target="#searchdate"> <label
									class="form-check-label" for="exampleRadios1"> بحث
									بالتاريخ </label>
							</div>
							&nbsp;&nbsp;&nbsp;&nbsp;
							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="exampleRadios" id="exampleRadios2" value=""
									data-toggle="collapse" data-target="#searchall"> <label
									class="form-check-label" for="exampleRadios2"> بحث </label>
							</div>
						</div>
						<div id="accordionExample3">
							<div class="collapse" data-parent="#accordionExample3"
								id="searchall">
								<input class="form-control" id="trainingInput" type="text"
									placeholder="Search.." style="margin-top: 8px;">
							</div>
							<div class="collapse" data-parent="#accordionExample3"
								id="searchdate">
								<input class="form-control" id="trainingInput2" type="date"
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
										<th scope="col">السعر</th>
										<th scope="col">تدريب رقم</th>
										<th scope="col">مجموع التدريبات</th>
										<th scope="col">الموبايل</th>
										<th scope="col">الاسم</th>
										<th scope="col">رقم الاشتراك</th>
										<th scope="col">الاشتراك</th>
										<th scope="col">التاريخ</th>
										<th scope="col">التسلسل</th>
									</tr>
								</thead>
								<tbody id="trainingTable" style="overflow: scroll;">
									<c:forEach items="${allCustToday}" var="atoday">
										<tr>
											<td>
												<button type="button" class="btn btn-warning btn-xs" id="bc"
													data-cna="${atoday.name}" data-toggle="modal"
													data-target="#bodyTodayModel">قياسات الجسم</button>
											</td>
											<td>${atoday.price}</td>
											<td>${atoday.count_done}</td>
											<td>${atoday.count_trining}</td>
											<td>${atoday.phone}</td>
											<td>${atoday.name}</td>
											<td>${atoday.number_sub}</td>
											<td>${atoday.subscrip}</td>
											<td>${atoday.date}</td>
											<th scope="row">${atoday.id}</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<div class="modal fade" id="bodyTodayModel" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
						<div class="modal-dialog modal-dialog-scrollable modal-xl"
							role="document">
							<div class="modal-content">
								<div class="modal-header">
									<div align="left">
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<h5 class="modal-title" id="exampleModalLabel">
										<span id="bcust"></span> : قياسات الجسم لـ
									</h5>
								</div>
								<div class="modal-body">
									<table class="table table-hover table-dark">
										<thead>
											<tr>
												<th scope="col">معدل الحرق</th>
												<th scope="col">العضلات</th>
												<th scope="col">الدهون</th>
												<th scope="col">الوزن</th>
												<th scope="col">الطول</th>
												<th scope="col">العمر</th>
												<th scope="col">التاريخ</th>
												<th scope="col">اسم العميل</th>
												<th scope="col">التسلسل</th>
											</tr>
										</thead>
										<tbody id="bodyTable" style="overflow: scroll;">
											<c:forEach items="${allbody}" var="aBody">
												<tr>
													<td>${aBody.calories}</td>
													<td>${aBody.muscles}</td>
													<td>${aBody.fats}</td>
													<td>${aBody.weight}</td>
													<td>${aBody.hight}</td>
													<td>${aBody.age}</td>
													<td>${aBody.today_date}</td>
													<td>${aBody.c.name}</td>
													<th scope="row">${aBody.ID}</th>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">إلغاء</button>
								</div>
							</div>
						</div>
					</div>
					
				</div>
			</div>

		</div>
	</div>
</body>
</html>