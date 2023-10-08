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

import com.hms.beans.User;

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
		HttpSession session = request.getSession();
		ArrayList<User> userlist = new ArrayList<User>();
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
		String address = request.getParameter("streetAddress").trim() + ", " + request.getParameter("postcode").trim()
				+ ", " + request.getParameter("city").trim() + ", " + request.getParameter("state").trim();
		String accesslevel = request.getParameter("accesslevel").trim();
		String role = "";
		if (accesslevel.equals("0")) {
			role = "Administrator";
		} else if (accesslevel.equals("2")) {
			role = "Doctor";
		} else {
			role = "Nurse";
		}
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(
					"INSERT INTO user (name, email, password, ic, gender, phonenumber, nationality, dateofbirth, address, accesslevel, role) "
							+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			pst.setString(1, name);
			pst.setString(2, email);
			pst.setString(3, password);
			pst.setString(4, ic);
			pst.setString(5, gender);
			pst.setString(6, phonenumber);
			pst.setString(7, nationality);
			pst.setString(8, dateofbirth);
			pst.setString(9, address);
			pst.setString(10, accesslevel);
			pst.setString(11, role);

			int rowsAffected = pst.executeUpdate();

			PreparedStatement pst6 = con.prepareStatement("SELECT * from user");
			ResultSet rs6 = pst6.executeQuery();
			while (rs6.next()) {
				User user = new User();
				user.setId(Integer.parseInt(rs6.getString("id")));
				user.setName(rs6.getString("name"));
				user.setEmail(rs6.getString("email"));
				user.setPassword(rs6.getString("password"));
				user.setAccessLevel(Integer.parseInt(rs6.getString("accessLevel")));
				user.setRole(rs6.getString("role"));
				user.setIc(rs6.getString("ic"));
				user.setGender(rs6.getString("gender"));
				user.setPhonenumber(rs6.getString("phonenumber"));
				user.setNationality(rs6.getString("nationality"));
				user.setAddress(rs6.getString("address"));
				userlist.add(user);
			}
			session.setAttribute("UserData", userlist);
			rs6.close();
			pst6.close();
			response.sendRedirect("jsp/Administration.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}
}
