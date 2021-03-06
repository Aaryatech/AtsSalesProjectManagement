<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
</head>

<body>
	<c:url var="checkUniqueField" value="/checkUniqueField"></c:url>

	<!-- Main navbar -->
	<jsp:include page="/WEB-INF/views/include/header.jsp"></jsp:include>
	<!-- /main navbar -->


	<!-- Page content -->
	<div class="page-content">

		<!-- Main sidebar -->
		<jsp:include page="/WEB-INF/views/include/left.jsp"></jsp:include>
		<!-- /main sidebar -->


		<!-- Main content -->
		<div class="content-wrapper">

			<!-- Page header -->
			<div class="page-header page-header-light"></div>
			<!-- /page header -->


			<!-- Content area -->
			<div class="content">

				<!-- Form validation -->
				<div class="row">
					<div class="col-md-12">
						<!-- Title -->
						<!-- <div class="mb-3">
							<h6 class="mb-0 font-weight-semibold">Hidden labels</h6>
							<span class="text-muted d-block">Inputs with empty values</span>
						</div> -->
						<!-- /title -->


						<div class="card">

							<div class="card-header header-elements-inline">
								<table width="100%">
									<tr width="100%">
										<td width="60%"><h5 class="pageTitle">
												<i class="icon-list-unordered"></i> ${title}
											</h5></td>
										<td width="40%" align="right">
											<%-- <a
									href="${pageContext.request.contextPath}/showAddKra?empId=${editKra.exVar3}&finYrId=${editKra.exVar2}"
									class="breadcrumb-elements-item">
										<button type="button" class="btn btn-primary">KRA List </button>
								</a>  --%>
										</td>
									</tr>
								</table>
							</div>
							<div class="card-body">
								<%
									if (session.getAttribute("errorMsg") != null) {
								%>
								<div
									class="alert bg-danger text-white alert-styled-left alert-dismissible">
									<button type="button" class="close" data-dismiss="alert">
										<span>×</span>
									</button>
									<span class="font-weight-semibold">Oh snap!</span>
									<%
										out.println(session.getAttribute("errorMsg"));
									%>
								</div>

								<%
									session.removeAttribute("errorMsg");
									}
								%>
								<%
									if (session.getAttribute("successMsg") != null) {
								%>
								<div
									class="alert bg-success text-white alert-styled-left alert-dismissible">
									<button type="button" class="close" data-dismiss="alert">
										<span>×</span>
									</button>
									<span class="font-weight-semibold">Well done!</span>
									<%
										out.println(session.getAttribute("successMsg"));
									%>
								</div>
								<%
									session.removeAttribute("successMsg");
									}
								%>
				
								
								<form
									action="${pageContext.request.contextPath}/submitNewHardware"
									class="form-validate-jquery" novalidate="novalidate"
									id="submitTagForm" method="post">

									
									<input type="hidden" id="hardwareId" value="${hardware.hardwareId}" name="hardwareId">
	
									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="hardwareCode">Code<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${hardware.hardwareCode}"
													placeholder="Enter Hardware Code" id="hardwareCode" name="hardwareCode"
													autocomplete="off" required="required">
											</div>
										</div>
										
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="hardwareName">Hardware Name<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${hardware.hardwareName}"
													placeholder="Enter Hardware Name" id="hardwareName" name="hardwareName"
													autocomplete="off" required="required">
											</div>
										</div>

									</div>
									
									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="price">Price<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${hardware.price}"
													placeholder="Enter Price" id="price" name="price"
													autocomplete="off" required="required">
											</div>
										</div>

										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="hardwareName">Date of Purchase<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control datepickerclass" value="${hardware.dateOfPurchase}"
													placeholder="Enter Date of Purchase" id="dop" name="dop"
													autocomplete="off" required="required">
											</div>
										</div>

									</div>
									
									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="username">User Name<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${hardware.userName}"
													placeholder="Enter User Name" id="username" name="username"
													autocomplete="off" required="required">
											</div>
										</div>

										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="password">Password<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="password" class="form-control" value="${hardware.password}"
													placeholder="Enter Password" id="password" name="password"
													autocomplete="off" required="required">
											</div>
										</div>

									</div>
									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="hardwareName">Company Name<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${hardware.company}"
													placeholder="Enter Company Name" id="companyName" name="companyName"
													autocomplete="off" required="required">
											</div>
										</div>

									</div>


									<div class="form-group row mb-0">
										<div style="margin: 0 auto;">

											<button type="submit" class="btn blue_btn ml-3 legitRipple  "
												data-popup="tooltip" data-uuid="" id="submtbtn">Submit</button>
											<a
												href="${pageContext.request.contextPath}/tagList"><button
													type="button" class="btn btn-light">Back</button></a>
										</div>
									</div>
								</form>
								<p class="desc text-danger fontsize11">Note : * Fields are
									mandatory.</p>
							</div>
						</div>


					</div>
				</div>

			</div>
			<!-- /content area -->


			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
			<!-- /footer -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->


	<script>
		// Custom bootbox dialog
		$('.bootbox_custom').on('click', function() {
		

		});
	</script>



	<script>
		function trim(el) {
			el.value = el.value.replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
			replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
			replace(/\n +/, "\n"); // Removes spaces after newlines
			//checkSame();
			return;
		}

		$(document).ready(
				function($) {
					
					$('#submitTagForm').submit(
							function(e){
								
								if($('#submitTagForm').valid()==true){
									
									bootbox.confirm({
										title : 'Confirm',
										message : 'Confirm Submit Form ',
										buttons : {
											confirm : {
												label : 'yes',
												className : 'btn-success'
											},
											cancel : {
												lable : 'Cancel',
												classNAme : 'btn-link'
											}
										},
										callback : function(result) {
											if (result) {
												document.getElementById('submitTagForm').submit();
											}
										}
									});
									return false;
									}
								return false;
							});
										 
			
		});

		$('#price').on('input', function() {
			 this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');
			});
	</script>

<script type="text/javascript">
	$('.datepickerclass').daterangepicker({
			singleDatePicker : true,
			selectMonths : true,
			selectYears : true,
			locale : {
				format : 'DD-MM-YYYY'
			}
		});
	
	</script>

</body>
</html>