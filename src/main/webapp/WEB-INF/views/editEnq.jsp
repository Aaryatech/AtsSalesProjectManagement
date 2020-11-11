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
												<i class="icon-list-unordered"></i> UPDATE ENQUIRY
											</h5></td>
										<td width="40%" align="right"><a
											href="${pageContext.request.contextPath}/showEnquiryList"
											class="breadcrumb-elements-item">
												<button type="button" class="btn btn-primary">ENQUIRY
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
									action="${pageContext.request.contextPath}/submitEditEnquiryForm"
									class="form-validate-jquery" novalidate="novalidate"
									id="submitAddEnquiryForm" method="post">
									<input type="hidden" name="inqId" name="inqId" value="${editEnqHeader.inqId }">
											<c:out value="	${editEnqHeaders}"></c:out> 
									<div class="form-group row">
								<!--Account Type Is Bydefault 2  -->
								<%-- 		<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="tagName">Account Type<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7 float">
												<select name="accType"
													class="form-control form-control-select2"
													data-placeholder="Select Acc Type" data-fouc
													required="required">
													<option value="">select</option>
													<c:forEach items="${accTypeList}" var="accType">
													
													<c:choose>
													<c:when test="${editEnqHeader.mdAccTypeId==accType.mdAccTypeId}">
												
													<option value="${accType.mdAccTypeId}" selected="selected" >${accType.mdAccTypeShortName}</option>
													</c:when>
													<c:otherwise>
													<c:out value="In Otherwise"></c:out>
													<option value="${accType.mdAccTypeId}" >${accType.mdAccTypeShortName}</option>
													</c:otherwise>
													
													</c:choose>
													
													</c:forEach>
													</select>

											</div>
										</div> 
										
 --%>

 									<div class="col-md-6">
											<label
											
												class="col-form-label text-info font-weight-bold  col-lg-5 float"
												for="inqTittle">Inquiry Tittle<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control"
													placeholder="Enter Inquiry Tittle" id="inqTittle" maxlength="30"
													minlength="5" name="inqTittle" autocomplete="off"
													required="required" value="${editEnqHeader.inquiryTittle}">
											</div>
										</div>
										
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold  col-lg-5 float"
												for=channelName>Channel<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7 float">
												<select name="channel"
													class="form-control form-control-select2"
													data-placeholder="Select Channel" data-fouc
													required="required">
													<option value="">select</option>
													<c:forEach items="${chanalList}" var="channel">
													<c:choose>
														<c:when test="${channel.mChannelId==editEnqHeader.channelId}">
															<option value="${channel.mChannelId}" selected="selected">${channel.mChannelName}</option>
														</c:when>
														<c:otherwise>
															<option value="${channel.mChannelId}" >${channel.mChannelName}</option>
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
											
												class="col-form-label  col-lg-5 float"
												for="domainName">Domain Name
											</label>
											<div class="col-lg-7  float">
												<input type="text" class="form-control"
													placeholder="Enter Domain Name" id="domainName" maxlength="30" value="${editEnqHeader.inqDomainOther}"
													minlength="5" name="domainName" autocomplete="off"
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
													data-placeholder="Select Domain" data-fouc
													required="required">
													<option value="">select</option>
													<c:forEach items="${domainList}" var="domain">
													<c:choose>
														<c:when test="${domain.mDomainId==editEnqHeader.inqDomainId}">
															<option value="${domain.mDomainId}" selected="selected" >${domain.mDomainName}</option>
														</c:when>
														<c:otherwise>
															<option value="${domain.mDomainId}"  >${domain.mDomainName}</option>
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
												for="accTag">Acc Tag<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7 float">
												<select name="accTag"
													class="form-control form-control-select2"
													data-placeholder="Select Tags" data-fouc id="accTag" multiple="multiple"
													required="required">
													<option value="">select</option>
													<c:forEach items="${tagList}" var="tag">
														<c:set var="find" value="0"></c:set>
														<c:forEach items="${selectedTags }" var="selectedTag">
															<c:if test="${selectedTag eq tag.mTagId}">
															<c:set value="1" var="find"></c:set>
															</c:if>
														</c:forEach>	
														
														<c:choose>
															<c:when test="${find==1 }">
																<option value="${tag.mTagId}" selected="selected">${tag.mTagName }</option>
															</c:when>
															<c:otherwise>
																<option value="${tag.mTagId}">${tag.mTagName }</option>
															</c:otherwise>
														
														</c:choose>												
													
													
													</c:forEach>
													
													
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
												<input type="text" class="form-control" value="${editEnqHeader.inqCompany}"
													placeholder="Company Name" id="cmpName" maxlength="30"
													minlength="5" name="cmpName" autocomplete="off"
													required="required">

											</div>
										</div>
									</div>
									<div class="form-group row">
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold  col-lg-5 float"
												for="domainId">Select State<span
												class="text-danger">* </span>:
											</label>
											<div class="col-lg-7 float">
												<select name="stateID" 
													class="form-control form-control-select2"
													data-placeholder="Select State" data-fouc
													required="required" id="stateID"   onchange="getCityList(this.value)">
													<option value="" >Select State</option>
													<c:forEach items="${stateList}" var="state">
														<option value="${state.mStateId}" ${editEnqHeader.mStateId==state.mStateId ? 'selected':' ' }  >${state.mStateName}</option>
													</c:forEach>
												</select>

											</div>
										</div>
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold  col-lg-5 float"
												for="domainId">Select City<span
												class="text-danger">* </span>:
											</label>
											<div class="col-lg-7 float">
												<select name="cityId"
													class="form-control form-control-select2"
													data-placeholder="Select City" data-fouc
													required="required" id="cityId">
													
												</select>

											</div>
										</div>
									
									
									</div>

									<div class="form-group row">
										<div class="col-md-6">
											<label class="col-form-label  col-lg-5 float" for="website">Website
												: </label>
											<div class="col-lg-7 float">
												<input type="text" class="form-control" value="${editEnqHeader.inqWebsite}"
													placeholder="Website" id="website" maxlength="30"
													minlength="5" name="website" autocomplete="off">

											</div>
										</div>

										<div class="col-md-6">
											<label class="col-form-label  col-lg-5 float" for="turnover">Turnover
												: </label>
											<div class="col-lg-7 float">
												<input type="text" class="form-control" value="${editEnqHeader.inqTurnover}"
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
												<input type="number" class="form-control" value="${editEnqHeader.inqEmpCount}"
													placeholder="Employee Count" id="empCount" maxlength="30"
													 name="empCount" autocomplete="off" min="0">

											</div>
										</div>

										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="contactNo">Contact No<span class="text-danger">*
											</span>:
											</label>
											<div class="col-lg-7 float">
												<input type="text" class="form-control" value="${editEnqHeader.inqCompanyLandline}"
													placeholder="Contact No." id="contactNo" maxlength="10"
													minlength="10" name="contactNo" autocomplete="off">

											</div>
										</div>
									</div>

									<div class="form-group row">
									<div class="col-md-6">
											<label class="col-form-label col-lg-5 float" for="scaleDesc">ACC
												Scale Desc :</label>
											<div class="col-lg-7 float">
												<textarea rows="3" cols="5" class="form-control" 
													placeholder="ACC Scale Desc" id="scaleDesc"
													name="scaleDesc">${editEnqHeader.inqScaleDesc}</textarea>
											</div>
										</div>
										<div class="col-md-6">
											<label
												class="col-form-label text-info font-weight-bold col-lg-5 float"
												for="remark">Remark
											</label>
											<div class="col-lg-7 float">
												<textarea rows="3" cols="5" name="Remark"
													class="form-control" required placeholder="Remark"
													id="Remark" name="taskDescription">${editEnqHeader.inqRemark}</textarea>
											</div>
										</div>
									</div>
									<div class="form-group row">
										 <div class="col-md-6">
											<label class="col-form-label  col-lg-5 float" for="rating">Rating
												: </label>
										<div class="col-lg-7 float">
												<select name="rating"
													class="form-control form-control-select2"
													data-placeholder="Select ratings" data-fouc
													required="required" id="domainId">
													<option value="">Select Domain</option>
											
														<option value="0" ${editEnqHeader.inqAtsRating=='0' ? 'selected' : ''}>0</option>
														<option value="0.5" ${editEnqHeader.inqAtsRating=='0.5' ? 'selected' : ''}>0.5</option>
														<option value="1" ${editEnqHeader.inqAtsRating=='1' ? 'selected' : ''}>1.0</option>
														<option value="1.5" ${editEnqHeader.inqAtsRating=='1.5' ? 'selected' : ''}>1.5</option>
														<option value="2" ${editEnqHeader.inqAtsRating=='2' ? 'selected' : ''}>2.0</option>
														<option value="2.5" ${editEnqHeader.inqAtsRating=='2.5' ? 'selected' : ''}>2.5</option>
														<option value="3" ${editEnqHeader.inqAtsRating=='3' ? 'selected' : ''}>3.0</option>
														<option value="3.5" ${editEnqHeader.inqAtsRating=='3.5' ? 'selected' : ''}>3.5</option>
														<option value="4" ${editEnqHeader.inqAtsRating=='4' ? 'selected' : ''}>4.0</option>
														<option value="4.5" ${editEnqHeader.inqAtsRating=='4.5' ? 'selected' : ''}>4.5</option>
														<option value="5" ${editEnqHeader.inqAtsRating=='5' ? 'selected' : ''}>5.0</option>
													
												</select>

											</div>
										</div> 

									</div>
									<hr>
									<div id="detailDiv">
										<div class="form-group row">
											<div class="col-md-6">
												<label class="col-form-label col-lg-5 float" for="cpName">Contact
													Person : </label>
												<div class="col-lg-7 float">
													<input type="text" class="form-control"
														placeholder="Contact Person Name" id="cpName"
														maxlength="30" name="cpName" autocomplete="off"> <span
														class="validation-invalid-label" id="error_cpName"
														style="display: none;">This field is required.</span>
												</div>
											</div>
											<div class="col-md-6">
												<label class="col-form-label col-lg-5 float"
													for="designation">Select Designation : </label>
												<div class="col-lg-7 float">
													<select name="designation"
														class="form-control form-control-select2"
														data-placeholder="Select Designation" data-fouc
														id="designation">
														<option value="">Select Designation</option>
														<c:forEach items="${designationList}"
															var="designationList">
															<option value="${designationList.mDesignationId}">${designationList.mDesignationName}</option>
														</c:forEach>
													</select><span class="validation-invalid-label"
														id="error_designation" style="display: none;">This
														field is required.</span>
												</div>
											</div>
										
										</div>
											<div class="form-group row">
											<div class="col-md-6">
												<label class="col-form-label col-lg-5 float" for="cpMobile1">Contact
													No. : </label>
												<div class="col-lg-7 float">
													<input type="text" class="form-control"
														placeholder="Contact No." id="cpMobile1" name="cpMobile1"
														autocomplete="off" maxlength="10"> <span
														class="validation-invalid-label" id="error_cpMobile1"
														style="display: none;">This field is required.</span>
												</div>
											</div>

											<div class="col-md-6">
												<label class="col-form-label col-lg-5 float" for="cpMobile2">Alternate
													Contact No. : </label>
												<div class="col-lg-7 float">
													<input type="text" class="form-control"
														placeholder="Contact No." id="cpMobile2" name="cpMobile2"
														autocomplete="off"><span
														class="validation-invalid-label" id="error_cpMobile2"
														style="display: none;">Enter valid mobile no.</span>
												</div>
											</div>
										</div>

										<div class="form-group row">
											<div class="col-md-6">
												<label class="col-form-label col-lg-5 float" for="emailId">Email
													: </label>
												<div class="col-lg-7 float">
													<input type="text" class="form-control" placeholder="Email"
														id="emailId" name="emailId" autocomplete="off"> <span
														class="validation-invalid-label" id="error_emailId"
														style="display: none;">Enter valid email.</span>
												</div>
											</div>

										</div>
											
										
										
										
									</div>
									<div class="form-group row mb-0">
										<div style="margin: 0 auto;">

											<button type="button" class="btn blue_btn ml-3 legitRipple"
												id="addBtn" onclick="addCp()">Add</button>

										</div>
									</div>
									<div class="table-responsive">
										<table class="table tasks-list table-lg" id="contactlist">
											<thead>
												<tr>
													<th>#</th>
													<th class="text-center">Contact Person Name</th>
													<th class="text-center">Contact No.</th>
													<th class="text-center">Alternate Contact No.</th>
													<th class="text-center">Email</th>
													<th class="text-center">Action</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${editEnqHeader.inqDetailList}" var="inqDetailList"
													varStatus="count">
													<tr>
													<td>${count.index+1}</td>
													<td>${inqDetailList.cpName}</td>
													<td>${inqDetailList.cpMobile }</td>
													<td>${inqDetailList.cpMobile2}</td>
													<td>${inqDetailList.cpEmail}</td>
													 <td class="text-center">
													 
													 
													 	 <!-- <a href="javascript:void(0)"
																	class="list-icons-item text-danger-600 bootbox_custom1"
																	data-uuid="${count.index}" data-popup="tooltip" title=""
																	data-original-title="Delete"><i class="icon-trash"></i></a> --> 
													 
													 
													 
													 <a href="javascript:void(0)"
															class="list-icons-item text-danger-600"
															onclick="deleteCp(${count.index})" title="Delete"><i
																class="icon-trash"></i>
													</a>
												</td> 
													</tr>
												</c:forEach>

											</tbody>
										</table>
									</div>
									<div class="form-group row mb-0">
										<div style="margin: 0 auto;">

											<button type="submit" class="btn blue_btn ml-3 legitRipple"
												id="submtbtn">Submit</button>
											<a href="${pageContext.request.contextPath}/showEnquiryList"><button
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
		

		function deleteCp(id) {
			
			if(id>=0){
				
				
				bootbox
				.confirm({
					title : 'Confirm ',
					message : 'Are you sure you want to delete selected records ?',
					buttons : {
						confirm : {
							label : 'Yes',
							className : 'btn-success'
						},
						cancel : {
							label : 'Cancel',
							className : 'btn-link'
						}
					},
					callback : function(result) {
						if (result) {
							
							var fd = new FormData();
							fd.append("id", id);
							$
									.ajax({
										url : '${pageContext.request.contextPath}/deleteCpInquiry',
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

							var index=0;
							
							for (var i = 0; i < response.length; i++) {

								if(response[i].delStatus==1){
									index=index+1;
									var action = '<div class="text-center"> <a href="javascript:void(0)" class="list-icons-item text-primary-600" data-popup="tooltip" '
										+ ' title="Delete" data-original-title="Delete" onclick="deleteCp('
										+ i
										+ ')"><i class="icon-trash"></i></a></div>'

								$('#contactlist td').css('white-space',
										'initial');
								$('#contactlist').DataTable().row.add(
										[
												(index),
												response[i].cpName,
												response[i].cpMobile,
												response[i].cpMobile2,
												response[i].cpEmail, action ])
										.draw();
								}
								
							}

							if (index > 0) {
								document.getElementById('submtbtn').disabled = false;
							} else {
								document.getElementById('submtbtn').disabled = true;
							}
							$("#cpName").val('');
							$("#designation").val(0);
							$("#cpMobile1").val('');
							$("#cpMobile2").val('');
							$("#emailId").val('');
							$("#designation").trigger("chosen:updated");
						},
					});

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
		
		
		

		

/* 		function deleteCp(id) {

			var fd = new FormData();
			fd.append("id", id);
			$
					.ajax({
						url : '${pageContext.request.contextPath}/deleteCpInquiry',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {
							getCpList();
						},
					});

		} */
		
		
		function validate() {
			var cpName = $("#cpName").val();
			var designation = $("#designation").val();
			var cpMobile1 = $("#cpMobile1").val();
			var cpMobile2 = $("#cpMobile2").val();
			var email = $("#emailId").val();

			$("#error_cpName").hide();
			$("#error_designation").hide();
			$("#error_cpMobile1").hide();
			$("#error_cpMobile2").hide();
			$("#error_emailId").hide();
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
							var ctId=${editEnqHeader.mCityId}
							for(var i=0;i<len;i++){
							if(parseInt(ctId)==parseInt(response[i].mCityId)){
								html += '<option selected value="'+response[i].mCityId+'"    >'+
								response[i].mCityName+'</option>'
								//alert(response[i].mCityName)
							}else {
								html += '<option value="'+response[i].mCityId+'"    >'+
								response[i].mCityName+'</option>'
								//alert(response[i].mCityName)
							}
								
							}
							$('#cityId').html(html);
							$('#cityId').trigger("chosen:updated");
						},
					});	
			}
			
				
			
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

	<script>
	/* $('#submtbtn').on('click', function() {
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
    
     
 */    
    
 </script>
 <script>
    
	/* $('.bootbox_custom1')
	.on(
			'click',
			function() {
				var uuid = $(this).data("uuid") 
				alert("In Boot Box")
				
				bootbox
				.confirm({
					title : 'Confirm ',
					message : 'Are you sure you want to delete selected records ?',
					buttons : {
						confirm : {
							label : 'Yes',
							className : 'btn-success'
						},
						cancel : {
							label : 'Cancel',
							className : 'btn-link'
						}
					},
					callback : function(result) {
						if (result) {
							
							var fd = new FormData();
							fd.append("id", id);
							$
									.ajax({
										url : '${pageContext.request.contextPath}/deleteCpInquiry',
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
				});
			
			});
	 */
	
	</script>

</body>
</html>