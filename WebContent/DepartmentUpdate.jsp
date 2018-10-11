<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="com.abcd.DepartmentModel" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<!-- The document style goes here -->
  		<style type="text/css">
  		body {
  min-height: 75rem; /* Can be removed; just added for demo purposes */
}

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

.album {
  
  padding-top: 3rem;
  padding-bottom: 3rem;
  background-color: #f7f7f7;
}

.card {
  float: left;
  background: white;
  width: 33.333%;
  padding: .75rem;
  margin-bottom: 2rem;
  border: 0;
}

.card > img {
  margin-bottom: .75rem;
}

.card-text {
  font-size: 85%;
}

.footer {
 	padding-top: 2%;
	padding-left: 5%;
    text-align: left;
}

#result{
background-color:white;
padding-top: 10%;
padding-bottom: 10%;
	
}

.navbar-custom{
background-color:#5A81AB;
color:black;
}
.centered {
    position: relative;
    text-align: center;
    color: white;
    
}

		</style>

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
<div id="result">

<%List<DepartmentModel> deptlist =(ArrayList<DepartmentModel>) request.getAttribute("departmentList"); 

%>

<div class="container">
		<form class="form-horizontal" method="post" action="DepartmentUpdate"  onsubmit='alert("Submitted!")'>
		<% for(DepartmentModel department:deptlist){ %>
			<div class="form-group">
				<label class="control-label col-sm-4" >Department :</label>
					<div class="col-sm-6">
						<input class="form-control" type="text" name="deptname" value="<%=department.getDeptname() %>" required "></input>
						<input type="hidden" value="<%=department.getDeptid()%>" name="deptid" ></input>
						<br>
						</div>
							<%}%>			
						<label class="control-label col-sm-4" ></label>
							<div class="col-sm-6">
							<input type="submit" class="btn btn-primary" value="Submit" ></input>
						
							</div>
						</div>
			
		</form>

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