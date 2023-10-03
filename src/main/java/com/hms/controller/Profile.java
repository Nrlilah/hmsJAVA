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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String fullName = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		String role = request.getParameter("role").trim();
		String ic = request.getParameter("ic").trim();
		String gender = request.getParameter("gender").trim();
		String phone = request.getParameter("phonenumber").trim();
		String nationality = request.getParameter("nationality").trim();
		String dateOfBirth = request.getParameter("dateofbirth").trim();
		String address = request.getParameter("address").trim();

		System.out
				.println(fullName + email+ role+ ic + gender+ phone + nationality + dateOfBirth + address );

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement(
					"select id from user WHERE ic = '" + session.getAttribute("ic").toString() + "'");
			ResultSet rs = pst.executeQuery();
			System.out.println(rs);
			Statement stat = con.createStatement();
			System.out.println("ok");
			stat.executeUpdate("update into user(name,email,role, ic, gender, phonenumber, nationality, dateofbirth, address) "
					+ "values('" + fullName + "','" + email+ "','" + role + ic
					+ "','" + gender + "','" + phone + "','" + nationality + "','" + dateOfBirth +  "','" + address +  "')");
//			ArrayList<User> userlist = new ArrayList<User>();
//			PreparedStatement pst2 = con.prepareStatement("select * from patient");
//			ResultSet rs2 = pst2.executeQuery();
//			
//	
//			
//			while (rs2.next()) {
//				Patient patient = new Patient();
//				patient.setIc(rs2.getString("ic"));
//				patient.setName(rs2.getString("name"));
//				patient.setGender(rs2.getString("gender"));
//				patient.setStatus(Integer.parseInt(rs2.getString("status")));
//				patientlist.add(patient);
//			}
//			System.out.print(patientlist);
//			session.setAttribute("PatientData", patientlist);
			response.sendRedirect("jsp/Profile.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
