<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
.navbar navbar-inverse{
	background-color:blue;
}
</style>
  <title>HR Management System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  		
<!-- The document style goes here -->
  		<style type="text/css">
  		html {
    position: relative;
    min-height: 100%;
}
body {
    margin: 0 0 100px; /* bottom = footer height */
}
footer {
    position: absolute;
    left: 0;
    bottom: 0;
    height: 100px;
    width: 100%;
}
  		body {
  min-height: 55rem; /* Can be removed; just added for demo purposes */
}

.navbar {
  margin-bottom: 0;

}

.collapse {
	margin-left: 20%;
}

.jumbotron {
  padding-top: 5rem;
  padding-bottom: 5rem;
  margin-bottom: 0;
  background-color: #fff;
}

.jumbotron p:last-child {
  margin-bottom: 0;
}

.jumbotron-heading {
  font-weight: 300;
}

.jumbotron .container {
  max-width: 50rem;
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

footer {
  padding-top: 3rem;
  padding-bottom: 3rem;
}

footer p {
  margin-bottom: .25rem;
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
<body style="background-color:#E3E4FA;">

<!-- Nav Bar starts here -->

<nav class="navbar navbar-inverse" style="background-color: #5A81AB;">
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
    <img src="HUMAN RESOURCE.png" alt="Find Image Path" style="height:500px;width:100%;" > </img>
  




<!-- Footer -->
	<footer  style="float:left;position:relative;bottom:0;">
      <div style="margin-left:20px;">   
        <p>Copyrights &copy;Team_4 2017</p>
        <p>All rights reserved</p>
      </div>
      </footer>


 


</body>
</html>