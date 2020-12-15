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
												<i class="icon-list-unordered"></i> NEW ATS TASK
											</h5></td>
									<%-- 	<td width="40%" align="right"><a
											href="${pageContext.request.contextPath}/showEnquiryList"
											class="breadcrumb-elements-item">
												<button type="button" class="btn btn-primary">ENQUIRY
													List</button>
										</a></td> --%>
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

								<form action="${pageContext.request.contextPath}/submitAtsAddTask"
									class="form-validate-jquery" novalidate="novalidate"
									id="submitAtsAddTask" method="post">
									
								<div class="form-group row">
									<div class="col-md-6">
										<label
											class="col-form-label text-info font-weight-bold  col-lg-5 float"
												for="taskTittle">Task Tittle<span class="text-danger">*
											</span>:
										</label>
										<div class="col-lg-7 float">
												<input type="text" class="form-control"
													placeholder="Enter Task Tittle" id="taskTittle" maxlength="50"
													minlength="5" name="taskTittle" autocomplete="off"
													required="required">
										</div>
									
									</div>
									
									<div class="col-md-6">
											<label class="col-form-label text-info col-lg-5 float" for="taskDesc">
												Task Desc<span class="text-danger">*
											</span>:
										</label>
											<div class="col-lg-7 float">
												<textarea rows="3" cols="5" class="form-control"
													placeholder="Task Description" id="taskDesc"
													name="taskDesc" required="required"></textarea>
											</div>
										</div>
								
								</div>	
								
								<div class="form-group row">
									<div class="col-md-6">
										<label 
										class="col-form-label text-info font-weight-bold  col-lg-5 float"
										for="taskRepType">Account Type<span class="text-danger">*</span>:
										</label>
										<div class="col-lg-7 float">
											<select name="accType"
													class="form-control form-control-select2"
													data-placeholder="Select Account Type" data-fouc
													required="required" id=""accType"">
													<option value="">Select Account Type</option>
													<c:forEach items="${accTypeList}" var="acc">
														<option value="${acc.mdAccTypeId}" >${acc.mdAccTypeText}</option>
													
													</c:forEach>
												
											</select>
										</div>
									
									</div>
									<div class="col-md-6">
										<label 
										class="col-form-label text-info font-weight-bold  col-lg-5 float"
										for="isSeprate">Seprate Task<span class="text-danger">*</span>:
										</label>
										<div class="col-lg-7 float">
											<select name="isSeprate"
													class="form-control form-control-select2"
													data-placeholder="Is Seprate Task" data-fouc
													required="required" id="isSeprate">
													<option value="">Select Repetetion Type</option>
													<option value="0">Single</option>
													<option value="1">Multiple</option>
												
											</select>
										</div>
									
									</div>
									
								
								</div>
								
								<div class="form-group row">
						
									 <div class="col-md-6">
											<label class="col-form-label text-info  col-lg-5 float" for="rating">Task Priority
												<span class="text-danger">*
											</span>:
											 </label>
										<div class="col-lg-7 float">
												<select name="priority"
													class="form-control form-control-select2"
													data-placeholder="Select priority" data-fouc
													required="required" id="priority">
													<option value="">Select priority</option>
													<option value="Low">Low</option>
													<option value="Normal">Normal</option>
													<option value="High">High</option>
												
													
												</select>
										</div>
										</div> 
										
										
										<div class="col-md-6">
										<label
											class="col-form-label text-info font-weight-bold  col-lg-5 float"
												for="taskPts">Task Pts.<span class="text-danger">*
											</span>:
										</label>
										<div class="col-lg-7 float">
												<input type="text" class="form-control"
													placeholder="Enter Task Pts." id="taskPts" maxlength="50"
													minlength="" name="taskPts" autocomplete="off"
													required="required">
										</div>
										</div>
								</div>
								
								<div class="form-group row">
								
									
									<div class="col-md-6">
											<label
												class="col-form-label  text-info font-weight-bold col-lg-5 float"
												for="points">Task Rep<span class="text-danger">*
											</span> :
											</label>
											<div class="col-lg-7 float">
												<select name="taskType" data-placeholder="Task Type"
													id="taskType" 
													class="form-control form-control-select2 select2-hidden-accessible"
													required="required" onchange="changeDiv()">
													<option value="">select</option>
													<option value="1" selected>One Time</option>
													<option value="2">Weekly</option>
													<option value="3">Monthly</option>

												</select>

											</div>
										</div>
										<div class="col-md-6">
										<div id="weekly" style="display: none;">
										<label
												class="col-form-label  text-info font-weight-bold col-lg-5 float"
												for="selectDay">Select Day<span class="text-danger">*
											</span> :
											</label>
											<div class="col-lg-7 float">
												<select name="selectDay" data-placeholder="Select Day"
													id="selectDay"
													class="form-control form-control-select2 select2-hidden-accessible"
													multiple="multiple">
													<option value="">select</option>
													<option value="0">Sunday</option>
													<option value="1">Monday</option>
													<option value="2">Tuesday</option>
													<option value="3">Wednesday</option>
													<option value="4">Thursday</option>
													<option value="5">Friday</option>
													<option value="6">Saturday</option>
													
												</select>
											</div>
										
										</div>
										<span id="error_sday" style="color:red;display: none;">Please Selact Day!!!!</span>
										
										</div>
										
									
								<!-- 	<div class="col-md-6">
										<label 
										class="col-form-label text-info font-weight-bold  col-lg-5 float"
										for="taskRepDetail">Rep.Detail<span class="text-danger">*</span>:
										</label>
										<div class="col-lg-7 float">
											<input type="text" class="form-control"
											placeholder="Task Repetetion Detail" id="taskRepDetail" name="taskRepDetail"
											maxlength="30" minlength="5" required="required">
										
										</div>
									
									</div> -->
									
								
								</div>
								
								<div class="form-group row" >
									<div class="col-md-6" style="display: none;" id="startDate" >
									<label class="col-form-label text-info font-weight-bold  col-lg-5 float" 
									for="sdate">Start
									Date <span class="text-danger">*</span>
									</label>
									<div class="col-lg-7 float">
									<input type="text" class="form-control datepickerclass" 
									placeholder="" id="sdate" name="sdate"
									>
									<span id="error_sdate" style="color:red;display: none;">Start Date Requiered!!!!</span>
									</div>
									</div>
									
									
									
									<div class="col-md-6"  style="display: none;" id="endDate" >
									<label class="col-form-label text-info font-weight-bold  col-lg-5 float" 
									for="edate">End
									Date <span class="text-danger">*</span>
									</label>
									<div class="col-lg-7 float">
									<input type="text" class="form-control datepickerclass" 
									placeholder="End Date" id="edate" name="edate"
									><span id="error_edate" style="color:red;display: none;">End Date Is Requiered!!!!</span>
									</div>
									</div>
									
								</div>
								
							<div class="form-group row">
								<div class="col-md-6">
									<label class="col-form-label text-info font-weight-bold  col-lg-5 float" 
									for="stime">Schedule
									Time <span class="text-danger">*</span>
									</label>
										<div class="col-lg-7 float">
									<input type="time" class="form-control" required
									placeholder="Scedule Time" id="stime" name="stime"
									>
								</div>
								</div>
								
								<div class="col-md-6">
									<label class="col-form-label text-info font-weight-bold  col-lg-5 float" 
									for="atime">Approx.
									Time <span class="text-danger">*</span>
									</label>
										<div class="col-lg-7 float">
									<input type="time" class="form-control" required
									placeholder="Scedule Time" id="atime" name="atime"
									>
								</div>
								</div>
							
								
							</div>	
							
							<div class="form-group row">
									 <div class="col-md-6">
											<label class="col-form-label text-info  col-lg-5 float" 
											for="allotedTo">Task Alloted To
												<span class="text-danger">*
											</span>:
											 </label>
										<div class="col-lg-7 float">
												<select name="allotedTo"
													class="form-control form-control-select2"
													data-placeholder="Task Alloted To" data-fouc
													required="required" id="allotedTo" multiple="multiple">
													<option value="">Select Employee</option>
														<c:forEach items="${empList}" var="emp">
															<option value="${emp.empId}" >${emp.empName}</option>
														</c:forEach>
													
													
												</select>
										</div>
										</div> 
							
							
							</div>
							
							
								<div class="form-group row mb-0">
										<div style="margin: 0 auto;">

											<button type="submit" class="btn blue_btn ml-3 legitRipple"
												id="submtbtn">Submit</button>
											<a href="${pageContext.request.contextPath}/showAtsTaskList"><button
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
		
		
		
		
		function addCp() {
			
			var cpName = $("#cpName").val();
			var designation = $("#designation").val();
			var cpMobile1 = $("#cpMobile1").val();
			var cpMobile2 = $("#cpMobile2").val();
			var email = $("#emailId").val();

			if (validate()) {

				var fd = new FormData();
				fd.append("cpName", cpName);
				fd.append("designation", designation);
				fd.append("cpMobile1", cpMobile1);
				fd.append("cpMobile2", cpMobile2);
				fd.append("email", email);
					
				$
						.ajax({
							url : '${pageContext.request.contextPath}/addContactPersonInquiry',
							type : 'post',
							dataType : 'json',
							data : fd,
							contentType : false,
							processData : false,
							success : function(response) {
								getCpList();
							},
						});
			}
		}
		
		
		
		function getCpList() {
			
			var fd = new FormData();

			$
					.ajax({
						url : '${pageContext.request.contextPath}/getCpListInquiry',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							var table = $('#contactlist').DataTable();
							var rows = table.rows().remove().draw();

							for (var i = 0; i < response.length; i++) {

								var action = '<div class="text-center"> <a href="javascript:void(0)" class="list-icons-item text-primary-600" data-popup="tooltip" '
										+ ' title="" data-original-title="Delete" onclick="deleteCp('
										+ i
										+ ')"><i class="icon-trash"></i></a></div>'

								$('#contactlist td').css('white-space',
										'initial');
								$('#contactlist').DataTable().row.add(
										[ (i + 1), response[i].cpName,
												response[i].cpMobile,
												response[i].cpMobile2,
												response[i].cpEmail, action ])
										.draw();
							}

							if (response.length > 0) {
								document.getElementById('submtbtn').disabled = false;
							} else {
								document.getElementById('submtbtn').disabled = true;
							}

						},
					});

		}
		

		

		function deleteCp(id) {

			var fd = new FormData();
			fd.append("id", id);
			$
					.ajax({
						url : '${pageContext.request.contextPath}/deleteContactPersonInquiry',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							getCpList();
						},
					});

		}
		
		
		function validate() {
			var cpName = $("#cpName").val();
			var designation = $("#designation").val();
			var cpMobile1 = $("#cpMobile1").val();
			

			$("#error_cpName").hide();
			$("#error_designation").hide();
			$("#error_cpMobile1").hide();
			
			var mob = /^\d{10}$/;
			const emailRegex = /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i;

			var isError = true;

			if (cpName == "") {
				$("#error_cpName").show();
				isError = false;
			}
			if (designation == "") {
				$("#error_designation").show();
				isError = false;
			}
			if (cpMobile1 == "") {
				$("#error_cpMobile1").html('This filed is required.');
				$("#error_cpMobile1").show();
				isError = false;
			} else if (!mob.test(cpMobile1)) {
				$("#error_cpMobile1").html('Invalid mobile no');
				$("#error_cpMobile1").show();
				isError = false;
			}

			if (!mob.test(cpMobile2) && cpMobile2 != "") {
				$("#error_cpMobile2").html('Invalid mobile no');
				$("#error_cpMobile2").show();
				isError = false;
			}

			if (!emailRegex.test(email) && email != "") {
				$("#error_emailId").html('Invalid email.');
				$("#error_emailId").show();
				isError = false;
			}
			return isError;
		}
		
		
		
		
		
		function getCityList(stateId){
			//alert("Ok!")
			
			if(stateId>0){
				var fd=new FormData();
				fd.append("stateId",stateId);
						$.ajax({
						url : '${pageContext.request.contextPath}/getCityListinq',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							//alert(response)
							var html;
							var len=response.length;
							for(var i=0;i<len;i++){
								html += '<option value="'+response[i].mCityId+'">'+
								response[i].mCityName+'</option>'
								//alert(response[i].mCityName)
							}
							$('#cityId').html(html);
							$('#cityId').trigger("chosen:updated");
						},
					});	
			}
			
				
			
		}	
		
		
		
		
		$('.datepickerclass').daterangepicker({
			singleDatePicker : true,
			selectMonths : true,
			selectYears : true,
			locale : {
				format : 'DD-MM-YYYY'
			}
		});
		
		
		
		function changeDiv(){
			//alert(document.getElementById("taskType").value);
			if(document.getElementById("taskType").value==1){
				$('#error_sday').hide()
				 document.getElementById("startDate").style.display = "block";
				 document.getElementById("endDate").style.display = "none";
				 document.getElementById("weekly").style.display = "none";
			}else if(document.getElementById("taskType").value==2) {
				 document.getElementById("startDate").style.display = "block";
				 document.getElementById("endDate").style.display = "block";
				 document.getElementById("weekly").style.display = "block";
			}else {
				 document.getElementById("startDate").style.display = "block";
				 document.getElementById("endDate").style.display = "none";
				 document.getElementById("weekly").style.display = "none";
			}
		}
		$(document).ready(
				function($) {

					$("#submitAtsAddTask").submit(
							function(e) {
								
								if ($('#submitAtsAddTask').valid() == true
									&& chkVal()  ) {
										
									bootbox.confirm({
										title : 'Confirm',
										message : 'Confirm Add New Task ? ',
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
												document.getElementById(
														'submitAtsAddTask').submit();
											}
										}
									});
									return false;
								}
								return false;
							});
				});
		
		
		function chkVal(){
			
			var isError = false;
			var rep=document.getElementById("taskType").value;
			   
			var sDate=document.getElementById("sdate").value;
			var eDate=document.getElementById("edate").value;
			var sDay=document.getElementById("selectDay").value;
		if(rep==1){
			alert(sDate);
			if(!sDate){
				$('#error_sdate').show()
			}else{
				isError=true;
				$('#error_sdate').hide()
			}
			
		}if(rep==2){
			alert(sDate);
			alert(eDate);
			alert(sDay);
			if(!sDate){
				$('#error_sdate').show()
			}else{
				$('#error_sdate').hide()
			}if(!eDate){
				$('#error_edate').show()
			}else{
				$('#error_edate').hide()
			}if(!sDay){
				
				$('#error_sday').show()
			}else{
				isError=true;
				$('#error_sday').hide()
			}
		}if(rep==3){
			alert(sDate);
			if(!sDate){
				$('#error_sdate').show()
			}else{
				isError=true;
				$('#error_sdate').hide()
			}
		}
			
			
			
			return isError;
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