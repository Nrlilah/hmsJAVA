package com.hms.beans;

public class Medication {
	private int medicationid;
	private int patientid;
	private String dosage;
	private String frequency;
	private String startdatetime;
	private String enddatetime;
	private String duration;
	private String notes;
	private int prescribeby;
	private int medicationList_id;
	private String medicationItem;

	public int getMedicationid() {
		return medicationid;
	}

	public void setMedicationid(int medicationid) {
		this.medicationid = medicationid;
	}

	public int getPatientid() {
		return patientid;
	}

	public void setPatientid(int patientid) {
		this.patientid = patientid;
	}

	public String getDosage() {
		return dosage;
	}

	public void setDosage(String dosage) {
		this.dosage = dosage;
	}

	public String getFrequency() {
		return frequency;
	}

	public void setFrequency(String frequency) {
		this.frequency = frequency;
	}

	public String getStartdatetime() {
		return startdatetime;
	}

	public void setStartdatetime(String startdatetime) {
		this.startdatetime = startdatetime;
	}

	public String getEnddatetime() {
		return enddatetime;
	}

	public void setEnddatetime(String enddatetime) {
		this.enddatetime = enddatetime;
	}

	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public int getPrescribeby() {
		return prescribeby;
	}

	public void setPrescribeby(int prescribeby) {
		this.prescribeby = prescribeby;
	}

	public int getMedicationList_id() {
		return medicationList_id;
	}

	public void setMedicationList_id(int medicationList_id) {
		this.medicationList_id = medicationList_id;
	}

	public String getMedicationItem() {
		return medicationItem;
	}

	public void setMedicationItem(String medicationItem) {
		this.medicationItem = medicationItem;
	}

}
