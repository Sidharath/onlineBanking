package com.model;

public class Customer
{
    int customerid;
	String password, firstname, lastname, dob, gender, address, city, state, country, pincode, mobile, email;
        public Customer(){
            customerid=0;
            password="";
            firstname="";
            lastname="";
            dob="";
            gender="";
            address="";
            city="";
            state="";
            country="";
            pincode="";
            mobile="";
            email="";
        }
	public Customer(int ci, String ps, String fn, String ln, String db, String gn, String ad, String ct,  String st, String cnt, String pin, String mob, String em)
	{
		customerid = ci;
		password = ps;
		firstname = fn;
		lastname = ln;
		dob = db;
		gender = gn;
		address = ad;
		city = ct;
		state = st;
		country = cnt;
		pincode = pin;
		mobile = mob;
		email = em;
	}
	public int getCustomerId(){
		return customerid;
	}
	public String getPassword(){
		return password;
	}
	public String getFirstname(){
		return firstname;
	}
	public String getLastname(){
		return lastname;
	}
	public String getDob(){
		return dob;
	}
	public String getGender(){
		return gender;
	}
	public String getAddress(){
		return address;
	}
	public String getCity(){
		return city;
	}
	public String getState(){
		return state;
	}
	public String getCountry(){
		return country;
	}
	public String getPincode(){
		return pincode;
	}
	public String getMobile(){
		return mobile;
	}
	public String getEmail(){
		return email;
	}
}