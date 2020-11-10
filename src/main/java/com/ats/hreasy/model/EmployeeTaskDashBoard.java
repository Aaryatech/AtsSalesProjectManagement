package com.ats.hreasy.model;

import java.util.List;
 

public class EmployeeTaskDashBoard {

	private int empId;
	private String empName;
	 
	private List<EmpTaskStatusCount> empTaskStatusWiseDetailList;

	public int getEmpId() {
		return empId;
	}

	public void setEmpId(int empId) {
		this.empId = empId;
	}

	public String getEmpName() {
		return empName;
	}

	public void setEmpName(String empName) {
		this.empName = empName;
	}

	public List<EmpTaskStatusCount> getEmpTaskStatusWiseDetailList() {
		return empTaskStatusWiseDetailList;
	}

	public void setEmpTaskStatusWiseDetailList(List<EmpTaskStatusCount> empTaskStatusWiseDetailList) {
		this.empTaskStatusWiseDetailList = empTaskStatusWiseDetailList;
	}

	@Override
	public String toString() {
		return "EmployeeTaskDashBoard [empId=" + empId + ", empName=" + empName + ", empTaskStatusWiseDetailList="
				+ empTaskStatusWiseDetailList + "]";
	}
	
	
	
}
