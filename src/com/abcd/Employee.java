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
 * Servlet implementation class Employee
 */
@WebServlet("/Employee")
public class Employee extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=hrdatabase";
	static final String USER = "hrdb";
	static final String PASS = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Employee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	//response.getWriter().append("Served at: ").append(request.getContextPath());
		/*
		 * 
		 */
		List <EmployeeModel> empList = new ArrayList<EmployeeModel>();
		
		Connection dbConnection = null;
		/*
		 * 
		 */
		Statement employeedetails = null;
		
		Statement stm = null;
		Statement stmts = null;
		Statement statements = null;
		dbConnection = getDBConnection();
		
		try {
			String get_details = "Select * from dbo.get_Employee_Details();";
			String dept="select deptname,deptid from department";
			String job="select jobtitle,jobcode,maxsalary from job";
			String manager="select empid,empname from employee where mgrid=0";
			
			employeedetails = dbConnection.createStatement();
			stm = dbConnection.createStatement();
			stmts=dbConnection.createStatement();
			statements=dbConnection.createStatement();
			
			ResultSet employeedetails_rs=employeedetails .executeQuery(get_details);
	        ResultSet rs=stm.executeQuery(dept);
	        ResultSet job_rs=stmts.executeQuery(job);
	        ResultSet mgr_rs=statements.executeQuery(manager);
	        System.out.println("query");
	        //List Deptname=new ArrayList();
	        
	        HashMap<Integer,String> DeptValues=new HashMap<Integer,String>();
	        HashMap<Integer,String> jobtitle=new HashMap<Integer,String>();
	        HashMap<Integer,Integer> jobsal=new HashMap<Integer,Integer>();
	        HashMap<Integer,String> mgrval=new HashMap<Integer,String>();
	        mgrval.put(0, "Manager");
	        
	        
	        /*
	         * 
	         * 
	         */
	        
	        while(employeedetails_rs.next())
	        {EmployeeModel obj = new EmployeeModel();
	        	obj.setEmpid(Integer.parseInt(employeedetails_rs.getString("empid")));
	        	
	        	obj.setEmpname(employeedetails_rs.getString("empname"));
	        	obj.setHiredate(  employeedetails_rs.getString("hiredate"));
	        	obj.setDeptid(Integer.parseInt(employeedetails_rs.getString("deptid")));
	        	obj.setJobcode( Integer.parseInt(employeedetails_rs.getString("jobcode")));
	        	obj.setMgrid(Integer.parseInt(employeedetails_rs.getString("mgrid")));
	        	System.out.println("1234566");
	        	obj.setSalary(Integer.parseInt((employeedetails_rs.getString("salary"))));
	        	System.out.println("1111111111");
	        	obj.setPhone(employeedetails_rs.getString("phone"));
	        	System.out.println("1222222222226");
	        	obj.setEmail(employeedetails_rs.getString("email"));
	        	empList.add(obj);
        	
        }
	        
	        
	        /*
	         * 
	         */
	        
	        System.out.println("query execute");      
	        
	        while(rs.next()){
	        DeptValues.put(Integer.parseInt(rs.getString("deptid")),(rs.getString("deptname")));
	        
	        System.out.println(rs.getString("deptname").toString()+" "+Integer.parseInt(rs.getString("deptid")));
	        //response.sendRedirect("Success.jsp");
			}
	        while(job_rs.next()) {
	        	jobtitle.put(Integer.parseInt(job_rs.getString("jobcode")), (job_rs.getString("jobtitle")));
		        jobsal.put(Integer.parseInt(job_rs.getString("jobcode")), Integer.parseInt(job_rs.getString("maxsalary")));
		        //System.out.println(rs.getString("jobtitle").toString()+" "+Integer.parseInt(rs.getString("jobcode")));
	        }
	        /*for (Map.Entry post: DeptValues.entrySet()) {   
	        	
	        	System.out.println(post.getKey()+" "+post.getValue());
	        }*/
	        
	        System.out.println("******");
	        while(mgr_rs.next()) {
	        	mgrval.put(Integer.parseInt(mgr_rs.getString("empid")), (mgr_rs.getString("empname")));
	        }
	        
	        request.setAttribute("displayList", empList);
	        request.setAttribute("dept",DeptValues);
	        request.setAttribute("jobtitle",jobtitle);
	        request.setAttribute("jobsal",jobsal);
	        request.setAttribute("manager", mgrval);
	        System.out.println("*&&&&&");
	        
	        rs.close();
	        job_rs.close();
	        mgr_rs.close();
	        stm.close();
	        statements.close();
	        stmts.close();
	        employeedetails.close();
	        employeedetails_rs.close();
	        System.out.println("*****");
		}
		catch(SQLException e) {
		System.out.println("sql Exception:"+e.getMessage());
	}
		
		
	
		try {
		RequestDispatcher rd = request.getRequestDispatcher("InsEmp.jsp");
        rd.forward(request, response);	
        }
		catch(Exception e) {
			e.printStackTrace();
		}

		
		
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
			
		Connection dbConnection = null;
		Statement stmt = null;
	    try {
		System.out.println("insert into table");
        String sqlid,sqlmail;
        sqlid = "select max(empid) as empid from employee";
        //sqlmail="select email from employee where email=(?)";
        
        
       
        dbConnection = getDBConnection();
    
    	String firstname="";
    	String lastname="";
    	String mailext="@imaginea.com";
        stmt = dbConnection.createStatement();
        ResultSet rs=stmt.executeQuery(sqlid);
        String empid="";
        int id=0;
        /*
         * if email id already exists append the empid to the mail id.
         */
        while(rs.next()){
        	id = rs.getInt("empid");
        	id+=1;
        	System.out.println(id);
        	System.out.print("inside increment id");
        	
        }
        /*
         * initialize and validate id and store in string to append in email
         */
        if(id==0) {
        	empid="";
        	System.out.print("inside normal id");
        }
        else {
        	empid=Integer.toString(id);
        	System.out.print("inside id");
        }
        
        
        System.out.println("1");
        
        PreparedStatement pstmt = dbConnection.prepareStatement("{call dbo.usp_employee_insert( ?, ?, ?, ?, ?, ?, ?, ?)}");
        pstmt.setString(1, "");
        
        System.out.println("status");
        
        /*pstmt.setInt(2, 9 );
        
        System.out.println("id");
        */
        
        firstname=request.getParameter("firstname");
        lastname=request.getParameter("lastname");
        pstmt.setString(2,firstname.trim()+" "+lastname.trim());
        System.out.println("name");
        firstname+="."+lastname;
        

        
        //System.out.println("3");
        pstmt.setInt(3,Integer.parseInt(request.getParameter("mgrid")));
        
        System.out.println("mgr");
        
        pstmt.setInt(4,Integer.parseInt(request.getParameter("deptid")));
        System.out.println("dept");
        
        pstmt.setInt(5, Integer.parseInt(request.getParameter("salary")));
        System.out.println("salary");
        
        /*pstmt.setString(6, "");
        
        System.out.println("date");*/
        
        pstmt.setInt(6,Integer.parseInt(request.getParameter("jobcode")));
        System.out.println("jobcode");
        String phonenum=request.getParameter("phonenumber");
        String countrycode=request.getParameter("countryCode");
        pstmt.setString(7,countrycode+phonenum);
        System.out.println("phonenum");
        //pstmt.setString(8,(request.getParameter("firstname").toString()+"."+request.getParameter("Lastname").toString()+"Pramati.com`"));
        String mailid=firstname;
        firstname+= mailext;
        firstname.trim();
        
        PreparedStatement psmt = dbConnection.prepareStatement("select email from employee where email=(?)");
        psmt.setString(1,firstname);
        
        ResultSet rss= psmt.executeQuery();
        
        if(rss.next()) {
        	String email=rss.getString("email");
        	 if(email.equals(firstname)) {
 	        	mailid += empid + mailext ;
 	        	System.out.println("inside email check");
 	        }
 	        else {
 	        	mailid+=mailext;
 	        	System.out.println("inside email initialize");
 	        }
        }
        else {
        	mailid+=mailext;
	        	System.out.println("inside email initialize");
        }
        
      /*  while(rss.next()){
        	String email=rss.getString("email");
        	
	        if(email.equals(firstname)) {
	        	mailid += empid + mailext ;
	        	System.out.println("inside email check");
	        }
	        else {
	        	mailid+=mailext;
	        	System.out.println("inside email initialize");
	        }
        }
      */  
        psmt.close();
        
        pstmt.setString(8,mailid);
        System.out.println("mailid");
        
        /*
         * to check if email id already exists
         */
        
        //setString();
        
        //rs=stmt.executeQuery(sqlmail);
        
       
        
        
        
        
        pstmt.execute();
        System.out.println("10");
       
       
        pstmt.close();
        dbConnection.close();
        System.out.println("11");
        }
	    catch(SQLException e) {
	    	System.out.println("sql exception" + e.getMessage());
	    }
	 //   HttpServletResponse.sendRedirect("success.jsp");
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
