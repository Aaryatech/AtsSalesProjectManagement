package com.ats.hreasy.model;

import java.util.List;

public class DashboardData {

	private DashBoardSummary dashBoardSummary;
	private List<TaskDetailsEmpName> pendingTask;
	public DashBoardSummary getDashBoardSummary() {
		return dashBoardSummary;
	}
	public void setDashBoardSummary(DashBoardSummary dashBoardSummary) {
		this.dashBoardSummary = dashBoardSummary;
	}
	public List<TaskDetailsEmpName> getPendingTask() {
		return pendingTask;
	}
	public void setPendingTask(List<TaskDetailsEmpName> pendingTask) {
		this.pendingTask = pendingTask;
	}
	@Override
	public String toString() {
		return "DashboardData [dashBoardSummary=" + dashBoardSummary + ", pendingTask=" + pendingTask + "]";
	}
	
	

}
