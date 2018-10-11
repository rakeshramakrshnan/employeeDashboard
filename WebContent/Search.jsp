<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
 <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 
  <script type="text/javascript">

  var test = <%=request.getAttribute("a")%>;
  if(test==1){
  alert("No records found");
  }
  </script>

  
  
<title>Search</title>
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

.album {
  
  padding-top: 3rem;
  padding-bottom: 3rem;
  background-color: #f7f7f7;
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

.card {
	  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
	}

	.card {
	  margin-top: 10px;
	  margin-left: 30%;
	  margin-right: 30%;
	  box-sizing: border-box;
	  border-radius: 4px;
	  background-clip: padding-box;
	}



    </style>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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
<br>
<br>

<div id="result">
<div class="container">
<form class="form-horizontal" action="SearchEmployee" method="post" >
<p class="lead text-muted">Search By </p>
<label class="control-label col-sm-4" >Name</label>
  <div class="col-sm-6">
<input type="text" name="Name" class="form-control"  placeholder="Employee/Department/JobTitle">
<br>
</div>
<label class="control-label col-sm-4" >Salary</label>
  <div class="col-sm-6">
<input type="number" name="Salary"  class="form-control" default=0 placeholder="eg.40000">
<br>
</div>
<label class="control-label col-sm-4" >Hire Date</label>
  <div class="col-sm-6">
<input type="date" name="Hiredate" class="form-control" >
<br>
<input type="submit" class="btn btn-primary pull-right"  id="right-panel-link" href="#" value="Submit"></input>

<input id="res" class="btn btn-primary pull-right" style="margin-right:10%;" type="reset"  href="#right-panel"  value="Reset">

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
