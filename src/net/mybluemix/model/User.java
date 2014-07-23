package net.mybluemix.model;

import java.sql.*;

import javax.annotation.Resource;
import javax.sql.*;


public class User {
	
	
	public User(){
		
	}
	
	public User(String username, String password, String name, String phone, String address, String bankName, String bankAccount){
		this.username = username;
		this.password = password;
		this.name = name;
		this.phone = phone;
		this.address = address;
		this.bankName = bankName;
		this.bankAccount = bankAccount;
	}
	
	public User(String username){
		try {
			Connection con = dataSource.getConnection();
			Statement s = con.createStatement();
			String query = "SELECT * FROM MYSITE.USER WHERE USERNAME = '"+username+"'";
			ResultSet rs = s.executeQuery(query);
			if(rs.next()){
				this.username = rs.getString(1);
				this.password = rs.getString(2);
				this.name = rs.getString(3);
				this.phone = rs.getString(4);
				this.address = rs.getString(5);
				this.bankName = rs.getString(6);
				this.bankAccount = rs.getString(7);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	@Resource(lookup = "jdbc/mydb")
	private DataSource dataSource;
	
	private String username;
	private String password;
	private String name;
	private String phone;
	private String address;
	private String bankName;
	private String bankAccount;
	
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getBankName() {
		return bankName;
	}

	public void setBankName(String bankName) {
		this.bankName = bankName;
	}

	public String getBankAccount() {
		return bankAccount;
	}

	public void setBankAccount(String bankAccount) {
		this.bankAccount = bankAccount;
	}
	
	
}
