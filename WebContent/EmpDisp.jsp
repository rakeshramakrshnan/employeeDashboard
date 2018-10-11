<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
  pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="com.abcd.EmployeeModel" %>

<head>
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

<title>Display Employee</title>


<!-- The document style goes here -->
      <style type="text/css">

#result{
background-color:white;
padding-bottom: 5%;
padding-top: 5%;
	
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
	  margin-top: 1%;
	  margin-left: 2%;
	  margin-right: 2%;
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
            <li><a href="DepartmentDisplay">Department</a></li>
           
            <li><a href="JobDisplay">Job Role</a></li>
          </ul>
        </li>
        <li><a href="SearchEmployee" style="color:white;">Search</a></li>
        
      </ul>
    </div>
  </div>
</nav>
  
<!-- Nav bar Ends Here -->

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
<div class="table-responsive" style = "background:white; color: black; font-size:12px; text-align: left;">
<div class="card">
<table class="table table-striped table-bordered table-hover">


<tr>
<th>Employee ID</th>
<th>Employee Name</th>

<th>Employee Department</th>
<th>Employee Salary</th>
<th>Employee Hiredate</th>
<th>Employee Job</th>
<th>Employee Phone</th>
<th>Employee Email</th>
<th>Select Record</th>

</tr>

<%

List<EmployeeModel> emplist =(ArrayList<EmployeeModel>) request.getAttribute("displayList"); 
for (EmployeeModel Abc : emplist) {   
%>

 <tr>
<td align="center"><%=Abc.getEmpid()%></td>
<td><%=Abc.getEmpname()%></td>

<td><%=dept.get(Abc.getDeptid())%></td>

<td><%=Abc.getSalary()%></td>
<td><%=Abc.getHiredate()%></td>
<td><%=job.get(Abc.getJobcode())%></td>
<td><%=Abc.getPhone()%></td>
<td><%=Abc.getEmail()%></td>
<td align="center"><input id = "radio" type = "radio"  value="<%=Abc.getEmpid()%>" id="update" name="update"></input>

</tr> 

<%}%>


</table>

</div>

<form  class= "form-horizontal col-sm-10" action="EmpUpdate" method="get" >
	<button class="btn btn-primary" type="submit" id="update" onclick="return upfunc()" name="update" style="float:right;" > Update </button>
	
</form>
<form  class= "form-horizontal col-sm-1"  action="EmpDisp" method="post">
	<button class="btn btn-primary" type="submit"  id="delete" onclick="return delfunc()" name="delete" style="float:right;"> Delete </button>
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