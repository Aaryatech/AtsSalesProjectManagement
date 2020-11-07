package com.ats.hreasy.model;

public class TaskDetailsWithMsg {

	private int taskId; 
	private String taskDoneDate; 
	private String message; 
	private String empName;
	public int getTaskId() {
		return taskId;
	}
	public void setTaskId(int taskId) {
		this.taskId = taskId;
	}
	public String getTaskDoneDate() {
		return taskDoneDate;
	}
	public void setTaskDoneDate(String taskDoneDate) {
		this.taskDoneDate = taskDoneDate;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
	public String getEmpName() {
		return empName;
	}
	public void setEmpName(String empName) {
		this.empName = empName;
	}
	@Override
	public String toString() {
		return "TaskDetailsWithMsg [taskId=" + taskId + ", taskDoneDate=" + taskDoneDate + ", message=" + message
				+ ", empName=" + empName + "]";
	}
	 
	
	
	

}
