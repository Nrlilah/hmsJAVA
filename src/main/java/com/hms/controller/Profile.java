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
 * Servlet implementation class Profile
 */
public class Profile extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Profile() {
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

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String fullName = request.getParameter("fullName").trim();
		System.out.println(fullName);
		String email = request.getParameter("email").trim();
		System.out.println(email);
		String gender = request.getParameter("gender").trim();
		System.out.println(gender);
		String phone = request.getParameter("phone").trim();
		System.out.println(phone);
		String nationality = request.getParameter("nationality").trim();
		System.out.println(nationality);
		String address = request.getParameter("address").trim();
		System.out.println(address);
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(
					"SELECT name, email, gender, phonenumber, nationality, address FROM user WHERE id = ?");
			pst.setInt(1, (int) session.getAttribute("USERid"));

			System.out.println(pst);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				System.out.println("ok3");
				// if (!fullName.equals(rs.getString("name"))) {
				System.out.println("ok4");
				Statement stat = con.createStatement();

//				stat.executeUpdate("update user SET name ='" + fullName + "', email= '" + email + "' WHERE id = "
//						+ Integer.parseInt(session.getAttribute("USERid").toString()));

				String sql = "update user SET name = ?, email = ?, gender = ?, phonenumber = ?, nationality = ?, address = ? WHERE id = ?";
				PreparedStatement preparedStatement = con.prepareStatement(sql);
				preparedStatement.setString(1, fullName);
				preparedStatement.setString(2, email);
				preparedStatement.setString(3, gender);
				preparedStatement.setString(4, phone);
				preparedStatement.setString(5, nationality);
				preparedStatement.setString(6, address);
				preparedStatement.setInt(7, Integer.parseInt(session.getAttribute("USERid").toString()));

				preparedStatement.executeUpdate();
				System.out.println("ok5");
				PreparedStatement pst2 = con.prepareStatement(
						"SELECT name, email, gender, phonenumber, nationality, address FROM user WHERE id = ?");
				pst2.setInt(1, Integer.parseInt(session.getAttribute("USERid").toString()));
				ResultSet rs2 = pst2.executeQuery();
				if (rs2.next()) {
					String USERemail = rs2.getString("email");
					String USERname = rs2.getString("name");
					String USERgender = rs2.getString("gender");
					String USERphoneNum = rs2.getString("phonenumber");
					String USERnationality = rs2.getString("nationality");
					String USERaddress = rs2.getString("address");

					session.setAttribute("USERemail", USERemail);
					session.setAttribute("USERname", USERname);
					session.setAttribute("USERgender", USERgender);
					session.setAttribute("USERphoneNum", USERphoneNum);
					session.setAttribute("USERnationality", USERnationality);
					session.setAttribute("USERaddress", USERaddress);
				}
				rs2.close();
				// }
			}
			System.out.println("ok6");
			response.sendRedirect("jsp/Profile.jsp");

			System.out.println("ok7");
		} catch (Exception ex) {
			ex.printStackTrace();
		}

	}
}
