<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

				<div class="row row-sortable">
					<div class="col-md-6">

						<div class="card card-body border-top-teal">
							<div class="list-feed list-feed-time">
								<div class="list-feed-item">
									<span class="feed-time text-muted font-size-sm">12:47</span> <a
										href="#">David Linner</a> requested refund for a double bank
									card charge
								</div>

								<div class="list-feed-item">
									<span class="feed-time text-muted font-size-sm">10:25</span>
									User <a href="#">Christopher Wallace</a> from Google is
									awaiting for staff reply
								</div>

								<div class="list-feed-item">
									<span class="feed-time text-muted font-size-sm">09:37</span>
									Ticket <strong>#43683</strong> has been resolved by <a href="#">Victoria
										Wilson</a>
								</div>

								<div class="list-feed-item">
									<span class="feed-time text-muted font-size-sm">08:28</span> <a
										href="#">Eugene Kopyov</a> merged <strong>Master</strong>, <strong>Demo</strong>
									and <strong>Dev</strong> branches
								</div>

								<div class="list-feed-item">
									<span class="feed-time text-muted font-size-sm">07:58</span>
									All sellers have received payouts for December, 2016!
								</div>

								<div class="list-feed-item">
									<span class="feed-time text-muted font-size-sm">06:32</span> <a
										href="#">Chris Arney</a> created a new ticket <strong>#43136</strong>
									and assigned to <a href="#">John Nod</a>
								</div>
							</div>
						</div>

					</div>
					<div class="col-md-6">

						<div class="card ui-sortable-handle">
							<div class="card-header bg-white header-elements-inline">
								<h6 class="card-title">YOUR TASK LIST</h6>
								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="collapse"></a> <a
											class="list-icons-item" data-action="move"></a>
									</div>
								</div>

							</div>
						</div>

					</div>

				</div>
				<div class="row row-sortable">
					<div class="col-md-6">

						<div class="card ui-sortable-handle">
							<div class="card-header bg-white header-elements-inline">
								<h6 class="card-title">YOUR TASK LIST</h6>
								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="collapse"></a> <a
											class="list-icons-item" data-action="move"></a>
									</div>
								</div>
							</div>


						</div>

					</div>
					<div class="col-md-6">

						<div class="card ui-sortable-handle">
							<div class="card-header bg-white header-elements-inline">
								<h6 class="card-title">YOUR TASK LIST</h6>
								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="collapse"></a> <a
											class="list-icons-item" data-action="move"></a>
									</div>
								</div>
							</div>

						</div>

					</div>

				</div>
				<!-- Highlighting rows and columns -->
				<div class="card">
					<div class="card-header header-elements-inline">
						<h5 class="pageTitle">
							<i class="icon-list-unordered"></i> YOUR TASK LIST
						</h5>
						<!-- <div class="header-elements">
							<div class="list-icons">
								<a class="list-icons-item" data-action="collapse"></a>
							</div> 
						</div>-->
					</div>

					<div class="card-body">

						<table class="table tasks-list table-lg">
							<thead>
								<tr>
									<th>#</th>

									<th>Task Description</th>
									<th>Schedule Date Time</th>
									<th>Status</th>
									<th>Assigned users</th>

								</tr>
							</thead>
							<tbody>

								<tr>
									<td colspan="6">Today</td>
									<td style="display: none;">dsf</td>
									<td style="display: none;">dsf</td>
									<td style="display: none;">dsf</td>
									<td style="display: none;">dsf</td>
								</tr>

								<tr>
									<td>#25</td>

									<td>
										<div class="font-weight-semibold">
											<a href="#" data-toggle="modal" data-target="#task_log">
												Previous Task</a>
										</div>
										<div class="text-muted">Call to customer</div>
									</td>

									<td>20-10-2020 12:00 AM</td>
									<td>Open</td>
									<td>Akshay,Sachin</td>

								</tr>
								<tr>
									<td>#25</td>

									<td>
										<div class="font-weight-semibold">
											<a href="#" data-toggle="modal"
												data-target="#modal_form_vertical"> Call to customer</a>
										</div>
										<div class="text-muted">Call to customer</div>
									</td>

									<td>20-10-2020 12:00 AM</td>
									<td>Open</td>
									<td>Akshay,Sachin</td>

								</tr>

								<tr>
									<td>#24</td>

									<td>
										<div class="font-weight-semibold">
											<a href="#" data-toggle="modal" data-target="#allocate_to">
												Demo For Client</a>
										</div>
										<div class="text-muted">Demo For Client</div>
									</td>

									<td>20-10-2020 12:00 AM</td>
									<td>Open</td>
									<td>Akshay,Sachin</td>

								</tr>

								<tr>
									<td>#23</td>

									<td>
										<div class="font-weight-semibold">
											<a href="${pageContext.request.contextPath}/tagList">Developing</a>
										</div>
										<div class="text-muted">Developing</div>
									</td>

									<td>20-10-2020 12:00 AM</td>
									<td>Open</td>
									<td>Akshay,Sachin</td>

								</tr>

								<tr>
									<td>#22</td>

									<td>
										<div class="font-weight-semibold">
											<a href="${pageContext.request.contextPath}/addEnquiry">Create
												ad campaign banners set</a>
										</div>
										<div class="text-muted">That he had recently cut out of
											an illustrated magazine..</div>
									</td>

									<td>20-10-2020 12:00 AM</td>
									<td>Open</td>
									<td>Akshay,Sachin</td>


								</tr>

								<tr>
									<td>#21</td>

									<td>
										<div class="font-weight-semibold">
											<a href="${pageContext.request.contextPath}/addLead">Edit
												the draft for the icons</a>
										</div>
										<div class="text-muted">You've got to get enough sleep.
											Other travelling salesmen..</div>
									</td>

									<td>20-10-2020 12:00 AM</td>
									<td>Open</td>
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
				<!-- /highlighting rows and columns -->

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
								<div class="col-sm-6">
									<label for="clientDiscussion">Client Discussion<span
										class="text-danger">*</span>
									</label>
									<textarea rows="3" cols="5" name="textarea"
										class="form-control" placeholder="Default textarea"
										id="clientDiscussion" name="clientDiscussion" required></textarea>
								</div>
							</div>
						</div>

						<hr>
						<div class="form-group">
							<div class="row">
								<div class="col-sm-4">
									<label for="sdate">New Schedule Date<span
										class="text-danger">*</span>
									</label> <input type="text" placeholder="Schedule Date"
										class="form-control datepickerclass" required="required"
										id="sdate" name="sdate">
								</div>
								<div class="col-sm-4">
									<label for="stime">New Schedule Time<span
										class="text-danger">*</span>
									</label> <input type="text" placeholder="Schedule Time"
										class="form-control " required="required" id="stime"
										name="stime">
								</div>
								<div class="col-sm-4">
									<label for="taskDescription">Task Description<span
										class="text-danger">*</span>
									</label> <input type="text" class="form-control" name="taskDescription"
										placeholder="Default textarea" id="taskDescription"
										name="taskDescription" required>
								</div>
							</div>
						</div>
						<div class="form-group">
							<div class="row">
								<div class="col-sm-4">
									<label for="clientProfiling">Client Profiling<span
										class="text-danger">*</span>
									</label>
									<textarea rows="3" cols="5" class="form-control"
										placeholder="Client Profiling" id="clientProfiling"
										name="clientProfiling" required></textarea>
								</div>
								<div class="col-sm-4">
									<label for="que">Any Tough Question<span
										class="text-danger">*</span>
									</label>
									<textarea rows="3" cols="5" class="form-control"
										placeholder="Question" id="que" name="que" required></textarea>
								</div>
								<div class="col-sm-4">
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
							<label class="col-form-label col-lg-3" for="status">Allocated
								To<span class="text-danger">*</span>
							</label>
							<div class="col-lg-9">
								<select name="status" class="form-control form-control-select2"
									data-placeholder="Select status" data-fouc required="required">
									<option value="open">Sachin</option>
									<option value="hold">Akshay</option>
									<option value="resolved">Anmol</option>

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
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h2 class="modal-title">Previous Task</h2>
					<button type="button" class="close" data-dismiss="modal">&times;</button>
				</div>
				<div class="modal-body">
					<div class=" border-top-teal">
						<div class="list-feed list-feed-time">
							<div class="list-feed-item">
								<span class="feed-time text-muted font-size-sm">12:47</span> <a
									href="#">David Linner</a> requested refund for a double bank
								card charge
							</div>

							<div class="list-feed-item">
								<span class="feed-time text-muted font-size-sm">10:25</span>
								User <a href="#">Christopher Wallace</a> from Google is awaiting
								for staff reply
							</div>

							<div class="list-feed-item">
								<span class="feed-time text-muted font-size-sm">09:37</span>
								Ticket <strong>#43683</strong> has been resolved by <a href="#">Victoria
									Wilson</a>
							</div>

							<div class="list-feed-item">
								<span class="feed-time text-muted font-size-sm">08:28</span> <a
									href="#">Eugene Kopyov</a> merged <strong>Master</strong>, <strong>Demo</strong>
								and <strong>Dev</strong> branches
							</div>

							<div class="list-feed-item">
								<span class="feed-time text-muted font-size-sm">07:58</span> All
								sellers have received payouts for December, 2016!
							</div>

							<div class="list-feed-item">
								<span class="feed-time text-muted font-size-sm">06:32</span> <a
									href="#">Chris Arney</a> created a new ticket <strong>#43136</strong>
								and assigned to <a href="#">John Nod</a>
							</div>

						</div>
					</div>
				</div>


			</div>
		</div>
	</div>
	<!-- /info modal -->

	<script type="text/javascript">
		$(document).ready(function() {
			// month selector
			$('#datepicker').datepicker({
				autoclose : true,
				format : "mm-yyyy",
				viewMode : "months",
				minViewMode : "months"

			});

		});
	</script>
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

		$('#selectAll').click(function(event) {
			if (this.checked) {
				// Iterate each checkbox
				$(':checkbox').each(function() {
					this.checked = true;
				});
			} else {
				$(':checkbox').each(function() {
					this.checked = false;
				});
			}
		});
	</script>
	<!-- <script type="text/javascript">
		$(window).on('load', function() {
			$('#myModal_checklist').modal('show');
		});
	</script> -->

	<script>
		// Custom bootbox dialog
		$('.bootbox_custom')
				.on(
						'click',
						function() {
							//var uuid = $(this).data("uuid") // will return the number 123
							var table = $('#printtable1').DataTable();
							table.search("").draw();
							$("#error_emp").hide();
							var list = [];

							$("input:checkbox[name=selectEmp]:checked").each(
									function() {
										list.push($(this).val());
									});
							if (list.length > 0) {

								bootbox
										.confirm({
											title : 'Confirm ',
											message : 'Have you upload attendance of the selected month of employee?',
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
													document
															.getElementById(
																	'submitFixAttendaceByDateAndEmp')
															.submit();

												}
											}
										});
							} else {
								//alert("Select Minimum one employee")
								$("#error_emp").show();
							}
						});
	</Script>
	<script type="text/javascript">
		$('.datatable-fixed-left_custom').DataTable({

			columnDefs : [ {
				orderable : false,
				targets : [ 0 ]
			}, {
				orderable : false,
				targets : [ 1 ]
			} ],
			"order" : [],
			//scrollX : true,
			scrollX : true,
			scrollY : '65vh',
			scrollCollapse : true,
			paging : false,
			fixedColumns : {
				leftColumns : 1,
				rightColumns : 0
			}

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