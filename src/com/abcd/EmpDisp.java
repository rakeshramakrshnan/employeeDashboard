package com.abcd;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class EmpDisp
 */
@WebServlet("/EmpDisp")
public class EmpDisp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=hrdatabase";
	static final String USER = "hrdb";
	static final String PASS = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpDisp() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List <EmployeeModel> empList = new ArrayList<EmployeeModel>();
		Connection dbConnection = null;
		Statement stm = null;
		Statement stms= null;
		Statement stmts = null;
		Statement statements = null;
		dbConnection = getDBConnection();
		
		HashMap<Integer,String> DeptValues=new HashMap<Integer,String>();
	    HashMap<Integer,String> jobtitles=new HashMap<Integer,String>();
	    HashMap<Integer,String> mgrval=new HashMap<Integer,String>();
	    mgrval.put(0,"manager");
	   
	        
		try {
			
			String get_details = "Select * from dbo.get_Employee_Details();";
			String dept= "select * from dbo.get_Department_Details();";
			String job= "select * from dbo.get_Job_Details();";
			String manager= "select empid,empname from employee where mgrid=0";
			
			stms = dbConnection.createStatement();
			stmts=dbConnection.createStatement();
			statements=dbConnection.createStatement();
			stm = dbConnection.createStatement();
			
	        ResultSet rs=stm.executeQuery(get_details);
	        ResultSet dept_rs=stms.executeQuery(dept);
	        ResultSet job_rs=stmts.executeQuery(job);
	        ResultSet mgr_rs=statements.executeQuery(manager);
	        
	       System.out.println("dfdfsdf");
	      if (dept_rs.isBeforeFirst() ) {    
	    		 
	       while(dept_rs.next()){
	    	  
		        DeptValues.put(Integer.parseInt(dept_rs.getString("deptid")),(dept_rs.getString("deptname")));
		        
		        System.out.println(dept_rs.getString("deptname").toString()+" "+Integer.parseInt(dept_rs.getString("deptid")));
		        //response.sendRedirect("Success.jsp");
				}
	    	   
	       }
	       else {
	    	   System.out.println("no data found");
	       }
	        
	        
		        while(job_rs.next()) {
		        	jobtitles.put(Integer.parseInt(job_rs.getString("jobcode")), (job_rs.getString("jobtitle")));
			        //jobsal.put(Integer.parseInt(job_rs.getString("jobcode")), Integer.parseInt(job_rs.getString("maxsalary")));
			       // System.out.println(rs.getString("jobtitle").toString()+" "+Integer.parseInt(rs.getString("jobcode")));
		        	System.out.println(Integer.parseInt(job_rs.getString("jobcode")));
		        }
		        
		        
		        /*for (Map.Entry post: DeptValues.entrySet()) {   
		        	
		        	System.out.println(post.getKey()+" "+post.getValue());
		        }*/
		        
		        
		        while(mgr_rs.next()) {
		        	mgrval.put(Integer.parseInt(mgr_rs.getString("empid")), (mgr_rs.getString("empname")));
		        	System.out.println("1");
		        }
        
		        while(rs.next())
		        {EmployeeModel obj = new EmployeeModel();
		        	obj.setEmpid(Integer.parseInt(rs.getString("empid")));
		        	
		        	obj.setEmpname(rs.getString("empname"));
		        	obj.setHiredate(  rs.getString("hiredate"));
		        	obj.setDeptid(Integer.parseInt(rs.getString("deptid")));
		        	obj.setJobcode( Integer.parseInt(rs.getString("jobcode")));
		        	obj.setMgrid(Integer.parseInt(rs.getString("mgrid")));
		        	obj.setSalary(Integer.parseInt((rs.getString("salary"))));
		        	obj.setPhone(rs.getString("phone"));
		        	obj.setEmail(rs.getString("email"));
		        	empList.add(obj);
	        	
	        }
        

	        	/*request.setAttribute("data",DeptValues);
		        request.setAttribute("jobtitle",jobtitles);
		        
		        request.setAttribute("manager", mgrval);
		        */
		        dept_rs.close();
		        job_rs.close();
		         mgr_rs.close();
		        stms.close();
		        statements.close();
		        stmts.close();
		        stm.close();
		        rs.close();
        
		}
		catch(Exception x) {
			System.out.println(x.getMessage());
		}
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		finally
		{
			request.setAttribute("displayList", empList);
			request.setAttribute("deptvalues",DeptValues);
	        request.setAttribute("jobtitle",jobtitles);
	        
	        request.setAttribute("manager", mgrval);
			
			
			try {
				RequestDispatcher rd = request.getRequestDispatcher("EmpDisp.jsp");
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
		System.out.println("post method update");
		Connection dbConnection = null;
		Statement stmt = null;
		try{
			dbConnection = getDBConnection();
			PreparedStatement pstmt = dbConnection.prepareStatement("{call dbo.usp_employee_delete( ?)}");
			pstmt.setInt(1, Integer.parseInt(request.getParameter("delete")));
			pstmt.execute();
			pstmt.close();
			
			doGet(request, response);
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
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
