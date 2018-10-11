<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
  <%@page language="java" import="java.util.*" %>


<%@page language="java" import="com.abcd.JobModel" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert Job</title>
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
#res{
margin-right:10px;
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

.navbar-custom{
background-color:#5A81AB;
color:black;
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
	  margin-top: 5px;
	  margin-left: 30%;
	  margin-right: 30%;
	  box-sizing: border-box;
	  border-radius: 4px;
	  background-clip: padding-box;
	}






		</style>



</head>
<body style="background-color:#E3E4FA;">

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


<!-- Form div begins here -->
<div class="container">

	<form class="form-horizontal" action ="Job" method="post" onsubmit='alert("Submitted!")'>

		<div class="form-group">

			<label class="control-label col-sm-4" >Job Title </label>
			<div class="col-sm-6">
					<input class="form-control" type="text" name="jobtitle" placeholder="eg.Principal Engineer" required>
					<br>
			</div>

			<label class="control-label col-sm-4" >Maximum Salary </label>
			<div class="col-sm-6">
			<input class="form-control"type="number" name="maxsalary" maxlength = 10 min= 0 placeholder="eg.100000" required>
			<br>
	 <input type="submit" class="btn btn-primary pull-right" id="right-panel-link" href="#right-panel" value="Submit"></input>
		<input id="res"class="btn btn-primary pull-right" type="reset"  href="#right-panel"  value="Reset">	
			</div>
		</div>
	</form>
</div>




<!-- table begins here -->




<div id="result" class="table-responsive">
<div class="card">
<table class="table table-striped table-bordered table-hover">

<tr>
<th width="10%">Job ID</th>
<th>Job Title</th>
<th>Max Salary</th>


</tr>

<%

List<JobModel> joblist =(ArrayList<JobModel>) request.getAttribute("displayList"); 
for (JobModel Abc : joblist) {   
%>

 <tr>
<td width="10%" align="center"><%=Abc.getJobcode()%></td>
<td><%=Abc.getJobtitle()%></td>
<td><%=Abc.getMaxsalary()%></td>

</tr>

<%}%>
</table>
</div>
</div>


<!-- Footer -->
	<div class="footer">
      <div style="margin-left:2%;">   
        <p>Copyrights &copy;Team_4 2017</p>
        <p>All rights reserved</p>
      </div>
      </div>
</html>