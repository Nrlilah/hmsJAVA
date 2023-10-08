package com.hms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.beans.Patient;

/**
 * Servlet implementation class AddPatient
 */
public class AddPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPatient() {
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
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		System.out.println("ini patient add");
		String name = request.getParameter("name").trim();
		String identificationcard = request.getParameter("identificationcard").trim();
		String gender = request.getParameter("gender").trim();
		System.out.println(gender);
		String phoneNum = request.getParameter("phoneNum").trim();
		String nationality = request.getParameter("nationality").trim();
		String dateOfBirth = request.getParameter("date").trim();
		String address = request.getParameter("streetAddress").trim() + ", " + request.getParameter("postcode").trim()
				+ ", " + request.getParameter("city").trim() + ", " + request.getParameter("state").trim();
		String appointmentDate = request.getParameter("appointmentDate");
		String status = request.getParameter("status").trim();
		System.out.println(
				name + identificationcard + phoneNum + nationality + dateOfBirth + address + appointmentDate + status);
		System.out.println("AAAAAAAAAAAAA" + name);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();

			// Use prepared statement to insert patient record
			PreparedStatement pst2 = con.prepareStatement("INSERT INTO patient (name, ic, gender, phonenumber, nationality, dateofbirth, address, appointmentDate, status, statusprogress) "
					+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, 'Registered')");
			pst2.setString(1, name);
			pst2.setString(2, identificationcard);
			pst2.setString(3, gender);
			pst2.setString(4, phoneNum);
			pst2.setString(5, nationality);
			pst2.setString(6, dateOfBirth);
			pst2.setString(7, address);
			pst2.setString(8, appointmentDate);
			pst2.setString(9, status);
			pst2.executeUpdate();

			// Use prepared statement to retrieve patient records
			String selectPatientQuery = "SELECT * FROM patient";
			PreparedStatement pstSelectPatient = con.prepareStatement(selectPatientQuery);
			ResultSet rs2 = pstSelectPatient.executeQuery();

			// Use prepared statements to retrieve status counts
			String countRedQuery = "SELECT COUNT(idPatient) AS red FROM patient WHERE status = 1";
			String countGreenQuery = "SELECT COUNT(idPatient) AS green FROM patient WHERE status = 2";
			String countBlueQuery = "SELECT COUNT(idPatient) AS blue FROM patient WHERE status = 3";

			PreparedStatement pstCountRed = con.prepareStatement(countRedQuery);
			PreparedStatement pstCountGreen = con.prepareStatement(countGreenQuery);
			PreparedStatement pstCountBlue = con.prepareStatement(countBlueQuery);

			ResultSet rs3 = pstCountRed.executeQuery();
			ResultSet rs4 = pstCountGreen.executeQuery();
			ResultSet rs5 = pstCountBlue.executeQuery();

			if (rs3.next()) {
				session.setAttribute("red", rs3.getString("red"));
			}
			if (rs4.next()) {
				session.setAttribute("green", rs4.getString("green"));
			}
			if (rs5.next()) {
				session.setAttribute("blue", rs5.getString("blue"));
			}

			ArrayList<Patient> patientlist = new ArrayList<Patient>();

			while (rs2.next()) {
				Patient patient = new Patient();
				patient.setIc(rs2.getString("ic"));
				patient.setName(rs2.getString("name"));
				patient.setGender(rs2.getString("gender"));
				patient.setStatus(Integer.parseInt(rs2.getString("status")));
				patient.setStatusprogress(rs2.getString("statusprogress"));
				patientlist.add(patient);
			}

			session.setAttribute("PatientData", patientlist);
			response.sendRedirect("jsp/Welcome.jsp");

			// Close resources
			rs2.close();
			pstSelectPatient.close();
			pstCountRed.close();
			pstCountGreen.close();
			pstCountBlue.close();
			pst2.close();
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
