<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><%@ page
	import="java.util.Date"%><%@ page import="java.text.SimpleDateFormat"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>

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
								<h6 class="card-title">
									<c:choose>
										<c:when test="${moduleId==1}">LMS Task Detail</c:when>
										<c:when test="${moduleId==2}">IMS Task Detail</c:when>
										<c:when test="${moduleId==3}">Office Task Detail</c:when>
									</c:choose>

								</h6>
								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="collapse"></a>
									</div>
								</div>
							</div>
							<div class="card-body py-0">
								<div class="row text-center">

									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0" id="unallocated">0</h5>
											<span class="text-muted font-size-sm">Unallocated</span>
										</div>
									</div>
									<div class="col-2">
										<div class="mb-3 ">
											<h5 class="font-weight-semibold mb-0" id="allocated">0</h5>
											<span class="text-muted font-size-sm">Allocated</span>
										</div>
									</div>


									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0" id="penidng">0</h5>
											<span class="text-muted font-size-sm">Pending</span>
										</div>
									</div>

									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0" id="remaining">0</h5>
											<span class="text-muted font-size-sm">Remaining</span>
										</div>
									</div>
									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0" id="completed">0</h5>
											<span class="text-muted font-size-sm">Completed</span>
										</div>
									</div>
								</div>
							</div>
							<div class="card-body">
								<ul class="nav nav-tabs nav-tabs-highlight">
									<li class="nav-item"><a href="#highlighted-tab1"
										class="nav-link active" data-toggle="tab">Unallocated </a></li>
									<li class="nav-item"><a href="#highlighted-tab2"
										class="nav-link" data-toggle="tab">Allocated </a></li>
									<li class="nav-item"><a href="#highlighted-tab3"
										class="nav-link" data-toggle="tab">Pending</a></li>
									<li class="nav-item"><a href="#highlighted-tab4"
										class="nav-link" data-toggle="tab">Remaining</a></li>
									<li class="nav-item"><a href="#highlighted-tab5"
										class="nav-link" data-toggle="tab">Completed</a></li>

								</ul>

								<div class="tab-content">
									<div class="tab-pane fade show active" id="highlighted-tab1">
										<div
											class="navbar navbar-expand-lg navbar-light navbar-component rounded">
											<div class="navbar-collapse " id="navbar-filter">
												<span class="navbar-text font-weight-semibold mr-3">
													Filter: </span>

												<ul class="navbar-nav flex-wrap">
													<li class="nav-item dropdown"><a href="#"
														class="navbar-nav-link dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false"> <i
															class="icon-sort-time-asc mr-2"></i> By date
													</a>

														<div class="dropdown-menu">
															<a href="#" class="dropdown-item">Show all</a>
															<div class="dropdown-divider"></div>
															<a href="#" class="dropdown-item">Today</a> <a href="#"
																class="dropdown-item">Yesterday</a> <a href="#"
																class="dropdown-item">This week</a> <a href="#"
																class="dropdown-item">This month</a> <a href="#"
																class="dropdown-item">This year</a>
														</div></li>

													<li class="nav-item dropdown"><a href="#"
														class="navbar-nav-link dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false"> <i
															class="icon-sort-amount-desc mr-2"></i> By status
													</a>

														<div class="dropdown-menu">
															<a href="#" class="dropdown-item">Show all</a>
															<div class="dropdown-divider"></div>
															<a href="#" class="dropdown-item">Open</a> <a href="#"
																class="dropdown-item">On hold</a> <a href="#"
																class="dropdown-item">Resolved</a> <a href="#"
																class="dropdown-item">Closed</a> <a href="#"
																class="dropdown-item">Duplicate</a> <a href="#"
																class="dropdown-item">Invalid</a> <a href="#"
																class="dropdown-item">Wontfix</a>
														</div></li>

													<li class="nav-item dropdown"><a href="#"
														class="navbar-nav-link dropdown-toggle"
														data-toggle="dropdown" aria-expanded="false"> <i
															class="icon-sort-numeric-asc mr-2"></i> By priority
													</a>

														<div class="dropdown-menu">
															<a href="#" class="dropdown-item">Show all</a>
															<div class="dropdown-divider"></div>
															<a href="#" class="dropdown-item">Highest</a> <a href="#"
																class="dropdown-item">High</a> <a href="#"
																class="dropdown-item">Normal</a> <a href="#"
																class="dropdown-item">Low</a>
														</div></li>
												</ul>

											</div>
										</div>
										<div class="table-responsive">
											<table class="table tasks-list table-lg"
												id="unallocatedTable">
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

												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="highlighted-tab2">
										<div class="table-responsive">
											<table class="table tasks-list table-lg" id="allocatedTable">
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



													<!-- <tr>
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
																	data-target="#allocate_to">Enquiry - Call to
																	customer</a>
															</div>
															<div class="text-muted">Call to customer</div> <a
															href="#" data-toggle="modal" data-target="#task_log"><span
																class="badge badge-success badge-pill">65
																	Completed</span></a>
														</td>

														<td class="text-center">20-10-2020 12:00 AM</td>
														<td class="text-center"><span
															class="badge badge-danger">High</span></td>

													</tr> -->

												</tbody>
											</table>
										</div>
									</div>

									<div class="tab-pane fade" id="highlighted-tab3">
										<div class="table-responsive">
											<table class="table tasks-list table-lg" id="pendingTable">
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



													<!-- <tr>
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
																	data-target="#allocate_to">Enquiry - Call to
																	customer</a>
															</div>
															<div class="text-muted">Call to customer</div> <a
															href="#" data-toggle="modal" data-target="#task_log"><span
																class="badge badge-success badge-pill">65
																	Completed</span></a>
														</td>

														<td class="text-center">20-10-2020 12:00 AM</td>
														<td class="text-center"><span
															class="badge badge-danger">High</span></td>

													</tr> -->

												</tbody>
											</table>
										</div>
									</div>

									<div class="tab-pane fade" id="highlighted-tab4">
										<div class="table-responsive">
											<table class="table tasks-list table-lg" id="remainingTable">
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



													<!-- <tr>
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
																	data-target="#allocate_to">Enquiry - Call to
																	customer</a>
															</div>
															<div class="text-muted">Call to customer</div> <a
															href="#" data-toggle="modal" data-target="#task_log"><span
																class="badge badge-success badge-pill">65
																	Completed</span></a>
														</td>

														<td class="text-center">20-10-2020 12:00 AM</td>
														<td class="text-center"><span
															class="badge badge-danger">High</span></td>

													</tr> -->

												</tbody>
											</table>
										</div>
									</div>

									<div class="tab-pane fade" id="highlighted-tab5">
										<div class="table-responsive">
											<table class="table tasks-list table-lg" id="completedTable">
												<thead>
													<tr>
														<th>#</th>
														<th class="text-center">Completed Date</th>
														<th class="text-center">Task Description</th>
														<th class="text-center">Schedule Date Time</th>
														<th class="text-center">Priority</th>
														<th class="text-center">Completed By</th>
													</tr>
												</thead>
												<tbody>



													<!-- <tr>
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
																	data-target="#allocate_to">Enquiry - Call to
																	customer</a>
															</div>
															<div class="text-muted">Call to customer</div> <a
															href="#" data-toggle="modal" data-target="#task_log"><span
																class="badge badge-success badge-pill">65
																	Completed</span></a>
														</td>

														<td class="text-center">20-10-2020 12:00 AM</td>
														<td class="text-center"><span
															class="badge badge-danger">High</span></td>

													</tr> -->

												</tbody>
											</table>
										</div>
									</div>

								</div>
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

	<div id="taskDetailModel" class="modal fade" tabindex="-1">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Task Description</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body" id="modalbody"></div>


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
	<script type="text/javascript">
		$(document)
				.ready(
						function() {
							$('a[data-toggle="tab"]')
									.on(
											'shown.bs.tab',
											function(e) {
												$($.fn.dataTable.tables(true))
														.DataTable().columns
														.adjust().responsive
														.recalc();
											});
						});

		$('.datepickerclass').daterangepicker({
			singleDatePicker : true,
			selectMonths : true,
			selectYears : true,
			locale : {
				format : 'DD-MM-YYYY'
			}
		});

		$(document).ready(function() {
			getDataList();
		})

		function getDataList() {

			var moduleId = '${moduleId}';
			var fd = new FormData();
			fd.append("moduleId", moduleId);

			//$('#modal_step1').modal('show');

			$
					.ajax({
						url : '${pageContext.request.contextPath}/getTaskByModuleWiseList',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							//$('#modal_step1').modal('hide');
							//alert(JSON.stringify(response))
							var table = $('#unallocatedTable').DataTable();
							var rows = table.rows().remove().draw();

							var unallocated = response.unallocatedList;

							for (var i = 0; i < unallocated.length; i++) {

								var profile = '<div class="text-center"> <a href="#"  onclick="getCustProfile('
										+ unallocated[i].mdAccTypeId
										+ ','
										+ unallocated[i].priKey
										+ ')">'
										+ '<i class="icon-users2 icon-2x d-inline-block text-info" title="Customer Profile"></i></a>'
										+ '<div class="font-size-sm text-muted line-height-1">Office task</div></div>'
								var remainingTime = '<div class="text-center" style="color: red;">Overdue</div>';
								if (unallocated[i].sts == 1) {
									remainingTime = '<div class="text-center" > <h6 class="mb-0">'
											+ unallocated[i].day
											+ ' - '
											+ unallocated[i].hour
											+ ':'
											+ unallocated[i].minutes
											+ '</h6> <div class="font-size-sm text-muted line-height-1">Day - HH:MM</div></div>';
								}
								var taskDescription = '<div class="font-weight-semibold"><a href="#"    onclick="taskDetail('
										+ unallocated[i].taskId
										+ ',\''
										+ unallocated[i].taskTittle
										+ '\')">'
										+ unallocated[i].mdAccTypeText
										+ '- '
										+ unallocated[i].taskTittle
										+ '</a>&nbsp;'
										+ '<span class="badge badge-primary badge-pill">'
										+ unallocated[i].taskPts
										+ ' PTS</span></div> <div class="text-muted">'
										+ unallocated[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#"  onclick="getTaskLog('
										+ unallocated[i].mdAccTypeId
										+ ','
										+ unallocated[i].priKey
										+ ')"><span class="badge badge-success badge-pill">'
										+ unallocated[i].completed
										+ ' Completed</span></a>';
								var schdatetime = '<div class="text-center">'
										+ unallocated[i].taskScheTime
										+ '</div>';
								var priority = '<div class="text-center"><span class="badge badge-success">Low</span></div>';

								if (unallocated[i].taskPriority == 2) {
									priority = '<div class="text-center"><span class="badge badge-warning">Normal</span></div>'
								} else if (unallocated[i].taskPriority == 3) {
									priority = '<div class="text-center"><span class="badge badge-danger">High</span></div>'
								}

								$('#unallocatedTable td').css('white-space',
										'initial');
								$('#unallocatedTable').DataTable().row.add(
										[ profile, remainingTime,
												taskDescription, schdatetime,
												priority ]).draw();
							}

							var table = $('#allocatedTable').DataTable();
							var rows = table.rows().remove().draw();

							var allocatedList = response.allocatedList;

							for (var i = 0; i < allocatedList.length; i++) {

								var profile = '<div class="text-center"> <a href="#"  onclick="getCustProfile('
										+ allocatedList[i].mdAccTypeId
										+ ','
										+ allocatedList[i].priKey
										+ ')">'
										+ '<i class="icon-users2 icon-2x d-inline-block text-info" title="Customer Profile"></i></a>'
										+ '<div class="font-size-sm text-muted line-height-1">Office task</div></div>'
								var remainingTime = '<div class="text-center" style="color: red;">Overdue</div>';
								if (allocatedList[i].sts == 1) {
									remainingTime = '<div class="text-center" > <h6 class="mb-0">'
											+ allocatedList[i].day
											+ ' - '
											+ allocatedList[i].hour
											+ ':'
											+ allocatedList[i].minutes
											+ '</h6> <div class="font-size-sm text-muted line-height-1">Day - HH:MM</div></div>';
								}
								var taskDescription = '<div class="font-weight-semibold"><a href="#"    onclick="taskDetail('
										+ allocatedList[i].taskId
										+ ',\''
										+ allocatedList[i].taskTittle
										+ '\')">'
										+ allocatedList[i].mdAccTypeText
										+ '- '
										+ allocatedList[i].taskTittle
										+ '</a>&nbsp;'
										+ '<span class="badge badge-primary badge-pill">'
										+ allocatedList[i].taskPts
										+ ' PTS</span></div> <div class="text-muted">'
										+ allocatedList[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#"  onclick="getTaskLog('
										+ allocatedList[i].mdAccTypeId
										+ ','
										+ allocatedList[i].priKey
										+ ')"><span class="badge badge-success badge-pill">'
										+ allocatedList[i].completed
										+ ' Completed</span></a>';
								var schdatetime = '<div class="text-center">'
										+ allocatedList[i].taskScheTime
										+ '</div>';
								var priority = '<div class="text-center"><span class="badge badge-success">Low</span></div>';

								if (allocatedList[i].taskPriority == 2) {
									priority = '<div class="text-center"><span class="badge badge-warning">Normal</span></div>'
								} else if (allocatedList[i].taskPriority == 3) {
									priority = '<div class="text-center"><span class="badge badge-danger">High</span></div>'
								}

								$('#allocatedTable td').css('white-space',
										'initial');
								$('#allocatedTable').DataTable().row
										.add(
												[
														profile,
														remainingTime,
														taskDescription,
														schdatetime,
														priority,
														allocatedList[i].employeeName ])
										.draw();
							}

							var table = $('#pendingTable').DataTable();
							var rows = table.rows().remove().draw();

							var pendingList = response.pendingList;

							for (var i = 0; i < pendingList.length; i++) {

								var profile = '<div class="text-center"> <a href="#"  onclick="getCustProfile('
										+ pendingList[i].mdAccTypeId
										+ ','
										+ pendingList[i].priKey
										+ ')">'
										+ '<i class="icon-users2 icon-2x d-inline-block text-info" title="Customer Profile"></i></a>'
										+ '<div class="font-size-sm text-muted line-height-1">Office task</div></div>'
								var remainingTime = '<div class="text-center" style="color: red;">Overdue</div>';
								if (pendingList[i].sts == 1) {
									remainingTime = '<div class="text-center" > <h6 class="mb-0">'
											+ pendingList[i].day
											+ ' - '
											+ pendingList[i].hour
											+ ':'
											+ pendingList[i].minutes
											+ '</h6> <div class="font-size-sm text-muted line-height-1">Day - HH:MM</div></div>';
								}
								var taskDescription = '<div class="font-weight-semibold"><a href="#"    onclick="taskDetail('
										+ pendingList[i].taskId
										+ ',\''
										+ pendingList[i].taskTittle
										+ '\')">'
										+ pendingList[i].mdAccTypeText
										+ '- '
										+ pendingList[i].taskTittle
										+ '</a>&nbsp;'
										+ '<span class="badge badge-primary badge-pill">'
										+ pendingList[i].taskPts
										+ ' PTS</span></div> <div class="text-muted">'
										+ pendingList[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#"  onclick="getTaskLog('
										+ pendingList[i].mdAccTypeId
										+ ','
										+ pendingList[i].priKey
										+ ')"><span class="badge badge-success badge-pill">'
										+ pendingList[i].completed
										+ ' Completed</span></a>';
								var schdatetime = '<div class="text-center">'
										+ pendingList[i].taskScheTime
										+ '</div>';
								var priority = '<div class="text-center"><span class="badge badge-success">Low</span></div>';

								if (pendingList[i].taskPriority == 2) {
									priority = '<div class="text-center"><span class="badge badge-warning">Normal</span></div>'
								} else if (pendingList[i].taskPriority == 3) {
									priority = '<div class="text-center"><span class="badge badge-danger">High</span></div>'
								}

								$('#pendingTable td').css('white-space',
										'initial');
								$('#pendingTable').DataTable().row.add(
										[ profile, remainingTime,
												taskDescription, schdatetime,
												priority,
												pendingList[i].employeeName ])
										.draw();
							}

							var table = $('#remainingTable').DataTable();
							var rows = table.rows().remove().draw();

							var remainingList = response.remainingList;

							for (var i = 0; i < remainingList.length; i++) {

								var profile = '<div class="text-center"> <a href="#"  onclick="getCustProfile('
										+ remainingList[i].mdAccTypeId
										+ ','
										+ remainingList[i].priKey
										+ ')">'
										+ '<i class="icon-users2 icon-2x d-inline-block text-info" title="Customer Profile"></i></a>'
										+ '<div class="font-size-sm text-muted line-height-1">Office task</div></div>'
								var remainingTime = '<div class="text-center" style="color: red;">Overdue</div>';
								if (remainingList[i].sts == 1) {
									remainingTime = '<div class="text-center" > <h6 class="mb-0">'
											+ remainingList[i].day
											+ ' - '
											+ remainingList[i].hour
											+ ':'
											+ remainingList[i].minutes
											+ '</h6> <div class="font-size-sm text-muted line-height-1">Day - HH:MM</div></div>';
								}
								var taskDescription = '<div class="font-weight-semibold"><a href="#"    onclick="taskDetail('
										+ remainingList[i].taskId
										+ ',\''
										+ remainingList[i].taskTittle
										+ '\')">'
										+ remainingList[i].mdAccTypeText
										+ '- '
										+ remainingList[i].taskTittle
										+ '</a>&nbsp;'
										+ '<span class="badge badge-primary badge-pill">'
										+ remainingList[i].taskPts
										+ ' PTS</span></div> <div class="text-muted">'
										+ remainingList[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#"  onclick="getTaskLog('
										+ remainingList[i].mdAccTypeId
										+ ','
										+ remainingList[i].priKey
										+ ')"><span class="badge badge-success badge-pill">'
										+ remainingList[i].completed
										+ ' Completed</span></a>';
								var schdatetime = '<div class="text-center">'
										+ remainingList[i].taskScheTime
										+ '</div>';
								var priority = '<div class="text-center"><span class="badge badge-success">Low</span></div>';

								if (remainingList[i].taskPriority == 2) {
									priority = '<div class="text-center"><span class="badge badge-warning">Normal</span></div>'
								} else if (remainingList[i].taskPriority == 3) {
									priority = '<div class="text-center"><span class="badge badge-danger">High</span></div>'
								}

								$('#remainingTable td').css('white-space',
										'initial');
								$('#remainingTable').DataTable().row
										.add(
												[
														profile,
														remainingTime,
														taskDescription,
														schdatetime,
														priority,
														remainingList[i].employeeName ])
										.draw();
							}

							var table = $('#pendingTable').DataTable();
							var rows = table.rows().remove().draw();

							var pendingList = response.pendingList;

							for (var i = 0; i < pendingList.length; i++) {

								var profile = '<div class="text-center"> <a href="#"  onclick="getCustProfile('
										+ pendingList[i].mdAccTypeId
										+ ','
										+ pendingList[i].priKey
										+ ')">'
										+ '<i class="icon-users2 icon-2x d-inline-block text-info" title="Customer Profile"></i></a>'
										+ '<div class="font-size-sm text-muted line-height-1">Office task</div></div>'
								var remainingTime = '<div class="text-center" style="color: red;">Overdue</div>';
								if (pendingList[i].sts == 1) {
									remainingTime = '<div class="text-center" > <h6 class="mb-0">'
											+ pendingList[i].day
											+ ' - '
											+ pendingList[i].hour
											+ ':'
											+ pendingList[i].minutes
											+ '</h6> <div class="font-size-sm text-muted line-height-1">Day - HH:MM</div></div>';
								}
								var taskDescription = '<div class="font-weight-semibold"><a href="#"    onclick="taskDetail('
										+ pendingList[i].taskId
										+ ',\''
										+ pendingList[i].taskTittle
										+ '\')">'
										+ pendingList[i].mdAccTypeText
										+ '- '
										+ pendingList[i].taskTittle
										+ '</a>&nbsp;'
										+ '<span class="badge badge-primary badge-pill">'
										+ pendingList[i].taskPts
										+ ' PTS</span></div> <div class="text-muted">'
										+ pendingList[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#"  onclick="getTaskLog('
										+ pendingList[i].mdAccTypeId
										+ ','
										+ pendingList[i].priKey
										+ ')"><span class="badge badge-success badge-pill">'
										+ pendingList[i].completed
										+ ' Completed</span></a>';
								var schdatetime = '<div class="text-center">'
										+ pendingList[i].taskScheTime
										+ '</div>';
								var priority = '<div class="text-center"><span class="badge badge-success">Low</span></div>';

								if (pendingList[i].taskPriority == 2) {
									priority = '<div class="text-center"><span class="badge badge-warning">Normal</span></div>'
								} else if (pendingList[i].taskPriority == 3) {
									priority = '<div class="text-center"><span class="badge badge-danger">High</span></div>'
								}

								$('#pendingTable td').css('white-space',
										'initial');
								$('#pendingTable').DataTable().row.add(
										[ profile, remainingTime,
												taskDescription, schdatetime,
												priority,
												pendingList[i].employeeName ])
										.draw();
							}

							var table = $('#completedTable').DataTable();
							var rows = table.rows().remove().draw();

							var completedList = response.completedList;

							for (var i = 0; i < completedList.length; i++) {

								var profile = '<div class="text-center"> <a href="#"  onclick="getCustProfile('
										+ completedList[i].mdAccTypeId
										+ ','
										+ completedList[i].priKey
										+ ')">'
										+ '<i class="icon-users2 icon-2x d-inline-block text-info" title="Customer Profile"></i></a>'
										+ '<div class="font-size-sm text-muted line-height-1">Office task</div></div>'
								var remainingTime = '<div class="text-center">'
										+ completedList[i].taskDoneDate
										+ '</div>';

								var taskDescription = '<div class="font-weight-semibold">'
										+ completedList[i].mdAccTypeText
										+ '- '
										+ completedList[i].taskTittle
										+ '&nbsp;'
										+ '<span class="badge badge-primary badge-pill">'
										+ completedList[i].taskPts
										+ ' PTS</span></div> <div class="text-muted">'
										+ completedList[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#"  onclick="getTaskLog('
										+ completedList[i].mdAccTypeId
										+ ','
										+ completedList[i].priKey
										+ ')"><span class="badge badge-success badge-pill">'
										+ completedList[i].completed
										+ ' Completed</span></a>';
								var schdatetime = '<div class="text-center">'
										+ completedList[i].taskScheTime
										+ '</div>';
								var priority = '<div class="text-center"><span class="badge badge-success">Low</span></div>';

								if (completedList[i].taskPriority == 2) {
									priority = '<div class="text-center"><span class="badge badge-warning">Normal</span></div>'
								} else if (completedList[i].taskPriority == 3) {
									priority = '<div class="text-center"><span class="badge badge-danger">High</span></div>'
								}

								$('#completedTable td').css('white-space',
										'initial');
								$('#completedTable').DataTable().row
										.add(
												[
														profile,
														remainingTime,
														taskDescription,
														schdatetime,
														priority,
														completedList[i].employeeName ])
										.draw();
							}

							if (moduleId == 1) {
								$("#unallocated")
										.html(
												response.modeludeWiseDashboard.lmsUnallocatedTask);
								$("#allocated")
										.html(
												response.modeludeWiseDashboard.lmsAllocatedTask);
								$("#completed")
										.html(
												response.modeludeWiseDashboard.lmsTodayCompleted);
								$("#penidng")
										.html(
												response.modeludeWiseDashboard.lmsPendingCount);
								$("#remaining")
										.html(
												response.modeludeWiseDashboard.lmsRemainingCount);
							} else if (moduleId == 2) {
								$("#unallocated")
										.html(
												response.modeludeWiseDashboard.inqUnallocatedTask);
								$("#allocated")
										.html(
												response.modeludeWiseDashboard.inqAllocatedTask);
								$("#completed")
										.html(
												response.modeludeWiseDashboard.inqTodayCompleted);
								$("#penidng")
										.html(
												response.modeludeWiseDashboard.inqPendingCount);
								$("#remaining")
										.html(
												response.modeludeWiseDashboard.inqRemainingCount);
							} else if (moduleId == 2) {
								$("#unallocated")
										.html(
												response.modeludeWiseDashboard.atsUnallocatedTask);
								$("#allocated")
										.html(
												response.modeludeWiseDashboard.atsAllocatedTask);
								$("#completed")
										.html(
												response.modeludeWiseDashboard.atsTodayCompleted);
								$("#penidng")
										.html(
												response.modeludeWiseDashboard.atsPendingCount);
								$("#remaining")
										.html(
												response.modeludeWiseDashboard.atsRemainingCount);
							}

						},
					});

		}

		function taskDetail(taskId, taskTittle) {
			//alert(taskId + " " + taskTittle)

			//alert(var1+':'+var2);
			//$("#taskhead").html(taskTittle);
			var strhref = "${pageContext.request.contextPath}/editTask?taskId="
					+ taskId;
			$("#modalbody").load(strhref);
			$("#taskDetailModel").modal("show");
			$('#taskDetailModel').on('hidden.bs.modal', function() {
				$("#modalbody").html("");
				getDataList();
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