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

import com.hms.beans.Medication;
import com.hms.beans.Patient;

/**
 * Servlet implementation class DischargedPatient
 */
public class DischargedPatient extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DischargedPatient() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		response.getWriter().append("Served at: ").append(request.getContextPath());
		int patientID = Integer.parseInt(request.getParameter("patientID"));
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
				Statement stat = con.createStatement();
				stat.executeUpdate("update patient set status = 0, statusprogress= 'Discharged' where idpatient = "+ patientID);
				System.out.print("INISEBELUM");
				PreparedStatement pst10 = con.prepareStatement(
						"select * from patient where appointmentDate >= CURDATE() and statusprogress='Assigned' "
								+ "and doctorid = " + session.getAttribute("USERid") + " order by appointmentDate");
				ResultSet rs10 = pst10.executeQuery();
				ArrayList<Patient> patientAssignedlist = new ArrayList<Patient>();
				while (rs10.next()) {
					Patient patient = new Patient();
					patient.setIdpatient(Integer.parseInt(rs10.getString("idpatient")));
					patient.setName(rs10.getString("name"));
					patient.setIc(rs10.getString("ic"));
					patient.setGender(rs10.getString("gender"));
					patient.setPhonenumber(rs10.getString("phonenumber"));
					patient.setNationality(rs10.getString("nationality"));
					patient.setDateofbirth(rs10.getString("dateofbirth"));
					patient.setAddress(rs10.getString("address"));
					patient.setAppointmentDate(rs10.getString("appointmentDate"));
					patient.setStatus(Integer.parseInt(rs10.getString("status")));
					patient.setStatusprogress(rs10.getString("statusprogress"));
					patientAssignedlist.add(patient);
				}
				session.setAttribute("patientAssignedlist", patientAssignedlist);
		} catch (Exception ex) {
			ex.printStackTrace();
		}System.out.print("INISEBELUMLUAR");
		response.sendRedirect("jsp/Medication.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
