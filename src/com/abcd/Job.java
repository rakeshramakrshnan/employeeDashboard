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
 * Servlet implementation class Job
 */
@WebServlet("/Job")
public class Job extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=hrdatabase";
	static final String USER = "hrdb";
	static final String PASS = "1234";


       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Job() {
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
				RequestDispatcher rd = request.getRequestDispatcher("InsJob.jsp");
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
		//doGet(request, response);
		Connection dbConnection = null;
		//Statement stmt = null;
		dbConnection = getDBConnection();
		
		try {
			
			
			/******************************************************************/
			/* using procedure to insert job tabe details                                                                */
			/******************************************************************/
			PreparedStatement pstmt = dbConnection.prepareStatement("{call [dbo].[usp_job_insert](?, ?, ?)}");
			System.out.println("1");
	        pstmt.setString(1,null);
			
			System.out.println("2");
	        pstmt.setString(2,(request.getParameter("jobtitle")));
	        System.out.println("3");
	        pstmt.setLong(3, Long.parseLong(request.getParameter("maxsalary")));
	        
	        /*
	         * check if job title is already present. if true -> error.jsp , false -> success.jsp
	         */
	        PreparedStatement psmt = dbConnection.prepareStatement("select jobtitle from job where jobtitle=(?)");
	        System.out.println("5");
	        psmt.setString(1,(request.getParameter("jobtitle").toString()));
	        System.out.println("6");
	        ResultSet rs=psmt.executeQuery();
	        System.out.println("7");
	       
	        if(rs.next()) {
	        	response.sendRedirect("Error.jsp");
	        }
	        else {
	        	System.out.println("3");
		        pstmt.execute();
		        System.out.println("4");
		        pstmt.close();
		       
	        }
	     
		}catch(SQLException e) {
			System.out.println("sql Exception:"+e.getMessage());
			
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
