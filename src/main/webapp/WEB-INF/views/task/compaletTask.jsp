<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<p>${taskDetail.companyInfo}-${taskDetail.taskAllotmentInstructions}</p>


<ul>
	<li><div class="row">
			<div class="col-sm-2">
				<strong>Schedule Date Time</strong>
			</div>
			: ${taskDetail.taskScheTime}
		</div></li>

</ul>


<form class="form-validate-jquery"
	action="${pageContext.request.contextPath}/submitandupdatetask"
	novalidate="novalidate" id="submitandupdatetask">
	<div class="form-group">
		<div class="row">
			<div class="col-sm-3">
				<label for="status">Change Status<span class="text-danger">*</span>
				</label> <select name="status" class="form-control form-control-select2"
					data-placeholder="Select status" required="required" id="status">
					<c:forEach items="${stsList}" var="stsList">
						<c:choose>
							<c:when
								test="${stsList.mTaskStatusId==taskDetail.taskFinalStatus}">
								<option value="${stsList.mTaskStatusId}" selected>${stsList.mTaskStatusName}</option>
							</c:when>
							<c:otherwise>
								<option value="${stsList.mTaskStatusId}">${stsList.mTaskStatusName}</option>
							</c:otherwise>
						</c:choose>

					</c:forEach>
				</select><span class="validation-invalid-label" id="error_status"
					style="display: none;">Change task status.</span>
			</div>
			<input type="hidden" id="currentsts" name="currentsts"
				value="${taskDetail.taskFinalStatus}">
			<div class="col-sm-3">
				<label for="sdate">New Schedule Date<span
					class="text-danger">*</span>
				</label> <input type="text" placeholder="Schedule Date"
					class="form-control datepickerclass" required="required" id="sdate"
					name="sdate">
			</div>
			<div class="col-sm-3">
				<label for="stime">New Schedule Time </label> <input type="time"
					placeholder="Schedule Time" class="form-control "
					required="required" id="stime" name="stime"> <span
					class="validation-invalid-label" id="error_stime"
					style="display: none;">This field is required.</span>
			</div>
			<div class="col-sm-3">
				<label for="clientDiscussion">Client Discussion<span
					class="text-danger">*</span>
				</label>
				<textarea rows="3" cols="5" class="form-control"
					placeholder="Client Discussion" id="clientDiscussion"
					name="clientDiscussion" required></textarea>
				<span class="validation-invalid-label" id="error_clientDiscussion"
					style="display: none;">This field is required.</span>
			</div>
		</div>
	</div>

	<div class="form-group">
		<div class="row">
			<div class="col-sm-3">
				<label for="taskDescription">New Task Instruction </label>
				<textarea rows="3" cols="5" class="form-control"
					placeholder="New Task Instruction" id="taskDescription"
					name="taskDescription" required></textarea>
				<span class="validation-invalid-label" id="error_taskDescription"
					style="display: none;">This field is required.</span>
			</div>
			<div class="col-sm-3">
				<label for="clientProfiling">Client Profiling </label>
				<textarea rows="3" cols="5" class="form-control"
					placeholder="Client Profiling" id="clientProfiling"
					name="clientProfiling"></textarea>
			</div>
			<div class="col-sm-3">
				<label for="queations">Any Tough Question </label>
				<textarea rows="3" cols="5" class="form-control"
					placeholder="Question" id="queations" name="queations"></textarea>
			</div>
			<div class="col-sm-3">
				<label for="right">What went right </label>
				<textarea rows="3" cols="5" class="form-control"
					placeholder="What went right " id="right" name="right"></textarea>
			</div>
		</div>
	</div>

	<div class="modal-footer">
		<button type="button" class="btn btn-link" data-dismiss="modal">Close</button>
		<button type="submit" class="btn bg-primary" id="insertbtn">Submit</button>
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
											$("#error_clientDiscussion").hide();
											$("#error_taskDescription").hide();
											$("#error_status").hide();
											/* alert($("#stime").val())
											if ($("#stime").val() == "") {
												isError = true;
												$("#error_stime").show();

											} */
											if ($("#clientDiscussion").val() == "") {
												isError = true;
												$("#error_clientDiscussion")
														.show();

											}
											/* if ($("#taskDescription").val() == "") {
												isError = true;
												$("#error_taskDescription")
														.show();

											} */

											/* if ($("#currentsts").val() == $(
													"#status").val()) {
												isError = true;
												$("#error_status").show();

											} */

											if (!isError) {

												var x = true;
												if (x == true) {

													document
															.getElementById('insertbtn').disabled = true;
													var fd = new FormData();
													fd.append("status", $(
															"#status").val());
													fd.append("sdate", $(
															"#sdate").val());
													fd.append("stime", $(
															"#stime").val());
													fd
															.append(
																	"clientDiscussion",
																	$(
																			"#clientDiscussion")
																			.val());
													fd
															.append(
																	"taskDescription",
																	$(
																			"#taskDescription")
																			.val());
													fd
															.append(
																	"clientProfiling",
																	$(
																			"#clientProfiling")
																			.val());
													fd
															.append(
																	"queations",
																	$(
																			"#queations")
																			.val());
													fd.append("right", $(
															"#right").val());
													//$('#modal_step1').modal('show');

													$
															.ajax({
																url : '${pageContext.request.contextPath}/submitandupdatetask',
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