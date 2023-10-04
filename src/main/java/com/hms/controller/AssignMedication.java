package com.hms.controller;

import java.io.IOException;
import java.sql.Connection;
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
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// HttpSession session = request.getSession();
		System.out.println("Ini medication");
		String Item = request.getParameter("Item").trim();
		String Dosage = request.getParameter("Dosage").trim();
		String Frequency = request.getParameter("Frequency").trim();
		String startDateTime = request.getParameter("startDateTime").trim();
		String endDateTime = request.getParameter("endDateTime").trim();
		String notes = request.getParameter("notes").trim();
		String duration = "1000";
		System.out.println(Item + Dosage + startDateTime + endDateTime + notes);

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			stat.executeUpdate(
					"insert into medication(medicationList_id, patientid, dosage, frequency, startdatetime, enddatetime, duration, notes, prescribe_by) values(1,1,'" + Dosage +"','" + Frequency + "','" + startDateTime + "','" + endDateTime+"','" + duration+"','" + notes
							+ "',5)");

			// doGet(request, response);
			response.sendRedirect("jsp/AssignMedication.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();

		}
	}
}
