package com.abcd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class JobUpdate
 */
@WebServlet("/JobUpdate")
public class JobUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=hrdatabase";
	static final String USER = "hrdb";
	static final String PASS = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public JobUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		Connection dbConnection = null;
		dbConnection = getDBConnection();
		List <JobModel> JobList = new ArrayList<JobModel>();
		try {
			int jobcode= Integer.parseInt(request.getParameter("update"));
			System.out.println(jobcode);
			PreparedStatement jobFetch = dbConnection.prepareStatement("select * from job  where jobcode = ?");
			jobFetch.setInt(1, jobcode);
			ResultSet rs=jobFetch.executeQuery();
			if(rs.next()) {
				JobModel obj= new JobModel();
				obj.setJobcode(Integer.parseInt(rs.getString("jobcode")));
				obj.setJobtitle(rs.getString("jobtitle"));
				obj.setMaxsalary(Integer.parseInt(rs.getString("maxsalary")));
				
				JobList.add(obj);
				
			}
			request.setAttribute("jobList", JobList);
			
		
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		finally {
			RequestDispatcher rd = request.getRequestDispatcher("JobUpdate.jsp");
		       rd.forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection dbConnection = null;
		dbConnection = getDBConnection();
		System.out.print("post method");
		try {
			PreparedStatement pstmt = dbConnection.prepareStatement("{call dbo.usp_job_update( ?, ?, ?)}");
			pstmt.setInt(1, Integer.parseInt(request.getParameter("jobcode")));
			System.out.println("id");
			pstmt.setString(2, request.getParameter("jobtitle"));
			pstmt.setInt(3, Integer.parseInt(request.getParameter("maxsalary")));
			
			pstmt.execute();
			
			pstmt.close();
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			
			RequestDispatcher rd = request.getRequestDispatcher("JobDisplay");
		       rd.forward(request, response);	
		       }
		
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
