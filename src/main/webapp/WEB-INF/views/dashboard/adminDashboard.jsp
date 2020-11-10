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
							<div class="card-header bg-white header-elements-inline">
								<h6 class="card-title">Employee Task Summary Table</h6>
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
											<th class="text-center" width="20%">Employee</th>
											<th class="text-center">Task Allocated Task</th>
											<th class="text-center">Completed Task</th>
											<th class="text-center">Pending Task</th>
											<th class="text-center">Remaining Task</th>

										</tr>
									</thead>
									<tbody>

										<c:forEach items="${empList}" var="empList" varStatus="count">
											<tr>
												<td>${count.index+1}</td>
												<td><a
													href="${pageContext.request.contextPath}/moduleDetailWiseDashboard?moduleId=0">${empList.empName}</a></td>
												<td class="text-center">
													<div class="row">

														<h6 class="mb-0">
															${empList.allocateTask}
															<div class="font-size-sm text-muted line-height-1">Task</div>
														</h6>
														&nbsp;/&nbsp;
														<h6 class="mb-0">
															${empList.allocatePts}
															<div class="font-size-sm text-muted line-height-1">PTS</div>
														</h6>

													</div>

												</td>

												<td class="text-center"><div class="row">

														<h6 class="mb-0">
															${empList.completedTask}
															<div class="font-size-sm text-muted line-height-1">Task</div>
														</h6>
														&nbsp;/&nbsp;
														<h6 class="mb-0">
															${empList.completedPts}
															<div class="font-size-sm text-muted line-height-1">PTS</div>
														</h6>

													</div></td>
												<td class="text-center"><div class="row">

														<h6 class="mb-0">
															${empList.pendingCount}
															<div class="font-size-sm text-muted line-height-1">Task</div>
														</h6>
														&nbsp;/&nbsp;
														<h6 class="mb-0">
															${empList.pendingPts}
															<div class="font-size-sm text-muted line-height-1">PTS</div>
														</h6>

													</div></td>
												<td class="text-center"><div class="row">

														<h6 class="mb-0">
															${empList.remainingCount}
															<div class="font-size-sm text-muted line-height-1">Task</div>
														</h6>
														&nbsp;/&nbsp;
														<h6 class="mb-0">
															${empList.remainingPts}
															<div class="font-size-sm text-muted line-height-1">PTS</div>
														</h6>

													</div></td>

											</tr>
										</c:forEach>


									</tbody>
								</table>
							</div>
						</div>

					</div>

				</div>



				<div class="row">
					<div class="col-md-12">
						<div class="card">
							<div class="card-header bg-white header-elements-inline">
								<h6 class="card-title">Module Task Summary Table</h6>
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
											<th class="text-center" width="20%">Module</th>
											<th class="text-center">Unallocate Task</th>
											<th class="text-center">Task Allocated Task</th>
											<th class="text-center">Completed Task</th>
											<th class="text-center">Pending Task</th>
											<th class="text-center">Remaining Task</th>

										</tr>
									</thead>
									<tbody>


										<tr>
											<td class="text-center">1</td>
											<td width="30%"><a
												href="${pageContext.request.contextPath}/moduleDetailWiseDashboard?moduleId=1">LMS</a></td>
											<td class="text-center">
												<div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsUnallocatedTask}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsUnallocatedPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div>

											</td>

											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsAllocatedTask}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsAllocatedPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsTodayCompleted}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsTodayCompleted_pts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsPendingCount}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsPendingPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsRemainingCount}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.lmsRemainingPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
										</tr>

										<tr>
											<td class="text-center">2</td>
											<td width="30%"><a
												href="${pageContext.request.contextPath}/moduleDetailWiseDashboard?moduleId=2">IMS</a></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.inqUnallocatedTask}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.inqUnallocatedPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center">
												<div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.inqAllocatedTask}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.inqAllocatedPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div>

											</td>

											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.inqTodayCompleted}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.inqTodayCompleted_pts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.inqPendingCount}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.inqPendingPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.inqRemainingCount}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.inqRemainingPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>

										</tr>

										<tr>
											<td class="text-center">2</td>
											<td width="30%"><a
												href="${pageContext.request.contextPath}/moduleDetailWiseDashboard?moduleId=3">Office
													Task</a></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.atsUnallocatedTask}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.atsUnallocatedPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center">
												<div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.atsAllocatedTask}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.atsAllocatedPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div>

											</td>

											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.atsTodayCompleted}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.atsTodayCompleted_pts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.atsPendingCount}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.atsPendingPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>
											<td class="text-center"><div class="row">

													<h6 class="mb-0">
														${modeludeWiseDashboard.atsRemainingCount}
														<div class="font-size-sm text-muted line-height-1">Task</div>
													</h6>
													&nbsp;/&nbsp;
													<h6 class="mb-0">
														${modeludeWiseDashboard.atsRemainingPts}
														<div class="font-size-sm text-muted line-height-1">PTS</div>
													</h6>

												</div></td>

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
			//getTaskPendingList();
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
								var taskDescription = '<div class="font-weight-semibold">'
										+ response[i].mdAccTypeText
										+ '- '
										+ response[i].taskTittle
										+ ' '
										+ '<span class="badge badge-primary badge-pill">'
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
	</script>
</body>
</html>