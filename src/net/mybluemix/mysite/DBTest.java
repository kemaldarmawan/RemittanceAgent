package net.mybluemix.mysite;

import java.io.IOException;
import java.sql.*;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.*;

/**
 * Servlet implementation class DBTest
 */
@WebServlet("/DBTest")
public class DBTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBTest() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    
    @Resource(lookup = "jdbc/mydb")
	private DataSource myDataSource;
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			Connection c = myDataSource.getConnection();
			Statement s = c.createStatement();
			try{
				s.executeUpdate("DROP TABLE MYLIBRARY.MYTABLE");
			} catch (Exception e) {
				//Table probably doesn't exist
			}
			s.executeUpdate("CREATE TABLE MYLIBRARY.MYTABLE (NAME VARCHAR(20), ID INTEGER)");
			s.executeUpdate("INSERT INTO MYLIBRARY.MYTABLE (NAME, ID) VALUES ('BlueMix', 123)");
			response.getOutputStream().print(
					"Test Data inserted into "
							+ c.getMetaData().getDatabaseProductName());
		} catch (Exception e) {
			response.getOutputStream().print(
					"Something went wrong! : " + e.getMessage());
			return;
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
