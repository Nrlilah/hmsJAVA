package com.hms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.beans.Medication;
import com.hms.beans.Predicament;

/**
 * Servlet implementation class DeleteMedication
 */
public class DeleteMedication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteMedication() {
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		ArrayList<Medication> Medicationlist = new ArrayList<Medication>();
		int medicationID = Integer.parseInt(request.getParameter("medicationID").toString());
		int patientID = Integer.parseInt(request.getParameter("patientID").toString());
		try {

			System.out.print("be");
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con
					.prepareStatement("DELETE FROM medication WHERE medicationid = ? and patientid = ?");
			pst.setInt(1, medicationID);
			pst.setInt(2, patientID);

			pst.executeUpdate();

			System.out.print("eeeee");
			pst = con.prepareStatement(
					"SELECT * FROM medication INNER JOIN medication_list ON medication.medicationList_id = medication_list.medicationList_id WHERE patientid = ?");

			pst.setInt(1, patientID);
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {

				System.out.print("OK3");
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
			System.out.print("OK3");
			session.setAttribute("MedicationListData", Medicationlist);
			response.sendRedirect("jsp/AssignMedication.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
