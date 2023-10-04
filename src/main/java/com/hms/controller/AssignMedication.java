package com.hms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
		session.setAttribute("patientID", patientID);
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
		String duration = "1000";
		System.out.println(medicationItem + Dosage + startDateTime + endDateTime + notes);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			PreparedStatement pst = con
					.prepareStatement("select medicationList_id FROM medication_list WHERE medicationItem = ? ");
			pst.setString(1, medicationItem);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				stat.executeUpdate(
						"insert into medication(medicationList_id, patientid, dosage, frequency, startdatetime, enddatetime, duration, notes, prescribeby) values("+ rs.getInt("medicationList_id")+","
								+ session.getAttribute("patientID") + ",'" + Dosage + "','" + Frequency + "','"
								+ startDateTime + "','" + endDateTime + "','" + duration + "','" + notes + "',"
								+ session.getAttribute("USERid") + ")");
			}
			// doGet(request, response);
			response.sendRedirect("jsp/AssignMedication.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();

		}
	}
}
