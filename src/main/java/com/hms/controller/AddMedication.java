package com.hms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddMedication
 */
public class AddMedication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMedication() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String medicationItem = request.getParameter("medicationItem").trim();
		System.out.println(medicationItem);
		// TODO Auto-generated method stub
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into medication_list (medicationItem) "
					+ "values('" + medicationItem + "')");
			
			response.sendRedirect("jsp/Administration.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
