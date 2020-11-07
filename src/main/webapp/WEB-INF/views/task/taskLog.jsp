<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class=" border-top-teal">

	<div class="list-feed">

		<c:forEach items="${logList}" var="logList">
			<div class="list-feed-item">
				<a href="#">${logList.taskTittle}</a> -
				${logList.taskClientDiscussion}
				<div class="text-muted">${logList.taskDoneDate}&nbsp;-&nbsp;${logList.employeeName}</div>
			</div>
		</c:forEach>
		<!-- <div class="list-feed-item">
			User <a href="#">Christopher Wallace</a> from Google is awaiting for
			staff reply
			<div class="text-muted">Jan 11, 10:25</div>
		</div>

		<div class="list-feed-item">
			Ticket <strong>#43683</strong> has been resolved by <a href="#">Victoria
				Wilson</a>
			<div class="text-muted">Jan 10, 09:37</div>
		</div>

		<div class="list-feed-item">
			<a href="#">Eugene Kopyov</a> merged <strong>Master</strong>, <strong>Demo</strong>
			and <strong>Dev</strong> branches
			<div class="text-muted">Jan 9, 08:28</div>
		</div>

		<div class="list-feed-item">
			All sellers have received payouts for December, 2016!
			<div class="text-muted">Jan 8, 07:58</div>
		</div>

		<div class="list-feed-item">
			<a href="#">Chris Arney</a> created a new ticket <strong>#43136</strong>
			and assigned to <a href="#">John Nod</a>
			<div class="text-muted">Jan 7, 06:32</div>
		</div> -->
	</div>
</div>