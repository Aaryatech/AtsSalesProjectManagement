<h4 class="font-weight-semibold">Call Customer</h4>
<p>Duis mollis, est non commodo luctus, nisi erat porttitor ligula,
	eget lacinia odio sem. Praesent commodo cursus magna, vel scelerisque
	nisl consectetur et. Vivamus sagittis lacus vel augue laoreet rutrum
	faucibus dolor auctor.</p>
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

<form class="form-validate-jquery" action="#" novalidate="novalidate"
	id="a">

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
			<select name="Priority" class="form-control form-control-select2"
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