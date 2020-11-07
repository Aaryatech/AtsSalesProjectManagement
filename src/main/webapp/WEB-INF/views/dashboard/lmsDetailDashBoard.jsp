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
								<h6 class="card-title">LMS Task Detail</h6>
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
											<h5 class="font-weight-semibold mb-0">2,345</h5>
											<span class="text-muted font-size-sm">Introduction
												Mail Pending</span>
										</div>
									</div>
									<div class="col-2">
										<div class="mb-3 ">
											<h5 class="font-weight-semibold mb-0">32,693</h5>
											<span class="text-muted font-size-sm">Demo Meeting
												Pending</span>
										</div>
									</div>
									<div class="col-2">
										<div class="mb-3">
											<h5 class="font-weight-semibold mb-0">2,345</h5>
											<span class="text-muted font-size-sm">Demo Scheduled</span>
										</div>
									</div>

								</div>
							</div>
							<div class="card-body">
								<ul class="nav nav-tabs nav-tabs-highlight">

									<li class="nav-item"><a href="#highlighted-tab1"
										class="nav-link active" data-toggle="tab">Introduction
											Mail Pending </a></li>
									<li class="nav-item"><a href="#highlighted-tab2"
										class="nav-link" data-toggle="tab">Demo Meeting Pending </a></li>
									<li class="nav-item"><a href="#highlighted-tab3"
										class="nav-link" data-toggle="tab">Demo Scheduled</a></li>


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
												id="pendingTaskTable">
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
														<td class="text-center"><a href="#"
															data-toggle="modal" data-target="#customerProfile"><i
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
															<div class="text-muted">Call to customer</div> <a
															href="#" data-toggle="modal" data-target="#task_log"><span
																class="badge badge-success badge-pill">65
																	Completed</span></a>
														</td>

														<td class="text-center">20-10-2020 12:00 AM</td>
														<td class="text-center"><span
															class="badge badge-danger">High</span></td>
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
																	data-target="#modal_form_vertical">Office task -
																	Call to customer</a>
															</div>
															<div class="text-muted">Call to customer</div> <a
															href="#" data-toggle="modal" data-target="#task_log"><span
																class="badge badge-success badge-pill">65
																	Completed</span></a>

														</td>

														<td class="text-center">20-10-2020 12:00 AM</td>
														<td class="text-center"><span
															class="badge badge-danger">High</span></td>
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
															<div class="font-weight-semibold">Enquiry - Demo
																For Client</div>
															<div class="text-muted">Demo For Client</div> <a href="#"
															data-toggle="modal" data-target="#task_log"><span
																class="badge badge-success badge-pill">65
																	Completed</span></a>
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
																class="badge badge-success badge-pill">65
																	Completed</span></a>
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
																class="badge badge-success badge-pill">65
																	Completed</span></a>
														</td>

														<td class="text-center">20-10-2020 12:00 AM</td>
														<td class="text-center"><span
															class="badge badge-danger">High</span></td>
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
																class="badge badge-success badge-pill">65
																	Completed</span></a>
														</td>

														<td class="text-center">20-10-2020 12:00 AM</td>
														<td class="text-center"><span
															class="badge badge-danger">High</span></td>
														<td>Akshay,Sachin</td>

													</tr>


												</tbody>
											</table>
										</div>
									</div>
									<div class="tab-pane fade" id="highlighted-tab2">
										<div class="table-responsive">
											<table class="table tasks-list table-lg"
												id="assignPendingTaskTable">
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

													</tr>

												</tbody>
											</table>
										</div>
									</div>

									<div class="tab-pane fade" id="highlighted-tab3">DIY
										synth PBR banksy irony. Leggings gentrify squid 8-bit cred
										pitchfork. Williamsburg whatever.</div>

									<div class="tab-pane fade" id="highlighted-tab4">DIY
										synth PBR banksy irony. Leggings gentrify squid 8-bit cred
										pitchfork. Williamsburg whatever.</div>

									<div class="tab-pane fade" id="highlighted-tab5">DIY
										synth PBR banksy irony. Leggings gentrify squid 8-bit cred
										pitchfork. Williamsburg whatever.</div>

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
							<label class="col-form-label col-lg-3" for="schdldt">Schedule
								Date <span class="text-danger">*</span>
							</label>
							<div class="col-lg-9">
								<input type="text" class="form-control" required
									placeholder="Schedule Schedule" id="schdldt" name="schdldt">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-form-label col-lg-3" for="schdltm">Schedule
								Time <span class="text-danger">*</span>
							</label>
							<div class="col-lg-9">
								<input type="text" name="textarea" class="form-control" required
									placeholder="Schedule Time" id="schdltm" name="schdltm">
							</div>
						</div>
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
	</script>
</body>
</html>