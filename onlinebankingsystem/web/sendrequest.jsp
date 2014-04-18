<%
	String userid = null;
	String friendid = null;
	String msg = "";
	try{
		session = request.getSession();
		userid = (String) session.getAttribute("logged");
		friendid = request.getParameter("username");

		if(userid.equals(friendid)){
			msg = "Can not send request your self";
		}else{
			com.model.DatabaseConnection con = new com.model.DatabaseConnection();
			String query = "select * from friends where (fromuser='" + userid + "' and touser='" + friendid + "') or (touser='" + userid + "' and fromuser='" + friendid + "')";
			out.println(query);
			con.executeSelect(query);
			if(con.rs.next())
			{
				if(con.rs.getString("status").equals("pending"))
					msg = "Request Already Sent.";
				else
					msg = "You are already friend.";
			}
			else
			{
				query = "insert into friends values('" + userid + "','" + friendid + "','pending')";
				con = new com.model.DatabaseConnection();
				con.executeNonSelect(query);
				msg = "Request Sent";
			}
		}
	}catch(Exception ex){
		ex.printStackTrace();
	}
	response.sendRedirect("showuser.jsp?userid="+friendid+"&msg="+msg);
%>