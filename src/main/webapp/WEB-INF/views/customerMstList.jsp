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
										<i class="icon-list-unordered "></i> Customer Master List
									</h5></td>
								<td width="40%" align="right"><a
									href="${pageContext.request.contextPath}/addCustMaster"
									class="breadcrumb-elements-item"> <button type="button" class="btn blue_btn">New Customer</button>
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

									<th width="10%" class="text-center">Sr. No.</th>

									<th class="text-center">Customer Name</th>
									<th class="text-center">Customer Email</th>
									<th class="text-center">Contact P Name</th>

									<th class="text-center">Contact P Mob</th>
									<th class="10%">Contact P Mob2</th>
									<th class="10%">Contact P Email</th>
									<!-- <th class="10%">Last TouchBase</th> -->
									<th class="10%">Action</th>
								</tr>
							</thead>
							<tbody>

								<c:forEach items="${custList}" var="cust" varStatus="count">
									<tr>
										<td>${count.index+1}</td>
										<td>${cust.customerName}</td>
										<td>${cust.customerEmail}</td>
										<td>${cust.cpName}</td>
										<td>${cust.cpMobile}</td>
										<td>${cust.cpMobile2}</td>
										<td>${cust.cpEmail}</td>
										<td class="text-center"><a
											href="${pageContext.request.contextPath}/editCustMst?custId=${cust.custId}"
											class="list-icons-item text-primary-600" data-popup="tooltip"
											title="" data-original-title="Edit"><i
												class="icon-pencil7"></i></a> <a
											href="${pageContext.request.contextPath}/deleteCustMst?custId=${cust.custId}"
											data-popup="tooltip" title=""
											data-original-title="Delete Customer"> <i  class="icon-trash"></i>
												<!-- 		Add Inquiry -->
										</a></td>
										

										<%-- <td>${cust.cpInfo}&nbsp;(${cust.accCode})</td>
										<td>${cust.cpContact}</td>
										<td><a href="${cust.accWebsite}" target="_blank">${cust.cpInfo2}</a></td>
										<td>${cust.cityState}</td>
										<td>${cust.accAtsRating}</td>
										<td>-</td>
										<td>-</td>
										<td class="text-center"><a
											href="${pageContext.request.contextPath}/editLms?lmsId=${cust.lmsId}"
											class="list-icons-item text-primary-600" data-popup="tooltip"
											title="" data-original-title="Edit"><i
												class="icon-pencil7"></i></a> <a
											href="${pageContext.request.contextPath}/addEnquiry?Cid=${cust.lmsId}"
											data-popup="tooltip" title=""
											data-original-title="Add Inquiry"> <i class="icon-add"></i>
												<!-- 		Add Inquiry -->
										</a></td>

											<td class="text-center">
											<c:if test="${editAccess == 0}"> <a
											href="${pageContext.request.contextPath}/editTag?tagId=${tag.mTagId}"
											class="list-icons-item text-primary-600" data-popup="tooltip"
											title="" data-original-title="Edit"><i
												class="icon-pencil7"></i></a> </c:if> <c:if test="${deleteAccess == 0}">


											<a href="#"
											class="list-icons-item text-danger-600 bootbox_custom"
											 data-popup="tooltip" title=""
											data-original-title="Delete" data-uuid="${tag.mTagId}"><i class="icon-trash"></i></a> </c:if>
										</td> --%>
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
												location.href = "${pageContext.request.contextPath}/deleteTag?tagId="
														+ uuid;

											}
										}
									});
						});
	</Script>
</body>
</html>