package com.hms.model;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import com.hms.beans.User;

public class UserDB {
	String s1 = null;

	public String insertUser(User rb) {
		myDatabase db = new myDatabase();
		Connection con = db.getCon();
		try {
			Statement stat = con.createStatement();
			stat.executeUpdate("insert into user(name,email,password) values('" + rb.getName() + "','" + rb.getEmail()
					+ "','" + rb.getPassword() + "')");
			s1 = "Data Insert Successfully";
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return s1;
	}
}
