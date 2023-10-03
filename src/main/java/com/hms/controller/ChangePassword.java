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
 * Servlet implementation class ChangePassword
 */
public class ChangePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ChangePassword() {
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

		String password = request.getParameter("password").trim();
		String newpassword = request.getParameter("newpassword").trim();
		String renewpassword = request.getParameter("renewpassword").trim();
		System.out.println("before if");
		HttpSession session = request.getSession();
		System.out.println("ok");
		System.out.println(renewpassword + " ok");
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(
					"select password from user WHERE ic = '" + session.getAttribute("ic").toString() + "'");
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				if (password.equals(rs.getString("password"))) {
					if (newpassword.equals(renewpassword)) {
						Statement stat = con.createStatement();
						System.out.println("ok2");
						stat.executeUpdate("update user SET password ='" + renewpassword + "'WHERE ic = '"
								+ session.getAttribute("ic").toString() + "'");
						System.out.println("ok3");
					}
				}
			}
			response.sendRedirect("jsp/Profile.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}

}
