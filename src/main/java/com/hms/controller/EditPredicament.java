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
 * Servlet implementation class EditPredicament
 */
public class EditPredicament extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EditPredicament() {
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
		int predicamentList_id = Integer.parseInt(request.getParameter("predicamentList_id").trim());
		String predicament_nameEDIT = request.getParameter("predicament_nameEDIT").trim();
		ArrayList<PredicamentList> predicamentlistlist = new ArrayList<PredicamentList>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();

			String sql = "update predicament_list SET predicament_name = ? WHERE predicamentList_id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, predicament_nameEDIT);
			preparedStatement.setInt(2, predicamentList_id);

			preparedStatement.executeUpdate();
			System.out.println("ok5");
			PreparedStatement pst = con.prepareStatement("select * from predicament_list");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				PredicamentList predicamentlist = new PredicamentList();
				predicamentlist.setPredicamentList_id(Integer.parseInt(rs.getString("predicamentList_id")));
				predicamentlist.setPredicament_name(rs.getString("predicament_name"));
				predicamentlistlist.add(predicamentlist);
			}
			session.setAttribute("PredicamentListListData", predicamentlistlist);		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		response.sendRedirect("jsp/Administration.jsp");
	}

}
