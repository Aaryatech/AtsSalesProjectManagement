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
										<c:when test="${moduleId==1}">LMS Task Dashboard</c:when>
										<c:when test="${moduleId==2}">IMS Task Dashboard</c:when>
										<c:when test="${moduleId==3}">Office Task Dashboard</c:when>
									</c:choose>
								</h6>
								<div class="header-elements">
									<div class="list-icons">
										<a class="list-icons-item" data-action="collapse"></a>
									</div>
								</div>
							</div>
							<!-- <div class="card-body py-0">
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
							</div> -->
							<div class="card-body">

								<div class="form-group row">
									<label class="col-form-label col-lg-2" for="status">Select
										Status <span class="text-danger">*</span>
									</label>
									<div class="col-lg-3">
										<select name="status"
											class="form-control form-control-select2"
											data-placeholder="Select status" required="required"
											id="status" onchange="getDataList(this.value)">
											<option value="0" selected>All</option>
											<c:forEach items="${stsList}" var="stsList">
												<option value="${stsList.mTaskStatusId}">${stsList.mTaskStatusName}</option>
											</c:forEach>


										</select>
									</div>
								</div>
								<div class="table-responsive">
									<table class="table" id="unallocatedTable">
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
										<tbody></tbody>
									</table>
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
			//getDataList(0);
		})

		function getDataList(value) {

			var status = value;

			var moduleId = '${moduleId}';
			//alert(status)
			var fd = new FormData();
			fd.append("moduleId", moduleId);
			fd.append("status", status);
			//$('#modal_step1').modal('show');

			$
					.ajax({
						url : '${pageContext.request.contextPath}/getTaskByStatusWiseList',
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
										+ '<div class="font-size-sm text-muted line-height-1">'
										+ unallocated[i].mdAccTypeText
										+ '</div></div>'
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
										+ unallocated[i].companyInfo
										+ '- '
										+ unallocated[i].taskTittle
										+ '</a></div> <div class="text-muted">'
										+ unallocated[i].taskAllotmentInstructions
										+ '</div>'
										+ '<a href="#"  onclick="getTaskLog('
										+ unallocated[i].mdAccTypeId
										+ ','
										+ unallocated[i].priKey
										+ ')"><span class="badge badge-success badge-pill">'
										+ unallocated[i].completed
										+ ' Completed</span></a>&nbsp;'
										+ '<span class="badge badge-primary badge-pill">'
										+ unallocated[i].taskPts
										+ ' PTS</span>';
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
												priority,
												unallocated[i].employeeName ])
										.draw();
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
				var status = $("#status").val();
				getDataList(status);
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