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
												<i class="icon-list-unordered"></i> NEW LEAD
											</h5></td>
										<td width="40%" align="right"><a
											href="${pageContext.request.contextPath}/showLeadList"
											class="breadcrumb-elements-item">
												<button type="button" class="btn btn-primary">Lead
													List</button>
										</a></td>
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
									id="submitInsertLocaion" method="post">

									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="tagName">Customer Name<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control" value="${dept.name}"
													placeholder="Customer Department" id="tagName"
													maxlength="30" minlength="5" name="tagName"
													autocomplete="off" required="required">
											</div>
										</div>

										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold  col-lg-5 float"
												for="desigShortName">Type<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7 float">
												<select name="status"
													class="form-control form-control-select2"
													data-placeholder="Select status" data-fouc
													required="required">
													<option value="">select</option>
													<option value="open">Customer</option>
													<option value="hold">Collaborator</option>
												</select>

											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="accCode">Acc Code<span class="text-danger">*
											</span> :
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control"
													placeholder="Acc Code" id="accCode" maxlength="30"
													minlength="5" name="accCode" autocomplete="off"
													required="required">
											</div>
										</div>

										<div class="col-md-6">
											<label
												class="col-form-label  text-info font-weight-bold col-lg-5 float"
												for="dId">Select Domain<span class="text-danger">*
											</span> :
											</label>
											<div class="col-lg-7 float">
												<select name="dId" class="form-control form-control-select2"
													data-placeholder="Select status" data-fouc
													required="required">
													<option value="">select</option>
													<option value="open">Customer</option>
													<option value="hold">Collaborator</option>
												</select>

											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="accTag">Acc Tag<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7 float">
												<select name="accTag"
													class="form-control form-control-select2"
													data-placeholder="Select status" data-fouc
													required="required">
													<option value="">select</option>
													<option value="open">HR</option>
													<option value="hold">HR</option>
												</select>

											</div>
										</div>

										<div class="col-md-6">
											<label
												class="col-form-label  text-info font-weight-bold col-lg-5 float"
												for="cmpName">Company Name<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7 float">
												<input type="text" class="form-control" value="${dept.name}"
													placeholder="Company Name" id="tagName" maxlength="30"
													minlength="5" name="cmpName" autocomplete="off"
													required="required">

											</div>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-md-6">
											<label class="col-form-label  col-lg-5 float" for="website">Website
												: </label>
											<div class="col-lg-7 float">
												<input type="text" class="form-control" value="${dept.name}"
													placeholder="Website" id="website" maxlength="30"
													minlength="5" name="website" autocomplete="off">

											</div>
										</div>

										<div class="col-md-6">
											<label class="col-form-label  col-lg-5 float" for="turnover">Turnover
												: </label>
											<div class="col-lg-7 float">
												<input type="text" class="form-control" value="${dept.name}"
													placeholder="Turnover" id="turnover" maxlength="30"
													minlength="5" name="turnover" autocomplete="off">

											</div>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-md-6">
											<label class="col-form-label  col-lg-5 float" for="website">Employee
												Count : </label>
											<div class="col-lg-7 float">
												<input type="text" class="form-control" value="${dept.name}"
													placeholder="Website" id="website" maxlength="30"
													minlength="5" name="website" autocomplete="off">

											</div>
										</div>

										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="turnover">Contact No<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7 float">
												<input type="text" class="form-control" value="${dept.name}"
													placeholder="Contact No." id="turnover" maxlength="10"
													minlength="10" name="turnover" autocomplete="off">

											</div>
										</div>
									</div>

									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="remark">Remark<span class="text-danger">*</span>
											</label>
											<div class="col-lg-7 float">
												<textarea rows="3" cols="5" name="textarea"
													class="form-control" required placeholder="Remark"
													id="taskDescription" name="taskDescription"></textarea>
											</div>
										</div>
									</div>
									<div class="form-group row mb-0">
										<div style="margin: 0 auto;">

											<button type="submit" class="btn blue_btn ml-3 legitRipple"
												id="submtbtn">Submit</button>
											<a href="${pageContext.request.contextPath}/showLeadList"><button
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
		function trim(el) {
			el.value = el.value.replace(/(^\s*)|(\s*$)/gi, ""). // removes leading and trailing spaces
			replace(/[ ]{2,}/gi, " "). // replaces multiple spaces with one space 
			replace(/\n +/, "\n"); // Removes spaces after newlines
			//checkSame();
			return;
		}

		/* $(document).ready(function($) {

			$("#submitInsertLocaion").submit(function(e) {
				var isError = false;
				var errMsg = "";
				var validation = '';

				if (parseInt(validation) == 1) {

					if (!$("#man_pow").val() || $("#man_pow").val() < 0) {
						isError = true;
						$("#error_man_pow").show();
					} else {
						$("#error_man_pow").hide();
					}
				}//end of if validation==1

				if (!$("#desigName").val()) {

					isError = true;

					$("#error_designation").show()
					//return false;
				} else {
					$("#error_designation").hide()
				}

				if (!$("#desigShortName").val()) {

					isError = true;

					$("#error_desigShortName").show()

				} else {
					$("#error_desigShortName").hide()
				}

				if (!isError) {

					var x = true;
					if (x == true) {

						document.getElementById("submtbtn").disabled = true;
						return true;
					}
					//end ajax send this to php page
				}
				return false;
			});
		}); */
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