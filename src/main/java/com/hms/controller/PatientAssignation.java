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
 * Servlet implementation class PatientAssignation
 */
public class PatientAssignation extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public PatientAssignation() {
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
		HttpSession session = request.getSession();
		ArrayList<Patient> patientlist = new ArrayList<Patient>();
		String patientAssignedIC = request.getParameter("patientAssignedIC").trim();
		String doctor = request.getParameter("doctor").trim();
		System.out.println("AAAAAAAAAAAAA" + patientAssignedIC + doctor);
		System.out.print(patientAssignedIC);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement("select id from user where name = '" + doctor + "'");
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				String doctorID = rs.getString("id");
				Statement stat = con.createStatement();
				stat.executeUpdate("update patient set doctorid = " + doctorID + ", statusprogress= 'Assigned' where ic = '"+ patientAssignedIC +"'");
				
				PreparedStatement pst2 = con.prepareStatement("select * from patient");
				ResultSet rs2 = pst2.executeQuery();
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
			}
			response.sendRedirect("jsp/PatientAssignation.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		// doGet(request, response);
	}

}
