package com.remarkgroup.model;

import java.io.Serializable;
import java.sql.Time;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
public class Visitor implements Serializable {
	
	@Id
    @GeneratedValue(strategy=GenerationType.AUTO)
	private int id;
	
	private String visitorName;
	
	private String hostName;
	
	private String purpose;
	
	private String companyName;
	
	private String mobile;
	
	private String note;
	
	private Date dateVisit;
	
	private Time timeVisit;
	
	//private User user;
	
	public Visitor() {}

	public Visitor(String visitorName, User user, String companyName, Date dateVisit, Time timeVisit) {
		this.visitorName = visitorName;
		//this.user = user;
		this.companyName = companyName;
		this.dateVisit = dateVisit;
		this.timeVisit = timeVisit;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getVisitorName() {
		return visitorName;
	}

	public void setVisitorName(String visitorName) {
		this.visitorName = visitorName;
	}	

//	public User getUser() {
//		return user;
//	}
//
//	public void setUser(User user) {
//		this.user = user;
//	}

	public String getHostName() {
		return hostName;
	}

	public void setHostName(String hostName) {
		this.hostName = hostName;
	}

	public String getPurpose() {
		return purpose;
	}

	public void setPurpose(String purpose) {
		this.purpose = purpose;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

	public Date getDateVisit() {
		return dateVisit;
	}

	public void setDateVisit(Date dateVisit) {
		this.dateVisit = dateVisit;
	}

	public Time getTimeVisit() {
		return timeVisit;
	}

	public void setTimeVisit(Time timeVisit) {
		this.timeVisit = timeVisit;
	}	

}
