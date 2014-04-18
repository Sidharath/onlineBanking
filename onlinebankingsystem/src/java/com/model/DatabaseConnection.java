package com.model;

import java.sql.*;

public class DatabaseConnection
{ 
	public int rows;
	Connection con;//reference variable
	Statement stmt;
	public ResultSet rs;
	
	public DatabaseConnection()
	{
		try{
                    //DriverManager.registerDriver(new sun.jdbc.odbc.JdbcOdbcDriver());
                    //String path = sc.getRealPath("/")+"database\\banking.mdb";
                    //String url = "jdbc:odbc:Driver={Microsoft Access Driver (*.mdb)};DBQ="+path+";DriverID=22;READONLY=false";
                    //con = DriverManager.getConnection(url);
                    String url = "jdbc:mysql://localhost:3306/onlinebanking";
                    String userName = "root";
                    String password = "";
                    DriverManager.registerDriver(new sun.jdbc.odbc.JdbcOdbcDriver());
                    Class.forName("org.gjt.mm.mysql.Driver");
                    con = DriverManager.getConnection(url,userName,password);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
	
	//this method only called for select query
	public void executeSelect(String query)
	{
		try{
			stmt = con.createStatement();
			rs = stmt.executeQuery(query);
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}

	//this method only called for insert, delete, update queries
	public void executeNonSelect(String query)
	{
		try{
			stmt = con.createStatement();
			rows = stmt.executeUpdate(query);
			if(rows > 0)
				System.out.println("Non Select query executed");
			else
				System.out.println("Select query executed");
		}catch(Exception ex){
			ex.printStackTrace();
		}
	}
}