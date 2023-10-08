package com.hms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.beans.MedicationList;

/**
 * Servlet implementation class EditMedication
 */
public class EditMedication extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditMedication() {
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
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int medicationList_id = Integer.parseInt(request.getParameter("medicationList_id").trim());
		String medicationItemEDIT = request.getParameter("medicationItemEDIT").trim();
		ArrayList<MedicationList> medicationlistlist = new ArrayList<MedicationList>();
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();

			String sql = "update medication_list SET medicationItem = ? WHERE medicationList_id = ?";
			PreparedStatement preparedStatement = con.prepareStatement(sql);
			preparedStatement.setString(1, medicationItemEDIT);
			preparedStatement.setInt(2, medicationList_id);

			preparedStatement.executeUpdate();
			System.out.println("ok5");
			PreparedStatement pst = con.prepareStatement("select * from medication_list");
			ResultSet rs = pst.executeQuery();
			while (rs.next()) {
				MedicationList medicationlist = new MedicationList();
				medicationlist.setMedicationList_id(Integer.parseInt(rs.getString("medicationList_id")));
				medicationlist.setMedicationItem(rs.getString("medicationItem"));
				medicationlistlist.add(medicationlist);

				System.out.println("ok1");
			}

			System.out.println("ok5");
			session.setAttribute("MedicationListListData", medicationlistlist);		
		} catch (Exception ex) {
			ex.printStackTrace();
		}
		response.sendRedirect("jsp/Administration.jsp");
	}

}
