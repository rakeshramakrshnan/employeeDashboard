<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page language="java" import="java.util.*" %>
<%@page language="java" import="com.abcd.DepartmentModel" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
  <title>HR Management System</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <script>
  $(document).ready(function(){
        $("input[type='radio']").click(function(){
            var radioValue = $("input[name='update']:checked").val();
            if(radioValue){
 				document.getElementById("update").value = radioValue;
 				document.getElementById("delete").value = radioValue;
 				          		
            }
        });
        
    });

  function upfunc()
  {
  	if($("input[name='update']:checked").val())
  return true;
    else
    alert("Please select a Record");
    return false;

  }
  function delfunc()
  {
  	if($("input[name='update']:checked").val())
  	{
  		var r = confirm("Are you sure to delete the record!");
  	   if (r == true) {
  	       return true;
  	   } else {
  	       return false;
  	   }	
  		
  		}
  	
  		  else
  		  alert("Please select a Record");
  		  return false;

  	   
  	

  }
</script>

  		
<!-- The document style goes here -->
  		<style type="text/css">

#result{
background-color:white;
padding-bottom: 5%;
	
}


.navbar {
  margin-bottom: 0;

}

.collapse {
	margin-left: ;
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


.footer {
  padding-top: 2%;
	padding-left: 5%;
    text-align: left;
}

th{
text-align:left;
height:10px;
background-color:#E3E4FA;

}
#updatedelete{
	background-color:darkgrey;
}

.navbar navbar-default{
	background-color:black;
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
	  margin-top: 5%;
	  margin-left: 5%;
	  margin-right: 5%;
	  margin-bottom: 2%;
	  
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



<!-- Jumbotron Section Starts here to display records -->
 
<div id="result">
<div class="table-responsive" style = "background:white; color: black;  font-size:12px; text-align: left;">   
<div class="card" style="margin-left:20%; margin-right:20%;">
<table class="table table-striped table-bordered table-hover">
<tr>
<th width="18%" align="center">Department ID</th>
<th>Department Name</th>
<th width="20%">Select Record</th>
</tr>

<%

List<DepartmentModel> deptlist =(ArrayList<DepartmentModel>) request.getAttribute("displayList"); 
for (DepartmentModel Abc : deptlist) {   
%>
<tr>
<td width="18%" align="center"><%=Abc.getDeptid()%></td>
<td><%=Abc.getDeptname()%></td>
<td width="20%" align="center"><input id = "radio" type = "radio"  value="<%=Abc.getDeptid()%>" id="update" name="update"></input></td>
</tr>
<%}%>
  

</table>
</div>


<form class="form-horizontal col-sm-8" action="DepartmentUpdate" method="get">
	<button class="btn btn-primary pull-right" type="submit"   id="update" name="update"onclick="return upfunc()"> Update </button>
</form>


<form class="form-horizontal col-sm-1" action="DepartmentDisplay" method="post">
	<button class="btn btn-primary pull-right" type="submit"  id="delete" name="delete" onclick="return delfunc()"> Delete </button>
	
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