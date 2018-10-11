<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>HR Management System</title>
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
</head>
<body  style="background-color:#E3E4FA;">

<!-- Nav Bar starts here -->

<nav class="navbar navbar-default">  
<div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="index.jsp">HR Management System</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Insert<span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="InsDept.jsp">Insert Department</a></li>
            <li><a href="Employee">Insert Employee</a></li>
            <li><a href="InsJob.jsp">Insert Job</a></li>
          </ul>
        </li>
        <li class="dropdown">
          <a class="dropdown-toggle" data-toggle="dropdown" href="#">Display <span class="caret"></span></a>
          <ul class="dropdown-menu">
            <li><a href="#">Display Department</a></li>
            <li><a href="#">Display Employee</a></li>
            <li><a href="#">Display Job</a></li>
          </ul>
        </li>
        <li><a href="#">Search</a></li>
        
      </ul>
    </div>
  </div>
</nav>

<!-- Nav bar Ends Here -->

  
<div id="result">
        <div class="container">
          <h1 >Submitted Successfully !</h1>
          <p class="lead text-muted">Please Go Back To The Home Page Or Select Another Operation.</p>
          <p>
            <a href="index.jsp" class="btn btn-primary">Go To Home Page</a>
            
          </p>
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