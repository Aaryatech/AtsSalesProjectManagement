package com.ats.hreasy.model;

public class CustInfo {

	private int id;

	private String compName;

	private String custName;

	private String contact;

	private String link;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCompName() {
		return compName;
	}

	public void setCompName(String compName) {
		this.compName = compName;
	}

	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}

	public String getLink() {
		return link;
	}

	public void setLink(String link) {
		this.link = link;
	}

	@Override
	public String toString() {
		return "CustInfo [id=" + id + ", compName=" + compName + ", custName=" + custName + ", contact=" + contact
				+ ", link=" + link + "]";
	}
	
	

}
