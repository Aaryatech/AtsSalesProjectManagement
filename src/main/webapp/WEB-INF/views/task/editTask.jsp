<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<h4 class="font-weight-semibold">${taskDetail.taskTittle}</h4>
<p>${taskDetail.taskAllotmentInstructions}</p>
<ul>
	<li><div class="row">
			<div class="col-sm-4">
				<strong>Schedule Date Time</strong>
			</div>
			: ${taskDetail.taskScheTime}
		</div></li>

</ul>

<form class="form-validate-jquery"
	action="${pageContext.request.contextPath}/submitandupdatetask"
	novalidate="novalidate" id="submitandupdatetask">

	<div class="form-group row">
		<label class="col-form-label col-lg-3" for="sdate">Schedule
			Date <span class="text-danger">*</span>
		</label>
		<div class="col-lg-9">
			<input type="text" class="form-control datepickerclass" required
				placeholder="Schedule Schedule" id="sdate" name="sdate"
				value="${taskDetail.taskScheDate}">
		</div>
	</div>
	<div class="form-group row">
		<label class="col-form-label col-lg-3" for="stime">Schedule
			Time <span class="text-danger">*</span>
		</label>
		<div class="col-lg-9">
			<input type="time" class="form-control" required
				placeholder="Schedule Time" id="stime" name="stime"
				value="${taskDetail.time}"><span
				class="validation-invalid-label" id="error_stime"
				style="display: none;">This field is required.</span>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-form-label col-lg-3" for="taskDescription">Task
			Instruction<span class="text-danger">*</span>
		</label>
		<div class="col-lg-9">
			<textarea rows="3" cols="5" class="form-control" required
				placeholder="Task Instruction" id="taskDescription"
				name="taskDescription">${taskDetail.taskAllotmentInstructions}</textarea>
			<span class="validation-invalid-label" id="error_taskDescription"
				style="display: none;">This field is required.</span>
		</div>
	</div>
	<div class="form-group row">
		<label class="col-form-label col-lg-3" for="allocateTo">Allocate
			To<span class="text-danger">*</span>
		</label>
		<div class="col-lg-9">
			<select name="allocateTo" class="form-control form-control-select2"
				data-placeholder="Allocate To" required="required" id="allocateTo"
				multiple="multiple">
				<c:forEach items="${empList}" var="empList">
					<c:set value="0" var="find"></c:set>
					<c:forEach items="${allocateTo}" var="allocateTo">
						<c:if test="${empList.empId==allocateTo}">
							<c:set value="1" var="find"></c:set>
						</c:if>
					</c:forEach>
					<c:choose>
						<c:when test="${find==1}">
							<option value="${empList.empId}" selected>${empList.empName}</option>
						</c:when>
						<c:otherwise>
							<option value="${empList.empId}">${empList.empName}</option>
						</c:otherwise>
					</c:choose>

				</c:forEach>
			</select><span class="validation-invalid-label" id="error_allocateTo"
				style="display: none;">This field is required.</span>
		</div>
	</div>

	<div class="form-group row">
		<label class="col-form-label col-lg-3" for="priority">Set
			Priority<span class="text-danger">*</span>
		</label>
		<div class="col-lg-9">
			<select name="priority" class="form-control form-control-select2"
				data-placeholder="Select Priority" required="required" id="priority">
				<option value="1" ${taskDetail.taskPriority==1 ? 'selected' : ''}>Low</option>
				<option value="2" ${taskDetail.taskPriority==2 ? 'selected' : ''}>Normal</option>
				<option value="3" ${taskDetail.taskPriority==3 ? 'selected' : ''}>High</option>

			</select><span class="validation-invalid-label" id="error_priority"
				style="display: none;">This field is required.</span>
		</div>
	</div>

	<div class="modal-footer">

		<button type="submit" class="btn bg-primary">Submit</button>
	</div>
</form>
<script type="text/javascript">
	$(document)
			.ready(
					function($) {

						$("#submitandupdatetask")
								.submit(
										function(e) {
											var isError = false;
											var errMsg = "";

											$("#error_stime").hide();
											$("#error_taskDescription").hide();
											$("#error_allocateTo").hide();

											if ($("#stime").val() == "") {
												isError = true;
												$("#error_stime").show();

											}
											if ($("#taskDescription").val() == "") {
												isError = true;
												$("#error_taskDescription")
														.show();

											}
											if ($("#allocateTo").val() == ""
													|| $("#allocateTo").val() == 0) {
												isError = true;
												$("#error_allocateTo").show();

											}

											if (!isError) {
												var alow = $("#allocateTo")
														.val();
												var x = true;
												if (x == true) {

													var fd = new FormData();

													fd.append("sdate", $(
															"#sdate").val());

													fd.append("stime", $(
															"#stime").val());
													fd
															.append(
																	"taskDescription",
																	$(
																			"#taskDescription")
																			.val());
													fd
															.append(
																	"allocateTo",
																	alow);
													fd.append("priority", $(
															"#priority").val());

													//$('#modal_step1').modal('show');

													$
															.ajax({
																url : '${pageContext.request.contextPath}/submitEdittask',
																type : 'post',
																dataType : 'json',
																data : fd,
																contentType : false,
																processData : false,
																success : function(
																		response) {

																	//alert(response);
																	$(
																			"#taskDetailModel")
																			.modal(
																					"hide");
																	return false;
																},
															});

													return false;
												}
												//end ajax send this to php page
												return false;
											}
											return false;
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