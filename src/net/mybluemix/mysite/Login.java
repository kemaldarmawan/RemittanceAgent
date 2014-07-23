package net.mybluemix.mysite;

import java.io.IOException;
import java.io.PrintWriter;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

import javax.sql.*;

import net.mybluemix.model.User;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	@Resource(lookup = "jdbc/mydb")
	private DataSource dataSource;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
	
    public Login() {
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
		HttpSession session = request.getSession();
		try {
			Connection con = dataSource.getConnection();
			String query = "SELECT * FROM MYSITE.USER WHERE USERNAME = '" + username +"' AND PASSWORD = '" +password+"'";
			Statement s = con.createStatement();
			ResultSet rs = s.executeQuery(query);
			if(rs.next()) {
				User user = new User();
				user.setUsername(rs.getString(1));
				user.setPassword(rs.getString(2));
				user.setName(rs.getString(3));
				user.setPhone(rs.getString(4));
				user.setAddress(rs.getString(5));
				user.setBankName(rs.getString(6));
				user.setBankAccount(rs.getString(7));
				session.setAttribute("user", user);
				out.print("True");
			}
			else out.print("False");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

}
