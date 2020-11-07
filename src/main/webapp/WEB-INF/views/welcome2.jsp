<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page
	import="java.util.Date"%><%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/extensions/jquery_ui/interactions.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/extensions/jquery_ui/touch.min.js"></script>

<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/demo_pages/content_cards_draggable.js"></script>
</head>

<body>

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
				<div class="row">

					<div class="col-md-12">
						<div class="card">
							<div class="card-header header-elements-inline">
								<h6 class="card-title">Todays Task</h6>
								<div class="header-elements">
									<span><i class="icon-history text-warning mr-2"></i> <%
 	Date dt = new Date();
 	SimpleDateFormat sf = new SimpleDateFormat("dd MMM yyyy | hh:mm a");
 %><%=sf.format(dt)%></span>
									<!-- <span
										class="badge bg-success align-self-start ml-3">Online</span> -->
								</div>
							</div>

							<!-- Numbers -->
							<div class="card-body py-0">
								<div class="row text-center">

									<div class="col-2">
										<div class="mb-3 ">
											<h5 class="font-weight-semibold mb-0">32,693</h5>
											<span class="text-muted font-size-sm">Today's</span>
										</div>
									</div>
									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0">2,345</h5>
											<span class="text-muted font-size-sm">Completed</span>
										</div>
									</div>

									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0">3,568</h5>
											<span class="text-muted font-size-sm">Pending</span>
										</div>
									</div>

									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0">32,693</h5>
											<span class="text-muted font-size-sm">Remaining</span>
										</div>
									</div>
									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0">32,693</h5>
											<span class="text-muted font-size-sm">Completed PTS</span>
										</div>
									</div>

									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0">32,693</h5>
											<span class="text-muted font-size-sm">Pending PTS</span>
										</div>
									</div>
								</div>
							</div>
							<!-- /numbers -->

							<!-- Tabs content -->

						</div>
						<!-- /tabs content -->

					</div>
				</div>
				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header bg-white header-elements-inline">
								<h6 class="card-title">YOUR TASK LIST</h6>
								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="collapse"></a>
									</div>
								</div>
							</div>

							<div class="table-responsive">
								<table class="table tasks-list table-lg" id="pendingTaskTable">
									<thead>
										<tr>
											<th>#</th>
											<th class="text-center">Due</th>
											<th class="text-center">Task Description</th>
											<th class="text-center">Schedule Date Time</th>
											<th class="text-center">Priority</th>
											<th class="text-center">Assigned users</th>

										</tr>
									</thead>
									<tbody>


										<tr>
											<td class="text-center"><a href="#" data-toggle="modal"
												data-target="#customerProfile"><i
													class="icon-users2 icon-2x d-inline-block text-info"
													title="Customer Profile"></i></a>
												<div class="font-size-sm text-muted line-height-1">Office
													task</div></td>
											<td class="text-center">
												<h6 class="mb-0">12</h6>
												<div class="font-size-sm text-muted line-height-1">hours</div>
											</td>
											<td>
												<div class="font-weight-semibold">
													LEAD - Previous Task <span
														class="badge badge-primary badge-pill">10 PTS</span>
												</div>
												<div class="text-muted">Call to customer</div> <a href="#"
												data-toggle="modal" data-target="#task_log"><span
													class="badge badge-success badge-pill">65 Completed</span></a>
											</td>

											<td class="text-center">20-10-2020 12:00 AM</td>
											<td class="text-center"><span class="badge badge-danger">High</span></td>
											<td>Akshay,Sachin</td>

										</tr>
										<tr>
											<td><a href="#" data-toggle="modal"
												data-target="#customerProfile"><i
													class="icon-users2 icon-2x d-inline-block text-info"
													title="Customer Profile"></i></a></td>
											<td class="text-center">
												<h6 class="mb-0">12</h6>
												<div class="font-size-sm text-muted line-height-1">hours</div>
											</td>
											<td>
												<div class="font-weight-semibold">
													<a href="#" data-toggle="modal"
														data-target="#modal_form_vertical">Office task - Call
														to customer</a>
												</div>
												<div class="text-muted">Call to customer</div> <a href="#"
												data-toggle="modal" data-target="#task_log"><span
													class="badge badge-success badge-pill">65 Completed</span></a>

											</td>

											<td class="text-center">20-10-2020 12:00 AM</td>
											<td class="text-center"><span class="badge badge-danger">High</span></td>
											<td>Akshay,Sachin</td>

										</tr>

										<tr>
											<td><a href="#" data-toggle="modal"
												data-target="#customerProfile"><i
													class="icon-users2 icon-2x d-inline-block text-info"
													title="Customer Profile"></i></a></td>
											<td class="text-center">
												<h6 class="mb-0">12</h6>
												<div class="font-size-sm text-muted line-height-1">hours</div>
											</td>
											<td>
												<div class="font-weight-semibold">Enquiry - Demo For
													Client</div>
												<div class="text-muted">Demo For Client</div> <a href="#"
												data-toggle="modal" data-target="#task_log"><span
													class="badge badge-success badge-pill">65 Completed</span></a>
											</td>

											<td class="text-center">20-10-2020 12:00 AM</td>
											<td class="text-center"><span
												class="badge badge-warning">Normal</span></td>
											<td>Akshay,Sachin</td>

										</tr>

										<tr>
											<td><a href="#" data-toggle="modal"
												data-target="#customerProfile"><i
													class="icon-users2 icon-2x d-inline-block text-info"
													title="Customer Profile"></i></a></td>
											<td class="text-center">
												<h6 class="mb-0">12</h6>
												<div class="font-size-sm text-muted line-height-1">hours</div>
											</td>
											<td>
												<div class="font-weight-semibold">
													<a href="${pageContext.request.contextPath}/tagList">Developing</a>
												</div>
												<div class="text-muted">Developing</div> <a href="#"
												data-toggle="modal" data-target="#task_log"><span
													class="badge badge-success badge-pill">65 Completed</span></a>
											</td>

											<td class="text-center">20-10-2020 12:00 AM</td>
											<td class="text-center"><span
												class="badge badge-success">Low</span></td>
											<td>Akshay,Sachin</td>

										</tr>

										<tr>
											<td><a href="#" data-toggle="modal"
												data-target="#customerProfile"><i
													class="icon-users2 icon-2x d-inline-block text-info"
													title="Customer Profile"></i></a></td>
											<td class="text-center">
												<h6 class="mb-0">12</h6>
												<div class="font-size-sm text-muted line-height-1">hours</div>
											</td>
											<td>
												<div class="font-weight-semibold">
													<a href="${pageContext.request.contextPath}/addEnquiry">Create
														ad campaign banners set</a>
												</div>
												<div class="text-muted">That he had recently ...</div> <a
												href="#" data-toggle="modal" data-target="#task_log"><span
													class="badge badge-success badge-pill">65 Completed</span></a>
											</td>

											<td class="text-center">20-10-2020 12:00 AM</td>
											<td class="text-center"><span class="badge badge-danger">High</span></td>
											<td>Akshay,Sachin</td>


										</tr>

										<tr>
											<td><a href="#" data-toggle="modal"
												data-target="#customerProfile"><i
													class="icon-users2 icon-2x d-inline-block text-info"
													title="Customer Profile"></i></a></td>
											<td class="text-center">
												<h6 class="mb-0">12</h6>
												<div class="font-size-sm text-muted line-height-1">hours</div>
											</td>
											<td>
												<div class="font-weight-semibold">
													<a href="${pageContext.request.contextPath}/addLead">Edit
														the draft for the icons</a>
												</div>
												<div class="text-muted">You've got to get enough
													sleep..</div> <a href="#" data-toggle="modal"
												data-target="#task_log"><span
													class="badge badge-success badge-pill">65 Completed</span></a>
											</td>

											<td class="text-center">20-10-2020 12:00 AM</td>
											<td class="text-center"><span class="badge badge-danger">High</span></td>
											<td>Akshay,Sachin</td>

											<!-- <td class="text-center">
										<div class="list-icons">
											<div class="dropdown">
												<a href="#" class="list-icons-item dropdown-toggle caret-0"
													data-toggle="dropdown"><i class="icon-menu9"></i></a>
												<div class="dropdown-menu dropdown-menu-right">
													<a href="#" class="dropdown-item"><i
														class="icon-alarm-add"></i> Check in</a> <a href="#"
														class="dropdown-item"><i class="icon-attachment"></i>
														Attach screenshot</a> <a href="#" class="dropdown-item"><i
														class="icon-rotate-ccw2"></i> Reassign</a>
													<div class="dropdown-divider"></div>
													<a href="#" class="dropdown-item"><i
														class="icon-pencil7"></i> Edit task</a> <a href="#"
														class="dropdown-item"><i class="icon-cross2"></i>
														Remove</a>
												</div>
												</li>
											</div>
									</td> -->
										</tr>


									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div>



				<!-- <div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header bg-white header-elements-inline">
								<h6 class="card-title">ASSIGN TASK PENDING LIST</h6>
								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="collapse"></a>
									</div>
								</div>
							</div>

							<div class="table-responsive">
								<table class="table tasks-list table-lg">
									<thead>
										<tr>
											<th>#</th>
											<th class="text-center">Due</th>
											<th class="text-center">Task Description</th>
											<th class="text-center">Schedule Date Time</th>
											<th class="text-center">Priority</th>


										</tr>
									</thead>
									<tbody>



										<tr>
											<td><a href="#" data-toggle="modal"
												data-target="#customerProfile"><i
													class="icon-users2 icon-2x d-inline-block text-info"
													title="Customer Profile"></i></a></td>
											<td class="text-center">
												<h6 class="mb-0">12</h6>
												<div class="font-size-sm text-muted line-height-1">hours</div>

											</td>
											<td>
												<div class="font-weight-semibold">
													<a href="#" data-toggle="modal" data-target="#allocate_to">Enquiry
														- Call to customer</a>
												</div>
												<div class="text-muted">Call to customer</div> <a href="#"
												data-toggle="modal" data-target="#task_log"><span
													class="badge badge-success badge-pill">65 Completed</span></a>
											</td>

											<td class="text-center">20-10-2020 12:00 AM</td>
											<td class="text-center"><span class="badge badge-danger">High</span></td>

										</tr>


									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div> -->

			</div>
			<!-- /content area -->


			<!-- Footer -->
			<jsp:include page="/WEB-INF/views/include/footer.jsp"></jsp:include>
			<!-- /footer -->

		</div>
		<!-- /main content -->

	</div>
	<!-- /page content -->


	<!-- Modal -->
	<div id="taskDetailModel" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<!-- <div class="modal-dialog"> -->
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">
						Task Description - <span id="taskhead">Call Customer</span>
					</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" id="modalbody"></div>


			</div>
		</div>
	</div>

	<div id="allocate_to" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Task Description</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<h4 class="font-weight-semibold">Call Customer</h4>
					<p>Duis mollis, est non commodo luctus, nisi erat porttitor
						ligula, eget lacinia odio sem. Praesent commodo cursus magna, vel
						scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue
						laoreet rutrum faucibus dolor auctor.</p>
					<ul>
						<li><div class="row">
								<div class="col-sm-4">
									<strong>Schedule Date Time</strong>
								</div>
								: 20-10-2020 12:00 AM
							</div></li>
						<li><div class="row">
								<div class="col-sm-4">
									<strong>Generated By</strong>
								</div>
								: Swapnil Mashalkar, 20-10-2020 12:00 AM
							</div></li>
					</ul>

					<form class="form-validate-jquery" action="#"
						novalidate="novalidate" id="a">

						<div class="form-group row">
							<label class="col-form-label col-lg-3" for="taskDescription">Task
								Instruction<span class="text-danger">*</span>
							</label>
							<div class="col-lg-9">
								<textarea rows="3" cols="5" name="textarea" class="form-control"
									required placeholder="Task Instruction" id="taskInstruction"
									name="taskInstruction"></textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-form-label col-lg-3" for="status">Allocate
								To<span class="text-danger">*</span>
							</label>
							<div class="col-lg-9">
								<select name="status" class="form-control form-control-select2"
									data-placeholder="Select status" data-fouc required="required"
									multiple="multiple">
									<option value="">select</option>
									<option value="open">Sachin</option>
									<option value="hold">Akshay</option>
									<option value="resolved">Anmol</option>

								</select>
							</div>
						</div>

						<div class="form-group row">
							<label class="col-form-label col-lg-3" for="Priority">Set
								Priority<span class="text-danger">*</span>
							</label>
							<div class="col-lg-9">
								<select name="Priority"
									class="form-control form-control-select2"
									data-placeholder="Select status" data-fouc required="required">
									<option value="">select</option>
									<option value="Low">Low</option>
									<option value="Normal">Normal</option>
									<option value="High">High</option>

								</select>
							</div>
						</div>

						<div class="modal-footer">

							<button type="submit" class="btn bg-primary">Submit</button>
						</div>
					</form>


				</div>


			</div>
		</div>
	</div>

	<div id="task_log" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Previous Task</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" id="taskLogData"></div>


			</div>
		</div>
	</div>
	<!-- /info modal -->

	<div id="customerProfileModel" class="modal fade" tabindex="-1">

		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header pb-3">
					<h5 class="modal-title">Customer Profile</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body py-0" id="custProfile"></div>

				<!-- <div class="modal-footer pt-3">
					<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
					<button type="button" class="btn bg-primary">Save changes</button>
				</div> -->
			</div>
		</div>
	</div>

	<!-- Info modal -->
	<div id="modal_step1" class="modal fade " data-backdrop="false"
		tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header bg-info">
					<h6 class="modal-title">Please wait.....</h6>
					<!-- <button type="button" class="close" data-dismiss="modal">&times;</button> -->
				</div>

				<div class="modal-body">
					<!-- <h6 class="font-weight-semibold text-center">Please wait.....
					</h6>

					<hr> -->
					<p class="text-center text-info">If it is taking time please
						reload the page</p>
				</div>

				<div class="modal-footer">
					<!--   <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button> -->

				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		// Single picker
		$('.datepickerclass').daterangepicker({
			singleDatePicker : true,
			selectMonths : true,
			selectYears : true,
			locale : {
				format : 'DD-MM-YYYY'
			}
		});

		//daterange-basic_new
		// Basic initialization
		$('.daterange-basic_new').daterangepicker({
			applyClass : 'bg-slate-600',

			cancelClass : 'btn-light',
			locale : {
				format : 'DD-MM-YYYY',
				separator : ' to '
			}
		});
	</script>
	<!-- <script type="text/javascript">
		$(window).on('load', function() {
			$('#myModal_checklist').modal('show');
		});
	</script> -->


	<script type="text/javascript">
		$(document).ready(function() {
			getTaskPendingList();
		})

		function getTaskPendingList() {

			var fd = new FormData();

			//$('#modal_step1').modal('show');

			$
					.ajax({
						url : '${pageContext.request.contextPath}/getPendingTaskList',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							//$('#modal_step1').modal('hide');
							//alert(JSON.stringify(response))
							var table = $('#pendingTaskTable').DataTable();
							var rows = table.rows().remove().draw();

							for (var i = 0; i < response.length; i++) {

								var profile = '<div class="text-center"> <a href="#"  onclick="getCustProfile('
										+ response[i].mdAccTypeId
										+ ','
										+ response[i].priKey
										+ ')">'
										+ '<i class="icon-users2 icon-2x d-inline-block text-info" title="Customer Profile"></i></a>'
										+ '<div class="font-size-sm text-muted line-height-1">Office task</div></div>'
								var remainingTime = '<div class="text-center" style="color: red;">Overdue</div>';
								if (response[i].sts == 1) {
									remainingTime = '<div class="text-center" > <h6 class="mb-0">'
											+ response[i].day
											+ ' - '
											+ response[i].hour
											+ ':'
											+ response[i].minutes
											+ '</h6> <div class="font-size-sm text-muted line-height-1">Day - HH:MM</div></div>';
								}
								var taskDescription = '<div class="font-weight-semibold"><a href="#"    onclick="taskDetail('
										+ response[i].taskId
										+ ',\''
										+ response[i].taskTittle
										+ '\')">'
										+ response[i].mdAccTypeText
										+ '- '
										+ response[i].taskTittle
										+ '</a>&nbsp;'
										+ '<span class="badge badge-primary badge-pill">'
										+ response[i].taskPts
										+ ' PTS</span></div> <div class="text-muted">'
										+ response[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#"  onclick="getTaskLog('
										+ response[i].mdAccTypeId
										+ ','
										+ response[i].priKey
										+ ')"><span class="badge badge-success badge-pill">'
										+ response[i].completed
										+ ' Completed</span></a>';
								var schdatetime = '<div class="text-center">'
										+ response[i].taskScheTime + '</div>';
								var priority = '<div class="text-center"><span class="badge badge-success">Low</span></div>';

								if (response[i].taskPriority == 2) {
									priority = '<div class="text-center"><span class="badge badge-warning">Normal</span></div>'
								} else if (response[i].taskPriority == 3) {
									priority = '<div class="text-center"><span class="badge badge-danger">High</span></div>'
								}

								$('#pendingTaskTable td').css('white-space',
										'initial');
								$('#pendingTaskTable').DataTable().row.add(
										[ profile, remainingTime,
												taskDescription, schdatetime,
												priority,
												response[i].employeeName ])
										.draw();
							}

						},
					});

		}
		$('.datepickerclass').daterangepicker({
			singleDatePicker : true,
			selectMonths : true,
			selectYears : true,
			locale : {
				format : 'DD-MM-YYYY'
			}
		});
		function taskDetail(taskId, taskTittle) {
			//alert(empId)

			//alert(var1+':'+var2);
			$("#taskhead").html(taskTittle);
			var strhref = "${pageContext.request.contextPath}/compaletTask?taskId="
					+ taskId;
			$("#modalbody").load(strhref);
			$("#taskDetailModel").modal("show");
			$('#taskDetailModel').on('hidden.bs.modal', function() {
				$("#modalbody").html("");
				getTaskPendingList();
			});

		}

		function getTaskLog(typeId, primaryKey) {
			//alert(typeId)

			//alert(var1+':'+var2);
			//$("#taskhead").html(taskTittle);
			var strhref = "${pageContext.request.contextPath}/taskLog?typeId="
					+ typeId + "&primaryKey=" + primaryKey;
			$("#taskLogData").load(strhref);
			$("#task_log").modal("show");
			$('#task_log').on('hidden.bs.modal', function() {
				$("#taskLogData").html("");
				//getTaskPendingList();
			});

		}

		function getCustProfile(typeId, primaryKey) {
			//alert(typeId)

			//alert(var1+':'+var2);
			//$("#taskhead").html(taskTittle);
			var strhref = "${pageContext.request.contextPath}/customerProfile?typeId="
					+ typeId + "&primaryKey=" + primaryKey;
			$("#custProfile").load(strhref);
			$("#customerProfileModel").modal("show");
			$('#customerProfileModel').on('hidden.bs.modal', function() {
				$("#custProfile").html("");
				//getTaskPendingList();
			});

		}
	</script>
</body>
</html>