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
		String address = request.getParameter("streetAddress").trim() + ", " + request.getParameter("postcode").trim() + ", "
				+ request.getParameter("city").trim() + ", " + request.getParameter("state").trim();
		String appointmentDate = request.getParameter("appointmentDate");
		String status = request.getParameter("status").trim();
		System.out
				.println(name + identificationcard + phoneNum + nationality + dateOfBirth + address + appointmentDate+status);
		System.out.println("AAAAAAAAAAAAA" + name);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into patient(name, ic, gender, phonenumber, nationality, dateofbirth, address, appointmentDate, status, statusprogress) values('" + name + "','" + identificationcard
					+ "','" + gender + "','" + phoneNum + "','" + nationality + "','" + dateOfBirth +  "','" + address + "','" + appointmentDate + "','" + status +"','Registered')");
			ArrayList<Patient> patientlist = new ArrayList<Patient>();
			PreparedStatement pst2 = con.prepareStatement("select * from patient");
			ResultSet rs2 = pst2.executeQuery();
			
			PreparedStatement pst3 = con.prepareStatement("select count(idPatient) as red from patient where status = 1");
			ResultSet rs3 = pst3.executeQuery();
			
			PreparedStatement pst4 = con.prepareStatement("select count(idPatient) as green from patient where status = 2");
			ResultSet rs4 = pst4.executeQuery();
			
			PreparedStatement pst5 = con.prepareStatement("select count(idPatient) as blue from patient where status = 3");
			ResultSet rs5 = pst5.executeQuery();
			
			
			
			if (rs3.next()) {
				session.setAttribute("red", rs3.getString("red"));
			}
			if (rs4.next()) {
				session.setAttribute("green", rs4.getString("green"));
			}
			if (rs5.next()) {
				session.setAttribute("blue", rs5.getString("blue"));
			}
			while (rs2.next()) {
				Patient patient = new Patient();
				patient.setIc(rs2.getString("ic"));
				patient.setName(rs2.getString("name"));
				patient.setGender(rs2.getString("gender"));
				patient.setStatus(Integer.parseInt(rs2.getString("status")));
				patient.setStatusprogress(rs2.getString("statusprogress"));
				patientlist.add(patient);
			}
			System.out.print(patientlist);
			session.setAttribute("PatientData", patientlist);
			response.sendRedirect("jsp/Welcome.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
