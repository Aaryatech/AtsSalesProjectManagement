<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
					<th>Allocate By / Generate By</th>
					<th>Allocate Date Time/Generate Date Time</th>
					<th>Status</th>
					<th>Assigned users</th>

				</tr>
			</thead>
			<tbody>
				<tr>
					<td>#25</td>

					<td>
						<div class="font-weight-semibold">
							<a href="#" data-toggle="modal"
								data-target="#modal_form_vertical"> Call to customer</a>
						</div>
						<div class="text-muted">Call to customer</div>
					</td>
					<td>Swapnil Mashalkar</td>
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
					<td>Swapnil Mashalkar</td>
					<td>20-10-2020 12:00 AM</td>
					<td>Open</td>
					<td>Akshay,Sachin</td>

				</tr>

				<tr>
					<td>#23</td>

					<td>
						<div class="font-weight-semibold">
							<a href="task_manager_detailed.html">Developing</a>
						</div>
						<div class="text-muted">Developing</div>
					</td>
					<td>Swapnil Mashalkar</td>
					<td>20-10-2020 12:00 AM</td>
					<td>Open</td>
					<td>Akshay,Sachin</td>

				</tr>

				<tr>
					<td>#22</td>

					<td>
						<div class="font-weight-semibold">
							<a href="task_manager_detailed.html">Create ad campaign
								banners set</a>
						</div>
						<div class="text-muted">That he had recently cut out of an
							illustrated magazine..</div>
					</td>
					<td>Swapnil Mashalkar</td>
					<td>20-10-2020 12:00 AM</td>
					<td>Open</td>
					<td>Akshay,Sachin</td>


				</tr>

				<tr>
					<td>#21</td>

					<td>
						<div class="font-weight-semibold">
							<a href="task_manager_detailed.html">Edit the draft for the
								icons</a>
						</div>
						<div class="text-muted">You've got to get enough sleep.
							Other travelling salesmen..</div>
					</td>
					<td>Swapnil Mashalkar</td>
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

<!-- Modal -->
<div id="modal_form_vertical" class="modal fade" tabindex="-1">
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

				<p>
					<strong>Schedule Date</strong> : 20-10-2020, <strong>Schedule
						time</strong>: 12:00 AM
				</p>

				<p>
					<strong>Alloted by</strong> : Swapnil Mashalkar, <strong>Alloted
						time</strong>: 12:00 AM
				</p>

				<form class="form-validate-jquery" action="#"
					novalidate="novalidate" id="a">
					<div class="form-group row">
						<label class="col-form-label col-lg-3" for="status">Change
							Status<span class="text-danger">*</span>
						</label>
						<div class="col-lg-9">
							<select name="status" class="form-control form-control-select2"
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
					</div>
					<div class="form-group row">
						<label class="col-form-label col-lg-3" for="clientDiscussion">Client
							Discussion<span class="text-danger">*</span>
						</label>
						<div class="col-lg-9">
							<textarea rows="3" cols="5" name="textarea" class="form-control"
								placeholder="Default textarea" id="clientDiscussion"
								name="clientDiscussion" required></textarea>
						</div>
					</div>
					<div class="modal-footer">

						<button type="submit" class="btn bg-primary">Submit</button>
					</div>
				</form>

				<hr>

				<form class="form-validate-jquery1" action="#"
					novalidate="novalidate" id="b">
					<h4 class="font-weight-semibold">Generate New Task</h4>

					<div class="form-group row">
						<label class="col-form-label col-lg-3" for="taskname">Task
							Name<span class="text-danger">*</span>
						</label>
						<div class="col-lg-9">
							<input type="text" placeholder="Task Name" class="form-control"
								required="required" id="taskname" name="taskname">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-form-label col-lg-3" for="taskDescription">Task
							Description<span class="text-danger">*</span>
						</label>
						<div class="col-lg-9">
							<textarea rows="3" cols="5" name="textarea" class="form-control"
								required placeholder="Default textarea" id="taskDescription"
								name="taskDescription"></textarea>
						</div>
					</div>

					<div class="form-group row">
						<label class="col-form-label col-lg-3" for="sdate">Schedule
							Date<span class="text-danger">*</span>
						</label>
						<div class="col-lg-9">
							<input type="text" placeholder="Schedule Date"
								class="form-control datepickerclass" required="required"
								id="sdate" name="sdate">
						</div>
					</div>
					<div class="form-group row">
						<label class="col-form-label col-lg-3" for="stime">Schedule
							Time<span class="text-danger">*</span>
						</label>
						<div class="col-lg-9">
							<input type="text" placeholder="Schedule Time"
								class="form-control " required="required" id="stime"
								name="stime">
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

				<p>
					<strong>Schedule Date</strong> : 20-10-2020, <strong>Schedule
						time</strong>: 12:00 AM
				</p>

				<p>
					<strong>Generated by</strong> : Sachin Handge, <strong>Generated
						by time</strong>: 12:00 AM
				</p>

				<form class="form-validate-jquery" action="#"
					novalidate="novalidate" id="a">
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

	$('.form-validate-jquery1')
			.validate(
					{
						ignore : 'input[type=hidden], .select2-search__field', // ignore hidden fields
						errorClass : 'validation-invalid-label',
						successClass : 'validation-valid-label',
						validClass : 'validation-valid-label',
						highlight : function(element, errorClass) {
							$(element).removeClass(errorClass);
						},
						unhighlight : function(element, errorClass) {
							$(element).removeClass(errorClass);
						},
						success : function(label) {
							label.addClass('validation-valid-label').text(
									'Success.'); // remove to hide Success message
						},

						// Different components require proper error label placement
						errorPlacement : function(error, element) {

							// Unstyled checkboxes, radios
							if (element.parents().hasClass('form-check')) {
								error.appendTo(element.parents('.form-check')
										.parent());
							}

							// Input with icons and Select2
							else if (element.parents().hasClass(
									'form-group-feedback')
									|| element
											.hasClass('select2-hidden-accessible')) {
								error.appendTo(element.parent());
							}

							// Input group, styled file input
							else if (element.parent().is(
									'.uniform-uploader, .uniform-select')
									|| element.parents()
											.hasClass('input-group')) {
								error.appendTo(element.parent().parent());
							}

							// Other elements
							else {
								error.insertAfter(element);
							}
						},
						rules : {
							password : {
								minlength : 5
							},
							repeat_password : {
								equalTo : '#password'
							},
							email : {
								email : true
							},
							repeat_email : {
								equalTo : '#email'
							},
							minimum_characters : {
								minlength : 10
							},
							maximum_characters : {
								maxlength : 10
							},
							minimum_number : {
								min : 10
							},
							maximum_number : {
								max : 10
							},
							number_range : {
								range : [ 10, 20 ]
							},
							url : {
								url : true
							},
							date : {
								date : true
							},
							date_iso : {
								dateISO : true
							},
							numbers : {
								number : true
							},
							digits : {
								digits : true
							},
							creditcard : {
								creditcard : true
							},
							basic_checkbox : {
								minlength : 2
							},
							styled_checkbox : {
								minlength : 2
							},
							switchery_group : {
								minlength : 2
							},
							switch_group : {
								minlength : 2
							}
						},
						messages : {
							custom : {
								required : 'This is a custom error message'
							},
							basic_checkbox : {
								minlength : 'Please select at least {0} checkboxes'
							},
							styled_checkbox : {
								minlength : 'Please select at least {0} checkboxes'
							},
							switchery_group : {
								minlength : 'Please select at least {0} switches'
							},
							switch_group : {
								minlength : 'Please select at least {0} switches'
							},
							agree : 'Please accept our policy'
						}
					});
</script>
</body>
</html>