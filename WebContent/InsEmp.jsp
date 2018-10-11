<?xml version="1.0" encoding="ISO-8859-1" ?>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<html xmlns="http://www.w3.org/1999/xhtml">
<%@page language="java" import="java.util.*" %>
<%@page language="java" import="com.abcd.EmployeeModel" %>
<%-- <% HashMap<Integer,Integer> jobsal=(HashMap<Integer,Integer>)request.getAttribute("jobsal"); 
String vel="";
%> --%>

<head>
<style>

</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1" />
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insert Employee</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- Script
to
validate phone
number -->


<script>
//phone validation
function Validation()
{
var status=false;

var a = document.form.phonenumber.value;
if(a=="")
{
alert("Please Enter the Contact Number");
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
alert("please Enter Salary");
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
var maxsal="The Salary cannot be more than "+d;
alert(maxsal);
return false;
}return alert("Employee data stored successfully");
}

</script>


<!-- Script
to
validate phone
number -->



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


footer {
  padding-top: 3rem;
  padding-bottom: 3rem;
}

footer p {
  margin-bottom: .25rem;
}
#result{
background-color:white;
padding-bottom: 2%;
padding-top: 2%;
}
#res{
margin-right:10px;
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
	  margin-top: 10px;
	  margin-left: 5%;
	  margin-right: 5%;
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

    <form name="form" class="form-horizontal" action ="Employee" method="post" onsubmit="return Validation()" >

        <div class="form-group">
            <label class="control-label col-sm-4" >Name </label>
            <div class="col-sm-3">
                <input type="text" class="form-control" name="firstname" placeholder="Enter your First name" required>
            </div>
                       
            <div class="col-sm-3">
                <input type="text" class="form-control" name="lastname" placeholder="Enter your Last name"  required>
                <br>
            </div>
            
            <label class="control-label col-sm-4" >Phone Number </label>
            <div class="col-sm-6">
             <select class="form-control" name="countryCode" id="countryCode" style="width:25%; float: left; ">
            <option data-countryCode="IN" value="+91" selected>India (+91)</option>
			<option data-countryCode="GB" value="+44" >UK (+44)</option>
			<option data-countryCode="US" value="+1">USA (+1)</option>
	
	<optgroup label="Other countries">
		<option data-countryCode="DZ" value="+213">Algeria (+213)</option>
		<option data-countryCode="AD" value="+376">Andorra (+376)</option>
		<option data-countryCode="AO" value="+244">Angola (+244)</option>
		<option data-countryCode="AI" value="+1264">Anguilla (+1264)</option>
		<option data-countryCode="AG" value="+1268">Antigua &amp; Barbuda (+1268)</option>
		<option data-countryCode="AR" value="+54">Argentina (+54)</option>
		<option data-countryCode="AM" value="+374">Armenia (+374)</option>
		<option data-countryCode="AW" value="+297">Aruba (+297)</option>
		<option data-countryCode="AU" value="+61">Australia (+61)</option>
		<option data-countryCode="AT" value="+43">Austria (+43)</option>
		<option data-countryCode="AZ" value="+994">Azerbaijan (+994)</option>
		<option data-countryCode="BS" value="+1242">Bahamas (+1242)</option>
		<option data-countryCode="BH" value="+973">Bahrain (+973)</option>
		<option data-countryCode="BD" value="+880">Bangladesh (+880)</option>
		<option data-countryCode="BB" value="+1246">Barbados (+1246)</option>
		<option data-countryCode="BY" value="+375">Belarus (+375)</option>
		<option data-countryCode="BE" value="+32">Belgium (+32)</option>
		<option data-countryCode="BZ" value="+501">Belize (+501)</option>
		<option data-countryCode="BJ" value="+229">Benin (+229)</option>
		<option data-countryCode="BM" value="+1441">Bermuda (+1441)</option>
		<option data-countryCode="BT" value="+975">Bhutan (+975)</option>
		<option data-countryCode="BO" value="+591">Bolivia (+591)</option>
		<option data-countryCode="BA" value="+387">Bosnia Herzegovina (+387)</option>
		<option data-countryCode="BW" value="+267">Botswana (+267)</option>
		<option data-countryCode="BR" value="+55">Brazil (+55)</option>
		<option data-countryCode="BN" value="+673">Brunei (+673)</option>
		<option data-countryCode="BG" value="+359">Bulgaria (+359)</option>
		<option data-countryCode="BF" value="+226">Burkina Faso (+226)</option>
		<option data-countryCode="BI" value="+257">Burundi (+257)</option>
		<option data-countryCode="KH" value="+855">Cambodia (+855)</option>
		<option data-countryCode="CM" value="+237">Cameroon (+237)</option>
		<option data-countryCode="CA" value="+1">Canada (+1)</option>
		<option data-countryCode="CV" value="+238">Cape Verde Islands (+238)</option>
		<option data-countryCode="KY" value="+1345">Cayman Islands (+1345)</option>
		<option data-countryCode="CF" value="+236">Central African Republic (+236)</option>
		<option data-countryCode="CL" value="+56">Chile (+56)</option>
		<option data-countryCode="CN" value="+86">China (+86)</option>
		<option data-countryCode="CO" value="+57">Colombia (+57)</option>
		<option data-countryCode="KM" value="+269">Comoros (+269)</option>
		<option data-countryCode="CG" value="+242">Congo (+242)</option>
		<option data-countryCode="CK" value="+682">Cook Islands (+682)</option>
		<option data-countryCode="CR" value="+506">Costa Rica (+506)</option>
		<option data-countryCode="HR" value="+385">Croatia (+385)</option>
		<option data-countryCode="CU" value="+53">Cuba (+53)</option>
		<option data-countryCode="CY" value="+90392">Cyprus North (+90392)</option>
		<option data-countryCode="CY" value="+357">Cyprus South (+357)</option>
		<option data-countryCode="CZ" value="+42">Czech Republic (+42)</option>
		<option data-countryCode="DK" value="+45">Denmark (+45)</option>
		<option data-countryCode="DJ" value="+253">Djibouti (+253)</option>
		<option data-countryCode="DM" value="+1809">Dominica (+1809)</option>
		<option data-countryCode="DO" value="+1809">Dominican Republic (+1809)</option>
		<option data-countryCode="EC" value="+593">Ecuador (+593)</option>
		<option data-countryCode="EG" value="+20">Egypt (+20)</option>
		<option data-countryCode="SV" value="+503">El Salvador (+503)</option>
		<option data-countryCode="GQ" value="+240">Equatorial Guinea (+240)</option>
		<option data-countryCode="ER" value="+291">Eritrea (+291)</option>
		<option data-countryCode="EE" value="+372">Estonia (+372)</option>
		<option data-countryCode="ET" value="+251">Ethiopia (+251)</option>
		<option data-countryCode="FK" value="+500">Falkland Islands (+500)</option>
		<option data-countryCode="FO" value="+298">Faroe Islands (+298)</option>
		<option data-countryCode="FJ" value="+679">Fiji (+679)</option>
		<option data-countryCode="FI" value="+358">Finland (+358)</option>
		<option data-countryCode="FR" value="+33">France (+33)</option>
		<option data-countryCode="GF" value="+594">French Guiana (+594)</option>
		<option data-countryCode="PF" value="+689">French Polynesia (+689)</option>
		<option data-countryCode="GA" value="+241">Gabon (+241)</option>
		<option data-countryCode="GM" value="+220">Gambia (+220)</option>
		<option data-countryCode="GE" value="+7880">Georgia (+7880)</option>
		<option data-countryCode="DE" value="+49">Germany (+49)</option>
		<option data-countryCode="GH" value="+233">Ghana (+233)</option>
		<option data-countryCode="GI" value="+350">Gibraltar (+350)</option>
		<option data-countryCode="GR" value="+30">Greece (+30)</option>
		<option data-countryCode="GL" value="+299">Greenland (+299)</option>
		<option data-countryCode="GD" value="+1473">Grenada (+1473)</option>
		<option data-countryCode="GP" value="+590">Guadeloupe (+590)</option>
		<option data-countryCode="GU" value="+671">Guam (+671)</option>
		<option data-countryCode="GT" value="+502">Guatemala (+502)</option>
		<option data-countryCode="GN" value="+224">Guinea (+224)</option>
		<option data-countryCode="GW" value="+245">Guinea - Bissau (+245)</option>
		<option data-countryCode="GY" value="+592">Guyana (+592)</option>
		<option data-countryCode="HT" value="+509">Haiti (+509)</option>
		<option data-countryCode="HN" value="+504">Honduras (+504)</option>
		<option data-countryCode="HK" value="+852">Hong Kong (+852)</option>
		<option data-countryCode="HU" value="+36">Hungary (+36)</option>
		<option data-countryCode="IS" value="+354">Iceland (+354)</option>
		
		<option data-countryCode="ID" value="+62">Indonesia (+62)</option>
		<option data-countryCode="IR" value="+98">Iran (+98)</option>
		<option data-countryCode="IQ" value="+964">Iraq (+964)</option>
		<option data-countryCode="IE" value="+353">Ireland (+353)</option>
		<option data-countryCode="IL" value="+972">Israel (+972)</option>
		<option data-countryCode="IT" value="+39">Italy (+39)</option>
		<option data-countryCode="JM" value="+1876">Jamaica (+1876)</option>
		<option data-countryCode="JP" value="+81">Japan (+81)</option>
		<option data-countryCode="JO" value="+962">Jordan (+962)</option>
		<option data-countryCode="KZ" value="+7">Kazakhstan (+7)</option>
		<option data-countryCode="KE" value="+254">Kenya (+254)</option>
		<option data-countryCode="KI" value="+686">Kiribati (+686)</option>
		<option data-countryCode="KP" value="+850">Korea North (+850)</option>
		<option data-countryCode="KR" value="+82">Korea South (+82)</option>
		<option data-countryCode="KW" value="+965">Kuwait (+965)</option>
		<option data-countryCode="KG" value="+996">Kyrgyzstan (+996)</option>
		<option data-countryCode="LA" value="+856">Laos (+856)</option>
		<option data-countryCode="LV" value="+371">Latvia (+371)</option>
		<option data-countryCode="LB" value="+961">Lebanon (+961)</option>
		<option data-countryCode="LS" value="+266">Lesotho (+266)</option>
		<option data-countryCode="LR" value="+231">Liberia (+231)</option>
		<option data-countryCode="LY" value="+218">Libya (+218)</option>
		<option data-countryCode="LI" value="+417">Liechtenstein (+417)</option>
		<option data-countryCode="LT" value="+370">Lithuania (+370)</option>
		<option data-countryCode="LU" value="+352">Luxembourg (+352)</option>
		<option data-countryCode="MO" value="+853">Macao (+853)</option>
		<option data-countryCode="MK" value="+389">Macedonia (+389)</option>
		<option data-countryCode="MG" value="+261">Madagascar (+261)</option>
		<option data-countryCode="MW" value="+265">Malawi (+265)</option>
		<option data-countryCode="MY" value="+60">Malaysia (+60)</option>
		<option data-countryCode="MV" value="+960">Maldives (+960)</option>
		<option data-countryCode="ML" value="+223">Mali (+223)</option>
		<option data-countryCode="MT" value="+356">Malta (+356)</option>
		<option data-countryCode="MH" value="+692">Marshall Islands (+692)</option>
		<option data-countryCode="MQ" value="+596">Martinique (+596)</option>
		<option data-countryCode="MR" value="+222">Mauritania (+222)</option>
		<option data-countryCode="YT" value="+269">Mayotte (+269)</option>
		<option data-countryCode="MX" value="+52">Mexico (+52)</option>
		<option data-countryCode="FM" value="+691">Micronesia (+691)</option>
		<option data-countryCode="MD" value="+373">Moldova (+373)</option>
		<option data-countryCode="MC" value="+377">Monaco (+377)</option>
		<option data-countryCode="MN" value="+976">Mongolia (+976)</option>
		<option data-countryCode="MS" value="+1664">Montserrat (+1664)</option>
		<option data-countryCode="MA" value="+212">Morocco (+212)</option>
		<option data-countryCode="MZ" value="+258">Mozambique (+258)</option>
		
		<option data-countryCode="VI" value="+84">Virgin Islands - US (+1340)</option>
		<option data-countryCode="WF" value="+681">Wallis &amp; Futuna (+681)</option>
		<option data-countryCode="YE" value="+969">Yemen (North)(+969)</option>
		<option data-countryCode="YE" value="+967">Yemen (South)(+967)</option>
		<option data-countryCode="ZM" value="+260">Zambia (+260)</option>
		<option data-countryCode="ZW" value="+263">Zimbabwe (+263)</option>
	</optgroup>
</select>
                <input type="text" class="form-control" name="phonenumber" placeholder="Enter your Phone number" style="width:73%; float: left; margin-left:2%; " required  >
                <br></br>
                <br>
            </div>
            <br>
            
             <label class="control-label col-sm-4" >Designation  and Salary</label>
            <div class="col-sm-3">
                <select class="form-control" name="jobcode" id="jobcode" required >
                 <option value="" > Select  Designation</option>
                <%
                HashMap<Integer,Integer> jobsal=(HashMap<Integer,Integer>)request.getAttribute("jobsal"); 
               HashMap<Integer,String> job=(HashMap<Integer,String>)request.getAttribute("jobtitle"); 
                for (Map.Entry post: job.entrySet()) {   
                %>
                <option value="<%=post.getKey()%>" > <span id="Salaryid" name="Salaryid" value="<%=jobsal.get(post.getKey())%>" ></span> <%=post.getValue()%> </option>
                            
                <%}%>
                </select>
                <br>
                <% 
                for (Map.Entry post: job.entrySet()) {   
                %>
                <input type="hidden" id="jobcode_<%=post.getKey()%>" value="<%=jobsal.get(post.getKey())%>"/>
             
	         <%}%></div>
            
            <div class="col-sm-3">
                <input type="number" class="form-control" name="salary" maxlength = "8" min= 0 placeholder="Enter your Salary" required >
                <br>
            </div>

            <label class="control-label col-sm-4" >Manager </label>
            <div class="col-sm-6">
                <select class="form-control" name="mgrid" required>
                <option value=0 default > Select Manager</option>
                <%
               HashMap<Integer,String> manager=(HashMap<Integer,String>)request.getAttribute("manager"); 
                for (Map.Entry post: manager.entrySet()) {   
                %>
                <option value="<%=post.getKey()%>" > <%=post.getValue()%> </option>
                <%}%>
                </select>
                <br>
            </div>

            <label class="control-label col-sm-4" >Department </label>
            <div class="col-sm-6">
                <select class="form-control" name="deptid" required>
                 <option value=""> Select Department</option>
               <%
               HashMap<Integer,String> dept=(HashMap<Integer,String>)request.getAttribute("dept"); 
                for (Map.Entry post: dept.entrySet()) {   
                %>
                <option value="<%=post.getKey()%>" > <%=post.getValue()%> </option>
                <%}%>
                </select>
                <br>
                 <input id="sub"class="btn btn-primary pull-right" type="submit"  href="#right-panel"  value="Submit">
                  <input id="res"class="btn btn-primary pull-right" type="reset"  href="#right-panel"  value="Reset">
                
            </div>

           
         
               

            </div>
            
        </div>
        
    </form>
</div>

<!-- Form div ends here -->
<!-- employee display starts here -->


<div class="table-responsive" id="result">
<DIV class="card">
<table class="table table-striped table-bordered table-hover">


<tr>
<th>Employee ID</th>
<th>Employee Name</th>
<th>Manager</th>
<th>Employee Department</th>
<th>Employee Salary</th>
<th>Employee Hiredate</th>
<th>Employee Job</th>
<th>Employee Phone</th>
<th>Employee Email</th>

</tr>

<%

List<EmployeeModel> emplist =(ArrayList<EmployeeModel>) request.getAttribute("displayList"); 
for (EmployeeModel Abc : emplist) {   
%>

 <tr>
<td align="center"><%=Abc.getEmpid()%></td>
<td><%=Abc.getEmpname()%></td>
<td><%=manager.get(Abc.getMgrid())%></td>
<td><%=dept.get(Abc.getDeptid())%></td>

<td><%=Abc.getSalary()%></td>
<td><%=Abc.getHiredate()%></td>
<td><%=job.get(Abc.getJobcode())%></td>
<td><%=Abc.getPhone()%></td>
<td><%=Abc.getEmail()%></td>
</tr>

<%}%>


</table>
</div>
</div>




<!-- Footer -->
	<footer style="float:left;position:relative;bottom:0;">
      <div style="margin-left:20px;">   
        <p>Copyrights &copy;Team_4 2017</p>
        <p>All rights reserved</p>
      </div>
      </footer>

</body>
</html>