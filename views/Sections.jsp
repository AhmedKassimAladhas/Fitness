<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>أنواع الاشتراكات</title>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
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
$('#editModal').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var secID = button.data('i') // Extract info from data-* attributes
			var secName = button.data('sn')
			var secDet = button.data('sd')
			var secPr = button.data('sp')

			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #i').val(secID);
			modal.find('.modal-body #Sec_name').val(secName)
			modal.find('.modal-body #Sec_Details').val(secDet)
			modal.find('.modal-body #Price').val(secPr)
		})
$('#deleteSecModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var did = button.data('nid') // Extract info from data-* attributes
			var deid = button.data('aid')
			var one = button.data('o')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #snid').text(did)
			modal.find('.modal-body #secid').val(deid)
			modal.find('.modal-body #one').text(one)
		})
$('#deleteOfferModel').on('show.bs.modal', function(event) {
			var button = $(event.relatedTarget) // Button that triggered the modal
			var nam = button.data('nam') // Extract info from data-* attributes
			var oid = button.data('oid')
			// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
			// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
			var modal = $(this)
			modal.find('.modal-body #onam').text(nam)
			modal.find('.modal-body #oid').val(oid)
		})		
	});
</script>

<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/header-home.jpg">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 85%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#offerCollapse"
				aria-expanded="false" aria-controls="#offerCollapse">العروض</button>
			&nbsp;
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="collapse" data-target="#secCollapse"
				aria-expanded="false" aria-controls="#secCollapse">الاقسام</button>
		</div>

		<div align="right" id="accordionExample2" style="margin-top: 1%;">

			<div class="btn-group">
				<div id="secCollapse" class="collapse"
					data-parent="#accordionExample2">

					<button type="button" class="btn btn-success" data-toggle="modal"
						data-target="#exampleModal2">اضافة قسم جديد</button>

					<div class="SecTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="myInput" type="text"
							placeholder="Search.."> <br>
						<div
							style="width: 1000px; position: relative; height: 400px; overflow: auto;">
							<table class="table table-hover table-dark">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">سعر العرض</th>
										<th scope="col">عرض</th>
										<th scope="col">السعر</th>
										<th scope="col">التفاصيل</th>
										<th scope="col">اسم القسم</th>
										<th scope="col">التسلسل</th>
									</tr>
								</thead>
								<tbody id="myTable" style="overflow: scroll;">
									<c:forEach items="${allSec}" var="aSec">
										<tr>
										<c:if test="${name.grants!='مستخدم'}">
											<td>
												<a title="حذف" style="cursor: pointer;"
													data-toggle="modal" data-target="#deleteSecModel"
													data-aid="${aSec.id}" data-nid="${aSec.sec_name}" data-o="${aSec.id!='1'?'':'لايمكن حذف هذا القسم'}">
												<img src="${pageContext.request.contextPath}/resources/img/icons8_trash_26px.png" width="30" height="30" alt="">
												</a>
												&nbsp;&nbsp;
												<a title="تعديل" style="cursor: pointer;"
													data-toggle="modal" data-target="#editModal"
													data-i="${aSec.id}" data-sn="${aSec.sec_name}"
													data-sd="${aSec.sec_Details}" data-sp="${aSec.price}">
													<img src="${pageContext.request.contextPath}/resources/img/icons8_edit_30px_2.png" width="30" height="30" alt="">
													</a>
											</td>
										</c:if>	
											<td>${aSec.offer_price}</td>
											<td>${aSec.offer}</td>
											<td>${aSec.price}</td>
											<td>${aSec.sec_Details}</td>
											<td>${aSec.sec_name}</td>
											<th scope="row">${aSec.id}</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<form:form class="addSec" action="Sections" method="post"
						modelAttribute="sec">
						<div class="modal fade" id="exampleModal2" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalScrollableTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-scrollable" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">اضافة قسم
											جديد</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label class="control-label" for="focusedInput">اسم
												القسم</label>
											<form:input class="form-control" path="Sec_name" type="text"
												value="" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">التفاصيل</label>
											<form:textarea class="form-control" path="Sec_Details"
												type="text" value="" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">السعر</label>
											<form:input class="form-control" path="Price" type="text"
												value="" />
										</div>
										<div class="form-group">
											<form:input class="form-control" hidden="true" path="offer"
												type="text" value="لا يوجد" />
										</div>
										<div class="form-group">
											<form:input class="form-control" hidden="true"
												path="offer_price" type="text" value="" />
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

					<form:form class="editSec" action="Sections" method="put"
						modelAttribute="sec">
						<div class="modal fade" id="editModal" tabindex="-1" role="dialog"
							aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
							<div class="modal-dialog modal-dialog-scrollable" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">تعديل
											بيانات القسم</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label class="control-label" for="focusedInput">التسلسل</label>
											<form:input class="form-control" path="id" id="i" value=""
												readonly="true" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">اسم
												القسم</label>
											<form:input class="form-control" path="Sec_name" type="text"
												value="" id="Sec_name" readonly="true"/>
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">التفاصيل</label>
											<form:textarea class="form-control" path="Sec_Details"
												type="text" value="" id="Sec_Details" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">السعر</label>
											<form:input class="form-control" path="Price" type="text"
												value="" id="Price" />
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

					<form:form class="deleteSec" action="Sections" method="delete">
						<div class="modal fade" id="deleteSecModel" tabindex="-1"
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
										<label id="snid"></label> :هل تريد حذف القسم <input
											type="hidden" id="secid" name="secid" />
										<br>
										<label id="one" class="text-danger"></label>	
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
				<div id="offerCollapse" class="collapse"
					data-parent="#accordionExample2">

					<button type="button" class=" btn btn-success " data-toggle="modal"
						data-target="#exampleModal">اضافة عرض جديد</button>

					<div class="offerTable" style="width: 1000px; margin-top: 2%;">
						<input class="form-control" id="myInput2" type="text"
							placeholder="Search.." value=""> <br>
						<div
							style="width: 1000px; position: relative; height: 400px; overflow: auto;">
							<table class="table table-hover table-dark">
								<thead>
									<tr>
										<th scope="col"></th>
										<th scope="col">ملاحظات</th>
										<th scope="col">القسم</th>
										<th scope="col">تاريخ الانتهاء</th>
										<th scope="col">تاريخ البدء</th>
										<th scope="col">السعر</th>
										<th scope="col">التفاصيل</th>
										<th scope="col">اسم العرض</th>
										<th scope="col">التسلسل</th>
									</tr>
								</thead>
								<tbody id="myTable2">
									<c:forEach items="${allOffer}" var="aOff">
										<tr>
										<c:if test="${name.grants!='مستخدم'}">
											<td>
												<a title="حذف" style="cursor: pointer;"
													data-toggle="modal" data-target="#deleteOfferModel"
													data-nam="${aOff.offer_name}" data-oid="${aOff.id}">
													<img src="${pageContext.request.contextPath}/resources/img/icons8_edit_30px_2.png" width="30" height="30" alt="">
													</a>
											</td>
										</c:if>	
											<td>${aOff.notes}</td>
											<td>${aOff.sec.sec_name}</td>
											<td>${aOff.date_End}</td>
											<td>${aOff.date_Start}</td>
											<td>${aOff.offer_Price}</td>
											<td>${aOff.offer_Details}</td>
											<td>${aOff.offer_name}</td>
											<th scope="row">${aOff.id}</th>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>

					<form:form class="addOffer" action="Offer" method="post">
						<div class="modal fade" id="exampleModal" tabindex="-1"
							role="dialog" aria-labelledby="exampleModalScrollableTitle"
							aria-hidden="true">
							<div class="modal-dialog modal-dialog-scrollable" role="document">
								<div class="modal-content">
									<div class="modal-header">
										<h5 class="modal-title" id="exampleModalLabel">عرض جديد</h5>
										<button type="button" class="close" data-dismiss="modal"
											aria-label="Close">
											<span aria-hidden="true">&times;</span>
										</button>
									</div>
									<div class="modal-body">
										<div class="form-group">
											<label class="control-label" for="focusedInput">اسم العرض</label>
											<input class="form-control" name="offer_name"
												id="focusedInput" type="text" value="" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">التفاصيل</label>
											<textarea class="form-control" name="offer_Details"
												id="focusedInput" ></textarea>
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">السعر</label>
											<input class="form-control" name="offer_Price"
												id="focusedInput" type="text" value="" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">تاريخ البدء</label>
											<input class="form-control" name="date_Start"
												id="focusedInput" type="date" value="" />
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">تاريخ الانتهاء</label>
											<input class="form-control" name="date_End"
												id="focusedInput" type="date" value="" />
										</div>
										<div class="form-group">
											<label for="message-text" class="col-form-label">القسم</label>
											<select class="form-control form-control-sm" name="sec">
												<c:forEach items="${allSec}" var="sed">
												<option value="${sed.id}">${sed.sec_name}</option>
												</c:forEach>
											</select>
										</div>
										<div class="form-group">
											<label class="control-label" for="focusedInput">ملاحظات</label>
											<textarea class="form-control" name="notes"
												  cols="4" rows="4"></textarea>
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

					<form:form class="deletOffer" action="Offer" method="delete">
						<div class="modal fade" id="deleteOfferModel" tabindex="-1"
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
										<label id="onam"></label> :هل تريد حذف العرض <input
											type="hidden" id="oid" name="oid" />
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

		</div>
	</div>
</body>
</html>