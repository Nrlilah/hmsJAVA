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


/**
 * Servlet implementation class AddAccount
 */
public class AddAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddAccount() {
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
		String name = request.getParameter("name").trim();
		System.out.println(name);
		String email = request.getParameter("email").trim();
		System.out.println(name + email);
		String password = request.getParameter("password").trim();
		String ic = request.getParameter("ic").trim();
		String gender = request.getParameter("gender").trim();
		System.out.println(name + email);
		String phonenumber = request.getParameter("phonenumber").trim();
		System.out.println(name + email + ic + gender);
		String nationality = request.getParameter("nationality").trim();
		String dateofbirth = request.getParameter("dateofbirth").trim();
		String address = request.getParameter("streetAddress").trim() + ", " + request.getParameter("postcode").trim() + ", "
				+ request.getParameter("city").trim() + ", " + request.getParameter("state").trim();
		String accesslevel = request.getParameter("accesslevel").trim();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into user (name, email, password, ic, gender, phonenumber, nationality, dateofbirth, address, accesslevel) "
					+ "values('" + name + "','" + email + "','" + password + "','" + ic + "','" + gender + "','" + phonenumber + "','" + nationality + "','" + dateofbirth +  "','" + address + "','" + accesslevel + "')");
			
			response.sendRedirect("jsp/Administration.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}



