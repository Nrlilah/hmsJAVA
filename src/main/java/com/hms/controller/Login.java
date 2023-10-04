package com.hms.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hms.beans.MedicationList;
import com.hms.beans.Patient;
import com.hms.beans.PredicamentList;
import com.hms.beans.User;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Login() {
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
		String email = request.getParameter("email").trim();
		String password = request.getParameter("password").trim();
		HttpSession session = request.getSession();
		// RequestDispatcher dispatcher = null;

		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection con = DatabaseConnection.getConnection();
			PreparedStatement pst = con.prepareStatement("SELECT * FROM user WHERE email = ? AND password = ?");
			pst.setString(1, email);
			pst.setString(2, password);
			ResultSet rs = pst.executeQuery();
			if (rs.next()) {
				String USERemail = rs.getString("email");
				String USERname = rs.getString("name");
				String USERpassword = rs.getString("password");
				String USERrole = rs.getString("role");
				String USERic = rs.getString("ic");
				String USERgender = rs.getString("gender");
				String USERphoneNum = rs.getString("phonenumber");
				String USERnationality = rs.getString("nationality");
				String USERdateOfBirth = rs.getString("dateofbirth");
				String USERaddress = rs.getString("address");
				String USERaccessLevel = rs.getString("accessLevel");

				session.setAttribute("USERemail", USERemail);
				session.setAttribute("USERname", USERname);
				session.setAttribute("USERpassword", USERpassword);
				session.setAttribute("USERrole", USERrole);
				session.setAttribute("USERic", USERic);
				session.setAttribute("USERgender", USERgender);
				session.setAttribute("USERphoneNum", USERphoneNum);
				session.setAttribute("USERnationality", USERnationality);
				session.setAttribute("USERdateOfBirth", USERdateOfBirth);
				session.setAttribute("USERaddress", USERaddress);
				session.setAttribute("USERaccessLevel", USERaccessLevel);

				ArrayList<Patient> patientlist = new ArrayList<Patient>();
				ArrayList<User> userlist = new ArrayList<User>();
				ArrayList<MedicationList> medicationlistlist = new ArrayList<MedicationList>();
				ArrayList<PredicamentList> predicamentlistlist = new ArrayList<PredicamentList>();
				PreparedStatement pst2 = con.prepareStatement("select * from patient");
				ResultSet rs2 = pst2.executeQuery();

				PreparedStatement pst3 = con
						.prepareStatement("select count(idPatient) as red from patient where status = 1");
				ResultSet rs3 = pst3.executeQuery();

				PreparedStatement pst4 = con
						.prepareStatement("select count(idPatient) as green from patient where status = 2");
				ResultSet rs4 = pst4.executeQuery();

				PreparedStatement pst5 = con
						.prepareStatement("select count(idPatient) as blue from patient where status = 0");
				ResultSet rs5 = pst5.executeQuery();

				PreparedStatement pst6 = con.prepareStatement("select * from user");
				ResultSet rs6 = pst6.executeQuery();

				PreparedStatement pst7 = con.prepareStatement("select * from medication_list");
				ResultSet rs7 = pst7.executeQuery();

				PreparedStatement pst8 = con.prepareStatement("select * from predicament_list");
				ResultSet rs8 = pst8.executeQuery();

				if (rs3.next()) {
					session.setAttribute("red", rs3.getString("red"));
				}
				if (rs4.next()) {
					session.setAttribute("green", rs4.getString("green"));
				}
				if (rs5.next()) {
					session.setAttribute("blue", rs5.getString("blue"));
				}
				while (rs2.next()) {
					Patient patient = new Patient();
					patient.setIc(rs2.getString("ic"));
					patient.setName(rs2.getString("name"));
					patient.setGender(rs2.getString("gender"));
					patient.setStatus(Integer.parseInt(rs2.getString("status")));
					patient.setStatusprogress(rs2.getString("statusprogress"));
					patientlist.add(patient);
				}
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
					// user.setStatus(Integer.parseInt(rs2.getString("status")));
					userlist.add(user);
				}
				while (rs7.next()) {
					MedicationList medicationList = new MedicationList();
					medicationList.setMedicationList_id(Integer.parseInt(rs7.getString("medicationList_id")));
					medicationList.setMedicationItem(rs7.getString("medicationItem"));
					medicationlistlist.add(medicationList);
				}
				while (rs8.next()) {
					PredicamentList predicamentlist = new PredicamentList();
					predicamentlist.setPredicamentList_id(Integer.parseInt(rs8.getString("predicamentList_id")));
					predicamentlist.setPredicament_name(rs8.getString("predicament_name"));
					predicamentlistlist.add(predicamentlist);
				}
				session.setAttribute("PatientData", patientlist);
				session.setAttribute("UserData", userlist);
				session.setAttribute("MedicationListListData", medicationlistlist);
				session.setAttribute("PredicamentListlListData", predicamentlistlist);

				rs.close();
				rs2.close();
				rs3.close();
				rs4.close();
				rs5.close();
				rs6.close();
				rs7.close();
				rs8.close();

				pst.close();
				pst2.close();
				pst3.close();
				pst4.close();
				pst5.close();
				pst6.close();
				pst7.close();
				pst8.close();
				response.sendRedirect("jsp/Welcome.jsp");
			} else {
				session.setAttribute("status", "failed");
				System.out.println("Wrong email or password");

				response.sendRedirect("jsp/Login.jsp");
			}
			// dispatcher.forward(request, response);
		} catch (Exception ex) {
			ex.printStackTrace();
		}
	}

}
