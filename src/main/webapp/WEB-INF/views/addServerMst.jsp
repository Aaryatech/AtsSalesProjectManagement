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
										<c:choose>
										<c:when test="${flag==1 }">
										<td width="60%"><h5 class="pageTitle">
												<i class="icon-list-unordered"></i> EDIT SERVER
											</h5></td>
										<td width="40%" align="right">
										</c:when>
										<c:otherwise>
										<td width="60%"><h5 class="pageTitle">
												<i class="icon-list-unordered"></i> ADD NEW SERVER
											</h5></td>
										<td width="40%" align="right">
										
										</c:otherwise>
									
									</c:choose>
										
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
									action="${pageContext.request.contextPath}/submitServermstForm"
									class="form-validate-jquery" novalidate="novalidate"
									id="submitTagForm" method="post">

									
									<input type="hidden" id="serverId" value="${server.serverId}" name="serverId">
	
									<div class="form-group row">
											<div class="col-md-6">
											<label
												class="col-form-label  text-info font-weight-bold col-lg-5 float"
												for="custId">Select Customer<span
												class="text-danger">* </span> :
											</label>
											<div class="col-lg-7 float">

												<select name="custId"
													class="form-control form-control-select2"
													data-placeholder="Select Customer" data-fouc
													required="required" id="custId"><option
														>Select Customer</option>
													<c:forEach items="${custList}" var="cust">
													<c:choose>
														<c:when test="${cust.custId == server.custId}">
															<option value="${cust.custId}" selected="selected">${cust.customerName}</option>
														</c:when>
														<c:otherwise>
															<option value="${cust.custId}">${cust.customerName}</option>
														</c:otherwise>
													
													</c:choose>
														
													
														
													</c:forEach>
												</select>

											</div>
										</div>
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="servProvider">Service Provider<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.serviceProviderName}"
													placeholder="Enter Service Provider Name " id="servProvider" name="servProvider"
													autocomplete="off" required="required">
												</div>
											</div>
										</div>
										
										
										<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="servProviderUname">Service Provider Username<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.serviceProviderUsername}"
													placeholder="Enter Service Provider Username" id="servProviderUname" name="servProviderUname"
													autocomplete="off" required="required">
											</div>
										</div>
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="cSupNo">Customer Supprt No<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.custSupportNumber}"
													placeholder="Enter Customer Supprt No" id="cSupNo" name="cSupNo"
													autocomplete="off" required="required" maxlength="10">
												</div>
											</div>
										</div>
										
										
										<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="pinNo">Pin No<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="number" class="form-control" value="${server.pinNumber}"
													placeholder="Enter Pin No" id="pinNo" name="pinNo"
													autocomplete="off" required="required" maxlength="10">
											</div>
										</div>
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="mobNo">Mob No For Verfication.<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.mobNoForVerification}"
													placeholder="Enter Mob No For Verfication." id="mobNo" name="mobNo"
													autocomplete="off" required="required" maxlength="10">
											</div>
										</div>
									</div>
									
									
									<div class="form-group row">
									<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="serverIp">Server Ip<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.serverIp}"
													placeholder="Enter Server Ip" id="serverIp" name="serverIp"
													autocomplete="off" required="required">
											</div>
									</div>
									<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="serverName">Server Name<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.serverName}"
													placeholder="Enter Server Name" id="serverName" name="serverName"
													autocomplete="off" required="required">
											</div>
									</div>
									
									</div>
									<div class="form-group row">
									<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="anytime-month-numeric">Expiry Date<span class="text-danger">*
											</span>:
											</label>
									<div class="col-lg-7  float">
									<input type="text" value="${server.serverExpDate}" class="form-control datepickerclass" id="date" name="date" placeholder="Pick Exp Date" required="required" >
										
										<!-- <input type="text" class="form-control pickadate-strings" placeholder="Pick Expiry Date" required="required"> -->
								
									</div>
								  </div>
								  
								 
									
									</div>
									<div class="form-group row">
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="serverUName">Server UserName<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.serverUsername}"
													placeholder="Enter Server UserName" id="serverUName" name="serverUName"
													autocomplete="off" required="required">
											</div>
									</div>
									
									
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="serverPass">Server Password<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.serverPassword}"
													placeholder="Enter Server Password" id="serverPass" name="serverPass"
													autocomplete="off" required="required">
											</div>
									</div>
									
									</div>
									<div class="form-group row">
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="cPanelIp">C-panel Ip <span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.cpanelIpWithPortNo}"
													placeholder="Enter C-panel Ip " id="cPanelIp" name="cPanelIp"
													autocomplete="off" required="required">
											</div>
									</div>
									
									</div>
									<div class="form-group row">
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="cPaneluName">C-panel Username <span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.cpanelUsername}"
													placeholder="Enter C-panel Username" id="cPaneluName" name="cPaneluName"
													autocomplete="off" required="required">
											</div>
									</div>
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="cPanelPass">C-panel Password <span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${server.cpanelPassword}"
													placeholder="Enter C-panel Password" id="cPanelPass" name="cPanelPass"
													autocomplete="off" required="required">
											</div>
									</div>
									
									</div>
									<div class="form-group row">
									<div class="col-md-6">
											<label class="col-form-label col-lg-5 float" for="remarks">
												Remarks :</label>
											<div class="col-lg-7 float">
												<textarea rows="3" cols="5" class="form-control"
													placeholder="Enter Remark" id="remarks"
													name="remarks">${server.remarks}</textarea>
											</div>
										</div>
									
									
									</div>

									<div class="form-group row mb-0">
										<div style="margin: 0 auto;">

											<button type="submit" class="btn blue_btn ml-3 legitRipple  "
												data-popup="tooltip" data-uuid="" id="submtbtn">Submit</button>
											<a
												href="${pageContext.request.contextPath}/getServerMasterList"><button
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
	$('.datepickerclass').daterangepicker({
		singleDatePicker : true,
		selectMonths : true,
		selectYears : true,
		locale : {
			format : 'YYYY-MM-DD'
		}
	});
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
					
					$('#submitCustmstForm').submit(
							function(e){
								
								if($('#submitCustmstForm').valid()==true){
									
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
												document.getElementById('submitCustmstForm').submit();
											}
										}
									});
									return false;
									}
								return false;
							});
										 
			
		});

		//
	</script>

	<!-- <script type="text/javascript">
	$('#submtbtn').on('click', function() {
        swalInit({
            title: 'Are you sure?',
            text: "You won't be able to revert this!",
            type: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, delete it!',
            cancelButtonText: 'No, cancel!',
            confirmButtonClass: 'btn btn-success',
            cancelButtonClass: 'btn btn-danger',
            buttonsStyling: false
        }).then(function(result) {
            if(result.value) {
                swalInit(
                    'Deleted!',
                    'Your file has been deleted.',
                    'success'
                );
            }
            else if(result.dismiss === swal.DismissReason.cancel) {
                swalInit(
                    'Cancelled',
                    'Your imaginary file is safe :)',
                    'error'
                );
            }
        });
    });
	
	</script> -->

</body>
</html>