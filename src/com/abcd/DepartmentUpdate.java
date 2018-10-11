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
 * Servlet implementation class DepartmentUpdate
 */
@WebServlet("/DepartmentUpdate")
public class DepartmentUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final String DB_URL = "jdbc:sqlserver://localhost:1433;databaseName=hrdatabase";
	static final String USER = "hrdb";
	static final String PASS = "1234";
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DepartmentUpdate() {
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
		List <DepartmentModel> DepartmentList = new ArrayList<DepartmentModel>();
		try {
			int departmentId= Integer.parseInt(request.getParameter("update"));
			PreparedStatement deptFetch = dbConnection.prepareStatement("select * from department  where deptid = ?");
			deptFetch.setInt(1, departmentId);
			ResultSet rs=deptFetch.executeQuery();
			if(rs.next()) {
				DepartmentModel obj= new DepartmentModel();
				obj.setDeptid(Integer.parseInt(rs.getString("deptid")));
				obj.setDeptname(rs.getString("deptname"));
				DepartmentList.add(obj);
				
			}
			request.setAttribute("departmentList", DepartmentList);
			
		
		}
		catch(SQLException e) {
			System.out.println(e.getMessage());
		}
		finally {
			RequestDispatcher rd = request.getRequestDispatcher("DepartmentUpdate.jsp");
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
			PreparedStatement pstmt = dbConnection.prepareStatement("{call dbo.usp_department_update( ?, ?)}");
			pstmt.setInt(1, Integer.parseInt(request.getParameter("deptid")));
			System.out.println("id");
			pstmt.setString(2, request.getParameter("deptname"));
			pstmt.execute();
			
			pstmt.close();
			
		}
		catch(Exception e) {
			System.out.println(e.getMessage());
		}
		finally {
			
			RequestDispatcher rd = request.getRequestDispatcher("DepartmentDisplay");
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
