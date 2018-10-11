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
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class Display
 */
@WebServlet("/Display")
public class Display extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=Student";
	static final String USER = "vignesh";
	static final String PASS = "12345";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Display() {
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
		Statement stm = null;
		Statement stmts = null;
		Statement statements = null;
		dbConnection = getDBConnection();
		
		try {
			String dept="select deptname,deptcode from department";
			String job="select jobtitle,jobcode,maxsalary from job";
			String manager="select empid,empname from employee where mgrid=0";
			
			stm = dbConnection.createStatement();
			stmts=dbConnection.createStatement();
			statements=dbConnection.createStatement();
			
	        ResultSet rs=stm.executeQuery(dept);
	        ResultSet job_rs=stmts.executeQuery(job);
	        ResultSet mgr_rs=statements.executeQuery(manager);
	        System.out.println("query");
	        //List Deptname=new ArrayList();
	        
	        HashMap<Integer,String> DeptValues=new HashMap<Integer,String>();
	        HashMap<Integer,String> jobtitle=new HashMap<Integer,String>();
	        HashMap<Integer,Integer> jobsal=new HashMap<Integer,Integer>();
	        HashMap<Integer,String> mgrval=new HashMap<Integer,String>();
	        
	        
	        System.out.println("query execute");      
	        
	        while(rs.next()){
	        DeptValues.put(Integer.parseInt(rs.getString("deptcode")),(rs.getString("deptname")));
	        
	        System.out.println(rs.getString("deptname").toString()+" "+Integer.parseInt(rs.getString("deptcode")));
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
	        
	        
	        while(mgr_rs.next()) {
	        	mgrval.put(Integer.parseInt(mgr_rs.getString("empid")), (mgr_rs.getString("empname")));
	        }
	        
	        request.setAttribute("data",DeptValues);
	        request.setAttribute("jobtitle",jobtitle);
	        request.setAttribute("jobsal",jobsal);
	        request.setAttribute("manager", mgrval);
	        
	        rs.close();
	        job_rs.close();
	        mgr_rs.close();
	        stm.close();
	        statements.close();
	        stmts.close();
        
		}
		catch(SQLException e) {
		System.out.println("sql Exception:"+e.getMessage());
	}
		
		
	
		try {
		RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
        rd.forward(request, response);	
        }
		catch(Exception e) {
			e.printStackTrace();
		}
		/*try {
			String deptname="select deptname from department";
			stmt = dbConnection.createStatement();
	        ResultSet rs=stmt.executeQuery(deptname);
        
	        //List Deptname=new ArrayList();
	        List<String> Deptname = new ArrayList<String>();
	        System.out.println("query");
	        System.out.println("query execute");      
	        
	        while(rs.next()){
	        Deptname.add(rs.getString("deptname"));
	        //System.out.println(rs.getString("deptname"));
	        //response.sendRedirect("Success.jsp");
			}
	        
	        request.setAttribute("data",Deptname);
	        rs.close();
	        stmt.close();
        
		}
		catch(SQLException e) {
		System.out.println("sql Exception:"+e.getMessage());
	}
		
		getServletContext().getRequestDispatcher("/display.jsp").forward(
				request, response);
	
		try {
		RequestDispatcher rd = request.getRequestDispatcher("display.jsp");
        rd.forward(request, response);	
        }
		catch(Exception e) {
			e.printStackTrace();
		}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		try {
	System.out.println(request.getParameter("deptname").toString());
	System.out.println(request.getParameter("jobtitle").toString());
	System.out.println(request.getParameter("mgrid").toString());
		}
		catch(Exception e) {
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
