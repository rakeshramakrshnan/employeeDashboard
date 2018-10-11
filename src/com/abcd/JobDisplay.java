package com.abcd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JobDisplay
 */
@WebServlet("/JobDisplay")
public class JobDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=hrdatabase";
	static final String USER = "hrdb";
	static final String PASS = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobDisplay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		List <JobModel> JobList = new ArrayList<JobModel>();
		Connection dbConnection = null;
		Statement stm = null;
		dbConnection = getDBConnection();
		try {
			System.out.println("1");
			String job= "select * from dbo.get_Job_Details()";
			System.out.println("2");
			stm = dbConnection.createStatement();
			System.out.println("3");
			ResultSet job_rs=stm.executeQuery(job);
			
			System.out.println("4");
			while(job_rs.next())
	        {
				System.out.println("5");
				JobModel obj = new JobModel();
	        	obj.setJobcode(Integer.parseInt(job_rs.getString("jobcode")));
	        	obj.setJobtitle(job_rs.getString("jobtitle"));
	        	obj.setMaxsalary(Integer.parseInt(job_rs.getString("maxsalary")));
	        	JobList.add(obj);
	        	System.out.println("6");
	        }
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		finally {
			request.setAttribute("displayList", JobList);
			try {
				RequestDispatcher rd = request.getRequestDispatcher("JobDisplay.jsp");
				       rd.forward(request, response);	
				       }
				catch(Exception e) {
				e.printStackTrace();
				}
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("post method del");
		Connection dbConnection = null;
		
		try{
			dbConnection = getDBConnection();
			
			
			PreparedStatement pstmt = dbConnection.prepareStatement("{call dbo.usp_job_delete( ?)}");
			pstmt.setInt(1, Integer.parseInt(request.getParameter("delete")));
			pstmt.execute();
			pstmt.close();
			
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		
		
		doGet(request, response);
		
	}
	private static Connection getDBConnection() {

		Connection dbConnection = null;

		try {

			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

		} catch (ClassNotFoundException e) {

			System.out.println(e.getMessage());

		}

		try {

			dbConnection = DriverManager.getConnection(
					 DB_URL, USER,PASS);
			return dbConnection;

		} catch (SQLException e) {

			System.out.println(e.getMessage());

		}

		return dbConnection;

	}
}
