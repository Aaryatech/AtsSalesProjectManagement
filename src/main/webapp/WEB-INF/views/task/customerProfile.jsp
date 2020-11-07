<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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

	<h3 class="font-weight-semibold mb-0">${custInfo.compName}</h3>
	<span class="d-block opacity-75">${custInfo.contact} </span><span
		class="d-block opacity-75">${custInfo.link}</span>

</div>
<div class="form-group">
	<div class="row">
		<div class="col-sm-3">
			<div class="late_employee" id="weekly_off_emp_list" style="">
				<ul
					class="nav nav-tabs nav-tabs-solid nav-justified bg-indigo-400 border-x-0 border-bottom-0 border-top-indigo-300 mb-0">
					<li class="nav-item"><a
						class="nav-link font-size-sm text-uppercase ">Task /
							Communication Log</a></li>

				</ul>
				<div class="late_one fix_scroll">

					<div class="datatable-scroll-wrap">

						<div class=" border-top-teal">
							<div class="list-feed">
								<c:forEach items="${logList}" var="logList">
									<div class="list-feed-item">
										<a href="#">${logList.taskTittle}</a> -
										${logList.taskClientDiscussion}
										<div class="text-muted">${logList.taskDoneDate}&nbsp;-&nbsp;${logList.employeeName}</div>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>

				</div>

			</div>
		</div>
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

							<c:forEach items="${clientProfilingList}"
								var="clientProfilingList">
								<li class="media">

									<div class="media-body">
										<div class="d-flex justify-content-between">
											<a href="#">${clientProfilingList.message}</a> <span
												class="font-size-sm text-muted">${clientProfilingList.taskDoneDate}</span>
										</div>

										-${clientProfilingList.empName}
									</div>
								</li>
							</c:forEach>
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
						class="nav-link font-size-sm text-uppercase  ">Tough Questions</a></li>

				</ul>
				<div class="late_one fix_scroll">

					<div class="datatable-scroll-wrap">

						<ul class="media-list">
							<c:forEach items="${questionList}" var="questionList">
								<li class="media">

									<div class="media-body">
										<div class="d-flex justify-content-between">
											<a href="#">${questionList.message}</a> <span
												class="font-size-sm text-muted">${questionList.taskDoneDate}</span>
										</div>

										-${questionList.empName}
									</div>
								</li>
							</c:forEach>
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
						class="nav-link font-size-sm text-uppercase  ">What's went
							right</a></li>

				</ul>
				<div class="late_one fix_scroll">

					<div class="datatable-scroll-wrap">

						<ul class="media-list">
							<c:forEach items="${wentrightList}" var="wentrightList">
								<li class="media">

									<div class="media-body">
										<div class="d-flex justify-content-between">
											<a href="#">${wentrightList.message}</a> <span
												class="font-size-sm text-muted">${wentrightList.taskDoneDate}</span>
										</div>

										-${wentrightList.empName}
									</div>
								</li>
							</c:forEach>
						</ul>
					</div>

				</div>

			</div>
		</div>

	</div>
</div>
