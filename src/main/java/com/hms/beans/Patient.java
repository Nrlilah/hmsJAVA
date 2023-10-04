package com.hms.beans;

import java.util.Date;

public class Patient {
	private String name;
	private String ic;
	private String gender;
	private String phonenumber;
	private String natioality;
	private Date dateofbirth;
	private String address;
	private String appointmentDate;
	private int status;
	private String statusprogress;

	public String getStatusprogress() {
		return statusprogress;
	}

	public void setStatusprogress(String statusprogress) {
		this.statusprogress = statusprogress;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIc() {
		return ic;
	}

	public void setIc(String ic) {
		this.ic = ic;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhonenumber() {
		return phonenumber;
	}

	public void setPhonenumber(String phonenumber) {
		this.phonenumber = phonenumber;
	}

	public String getNatioality() {
		return natioality;
	}

	public void setNatioality(String natioality) {
		this.natioality = natioality;
	}

	public Date getDateofbirth() {
		return dateofbirth;
	}

	public void setDateofbirth(Date dateofbirth) {
		this.dateofbirth = dateofbirth;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAppointmentDate() {
		return appointmentDate;
	}

	public void setAppointmentDate(String appointmentDate) {
		this.appointmentDate = appointmentDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}