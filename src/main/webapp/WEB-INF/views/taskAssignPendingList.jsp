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
							<div class="card-header bg-white header-elements-inline">
								<h6 class="card-title">ASSIGN TASK PENDING LIST</h6>
								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="collapse"></a>
									</div>
								</div>
							</div>

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


	<!-- Modal -->
	<div id="modal_form_vertical" class="modal fade" tabindex="-1">
		<div class="modal-dialog modal-lg">
			<!-- <div class="modal-dialog"> -->
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Task Description - Call Customer</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">

					<p>Duis mollis, est non commodo luctus, nisi erat porttitor
						ligula, eget lacinia odio sem. Praesent commodo cursus magna, vel
						scelerisque nisl consectetur et. Vivamus sagittis lacus vel augue
						laoreet rutrum faucibus dolor auctor.</p>


					<ul>
						<li><div class="row">
								<div class="col-sm-2">
									<strong>Schedule Date Time</strong>
								</div>
								: 20-10-2020 12:00 AM
							</div></li>
						<li><div class="row">
								<div class="col-sm-2">
									<strong>Generate By</strong>
								</div>
								: Swapnil Mashalkar, 20-10-2020 12:00 AM
							</div></li>
						<li><div class="row">
								<div class="col-sm-2">
									<strong>Alloted By</strong>
								</div>
								: Swapnil Mashalkar, 20-10-2020 12:00 AM
							</div></li>
					</ul>


					<form class="form-validate-jquery" action="#"
						novalidate="novalidate" id="a">
						<div class="form-group">
							<div class="row">
								<div class="col-sm-3">
									<label for="status">Change Status<span
										class="text-danger">*</span>
									</label> <select name="status"
										class="form-control form-control-select2"
										data-placeholder="Select status" data-fouc required="required">
										<option value="open">Open</option>
										<option value="hold">On hold</option>
										<option value="resolved">Resolved</option>
										<option value="dublicate">Dublicate</option>
										<option value="invalid" selected="selected">Invalid</option>
										<option value="wontfix">Wontfix</option>
										<option value="closed">Closed</option>
									</select>
								</div>
								<div class="col-sm-3">
									<label for="sdate">New Schedule Date<span
										class="text-danger">*</span>
									</label> <input type="text" placeholder="Schedule Date"
										class="form-control datepickerclass" required="required"
										id="sdate" name="sdate">
								</div>
								<div class="col-sm-3">
									<label for="stime">New Schedule Time<span
										class="text-danger">*</span>
									</label> <input type="text" placeholder="Schedule Time"
										class="form-control " required="required" id="stime"
										name="stime">
								</div>
								<div class="col-sm-3">
									<label for="taskDescription">New Task Instruction<span
										class="text-danger">*</span>
									</label> <input type="text" class="form-control" name="taskDescription"
										placeholder="Default textarea" id="taskDescription"
										name="taskDescription" required>
								</div>
							</div>
						</div>

						<div class="form-group">
							<div class="row">
								<div class="col-sm-3">
									<label for="clientDiscussion">Client Discussion<span
										class="text-danger">*</span>
									</label>
									<textarea rows="3" cols="5" name="textarea"
										class="form-control" placeholder="Default textarea"
										id="clientDiscussion" name="clientDiscussion" required></textarea>
								</div>
								<div class="col-sm-3">
									<label for="clientProfiling">Client Profiling<span
										class="text-danger">*</span>
									</label>
									<textarea rows="3" cols="5" class="form-control"
										placeholder="Client Profiling" id="clientProfiling"
										name="clientProfiling" required></textarea>
								</div>
								<div class="col-sm-3">
									<label for="que">Any Tough Question<span
										class="text-danger">*</span>
									</label>
									<textarea rows="3" cols="5" class="form-control"
										placeholder="Question" id="que" name="que" required></textarea>
								</div>
								<div class="col-sm-3">
									<label for="right">What went right<span
										class="text-danger">*</span>
									</label>
									<textarea rows="3" cols="5" class="form-control"
										placeholder="Question" id="right" name="right" required></textarea>
								</div>
							</div>
						</div>

						<div class="modal-footer">
							<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
							<button type="submit" class="btn bg-primary">Submit</button>
						</div>
					</form>
				</div>


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
				<div class="modal-body">
					<div class=" border-top-teal">
						<div class="list-feed">
							<div class="list-feed-item">
								<a href="#">David Linner</a> requested refund for a double bank
								card charge
								<div class="text-muted">Jan 12, 12:47</div>
							</div>

							<div class="list-feed-item">
								User <a href="#">Christopher Wallace</a> from Google is awaiting
								for staff reply
								<div class="text-muted">Jan 11, 10:25</div>
							</div>

							<div class="list-feed-item">
								Ticket <strong>#43683</strong> has been resolved by <a href="#">Victoria
									Wilson</a>
								<div class="text-muted">Jan 10, 09:37</div>
							</div>

							<div class="list-feed-item">
								<a href="#">Eugene Kopyov</a> merged <strong>Master</strong>, <strong>Demo</strong>
								and <strong>Dev</strong> branches
								<div class="text-muted">Jan 9, 08:28</div>
							</div>

							<div class="list-feed-item">
								All sellers have received payouts for December, 2016!
								<div class="text-muted">Jan 8, 07:58</div>
							</div>

							<div class="list-feed-item">
								<a href="#">Chris Arney</a> created a new ticket <strong>#43136</strong>
								and assigned to <a href="#">John Nod</a>
								<div class="text-muted">Jan 7, 06:32</div>
							</div>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<!-- /info modal -->

	<div id="customerProfile" class="modal fade" tabindex="-1">

		<div class="modal-dialog modal-lg modal-dialog-scrollable">
			<div class="modal-content">
				<div class="modal-header pb-3">
					<h5 class="modal-title">Customer Profile</h5>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>

				<div class="modal-body py-0">

					<div class="card-body bg-blue text-center card-img-top"
						style="background-image: url(${pageContext.request.contextPath}/resources/global_assets/images/backgrounds/panel_bg.png); background-size: contain;">
						<div class="card-img-actions d-inline-block mb-3">
							<%-- <img class="img-fluid rounded-circle"
								src="${pageContext.request.contextPath}/resources/global_assets/images/placeholders/placeholder.jpg"
								width="170" height="170" alt=""> --%>
							<!-- <div class="card-img-actions-overlay card-img rounded-circle">
								<a href="#"
									class="btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round legitRipple">
									<i class="icon-plus3"></i>
								</a> <a href="user_pages_profile.html"
									class="btn btn-outline bg-white text-white border-white border-2 btn-icon rounded-round ml-2 legitRipple">
									<i class="icon-link"></i>
								</a>
							</div> -->
						</div>

						<h3 class="font-weight-semibold mb-0">Victoria Davidson</h3>
						<span class="d-block opacity-75">Aaryate Solution / +3630
							8911837</span><span class="d-block opacity-75">corporate@domain.com
							/ www.ats.com</span>

					</div>
					<div class="form-group">
						<div class="row">
							<div class="col-sm-3">
								<div class="late_employee" id="weekly_off_emp_list" style="">
									<ul
										class="nav nav-tabs nav-tabs-solid nav-justified bg-indigo-400 border-x-0 border-bottom-0 border-top-indigo-300 mb-0">
										<li class="nav-item"><a
											class="nav-link font-size-sm text-uppercase  ">Client
												Profiling</a></li>

									</ul>
									<div class="late_one fix_scroll">

										<div class="datatable-scroll-wrap">

											<ul class="media-list">
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>

												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
											</ul>
										</div>

									</div>

								</div>
							</div>
							<div class="col-sm-3">
								<div class="late_employee" id="weekly_off_emp_list" style="">
									<ul
										class="nav nav-tabs nav-tabs-solid nav-justified bg-indigo-400 border-x-0 border-bottom-0 border-top-indigo-300 mb-0">
										<li class="nav-item"><a
											class="nav-link font-size-sm text-uppercase  ">Tough
												Questions</a></li>

									</ul>
									<div class="late_one fix_scroll">

										<div class="datatable-scroll-wrap">

											<ul class="media-list">
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>

												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
											</ul>
										</div>

									</div>

								</div>
							</div>
							<div class="col-sm-3">
								<div class="late_employee" id="weekly_off_emp_list" style="">
									<ul
										class="nav nav-tabs nav-tabs-solid nav-justified bg-indigo-400 border-x-0 border-bottom-0 border-top-indigo-300 mb-0">
										<li class="nav-item"><a
											class="nav-link font-size-sm text-uppercase  ">What's
												went right</a></li>

									</ul>
									<div class="late_one fix_scroll">

										<div class="datatable-scroll-wrap">

											<ul class="media-list">
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>

												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
												<li class="media">

													<div class="media-body">
														<div class="d-flex justify-content-between">
															<a href="#">The constitutionally inventoried
																precariously...</a> <span class="font-size-sm text-muted">20-10-2020</span>
														</div>

														-Akshay Kasar
													</div>
												</li>
											</ul>
										</div>

									</div>

								</div>
							</div>
							<div class="col-sm-3">
								<div class="late_employee" id="weekly_off_emp_list" style="">
									<ul
										class="nav nav-tabs nav-tabs-solid nav-justified bg-indigo-400 border-x-0 border-bottom-0 border-top-indigo-300 mb-0">
										<li class="nav-item"><a
											class="nav-link font-size-sm text-uppercase ">Previous
												Task</a></li>

									</ul>
									<div class="late_one fix_scroll">

										<div class="datatable-scroll-wrap">

											<div class=" border-top-teal">
												<div class="list-feed">
													<div class="list-feed-item">
														<a href="#">David Linner</a> requested refund for a double
														bank card charge
														<div class="text-muted">Jan 12, 12:47</div>
													</div>

													<div class="list-feed-item">
														User <a href="#">Christopher Wallace</a> from Google is
														awaiting for staff reply
														<div class="text-muted">Jan 11, 10:25</div>
													</div>

													<div class="list-feed-item">
														Ticket <strong>#43683</strong> has been resolved by <a
															href="#">Victoria Wilson</a>
														<div class="text-muted">Jan 10, 09:37</div>
													</div>

													<div class="list-feed-item">
														<a href="#">Eugene Kopyov</a> merged <strong>Master</strong>,
														<strong>Demo</strong> and <strong>Dev</strong> branches
														<div class="text-muted">Jan 9, 08:28</div>
													</div>

													<div class="list-feed-item">
														All sellers have received payouts for December, 2016!
														<div class="text-muted">Jan 8, 07:58</div>
													</div>

													<div class="list-feed-item">
														<a href="#">Chris Arney</a> created a new ticket <strong>#43136</strong>
														and assigned to <a href="#">John Nod</a>
														<div class="text-muted">Jan 7, 06:32</div>
													</div>
												</div>
											</div>
										</div>

									</div>

								</div>
							</div>
						</div>
					</div>


				</div>

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
						url : '${pageContext.request.contextPath}/getAssignPendingTaskList',
						type : 'post',
						dataType : 'json',
						data : fd,
						contentType : false,
						processData : false,
						success : function(response) {

							//$('#modal_step1').modal('hide');
							//alert(JSON.stringify(response))
							var table = $('#assignPendingTaskTable')
									.DataTable();
							var rows = table.rows().remove().draw();

							for (var i = 0; i < response.length; i++) {

								var profile = '<div class="text-center"> <a href="#" data-toggle="modal" data-target="#customerProfile">'
										+ '<i class="icon-users2 icon-2x d-inline-block text-info" title="Customer Profile"></i></a>'
										+ '<div class="font-size-sm text-muted line-height-1">Office task</div></div>'
								var remainingTime = '<div class="text-center" style="color: red;">Overdue</div>';
								if (response[i].sts == 1) {
									remainingTime = '<div class="text-center" > <h6 class="mb-0">'
											+ response[i].day
											+ '-'
											+ response[i].hour
											+ ':'
											+ response[i].minutes
											+ '</h6> <div class="font-size-sm text-muted line-height-1">hours</div></div>';
								}
								var taskDescription = '<div class="font-weight-semibold"><a href="#" data-toggle="modal" data-target="#allocate_to">'
										+ response[i].mdAccTypeText
										+ '- '
										+ response[i].taskTittle
										+ ' '
										+ '</a><span class="badge badge-primary badge-pill">'
										+ response[i].taskPts
										+ ' PTS</span></div> <div class="text-muted">'
										+ response[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#" data-toggle="modal" data-target="#task_log"><span class="badge badge-success badge-pill">'
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

								$('#assignPendingTaskTable td').css(
										'white-space', 'initial');
								$('#assignPendingTaskTable').DataTable().row
										.add(
												[ profile, remainingTime,
														taskDescription,
														schdatetime, priority ])
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
	</script>
</body>
</html>