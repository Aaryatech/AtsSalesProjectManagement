<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%><%@ taglib
	uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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



				<!-- Highlighting rows and columns -->
				<div class="card">


					<div class="card-header header-elements-inline">


						<table width="100%">
							<tr width="100%">
								<td width="60%"><h5 class="pageTitle">
										<i class="icon-list-unordered"></i> Access Role List
									</h5></td>
								<td width="40%" align="right"><c:if
										test="${addAccess == 0}">
										<a href="${pageContext.request.contextPath}/addRightsRole"
											class="breadcrumb-elements-item"
											style="margin: 0; padding: 0;">
											<button type="button" class="btn blue_btn">Add
												Access Role</button>
											<!-- btn-primary -->
										</a>
									</c:if></td>
							</tr>
						</table>

					</div>

					<div class="card-body">

						<%
							if (session.getAttribute("errorMsg") != null) {
						%>
						<div
							class="alert bg-danger text-white alert-styled-left alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">
								<span>×</span>
							</button>
							<span class="font-weight-semibold">Oh snap!</span>
							<%
								out.println(session.getAttribute("errorMsg"));
							%>
						</div>

						<%
							session.removeAttribute("errorMsg");
							}
						%>
						<%
							if (session.getAttribute("successMsg") != null) {
						%>
						<div
							class="alert bg-success text-white alert-styled-left alert-dismissible">
							<button type="button" class="close" data-dismiss="alert">
								<span>×</span>
							</button>
							<span class="font-weight-semibold">Well done!</span>
							<%
								out.println(session.getAttribute("successMsg"));
							%>
						</div>
						<%
							session.removeAttribute("successMsg");
							}
						%>
						<table
							class="table table-bordered table-hover datatable-highlight1 datatable-button-html5-basic  datatable-button-print-columns1"
							id="printtable1">
							<thead>
								<tr class="bg-blue">
									<th width="10%">Sr. No.</th>
									<th>Role Name</th>
									<th>Short Name</th>
									<th>Remark</th>

									<th width="10%" class="text-center">Actions</th>
								</tr>
							</thead>
							<tbody>


								<c:forEach items="${empTypelist}" var="empTypelist"
									varStatus="count">
									<tr>

										<td>${count.index+1}</td>
										<td>${empTypelist.empTypeName}</td>
										<td>${empTypelist.empTypeShortName}</td>

										<c:choose>
											<c:when
												test="${empTypelist.empTypeRemarks=='null' || empty empTypelist.empTypeRemarks}">
												<td>-</td>
											</c:when>
											<c:otherwise>
												<td>${empTypelist.empTypeRemarks}</td>
											</c:otherwise>
										</c:choose>
										<%-- <td class="text-center"><c:if test="${editAccess == 0}">
												<a
													href="${pageContext.request.contextPath}/editAccessRole?empTypeId=${empTypelist.exVar1}"
													title="Edit"><i class="icon-pencil7"
													style="color: black;"></i></a>
											</c:if> <c:if test="${deleteAccess == 0}">
												<a
													href="${pageContext.request.contextPath}/deleteAccessRole?empTypeId=${empTypelist.exVar1}"
													onClick="return confirm('Are you sure want to delete this record');"
													title="Delete"><i class="icon-trash"
													style="color: black;"></i> </a>
											</c:if></td> --%>

										<td class="text-center"><c:if test="${editAccess == 0}">
												<a
													href="${pageContext.request.contextPath}/editAccessRole?empTypeId=${empTypelist.exVar1}"
													class="list-icons-item text-primary-600"
													data-popup="tooltip" title="" data-original-title="Edit"><i
													class="icon-pencil7"></i></a>
											</c:if> <c:if test="${deleteAccess == 0}">

												<a
													href="${pageContext.request.contextPath}/deleteAccessRole?empTypeId=${empTypelist.exVar1}"
													onClick="return confirm('Are you sure want to delete this record');"
													class="list-icons-item text-danger-600 bootbox_custom"
													data-popup="tooltip" title="" data-original-title="Edit"><i
													class="icon-trash"></i></a>
											</c:if></td>
									</tr>
								</c:forEach>

							</tbody>
						</table>



						<!-- new table with accordion start here -->


						<!-- <div class="table-responsive accordion">
							<table class="table">
								<thead>
									<tr class="bg-blue">
										<th scope="col">#</th>
										<th scope="col">Heading</th>
										<th scope="col">Heading</th>
										<th scope="col">Heading</th>
									</tr>
								</thead>
								<tbody>
									<tr class="accordion-toggle collapsed" id="accordion1"
										data-toggle="collapse" data-parent="#accordion1"
										href="#collapseOne">
										<td><span class="expand-button"></span></td>
										<td>Cell</td>
										<td>Cell</td>
										<td>Cell</td>

									</tr>
									<tr class="hide-table-padding">
										<td></td>
										<td colspan="4">
											<div id="collapseOne" class="collapse in p-3">




												<div class="row">
													<div class="col-3 row_padd">label</div>
													<div class="col-3 row_padd">value 1</div>

													<div class="col-3 row_padd">label</div>
													<div class="col-3 row_padd">
														<a href="#" class="list-icons-item text-primary-600"><i
															class="icon-pencil7"></i></a> <a href="#"
															class="list-icons-item text-danger-600 bootbox_custom"><i
															class="icon-trash"></i></a>
													</div>
												</div>
												<div class="row">
													<div class="col-3 row_padd">label</div>
													<div class="col-3 row_padd">value 1</div>

													<div class="col-3 row_padd">label</div>
													<div class="col-3 row_padd">
														<a href="#" class="list-icons-item text-primary-600"><i
															class="icon-pencil7"></i></a> <a href="#"
															class="list-icons-item text-danger-600 bootbox_custom"><i
															class="icon-trash"></i></a>
													</div>
												</div>
												<div class="row">
													<div class="col-3 row_padd">label</div>
													<div class="col-3 row_padd">value 1</div>

													<div class="col-3 row_padd">label</div>
													<div class="col-3 row_padd">
														<a href="#" class="list-icons-item text-primary-600"><i
															class="icon-pencil7"></i></a> <a href="#"
															class="list-icons-item text-danger-600 bootbox_custom"><i
															class="icon-trash"></i></a>
													</div>
												</div>
												<div class="row">
													<div class="col-3 row_padd">label</div>
													<div class="col-3 row_padd">value 1</div>

													<div class="col-3 row_padd">label</div>
													<div class="col-3 row_padd">
														<a href="#" class="list-icons-item text-primary-600"><i
															class="icon-pencil7"></i></a> <a href="#"
															class="list-icons-item text-danger-600 bootbox_custom"><i
															class="icon-trash"></i></a>
													</div>
												</div>
											</div>
										</td>
									</tr>


									<tr class="accordion-toggle collapsed" id="accordion2"
										data-toggle="collapse" data-parent="#accordion2"
										href="#collapseTwo">
										<td><span class="expand-button"></span></td>
										<td>Cell</td>
										<td>Cell</td>
										<td>Cell</td>

									</tr>
									<tr class="hide-table-padding">
										<td></td>
										<td colspan="4">
											<div id="collapseTwo" class="collapse in p-3">
												<div class="row">
													<div class="col-2">label</div>
													<div class="col-4">value</div>
													<div class="col-2">label</div>
													<div class="col-4">value</div>
												</div>
												<div class="row">
													<div class="col-2">label</div>
													<div class="col-4">value</div>
													<div class="col-2">label</div>
													<div class="col-4">value</div>
												</div>
												<div class="row">
													<div class="col-2">label</div>
													<div class="col-4">value</div>
													<div class="col-2">label</div>
													<div class="col-4">value</div>
												</div>
												<div class="row">
													<div class="col-2">label</div>
													<div class="col-4">value</div>
													<div class="col-2">label</div>
													<div class="col-4">value</div>
												</div>
											</div>
										</td>


									</tr>





								</tbody>
							</table>
						</div> -->




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

</body>
</html>