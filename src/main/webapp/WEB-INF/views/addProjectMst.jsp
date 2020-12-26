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
												<i class="icon-list-unordered"></i> EDIT Project Master
											</h5></td>
										<td width="40%" align="right">
										</c:when>
										<c:otherwise>
										<td width="60%"><h5 class="pageTitle">
												<i class="icon-list-unordered"></i> ADD Project Master
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
									action="${pageContext.request.contextPath}/submitProjectmstForm"
									class="form-validate-jquery" novalidate="novalidate"
									id="submitTagForm" method="post">

									
									<input type="hidden" id="projectId" value="${project.projectId}" name="projectId">
	
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
														<c:when test="${cust.custId == project.custId}">
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
												class="col-form-label  text-info font-weight-bold col-lg-5 float"
												for="custId">Select Server<span
												class="text-danger">* </span> :
											</label>
											<div class="col-lg-7 float">

												<select name="servId"
													class="form-control form-control-select2"
													data-placeholder="Select Customer" data-fouc
													required="required" id="servId"><option
														>Select Server</option>
													<c:forEach items="${serverList}" var="serv">
													<c:choose>
														<c:when test="${serv.serverId == project.server}">
															<option value="${serv.serverId}" selected="selected">${serv.serverName}</option>
														</c:when>
														<c:otherwise>
															<option value="${serv.serverId}">${serv.serverName}</option>
														</c:otherwise>
													
													</c:choose>
														
													
														
													</c:forEach>
												</select>

											</div>
										</div>
										</div>
										
										
										<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="pName">Project Name<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.projectName}"
													placeholder="Enter Project Name" id="pName" name="pName"
													autocomplete="off" required="required">
											</div>
										</div>
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="pDesc">Project Desc.<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.projectDesc}"
													placeholder="Enter Project Desc." id="pDesc" name="pDesc"
													autocomplete="off" required="required" >
												</div>
											</div>
										</div>
										
										
										<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="pLink">Enter Project Link<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.projectLink}"
													placeholder="Enter Project Link" id="pLink" name="pLink"
													autocomplete="off" required="required">
											</div>
										</div>
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="pType">Project Type.<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.projectType}"
													placeholder="Enter Project Type." id="pType" name="pType"
													autocomplete="off" required="required" >
											</div>
										</div>
									</div>
									
									
									<div class="form-group row">
									<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="gLink">GitHub Link<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.gitLink}"
													placeholder="Enter GitHub Link" id="gLink" name="gLink"
													autocomplete="off" required="required">
											</div>
									</div>
									<%-- <div class="col-md-6">
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
									</div> --%>
									
									</div>
									<div class="form-group row">
									<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="adminUname">Admin Username<span class="text-danger">*
											</span>:
											</label>
									<div class="col-lg-7  float">
									<input type="text" value="${project.adminUsername}" class="form-control " id="adminUname" name="adminUname" placeholder="Enter Admin Username" required="required" >
										
										<!-- <input type="text" class="form-control pickadate-strings" placeholder="Pick Expiry Date" required="required"> -->
								
									</div>
								  </div>
								   <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="adminPass">Admin  Password<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.adminPass}"
													placeholder="Enter Admin Password" id="adminPass" name="adminPass"
													autocomplete="off" required="required">
											</div>
									</div>
								  
								 
									
									</div>
									<div class="form-group row">
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="dbIp">Database Ip Address<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.databaseIp}"
													placeholder="Enter Database Ip Address" id="dbIp" name="dbIp"
													autocomplete="off" required="required">
											</div>
									</div>
									
									
									 <%-- <div class="col-md-6">
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
									</div> --%>
									
									</div>
									<div class="form-group row">
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="dbUname">Databse Username <span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.dbUsername}"
													placeholder="Enter Databse Username " id="dbUname" name="dbUname"
													autocomplete="off" required="required">
											</div>
									</div>
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="dbPass">Databse Password <span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.dbPassword}"
													placeholder="Enter Databse Password " id="dbPass" name="dbPass"
													autocomplete="off" required="required">
											</div>
									</div>
									
									</div>
									<div class="form-group row">
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="dbName">Database Name <span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.dbName}"
													placeholder="Enter Database Name" id="dbName" name="dbName"
													autocomplete="off" required="required">
											</div>
									</div>
									 <div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="pStatus">Project Status <span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${project.status}"
													placeholder="Enter Project Status" id="pStatus" name="pStatus"
													autocomplete="off" required="required">
											</div>
									</div>
									
									</div>
									<%-- <div class="form-group row">
									<div class="col-md-6">
											<label class="col-form-label col-lg-5 float" for="remarks">
												Remarks :</label>
											<div class="col-lg-7 float">
												<textarea rows="3" cols="5" class="form-control"
													placeholder="Enter Remark" id="remarks"
													name="remarks">${server.remarks}</textarea>
											</div>
										</div>
									
									
									</div> --%>

									<div class="form-group row mb-0">
										<div style="margin: 0 auto;">

											<button type="submit" class="btn blue_btn ml-3 legitRipple  "
												data-popup="tooltip" data-uuid="" id="submtbtn">Submit</button>
											<a
												href="${pageContext.request.contextPath}/getProjectMasterList"><button
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