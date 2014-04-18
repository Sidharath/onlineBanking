<%
    com.model.Utility util = new com.model.Utility();
		String cardno = request.getParameter("cardno");
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
		int cash = Integer.parseInt(request.getParameter("cash"));
		int credit = Integer.parseInt(request.getParameter("credit"));
		int cvv = Integer.parseInt(request.getParameter("cvv"));
		java.sql.Date dob = java.sql.Date.valueOf(request.getParameter("dob"));
		java.sql.Date expiry = java.sql.Date.valueOf(request.getParameter("expiry"));
		
		com.model.DatabaseConnection con = new com.model.DatabaseConnection();
		String query1="insert into customers values('"+custid+"','"+pass+"','"+fname+"','"+lname+"','"+dob+"','"+gender+"','"+add+"','"+city+"','"+state+"','"+country+"','"+pin+"','"+mob+"','"+email+"','"+encpass+"')";
		String query2 = "insert into cards values('" + cardno + "','" + custid + "','" + cvv + "','" + expiry + "','" + cash + "','" + credit + "','active')";
                try{con.executeNonSelect(query1);}catch(Exception e){e.printStackTrace();}
                try{con.executeNonSelect(query2);}catch(Exception e){e.printStackTrace();}
		
		response.sendRedirect("AddNewCard.jsp?sts=1");
%>