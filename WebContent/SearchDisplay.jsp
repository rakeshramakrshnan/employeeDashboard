
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="com.abcd.SearchModel" %>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Display Job</title>

 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- The document style goes here -->
  		<style type="text/css">

.navbar {
  margin-bottom: 0;

}

.collapse {
	margin-left: 20%;
}

.form-group{
	margin-top: 5rem;
	margin-bottom: 5rem;

}


.footer {
  	padding-top: 2%;
	padding-left: 5%;
    text-align: left;
}

#result{
background-color:white;
padding-bottom: 5%;
padding-top: 5%;
	
}
#section{}
.navbar-custom{
background-color:#5A81AB;
color:black;
}
#res{
margin-right:10px;
}
.centered {
    position: relative;
    text-align: center;
    color: white;
    
}


.card {
	  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	}

	.card {
	  margin-top: 7%;
	  margin-bottom: 7%;
	  margin-left: 5%;
	  margin-right: 5%;
	  box-sizing: border-box;
	  border-radius: 4px;
	  background-clip: padding-box;
	}

		</style>




<script>
function upfunc()
{
alert("confirm update record!!");
}
function delfunc()
{
alert("confirm delete record!!");
}
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body  style="background-color:#E3E4FA;">

<!-- Nav Bar starts here -->

<nav class="navbar navbar-custom">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" style = "color:white;"href="index.jsp">HR Management System</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#" style="color:white;">Create<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="Department">Department</a></li>
            <li><a href="Employee">Employee</a></li>
            <li><a href="Job">Job Role</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#"style="color:white;">View <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="DepartmentDisplay">Department</a></li>
            <li><a href="EmpDisp">Employee</a></li>
            <li><a href="JobDisplay">Job Role</a></li>
          </ul>
        </li>
        <li><a href="SearchEmployee" style="color:white;">Search</a></li>
        
      </ul>
    </div>
  </div>
</nav>
  
<!-- Nav bar Ends Here -->


<%
HashMap<Integer,String> dept=(HashMap<Integer,String>)request.getAttribute("deptvalues"); 
  
%>

<%
HashMap<Integer,String> job=(HashMap<Integer,String>)request.getAttribute("jobtitle"); 
  
%>
<%
HashMap<Integer,String> manager=(HashMap<Integer,String>)request.getAttribute("manager"); 
  
%>

<div id="result">

<div class="table-responsive">
<div class="card" >

<table class="table table-hover table-striped table-bordered">



<tr>
<th>Employee ID</th>
<th>Employee Name</th>

<th>Employee Department</th>
<th>Employee Salary</th>
<th>Employee Hiredate</th>
<th>Employee Job</th>
<th>Employee Phone</th>
<th>Employee Email</th>

</tr>

<%

List<SearchModel> emplist =(ArrayList<SearchModel>) request.getAttribute("displayList"); 
for (SearchModel Abc : emplist) {   
%>

 <tr>
<td><%=Abc.getEmpid()%></td>
<td><%=Abc.getEmpname()%></td>

<td><%=Abc.getDeptname()%></td>

<td><%=Abc.getSalary()%></td>
<td><%=Abc.getHiredate()%></td>
<td><%=Abc.getJobtitle()%></td>
<td>+<%=Abc.getPhone()%></td>
<td><%=Abc.getEmail()%></td>

</tr>

<%}%>


</table>
</div>

</div>
</div>



<!-- Footer -->
	<div class="footer">
      <div style="margin-left:2%;">   
        <p>Copyrights &copy;Team_4 2017</p>
        <p>All rights reserved</p>
      </div>
      </div>
      
  </body>
</html>