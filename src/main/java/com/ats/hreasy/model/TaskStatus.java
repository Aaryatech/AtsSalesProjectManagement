package com.ats.hreasy.model;

public class TaskStatus {

	private int mTaskStatusId;

	private int mdAccTypeId;
	
	private int mTaskStatusSequence;

	private String mTaskStatusName;

	private String mTaskStatusDesc;

	private int mTaskIsClosed;

	private int delStatus;

	private int isActive;

	private int makerUserId;

	private String makerDatetime;

	private int exInt1, exInt2;

	private String exVar1, exVar2;
	private int mTaskIsInternal;

	private int mTaskPts;
	
	public int getmTaskStatusId() {
		return mTaskStatusId;
	}

	public void setmTaskStatusId(int mTaskStatusId) {
		this.mTaskStatusId = mTaskStatusId;
	}

	public int getMdAccTypeId() {
		return mdAccTypeId;
	}

	public void setMdAccTypeId(int mdAccTypeId) {
		this.mdAccTypeId = mdAccTypeId;
	}

	public int getmTaskStatusSequence() {
		return mTaskStatusSequence;
	}

	public void setmTaskStatusSequence(int mTaskStatusSequence) {
		this.mTaskStatusSequence = mTaskStatusSequence;
	}

	public String getmTaskStatusName() {
		return mTaskStatusName;
	}

	public void setmTaskStatusName(String mTaskStatusName) {
		this.mTaskStatusName = mTaskStatusName;
	}

	public String getmTaskStatusDesc() {
		return mTaskStatusDesc;
	}

	public void setmTaskStatusDesc(String mTaskStatusDesc) {
		this.mTaskStatusDesc = mTaskStatusDesc;
	}

	public int getmTaskIsClosed() {
		return mTaskIsClosed;
	}

	public void setmTaskIsClosed(int mTaskIsClosed) {
		this.mTaskIsClosed = mTaskIsClosed;
	}

	public int getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(int delStatus) {
		this.delStatus = delStatus;
	}

	public int getIsActive() {
		return isActive;
	}

	public void setIsActive(int isActive) {
		this.isActive = isActive;
	}

	public int getMakerUserId() {
		return makerUserId;
	}

	public void setMakerUserId(int makerUserId) {
		this.makerUserId = makerUserId;
	}

	public String getMakerDatetime() {
		return makerDatetime;
	}

	public void setMakerDatetime(String makerDatetime) {
		this.makerDatetime = makerDatetime;
	}

	public int getExInt1() {
		return exInt1;
	}

	public void setExInt1(int exInt1) {
		this.exInt1 = exInt1;
	}

	public int getExInt2() {
		return exInt2;
	}

	public void setExInt2(int exInt2) {
		this.exInt2 = exInt2;
	}

	public String getExVar1() {
		return exVar1;
	}

	public void setExVar1(String exVar1) {
		this.exVar1 = exVar1;
	}

	public String getExVar2() {
		return exVar2;
	}

	public void setExVar2(String exVar2) {
		this.exVar2 = exVar2;
	}

	public int getmTaskIsInternal() {
		return mTaskIsInternal;
	}

	public void setmTaskIsInternal(int mTaskIsInternal) {
		this.mTaskIsInternal = mTaskIsInternal;
	}

	public int getmTaskPts() {
		return mTaskPts;
	}

	public void setmTaskPts(int mTaskPts) {
		this.mTaskPts = mTaskPts;
	}

	@Override
	public String toString() {
		return "TaskStatus [mTaskStatusId=" + mTaskStatusId + ", mdAccTypeId=" + mdAccTypeId + ", mTaskStatusSequence="
				+ mTaskStatusSequence + ", mTaskStatusName=" + mTaskStatusName + ", mTaskStatusDesc=" + mTaskStatusDesc
				+ ", mTaskIsClosed=" + mTaskIsClosed + ", delStatus=" + delStatus + ", isActive=" + isActive
				+ ", makerUserId=" + makerUserId + ", makerDatetime=" + makerDatetime + ", exInt1=" + exInt1
				+ ", exInt2=" + exInt2 + ", exVar1=" + exVar1 + ", exVar2=" + exVar2 + ", mTaskIsInternal="
				+ mTaskIsInternal + ", mTaskPts=" + mTaskPts + "]";
	}

	
}
