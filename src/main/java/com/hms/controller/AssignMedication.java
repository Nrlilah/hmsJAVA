package com.hms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.Period;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.beans.Medication;
import com.hms.beans.Predicament;

/**
 * Servlet implementation class AssignMedication
 */
public class AssignMedication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AssignMedication() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int patientID = Integer.parseInt(request.getParameter("patientID"));
		String patientName = request.getParameter("patientName").toString();
		ArrayList<Medication> Medicationlist = new ArrayList<Medication>();
		ArrayList<Predicament> Predicamentlist = new ArrayList<Predicament>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT * FROM medication INNER JOIN medication_list ON medication.medicationList_id = medication_list.medicationList_id WHERE patientid = ?");

			pst.setInt(1, patientID);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				Medication medication = new Medication();
				medication.setMedicationid(rs.getInt("medicationid"));
				medication.setPatientid(rs.getInt("patientid"));
				medication.setDosage(rs.getString("dosage"));
				medication.setFrequency(rs.getString("frequency"));
				medication.setStartdatetime(rs.getString("startdatetime"));
				medication.setEnddatetime(rs.getString("enddatetime"));
				medication.setDuration(rs.getString("duration"));
				medication.setNotes(rs.getString("notes"));
				medication.setPrescribeby(rs.getInt("prescribeby"));
				medication.setMedicationList_id(rs.getInt("medicationList_id"));
				medication.setMedicationItem(rs.getString("medicationItem"));
				Medicationlist.add(medication);
			}
			session.setAttribute("MedicationListData", Medicationlist);
			pst.close();
		} catch (Exception ex) {
			ex.printStackTrace();

		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT * FROM predicament INNER JOIN predicament_list ON predicament.predicament_id = predicament_list.predicamentList_id WHERE patient_id = ?");

			pst.setInt(1, Integer.parseInt(session.getAttribute("patientID").toString()));
			ResultSet rs2 = pst.executeQuery();
			while (rs2.next()) {
				Predicament predicament = new Predicament();
				predicament.setPredicamentList_id(rs2.getInt("predicamentList_id"));
				predicament.setPredicament_name(rs2.getString("predicament_name"));
				Predicamentlist.add(predicament);
			}
			session.setAttribute("PredicamentListData", Predicamentlist);
			pst.close();
		} catch (Exception ex) {
			ex.printStackTrace();

		}

		session.setAttribute("patientID", patientID);
		session.setAttribute("patientName", patientName);
		response.sendRedirect("jsp/AssignMedication.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String medicationItem = request.getParameter("medicationItem").trim();
		String Dosage = request.getParameter("Dosage").trim();
		String Frequency = request.getParameter("Frequency").trim();
		String startDateTime = request.getParameter("startDateTime").trim();
		String endDateTime = request.getParameter("endDateTime").trim();
		String notes = request.getParameter("notes").trim();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate startDate = LocalDate.parse(startDateTime, formatter);
		LocalDate endDate = LocalDate.parse(endDateTime, formatter);
		Period period = Period.between(startDate, endDate);
		int duration = period.getDays();
		System.out.println(medicationItem + Dosage + startDateTime + endDateTime + notes);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			//Statement stat = con.createStatement();
			PreparedStatement pst = con
					.prepareStatement("select medicationList_id FROM medication_list WHERE medicationItem = ? ");
			pst.setString(1, medicationItem);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				PreparedStatement pst2 = con.prepareStatement("INSERT INTO medication (medicationList_id, patientid, dosage, frequency, startdatetime, enddatetime, duration, notes, prescribeby) "
						+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)");
				pst2.setInt(1, rs.getInt("medicationList_id"));
				pst2.setInt(2, (int) session.getAttribute("patientID"));
				pst2.setString(3, Dosage);
				pst2.setString(4, Frequency);
				pst2.setString(5, startDateTime);
				pst2.setString(6, endDateTime);
				pst2.setInt(7, duration);
				pst2.setString(8, notes);
				pst2.setInt(9, (int) session.getAttribute("USERid"));
				
				int rowsAffected = pst2.executeUpdate();
			}
			// doGet(request, response);
			response.sendRedirect("jsp/AssignMedication.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();

		}
	}
}
