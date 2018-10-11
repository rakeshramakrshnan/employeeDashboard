package com.abcd;

import java.io.IOException;
import java.io.PrintWriter;
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
 * Servlet implementation class EmpUpdate
 */
@WebServlet("/EmpUpdate")
public class EmpUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=hrdatabase";
	static final String USER = "hrdb";
	static final String PASS = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmpUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		//request.setAttribute("firstname","vignesh");
		//request.setAttribute("lastname","sh");
		/*Connection dbConnection = null;
		Statement stmt = null;
		try{
		dbConnection = getDBConnection();
		String sqlid = "select max(empid) as empid from employee";
		stmt = dbConnection.createStatement();
        ResultSet rs=stmt.executeQuery(sqlid);
        }
		catch(SQLException e) {
			
		}*/
		
		
		Connection dbConnection = null;
		Statement stm = null;
		Statement stmts = null;
		Statement statements = null;
		Statement fetch = null;
		dbConnection = getDBConnection();
		System.out.println("inside empupdate get");
		try {
			String fullname[]= {"first" ,"last"};
			
			int a = Integer.parseInt( request.getParameter("update"));
			//String sql="select * from employee  where empid =  "+ a;
			PreparedStatement emp_fetch = dbConnection.prepareStatement("select * from employee  where empid = ?");
			emp_fetch.setInt(1, a);
			
		    
			String dept="select deptname,deptid from department";
			String job="select jobtitle,jobcode,maxsalary from job";
			String manager="select empid,empname from employee where mgrid=0";
			
			stm = dbConnection.createStatement();
			stmts=dbConnection.createStatement();
			statements=dbConnection.createStatement();
			fetch = dbConnection.createStatement();
			
			List <EmployeeModel> empList = new ArrayList<EmployeeModel>();
			
	        ResultSet rs=stm.executeQuery(dept);
	        ResultSet job_rs=stmts.executeQuery(job);
	        ResultSet mgr_rs=statements.executeQuery(manager);
	        ResultSet emp_rs = emp_fetch.executeQuery();
	        
	      
	        
	        
	        if(emp_rs.next()) 
	        	{
	        	EmployeeModel obj = new EmployeeModel();
	        	fullname = emp_rs.getString("empname").split(" ");
		        System.out.println(emp_rs.getString("empname"));
		        //System.out.println(fullname[0]+"  ****  "+fullname[1]);
	      
	        	System.out.println("empfetch");
	        	obj.setEmpid(Integer.parseInt(emp_rs.getString("empid")));
	        	System.out.println("empfetch1");
	        	obj.setEmpname(emp_rs.getString("empname"));
	        	System.out.println("empfetch2");
	        	obj.setHiredate(emp_rs.getString("hiredate"));
	        	obj.setDeptid(Integer.parseInt(emp_rs.getString("deptid")));
	        	obj.setJobcode( Integer.parseInt(emp_rs.getString("jobcode")));
	        	obj.setMgrid(Integer.parseInt(emp_rs.getString("mgrid")));
	        	obj.setSalary(Integer.parseInt(emp_rs.getString("salary")));
	        	obj.setPhone(emp_rs.getString("phone"));
	        	obj.setEmail(emp_rs.getString("email"));
	        	empList.add(obj);
        	
        }
    
	       
	        
	        
	        System.out.println("query");
	        //List Deptname=new ArrayList();
	        
	        HashMap<Integer,String> DeptValues=new HashMap<Integer,String>();
	        HashMap<Integer,String> jobtitle=new HashMap<Integer,String>();
	        HashMap<Integer,Integer> jobsal=new HashMap<Integer,Integer>();
	        HashMap<Integer,String> mgrval=new HashMap<Integer,String>();
	        
	        
	        System.out.println("query execute");      
	        
	        while(rs.next()){
	        DeptValues.put(Integer.parseInt(rs.getString("deptid")),(rs.getString("deptname")));
	        
	        System.out.println(rs.getString("deptname").toString()+" "+Integer.parseInt(rs.getString("deptid")));
	        //response.sendRedirect("Success.jsp");
			}
	        while(job_rs.next()) {
	        	jobtitle.put(Integer.parseInt(job_rs.getString("jobcode")), (job_rs.getString("jobtitle")));
		        jobsal.put(Integer.parseInt(job_rs.getString("jobcode")), Integer.parseInt(job_rs.getString("maxsalary")));
		        System.out.println(job_rs.getString("jobtitle").toString()+" "+Integer.parseInt(job_rs.getString("jobcode")));
	        }
	        /*for (Map.Entry post: DeptValues.entrySet()) {   
	        	
	        	System.out.println(post.getKey()+" "+post.getValue());
	        }*/
	        
	        
	        while(mgr_rs.next()) {
	        	mgrval.put(Integer.parseInt(mgr_rs.getString("empid")), (mgr_rs.getString("empname")));
	        	System.out.println("mgr"); 
	        }
	        
	        request.setAttribute("data",DeptValues);
	        request.setAttribute("jobtitle",jobtitle);
	        request.setAttribute("jobsal",jobsal);
	        request.setAttribute("manager", mgrval);
	        request.setAttribute("list",empList);
	        request.setAttribute("name",fullname);
	        request.setAttribute("empid",a);
	        System.out.println("size"+empList.size());
	        
	        
	      
	        
	        
	        System.out.println("result set compl"); 
	        
	        rs.close();
	        job_rs.close();
	        mgr_rs.close();
	        emp_rs.close();
	        stm.close();
	        statements.close();
	        stmts.close();
	        fetch.close();
        
		}
		catch(SQLException e) {
		System.out.println("sql Exception:"+e.getMessage());
	}
		
		
		
		try {
			
			System.out.println(request.getParameter("update"));
			System.out.println("abcd");
			RequestDispatcher rd = request.getRequestDispatcher("empUpdate.jsp");
			       rd.forward(request, response);	
			       }
			catch(Exception e) 
			{
			e.printStackTrace();
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
			PreparedStatement pstmt = dbConnection.prepareStatement("{call dbo.usp_employee_update( ?, ?, ?, ?, ?, ?, ?)}");
		    String firstname=request.getParameter("firstname")+" "+request.getParameter("lastname");	
		    System.out.println("firstname");
			pstmt.setInt(1, Integer.parseInt(request.getParameter("empid")));
			System.out.println("id");
			pstmt.setString(2, firstname);
			System.out.println("insert firstname");
			pstmt.setInt(3,Integer.parseInt(request.getParameter("mgrid")));
			System.out.println("mgr id");
			pstmt.setInt(4,Integer.parseInt(request.getParameter("deptid")));
			System.out.println("insert dept id");
			pstmt.setInt(5,Integer.parseInt(request.getParameter("salary")));
			System.out.println("salary");
			pstmt.setInt(6,Integer.parseInt(request.getParameter("jobcode")));
			System.out.println("jobcode");
			pstmt.setString(7,request.getParameter("phonenumber"));
			System.out.println("pphone");
			pstmt.execute();
           
            pstmt.close();
        }
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		finally{
			PrintWriter out = response.getWriter();
			out.println("<script type=\"text/javascript\">");
		       out.println("alert('User or password incorrect');");
		       out.println("</script>");
			
			 response.sendRedirect("EmpDisp");

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
