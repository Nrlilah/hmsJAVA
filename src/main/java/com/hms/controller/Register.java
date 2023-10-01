package com.hms.controller;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.model.UserDB;
import com.hms.beans.Patient;
import com.hms.beans.User;
import com.hms.model.myDatabase;

/**
 * Servlet implementation class Register
 */
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		PrintWriter out = response.getWriter();
		out.println("Welcome to first servlet");
		Connection con;
		Statement stmt;
		ResultSet rs;
		String query = "select * from patient";
		ArrayList<Patient> patientlist = new ArrayList<Patient>();
		//RequestDispatcher dispatcher = null;
		HttpSession session = request.getSession();
		myDatabase db = new myDatabase();
		try {
			con = db.getCon();
			if(con==null) {
				out.println("Failed with connection"+con);
			}else {
				out.println("Successful with connection" +con);
				stmt =con.createStatement();
				rs=stmt.executeQuery(query);
				while(rs.next())
				{
					Patient patient = new Patient();
					patient.setIc(rs.getString("ic"));
					patient.setName(rs.getString("name"));
					patient.setGender(rs.getString("gender"));
					patient.setStatus(rs.getString("status"));
					patientlist.add(patient);
				}
				System.out.print("HAHAH");
				session.setAttribute("patientData", patientlist);
				response.sendRedirect("jsp/Welcome.jsp");
				//request.setAttribute("UserData", userlist);
				//response.sendRedirect("jsp/Welcome.jsp?UserData"+userlist);
//				dispatcher = request.getRequestDispatcher("jsp/Welcome.jsp");
			}
			
			
//			dispatcher.forward(request, response).;
			
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		
		User rb = new User();
		
		rb.setName(name);
		rb.setEmail(email);
		rb.setPassword(password);
		
		UserDB ud = new UserDB();
		String s1 = ud.insertUser(rb);
		
		System.out.println(s1);
		// out.println(name);
		// out.println(email);
		// out.println(password);
		request.setAttribute("name", name);
		request.getRequestDispatcher("jsp/Welcome.jsp").forward(request, response);;
	}

}