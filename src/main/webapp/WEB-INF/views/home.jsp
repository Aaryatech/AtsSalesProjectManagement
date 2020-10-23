<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>

<jsp:include page="/WEB-INF/views/include/metacssjs.jsp"></jsp:include>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/assets/css/bootstrap-datepicker.css"
	type="text/css" />
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/global_assets/js/demo_pages/task_manager_list.js"></script>
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/global_assets/js/demo_pages/form_validation.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/forms/validation/validate.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/forms/inputs/touchspin.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/forms/selects/select2.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/forms/styling/switch.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/forms/styling/switchery.min.js"></script>
<script
	src="${pageContext.request.contextPath}/resources/global_assets/js/plugins/forms/styling/uniform.min.js"></script>
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


				<!-- Highlighting rows and columns -->
				<div id="appendDive">
					<div class="card">
						<div class="card-header header-elements-inline">
							<h5 class="pageTitle">
								<i class="icon-list-unordered"></i> DASHBOARD
							</h5>
							<!-- <div class="header-elements">
							<div class="list-icons">
								<a class="list-icons-item" data-action="collapse"></a>
							</div> 
						</div>-->
						</div>

						<div class="card-body">
							<a href="#" data-toggle="modal"
								data-target="#modal_form_vertical"
								onclick="getMapping('welcome1')"> CLICK HERE</a>
						</div>

					</div>
					<!-- /highlighting rows and columns -->

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
</body>
</html>