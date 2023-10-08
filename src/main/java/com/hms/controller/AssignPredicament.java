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

import com.hms.beans.Predicament;

/**
 * Servlet implementation class AssignPredicament
 */
public class AssignPredicament extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AssignPredicament() {
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
		ArrayList<Predicament> Predicamentlist = new ArrayList<Predicament>();
		String predicament_name = request.getParameter("predicament_name").trim();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			PreparedStatement pst = con
					.prepareStatement("select predicamentList_id FROM predicament_list WHERE predicament_name = ? ");
			pst.setString(1, predicament_name);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				stat.executeUpdate("insert into predicament(predicament_id, patient_id) values("
						+ rs.getInt("predicamentList_id") + "," + session.getAttribute("patientID") + ")");

				pst = con.prepareStatement(
						"SELECT * FROM predicament INNER JOIN predicament_list ON predicament.predicament_id = predicament_list.predicamentList_id WHERE patient_id = ?");
				System.out.print("OK1");
				pst.setInt(1, Integer.parseInt(session.getAttribute("patientID").toString()));
				ResultSet rs2 = pst.executeQuery();
				while (rs2.next()) {
					Predicament predicament = new Predicament();
					predicament.setPredicamentList_id(rs2.getInt("predicamentList_id"));
					predicament.setPredicament_name(rs2.getString("predicament_name"));
					System.out.print("OK2");
					Predicamentlist.add(predicament);
				}
				System.out.print("OK3");
				session.setAttribute("PredicamentListData", Predicamentlist);
				response.sendRedirect("jsp/AssignMedication.jsp");
			}
		} catch (Exception ex) {
			ex.printStackTrace();

		}
	}

}
