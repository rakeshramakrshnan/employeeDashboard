

<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="com.abcd.EmployeeModel" %>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Update Employee</title>



<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Script
to
validate phone
number -->


<script>

function Validation()
{
var status=false;

var a = document.form.phonenumber.value;
if(a=="")
{
alert("please Enter the Contact Number");
document.form.phonenumber.focus();
return status;
}
if(isNaN(a))
{
alert("Enter the valid Mobile Number(Like : 9876543210)");
document.form.phonenumber.focus();
return status;
}
if((a.length < 10) || (a.length > 10))
{
alert(" Mobile Number cannot be more than 10 digits");
return status;
}
return salary_Validation();

}




function salary_Validation()
{
	//id value
var b=document.form.jobcode.value;
var d= document.getElementById("jobcode_"+b).value;
var a = document.form.salary.value;

if(a=="")
{
alert("please Enter salary");
document.form.salary.focus();
return false;
}
if(isNaN(a))
{
alert("Enter the valid salary(Like : 375000)");
document.form.salary.focus();
return false;
}
if(Number(a)>Number(d))
{
var maxsal="salary cannot be more than "+d;
alert(maxsal);
return false;
}
return alert("Record Updated!");
}
</script>


<!-- Script
to
validate phone
number -->









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
  padding-top: 3rem;
  padding-bottom: 3rem;
}

#result{
background-color:white;
padding-top: 2%;
padding-bottom: 5%;
}
#res{
margin-right:10px;
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


<%List<EmployeeModel> emplist =(ArrayList<EmployeeModel>) request.getAttribute("list"); 

String empname[]= (String[])request.getAttribute("name");
int empval=(Integer)request.getAttribute("empid");

%>

<div id="result">
<div class="container" style="margin-top:50px;">
	<form class="form-horizontal" action ="EmpUpdate" method="post" onsubmit="return Validation()">
		<div class="formgroup">
			<label class="control-label col-sm-4" >First Name </label>
				<div class="col-sm-6">
					<input class="form-control" type="text" name="firstname" placeholder="first name" value="<%=empname[0] %>" required>
						<br>
				</div>

			<label class="control-label col-sm-4" >Last Name </label>
				<div class="col-sm-6">
				<input class="form-control" type="text" name="lastname" placeholder="Last name" value="<%=empname[1] %>" required></input>
				<br>
			</div>
				<br>
				
			<label class="control-label col-sm-4" >Phone Number </label>
				<div class="col-sm-6">
					<% for(EmployeeModel employee:emplist){ %>
					<input class="form-control" type="text"  name="phonenumber" placeholder="phone number"   value="<%=employee.getPhone() %>" required></input>
					<br>
				</div>
				<br>
			<label class="control-label col-sm-4" >Salary </label>
				<div class="col-sm-6">
				<input class="form-control" type="number" name="salary" maxlength = "10" min= 0 placeholder="salary" value="<%=employee.getSalary() %>" required>
				<br>
			</div> 
				<%}%>
			<br>
			<br>
			</br></br></div>
			
			<label class="control-label col-sm-4" >Manager</label>
							<div class="col-sm-6">
			
				<select name="mgrid"  class="form-control">
				<option value=0 default > select </option>
			 <%
			 
			  HashMap<Integer,String> managerval=(HashMap<Integer,String>)request.getAttribute("manager"); 
			  for (Map.Entry post: managerval.entrySet()) {   
			%>
			  <option value="<%=post.getKey()%>" > <%=post.getValue()%> </option>
			<%}%>
				</select>
				<br>
			</div>

			<label class="control-label col-sm-4" >Department </label>
			<div class="col-sm-6">
			 <select name="deptid" class="form-control">
			 <%
			  HashMap<Integer,String> posts=(HashMap<Integer,String>)request.getAttribute("data"); 
			  for (Map.Entry post: posts.entrySet()) {   
			%>
			  <option value="<%=post.getKey()%>" > <%=post.getValue()%> </option>
			<%}%>
			</select>
			<br>
			</div>



			<label class="control-label col-sm-4" >Job Title </label>
			<div class="col-sm-6">
			<select name="jobcode" id="jobcode" class="form-control">
			 <%
			  HashMap<Integer,String> jobval=(HashMap<Integer,String>)request.getAttribute("jobtitle"); 
			  for (Map.Entry post: jobval.entrySet()) {   
			%>
			  <option value="<%=post.getKey()%>" > <%=post.getValue()%> </option>
			<%}%>
			</select>
			
			<br>
			</div>


			<input type="hidden" name="empid" value="<%=empval %>" >
			
			
			<label class="control-label col-sm-4" ></label>
			<div class="col-sm-6">
			 <input  class="btn btn-primary pull-right" type="submit" href="#right-panel" value="Submit" >
		
			
		
			  </div>
			  </input>
			  </div>
			</form>
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
