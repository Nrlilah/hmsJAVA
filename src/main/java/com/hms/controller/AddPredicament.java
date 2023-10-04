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

import com.hms.beans.PredicamentList;

/**
 * Servlet implementation class AddPredicament
 */
public class AddPredicament extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPredicament() {
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
		String predicament_name = request.getParameter("predicament_name").trim();
		System.out.println(predicament_name);
		ArrayList<PredicamentList> predicamentlistlist = new ArrayList<PredicamentList>();
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			stat.executeUpdate(
					"insert into predicament_list (predicament_name) " + "values('" + predicament_name + "')");
			PreparedStatement pst8 = con.prepareStatement("select * from predicament_list");
			ResultSet rs8 = pst8.executeQuery();while (rs8.next()) {
				PredicamentList predicamentlist = new PredicamentList();
				predicamentlist.setPredicamentList_id(Integer.parseInt(rs8.getString("predicamentList_id")));
				predicamentlist.setPredicament_name(rs8.getString("predicament_name"));
				predicamentlistlist.add(predicamentlist);
			}session.setAttribute("PredicamentListlListData", predicamentlistlist);

			response.sendRedirect("jsp/Administration.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
