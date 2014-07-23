package net.mybluemix.mysite;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.sql.*;

import javax.sql.*;

/**
 * Servlet implementation class Submit
 */
@WebServlet("/Submit")
public class Submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Resource(lookup = "jdbc/mydb")
	DataSource dataSource;
	
    public Submit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String s_name = request.getParameter("s_name");
		String s_phone = request.getParameter("s_phone");
		String s_address = request.getParameter("s_address");
		String s_bankName = request.getParameter("s_bankName");
		String s_bankAccount = request.getParameter("s_bankAccount");
		String currency = request.getParameter("currency");
		String amount = request.getParameter("amount");
		String r_name = request.getParameter("r_name");
		String r_address = request.getParameter("r_address");
		String r_bankName = request.getParameter("r_bankName");
		String r_bankAccount = request.getParameter("r_bankAccount");
		PrintWriter out = response.getWriter();
		try {
			Connection con = dataSource.getConnection();
			Statement s = con.createStatement();
			String sql = "INSERT INTO MYSITE.TRANSACTION (S_NAME,S_PHONE,S_ADDRESS,S_BANK_NAME,S_BANK_ACCOUNT,CURRENCY,AMOUNT,"
					+ "R_NAME,R_ADDRESS,R_BANK_NAME,R_BANK_ACCOUNT) VALUES('"+s_name+"','"+s_phone+"','"+s_address+"','"+s_bankName+"','"+s_bankAccount+"','"+currency+"','"+amount+"','"+r_name+"','"+r_address+"','"+r_bankName+"','"+r_bankAccount+"')";
			if(s.executeUpdate(sql) == 1){
				s = con.createStatement();
				ResultSet rs =  s.executeQuery("select id from mysite.transaction order by id desc fetch first 1 rows only");
				rs.next();
				out.print(rs.getInt(1));
				
				String username = request.getParameter("username");
				if(username != null){
				s = con.createStatement();
					s.executeUpdate("UPDATE MYSITE.USER SET ADDRESS = '"+s_address+"', PHONE = '"+s_phone+"', BANK_NAME='"+s_bankName+"' , BANK_ACCOUNT='"+s_bankAccount+"' WHERE USERNAME = '"+username+"'");
				}
			}
			else{
				out.print("False");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print("False");
			e.printStackTrace();
		}
		
	}

}
