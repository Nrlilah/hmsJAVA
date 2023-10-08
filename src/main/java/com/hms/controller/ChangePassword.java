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
		HttpSession session = request.getSession();
		
		try {
		    Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DatabaseConnection.getConnection();
		    
		    // Prepare a parameterized query to retrieve the password
		    String selectPasswordQuery = "SELECT password FROM user WHERE ic = ?";
		    PreparedStatement selectPasswordStmt = con.prepareStatement(selectPasswordQuery);
		    selectPasswordStmt.setString(1, session.getAttribute("USERic").toString());
		    
		    ResultSet rs = selectPasswordStmt.executeQuery();
		    
		    if (rs.next()) {
		        String storedPassword = rs.getString("password");
		        if (password.equals(storedPassword) && newpassword.equals(renewpassword)) {
		            // Prepare a parameterized query to update the password
		            String updatePasswordQuery = "UPDATE user SET password = ? WHERE ic = ?";
		            PreparedStatement updatePasswordStmt = con.prepareStatement(updatePasswordQuery);
		            updatePasswordStmt.setString(1, renewpassword);
		            updatePasswordStmt.setString(2, session.getAttribute("USERic").toString());
		            
		            updatePasswordStmt.executeUpdate();
		        }
		    }
		    
		    response.sendRedirect("jsp/Profile.jsp");
		} catch (Exception ex) {
		    ex.printStackTrace();
		}

	}

}
