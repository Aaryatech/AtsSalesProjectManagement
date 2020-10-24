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
												<i class="icon-list-unordered"></i> ADD NEW TAG
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
									action="${pageContext.request.contextPath}/submitInsertDepartment"
									class="form-validate-jquery" novalidate="novalidate"
									id="submitTagForm" method="post">

									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="tagName">Tag Name<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${dept.name}"
													placeholder="Enter Tag Name" id="tagName" name="tagName"
													autocomplete="off" required="required">
											</div>
										</div>

										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold  col-lg-5 float"
												for="accountType">Select Account Type<span
												class="text-danger">* </span>:
											</label>
											<div class="col-lg-7 float">
												<select name="accountType"
													class="form-control form-control-select2"
													data-placeholder="Select Account Type" data-fouc
													required="required">
													<option value="">select</option>
													<c:forEach items="${AccountTypeList}" var="AccountType">
														<option value="${AccountType.mdAccTypeId }">${AccountType.mdAccTypeShortName}</option>
													</c:forEach>


												</select>

											</div>
										</div>

									</div>


									<div class="form-group row mb-0">
										<div style="margin: 0 auto;">

											<button type="submit" class="btn blue_btn ml-3 legitRipple  "
												data-popup="tooltip" data-uuid="" id="submtbtn">Submit</button>
											<a
												href="${pageContext.request.contextPath}/showDepartmentList"><button
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

					}
				}
			});

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

		$(document).ready(function($) {

			$("#submitTagForm").submit(function(e) {

				//alert(document.getElementById("submitTagForm").noValidate)
				bootbox.confirm({
					title : 'Confirm',
					message : 'Confirm Submit Form? ',
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

							//$("#submitTagForm").submit();
						}
						//return false;
					}
				});
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