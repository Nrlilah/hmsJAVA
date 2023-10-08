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

import com.hms.beans.Predicament;
import com.hms.beans.PredicamentList;

/**
 * Servlet implementation class DeletePredicament
 */
public class DeletePredicament extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeletePredicament() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession session = request.getSession();
		ArrayList<Predicament> Predicamentlist = new ArrayList<Predicament>();
		int predicamentID = Integer.parseInt(request.getParameter("predicamentID").toString());
		int patientID = Integer.parseInt(request.getParameter("patientID").toString());
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con
					.prepareStatement("DELETE FROM predicament WHERE predicament_id = ? and patient_id = ?");
			pst.setInt(1, predicamentID);
			pst.setInt(2, patientID);
			
	        pst.executeUpdate();
				pst = con.prepareStatement(
						"SELECT * FROM predicament INNER JOIN predicament_list ON predicament.predicament_id = predicament_list.predicamentList_id WHERE patient_id = ?");

				pst.setInt(1, patientID);
				ResultSet rs2 = pst.executeQuery();
				while (rs2.next()) {
					Predicament predicament = new Predicament();
					predicament.setPredicamentList_id(rs2.getInt("predicamentList_id"));
					predicament.setPredicament_name(rs2.getString("predicament_name"));
					Predicamentlist.add(predicament);
				}
				System.out.print("OK3");
				session.setAttribute("PredicamentListData", Predicamentlist);
			response.sendRedirect("jsp/AssignMedication.jsp");
		} catch (Exception ex) {
			ex.printStackTrace();

		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
