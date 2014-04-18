package com.controller;

import com.model.*;
import com.model.DatabaseConnection;
import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;

public class Authenticate extends HttpServlet
{ 

public void init()
{
	System.out.println("hello world");
}

public void doPost(HttpServletRequest req,HttpServletResponse res) throws ServletException,IOException
{
	try{
		DatabaseConnection con = new DatabaseConnection();
		String nm,ps, adm;
 		nm=req.getParameter("nm");
 		ps=req.getParameter("ps");
		adm = req.getParameter("admin");
		PrintWriter out = res.getWriter();
		String query;
		if(adm != null)
			query = "select * from admins where username='"+nm+"' and password='"+ps+"'";
                else{
                    ps= new com.model.Utility().encryptPassword(ps);
                    query = "select * from customers where customerid='"+nm+"' and encpassword='"+ps+"'";
                }
		out.println(query);
		con.executeSelect(query);
	

 	if(con.rs.next())
	{
		//this is used to create session to store user name permanently till the user logged in
		HttpSession session = req.getSession();
		session.setAttribute("logged", nm);

		if(adm != null)
			res.sendRedirect("adminhome.jsp");
		else
			res.sendRedirect("userhome.jsp");
 	}
	else
	{
		res.sendRedirect("index.jsp?attempt=fail");
 	}
	}catch(Exception ex){ex.printStackTrace();}
}
}