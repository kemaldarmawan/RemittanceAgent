package net.mybluemix.mysite;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.*;

import java.sql.*;

/**
 * Servlet implementation class Signup
 */
@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
	@Resource(lookup = "jdbc/mydb")
	private DataSource dataSource;
	
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		
		try {
			Connection con = dataSource.getConnection();
			Statement s = con.createStatement();
			String query = "SELECT * FROM MYSITE.USER WHERE USERNAME = '" + username +"'";
			String sql = "INSERT INTO MYSITE.USER (USERNAME,PASSWORD,NAME) VALUES('"+username+"','"+password+"','"+name+"')";
			if(s.executeUpdate(sql) == 1){
				out.print("True");
			}
			else out.print("False");
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			out.print("False");
			e.printStackTrace();
		}
		
		
	}

}
