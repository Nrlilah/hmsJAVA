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
		String name = request.getParameter("name").trim();
		String email = request.getParameter("email").trim();
		String role = request.getParameter("role").trim();
		String ic = request.getParameter("ic").trim();
		String gender = request.getParameter("gender").trim();
		String phone = request.getParameter("phonenumber").trim();
		String nationality = request.getParameter("nationality").trim();
		String dateOfBirth = request.getParameter("date").trim();
		String address = request.getParameter("address").trim();

		System.out
				.println(name + ic + phone + nationality + dateOfBirth + address );

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into user(name, ic, gender, phonenumber, nationality, dateofbirth, address) values('" + name + "','" + ic
					+ "','" + gender + "','" + phone + "','" + nationality + "','" + dateOfBirth +  "','" + address +  "')");
			ArrayList<Patient> patientlist = new ArrayList<Patient>();
			PreparedStatement pst2 = con.prepareStatement("select * from patient");
			ResultSet rs2 = pst2.executeQuery();
			
	
			
			while (rs2.next()) {
				Patient patient = new Patient();
				patient.setIc(rs2.getString("ic"));
				patient.setName(rs2.getString("name"));
				patient.setGender(rs2.getString("gender"));
				patient.setStatus(Integer.parseInt(rs2.getString("status")));
				patientlist.add(patient);
			}
			System.out.print(patientlist);
			session.setAttribute("PatientData", patientlist);
			response.sendRedirect("jsp/Welcome.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
        
        
        request.getRequestDispatcher("/Profile.jsp").forward(request, response);
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doGet(request, response);
	}

}
