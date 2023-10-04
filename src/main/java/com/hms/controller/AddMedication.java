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

import com.hms.beans.MedicationList;

/**
 * Servlet implementation class AddMedication
 */
public class AddMedication extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddMedication() {
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
		ArrayList<MedicationList> medicationlistlist = new ArrayList<MedicationList>();
		String medicationItem = request.getParameter("medicationItem").trim();
		System.out.println(medicationItem);
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into medication_list (medicationItem) " + "values('" + medicationItem + "')");
			PreparedStatement pst7 = con.prepareStatement("select * from medication_list");
			ResultSet rs7 = pst7.executeQuery();
			while (rs7.next()) {
				MedicationList medicationList = new MedicationList();
				medicationList.setMedicationList_id(Integer.parseInt(rs7.getString("medicationList_id")));
				medicationList.setMedicationItem(rs7.getString("medicationItem"));
				medicationlistlist.add(medicationList);
			}
			session.setAttribute("MedicationListListData", medicationlistlist);
			response.sendRedirect("jsp/Administration.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
