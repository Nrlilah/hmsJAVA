package com.hms.beans;

public class Predicament {
	private int predicament_id;
	private int patient_id;
	private String predicament_name;

	public String getPredicament_name() {
		return predicament_name;
	}

	public void setPredicament_name(String predicament_name) {
		this.predicament_name = predicament_name;
	}

	public int getPredicament_id() {
		return predicament_id;
	}

	public void setPredicamentList_id(int predicament_id) {
		this.predicament_id = predicament_id;
	}

	public int getPatient_id() {
		return patient_id;
	}

	public void setPatient_id(int patient_id) {
		this.patient_id = patient_id;
	}
}
