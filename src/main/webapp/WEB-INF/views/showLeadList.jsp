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
										<i class="icon-list-unordered"></i> LEAD LIST
									</h5></td>
								<td width="40%" align="right"><a
									href="${pageContext.request.contextPath}/addLead"
									class="breadcrumb-elements-item">
										<button type="button" class="btn blue_btn">NEW LEAD</button>
								</a><a href="${pageContext.request.contextPath}/importLead"
									class="breadcrumb-elements-item">
										<button type="button" class="btn blue_btn">Import
											Lead</button>
								</a><a href="${pageContext.request.contextPath}/sendMailer"
									class="breadcrumb-elements-item">
										<button type="button" class="btn blue_btn">Send
											Diwali Mail</button>
								</a></td>
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

									<th width="10%" class="text-center">SR. N0.</th>
									<th class="text-center">Company Name</th>
									<!-- <th class="text-center">Customer Name</th> -->
									<th class="text-center">Type</th>
									<th class="text-center">Channel</th>
									<th class="text-center">ACC Tag</th>
									<th class="text-center">Contact Person Info</th>
									<th width="10%" class="text-center">Action</th>
								</tr>
							</thead>
							<tbody>


								<c:forEach items="${list}" var="list" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td>${list.accCompany}</td>
										<%-- <td>${list.accCompany}</td> --%>
										<td><c:choose>
												<c:when test="${list.mdAccTypeId==1}">Customer</c:when>
												<c:otherwise>Collaborator</c:otherwise>
											</c:choose></td>
										<td>${list.channelName}</td>
										<td>${list.tagNames}</td>
										<td>${list.cpInfo}</td>
										<td class="text-center">
											<%-- <c:if test="${editAccess == 0}"> --%> <a
											href="${pageContext.request.contextPath}/editLms?lmsId=${list.lmsId}"
											class="list-icons-item text-primary-600" data-popup="tooltip"
											title="" data-original-title="Edit"><i
												class="icon-pencil7"></i></a> <%-- </c:if> <c:if test="${deleteAccess == 0}"> --%>


											<a href="javascript:void(0)"
											class="list-icons-item text-danger-600 bootbox_custom"
											data-uuid="${list.lmsId}" data-popup="tooltip" title=""
											data-original-title="Delete"><i class="icon-trash"></i></a> <%-- </c:if> --%>
										</td>
									</tr>
								</c:forEach>

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
	<script>
		// Custom bootbox dialog
		$('.bootbox_custom')
				.on(
						'click',
						function() {
							var uuid = $(this).data("uuid") // will return the number 123
							bootbox
									.confirm({
										title : 'Confirm ',
										message : 'Are you sure you want to delete selected records ?',
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
												location.href = "${pageContext.request.contextPath}/deleteLead?lmsId="
														+ uuid;

											}
										}
									});
						});
	</Script>
</body>
</html>