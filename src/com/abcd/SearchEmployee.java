package com.abcd;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchEmployee
 */
@WebServlet("/SearchEmployee")
public class SearchEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=hrdatabase";
	static final String USER = "hrdb";
	static final String PASS = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());

			
			RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
		       rd.forward(request, response);	
		       
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		Connection dbConnection = null;
		dbConnection = getDBConnection();
		
		 
		List <SearchModel> empList = new ArrayList<SearchModel>();
	 	Statement stm = null;
		Statement stms= null;
		Statement stmts = null;
		Statement statements = null;
		dbConnection = getDBConnection();
		int status=0;
		HashMap<Integer,String> DeptValues=new HashMap<Integer,String>();
	    HashMap<Integer,String> jobtitles=new HashMap<Integer,String>();
	    HashMap<Integer,String> mgrval=new HashMap<Integer,String>();
	    mgrval.put(0,"manager");
		   
		        
			try {
				
				//String get_details = "Select * from dbo.get_Employee_Details();";
				String dept= "select * from dbo.get_Department_Details();";
				String job= "select * from dbo.get_Job_Details();";
				String manager= "select empid,empname from employee where mgrid=0";
				
				stms = dbConnection.createStatement();
				stmts=dbConnection.createStatement();
				statements=dbConnection.createStatement();
				stm = dbConnection.createStatement();
				
		        //ResultSet rs=stm.executeQuery(get_details);
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
	        
		 
		 
		 
		 
		 
		 
		
			PreparedStatement pstmt = dbConnection.prepareStatement("SELECT * FROM dbo.get_Search_Details_New(?,?,?)");
			if(request.getParameter("Name").length()>=1) {
				pstmt.setString(1, request.getParameter("Name"));
				System.out.println("empname search");
			}
			else {
				pstmt.setString(1, "NULL");
				System.out.println("empname null");
			}
			if(request.getParameter("Salary")!=null && !request.getParameter("Salary").isEmpty()) {
				pstmt.setInt(2,Integer.parseInt(request.getParameter("Salary")) );
				System.out.println("salary if");
			}
			else {
				pstmt.setInt(2,0);
				System.out.println("sal else");
			}
			if((request.getParameter("Hiredate")).length()>0) {
				System.out.println("date");
				//java.util.Date javadate = new java.util.Date();
				
				
				 String sDate1= request.getParameter("Hiredate");
				/* System.out.println(sDate1);
				Date datess=new SimpleDateFormat("yyyy-mm-dd").parse(sDate1);
				String abc= datess.toString();
			    System.out.println(abc);*/ 
			    
			    
			    
				//javadate = request.getParameter("Hiredate");
	
				 //java.sql.Date date1 = new java.sql.Date(javadate.getTime());
				 /*System.out.println("date1 :"+date1); */
			    //java.sql.Date sqldate=java.sql.Date.valueOf(abc);
			    //System.out.println(sqldate); 
				 pstmt.setString(3, sDate1);
				}
			else {
				pstmt.setDate(3, null);
				System.out.println("else date");
			}
			
			ResultSet rs=pstmt.executeQuery();
			System.out.println("6 ");
			
			if (rs.isBeforeFirst() ) { 
				status=1;
			 while(rs.next()){
				
				 SearchModel obj = new SearchModel();
		        	obj.setEmpid(Integer.parseInt(rs.getString("EMPID")));
		        	
		        	obj.setEmpname(rs.getString("EMPNAME"));
		        	obj.setHiredate(  rs.getString("HIREDATE"));
		        	obj.setDeptname(rs.getString("DEPTNAME"));
		        	obj.setJobtitle(rs.getString("JOBTITLE"));
		        	
		        	obj.setSalary(Integer.parseInt((rs.getString("salary"))));
		        	obj.setPhone(rs.getString("PHONE"));
		        	obj.setEmail(rs.getString("EMAIL"));
		        	empList.add(obj);
	        	
			 }}
			else {
				request.setAttribute("a", 1);
				RequestDispatcher rd = request.getRequestDispatcher("Search.jsp");
				      rd.forward(request, response);
				/*PrintWriter out = response.getWriter();
				response.setContentType("text/html");
				out.println("no records found !");*/
			}
			pstmt.close();
			dept_rs.close();
	        job_rs.close();
	         mgr_rs.close();
	        stms.close();
	        statements.close();
	        stmts.close();
    
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
			if(status==1) {
			 
			RequestDispatcher rd = request.getRequestDispatcher("SearchDisplay.jsp");
			       rd.forward(request, response);	
			       }
			
		}
			catch(Exception e) {
			e.printStackTrace();
			}
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
