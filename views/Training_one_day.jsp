<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>تدريب يوم واحد</title>

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
			});
	$("#myInput3").on(
			"keyup",
			function() {
				var value = $(this).val().toLowerCase();
				$("#myTable3 tr").filter(
						function() {
							$(this).toggle(
									$(this).text().toLowerCase()
											.indexOf(value) > -1)
						})
			})

});
</script>

<script>
	$(document).ready(function() {
$('#notSubModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var sub = button.data('sss') // Extract info from data-* attributes
			var nam = button.data('nnn')
			var phone = button.data('ppp')
			var nsid = button.data('nsid')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #subs').val(sub)
			modal.find('.modal-body #na').val(nam)
			modal.find('.modal-body #pho').val(phone)
			modal.find('.modal-body #sid').val(nsid)
			modal.find('.modal-body #nam').text(nam)
		})
		$('#bodyModel').on('show.bs.modal', function(event) {
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
		$('#bodySubModel').on('show.bs.modal', function(event) {
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
		$('#bodyNotSubModel').on('show.bs.modal', function(event) {
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
		$('#SubModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var sub = button.data('sss') // Extract info from data-* attributes
			var nam = button.data('nnn')
			var phone = button.data('ppp')
			var nsid = button.data('nsid')
			var numb = button.data('numb')
			var msg = button.data('msg')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #subs').val(sub)
			modal.find('.modal-body #na').val(nam)
			modal.find('.modal-body #pho').val(phone)
			modal.find('.modal-body #sid').val(nsid)
			modal.find('.modal-body #nam').text(nam)
			modal.find('.modal-body #numberSub').val(numb)
			
			modal.find('.modal-body #messg').text(msg)
		})
	});
</script>

<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/box-ally-banner.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 85%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#trainingCollapse"
				aria-expanded="false" aria-controls="#trainingCollapse">تدريب
				اليوم</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#subCollapse"
				aria-expanded="false" aria-controls="#subCollapse">تدريب
				باشتراك</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#notSubCollapse"
				aria-expanded="false" aria-controls="#notSubCollapse">تدريب
				بدون اشتراك</button>
			&nbsp; <a class="btn btn-outline-primary btn-lg" href="Customers">تسجيل
				عميل جديد</a>
		</div>

		<div align="right" id="accordionExample2" style="margin-top: 1%;">

			<div class="btn-group">
				<div id="notSubCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="SecTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="myInput" type="text"
							placeholder="Search.."> <br>
						<div
							style="width: 1000px; position: relative; height: 400px; overflow: auto;">
							<table class="table table-hover table-dark">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">الاشتراك</th>
										<th scope="col">نوع الجنس</th>
										<th scope="col">العنوان</th>
										<th scope="col">الموبايل 2</th>
										<th scope="col">الموبايل 1</th>
										<th scope="col">اسم العميل</th>
										<th scope="col">التسلسل</th>
									</tr>
								</thead>
								<tbody id="myTable" style="overflow: scroll;">
									<c:forEach items="${allCustNotSub}" var="aCust">
										<tr>
											<td>
												<button type="button" class="btn btn-success btn-xs"
													data-toggle="modal" data-target="#notSubModel"
													data-sss="${aCust.last_sub}" data-nnn="${aCust.name}"
													data-ppp="${aCust.phone}" data-nsid="${aCust.cid}">ابدأ
													التدريب</button>
													<button type="button" class="btn btn-warning btn-xs" id="bc"
													data-cna="${aCust.name}" data-toggle="modal"
													data-target="#bodyNotSubModel">قياسات الجسم</button>
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

					<form:form class="addNotSub" action="TrainingNotSub" method="post">
						<div class="modal fade" id="notSubModel" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalLabel"
							aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">تأكيد
											البدء</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<label id="nam"></label>: اضغط بدء لتأكيد بدء التدريب لـ<input
											type="hidden" id="sid" name="sid" /> <input type="hidden"
											name="date" id="date" value="${getdate}"> <input
											type="hidden" name="subscrip" id="subs"> <input
											type="hidden" name="name" id="na"> <input
											type="hidden" name="phone" id="pho"> <input
											type="hidden" name="price" value="${getprice}">

									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">إلغاء</button>
										<button type="submit" class="btn btn-primary">بدء</button>
									</div>
								</div>
							</div>
						</div>
					</form:form>
					
					<div class="modal fade" id="bodyNotSubModel" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
					<div class="modal-content">
						<div class="modal-header" >
							<div align="left">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" >
								<span aria-hidden="true">&times;</span>
							</button>
							</div>
							<h5 class="modal-title" id="exampleModalLabel"><span id="bcust"></span> : قياسات الجسم لـ </h5>
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
										<th scope="col">الاشتراك</th>
										<th scope="col">نوع الجنس</th>
										<th scope="col">العنوان</th>
										<th scope="col">الموبايل 2</th>
										<th scope="col">الموبايل 1</th>
										<th scope="col">اسم العميل</th>
										<th scope="col">التسلسل</th>
									</tr>
								</thead>
								<tbody id="myTable" style="overflow: scroll;">
									<c:forEach items="${allCustSub}" var="aCust">
										<tr>
											<td>
												<button type="button" class="btn btn-success btn-xs"
													data-toggle="modal" data-target="#SubModel"
													data-sss="${aCust.last_sub}" data-nnn="${aCust.name}"
													data-ppp="${aCust.phone}" data-nsid="${aCust.cid}"
													data-numb="${aCust.subscrip_Number}"
													data-msg="${aCust.trainingCount!='بداية'?'تنبيه : هذه اخر تدريب في عدد التدريبات المحدد له':''}">ابدأ
													التدريب</button> 
													<button type="button" class="btn btn-warning btn-xs" id="bc"
													data-cna="${aCust.name}" data-toggle="modal"
													data-target="#bodySubModel">قياسات الجسم</button>
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

					<form:form class="addSub" action="TrainingSub" method="post">
						<div class="modal fade" id="SubModel" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">تأكيد
											البدء</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<label id="nam"></label>: اضغط بدء لتأكيد بدء التدريب لـ<input
											type="hidden" id="sid" name="sid" /> <input type="hidden"
											name="date" id="date" value="${getdate}"> <input
											type="hidden" name="subscrip" id="subs"> <input
											type="hidden" name="name" id="na"> <input
											type="hidden" name="phone" id="pho"> <input
											type="hidden" name="numberSub" id="numberSub"> <br>
										<label id="messg" class="text-danger"></label>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary"
											data-dismiss="modal">إلغاء</button>
										<button type="submit" class="btn btn-primary">بدء</button>
									</div>
								</div>
							</div>
						</div>
					</form:form>
					
			<div class="modal fade" id="bodySubModel" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
					<div class="modal-content">
						<div class="modal-header" >
							<div align="left">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" >
								<span aria-hidden="true">&times;</span>
							</button>
							</div>
							<h5 class="modal-title" id="exampleModalLabel"><span id="bcust"></span> : قياسات الجسم لـ </h5>
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

			<div class="btn-group">
				<div id="trainingCollapse" class="collapse"
					data-parent="#accordionExample2">

					<div class="TrainingTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="myInput3" type="text"
							placeholder="Search.."> <br>
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
								<tbody id="myTable3" style="overflow: scroll;">
									<c:forEach items="${allCustToday}" var="atoday">
										<tr>
											<td>
												<button type="button" class="btn btn-warning btn-xs" id="bc"
													data-cna="${atoday.name}" data-toggle="modal"
													data-target="#bodyModel">قياسات الجسم</button>
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
					
				<div class="modal fade" id="bodyModel" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable modal-xl" role="document">
					<div class="modal-content">
						<div class="modal-header" >
							<div align="left">
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close" >
								<span aria-hidden="true">&times;</span>
							</button>
							</div>
							<h5 class="modal-title" id="exampleModalLabel"><span id="bcust"></span> : قياسات الجسم لـ </h5>
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