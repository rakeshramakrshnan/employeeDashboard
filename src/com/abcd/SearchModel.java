package com.abcd;

public class SearchModel {
	private int empid;
	private String empname;
	private String mgrname;
	private String deptname;
	private int salary;
	private String hiredate;
	private String jobtitle;
	private String phone;
	private String email;
	
	public String getEmpname() {
		return empname;
	}

	public void setEmpname(String empname) {
		this.empname = empname;
	}

	public String getMgrname() {
		return mgrname;
	}

	public void setMgrname(String mgrname) {
		this.mgrname = mgrname;
	}

	public String getDeptname() {
		return deptname;
	}

	public void setDeptname(String deptname) {
		this.deptname = deptname;
	}

	public int getSalary() {
		return salary;
	}

	public void setSalary(int salary) {
		this.salary = salary;
	}

	public String getHiredate() {
		return hiredate;
	}

	public void setHiredate(String hiredate) {
		this.hiredate = hiredate;
	}

	public String getJobtitle() {
		return jobtitle;
	}

	public void setJobtitle(String jobtitle) {
		this.jobtitle = jobtitle;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	


	
/*	public EmployeeModel(int empid,String empname,int mgrid,int deptid,int salary,String hiredate,int jobcode,long phone,String email)
	{
		this.empid = empid;
		this.empname = empname;
		this.mgrid = mgrid;
		this.deptid = deptid;
		this.salary = salary;
		this.hiredate = hiredate;
		this.jobcode = jobcode;
		this.phone = phone;
		this.email = email;
	}*/
	
	public int getEmpid() {
		return empid;
	}

	public void setEmpid(int empid) {
		this.empid = empid;
	}

	public SearchModel()
	{}

	
	
	

}