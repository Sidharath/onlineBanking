<%
    com.model.Utility util = new com.model.Utility();
    String accountno = request.getParameter("accno");
    String	custid = request.getParameter("custid");
    String	pass= util.getRandomPassword(6);
    String encpass = util.encryptPassword(pass);
    String	fname = request.getParameter("fname");
		String	lname = request.getParameter("lname");
		String	gender = request.getParameter("gender");
		String	add = request.getParameter("add");		
		String	city = request.getParameter("city");
		String	state = request.getParameter("state");
		String	country = request.getParameter("country");
		String	pin = request.getParameter("pin");
		String	mob= request.getParameter("mob");
		String	email = request.getParameter("email");
		int balance = Integer.parseInt(request.getParameter("balance"));
		java.sql.Date dob = java.sql.Date.valueOf(request.getParameter("dob"));
		
		com.model.DatabaseConnection con = new com.model.DatabaseConnection();
		String query1="insert into customers values('"+custid+"','"+pass+"','"+fname+"','"+lname+"','"+dob+"','"+gender+"','"+add+"','"+city+"','"+state+"','"+country+"','"+pin+"','"+mob+"','"+email+"','"+encpass+"')";
		String query2 = "insert into accounts values('" + custid + "','" + accountno + "','" + balance + "','active')";
                try{con.executeNonSelect(query1);}catch(Exception e){e.printStackTrace();}
                try{con.executeNonSelect(query2);}catch(Exception e){e.printStackTrace();}
		
		response.sendRedirect("AddNewAccount.jsp?sts=1");
%>