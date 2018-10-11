<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.util.*" %>

<%@page language="java" import="com.abcd.DepartmentModel" %>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<title>Insert Department</title>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css"/>

	<script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
	<script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
 
 
 
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
 <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap.min.js"></script>
 <script> 
 $(document).ready(function() {
	    $('#tab').DataTable();
	} );
 
 </script>
  
  
  
 <script>
  function submitted(){
		if($("input[name='deptname']").val()){
			alert("Submitted !");
		}
			else{
			alert("Error!");
		}
	  	
}
  </script>
  
  
  
  
  
  
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
	  
	  margin-left: 30%;
	  margin-right: 30%;
	  box-sizing: border-box;
	  border-radius: 10px;
	  background-clip: padding-box;
	}


table.dataTable thead .sorting:before, table.dataTable thead .sorting:after, table.dataTable thead .sorting_asc:before, table.dataTable thead .sorting_asc:after, table.dataTable thead .sorting_desc:before, table.dataTable thead .sorting_desc:after {
   padding: 5px;
}
.dataTables_wrapper .mdb-select {
    border: none;
}
.dataTables_wrapper .mdb-select.form-control {
    padding-top: 0;
    margin-top: -1rem;
    margin-left: 0.7rem;
    margin-right: 0.7rem;
    width: 100px;
}
.dataTables_length label {
    display: flex;
    justify-content: left;
}
.dataTables_filter label {
    margin-bottom: 0;
}
.dataTables_filter label input.form-control {
    margin-top: -0.6rem;
    padding-bottom: 0;
}
table.dataTable {
    margin-bottom: 3rem!important;
}
div.dataTables_wrapper div.dataTables_info {
    padding-top: 0;
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

<!-- Form div begins here -->
<div class="container">

	<form class="form-horizontal" action ="Department" method="post" onsubmit ="submitted()">

		<div class="form-group">

			<label class="control-label col-sm-2" >Department </label>
			<div class="col-sm-6">
				<input type="text" class="form-control" name="deptname" placeholder="eg:Marketing" maxlength=20 required>
				<br>
				 <input type="submit" class="btn btn-primary pull-right" id="right-panel-link" href="#right-panel" value="Submit"></input>
				<input id="res"class="btn btn-primary pull-right" type="reset"  href="#right-panel"  value="Reset">
			</div>
		</div>	

	</form>

</div>



        

<div id="result" class="table-responsive">      
   
<div class="card" >
<table id="tab" class="table table-striped table-bordered table-hover" >

<tr>
<th width="20%">Department ID</th>
<th >Department Name</th>
</tr>

<%

List<DepartmentModel> deptlist =(ArrayList<DepartmentModel>) request.getAttribute("displayList"); 
for (DepartmentModel Abc : deptlist) {   
%>

 <tr>
<td width="20%" align="center" ><%=Abc.getDeptid()%></td>
<td ><%=Abc.getDeptname()%></td>

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

</body>
</html>