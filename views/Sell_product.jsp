<%@ page language="java" pageEncoding="UTF-8"%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="x" uri="http://java.sun.com/jsp/jstl/xml"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>بيع منتج</title>

<link
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>

<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
	
<script>
	$(document).ready(function() {
		$("#pric").change(function() {
			var select = $("#pric option:selected").attr("data-pc");
			$("#cost").val(select)
		})
		$("#count").change(function() {
			var count = $("#count").val();
			var cost = $("#cost").val();
			var disc = $("#disc").val();
			$("#tot").val(count * cost - disc)
		})
		$("#disc").change(function() {
			var count = $("#count").val();
			var cost = $("#cost").val();
			var disc = $("#disc").val();
			$("#tot").val(count * cost - disc)
		})
		$("#cost").change(function() {
			var count = $("#count").val();
			var cost = $("#cost").val();
			var disc = $("#disc").val();
			$("#tot").val(count * cost - disc)
		})
	});
</script>

<script>
// Example starter JavaScript for disabling form submissions if there are invalid fields
(function() {
  'use strict';
  window.addEventListener('load', function() {
    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    var forms = document.getElementsByClassName('needs-validation');
    // Loop over them and prevent submission
    var validation = Array.prototype.filter.call(forms, function(form) {
      form.addEventListener('submit', function(event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          event.stopPropagation();
        }
        form.classList.add('was-validated');
      }, false);
    });
  }, false);
})();
</script>

<%@include file="Template.jsp"%>
</head>
<body background="${pageContext.request.contextPath}/resources/img/pngguru.com.png">
	<div align="right" style="margin-top: 5%;">

		<div class="btn-group btn-group-justified" style="width: 20%;">
			<button class="btn btn-primary btn-lg" type="button"
				data-toggle="modal" data-target="#sellModal">بيع جديد</button>
		</div>

		<div class="SellTable" style="width: 1000px; margin-top: 2%;">

			<div
				style="width: 1000px; position: relative; height: 400px; overflow: auto;">
				<table class="table table-hover table-dark">
					<thead>
						<tr>
							<th scope="col">ملاحظات</th>
							<th scope="col">الاجمالي</th>
							<th scope="col">الخصم</th>
							<th scope="col">السعر</th>
							<th scope="col">المنتج</th>
							<th scope="col">الموظف</th>
							<th scope="col">تاريخ اليوم</th>
							<th scope="col">التسلسل</th>
						</tr>
					</thead>
					<tbody id="myTable" style="overflow: scroll;">
						<c:forEach items="${allSellToday}" var="aSell">
							<tr>
								<td>${aSell.notes}</td>
								<td>${aSell.total}</td>
								<td>${aSell.discount}</td>
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
		</div>

		<form action="Sell" method="post" class="needs-validation" novalidate>
			<div class="modal fade" id="sellModal" tabindex="-1" role="dialog"
				aria-labelledby="exampleModalScrollableTitle" aria-hidden="true">
				<div class="modal-dialog modal-dialog-scrollable" role="document">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="exampleModalLabel">بيع جديد</h5>
							<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
								<span aria-hidden="true">&times;</span>
							</button>
						</div>
						<div class="modal-body">
							<div class="form-group">
								<label class="control-label" for="focusedInput">تاريخ
									البيع</label>
								<input class="form-control" name="date_sell" type="date"
									value="${date}" readonly="readonly" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الموظف</label>
								<input class="form-control" name="emp" type="text" 
								value="${name.e.name}" readonly="readonly"/>
							</div>
							<div class="form-group">
								<label for="message-text" class="col-form-label">نوع
									المنتج</label> <select class="form-control form-control-sm"
									name="prod" id="pric">
									<option value=""></option>
									<c:forEach items="${allProd}" var="aprod">

										<option value="${aprod.ID}"
											data-pc="${aprod.price}">${aprod.name_Prod}</option>

									</c:forEach>
								</select>
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">المبلغ</label>
								<input class="form-control" name="price" type="text"
									value="" readonly="readonly" id="cost"/>
								
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">العدد</label>
								<input class="form-control" name="count" id="count" type="Number"
									value=""  required/>
								<div class="invalid-feedback">
        							يجب تحديد عدد 
      							</div>	
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الخصم</label>
								<input class="form-control" name="discount" type="text"
									value="0.0" id="disc">
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">الاحمالي</label>
								<input class="form-control" name="total" id="tot" type="text"
									value="" />
							</div>
							<div class="form-group">
								<label class="control-label" for="focusedInput">ملاحظات</label>
								<textarea class="form-control" name="notes" ></textarea>
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
		</form>

	</div>
</body>
</html>