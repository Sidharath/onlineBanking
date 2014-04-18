<%@ include file="userheader.jsp"%>
<%@ include file="leftsidebaruser.jsp"%>
<div class="post">
	<h2 class="title">Transaction Status</h2>
	<div class="entry">
    <%
	try{
		String cardno = request.getParameter("cardno");
		int amount = Integer.parseInt(request.getParameter("amount"));
                String type = request.getParameter("type");
		int tid = 1;
		
		String q = "select tid from transactions where tid=(select max(tid) from transactions)";
		com.model.DatabaseConnection db = new com.model.DatabaseConnection();
		db.executeSelect(q);
		
		if(db.rs.next())
			tid = db.rs.getInt("tid") + 1;
		
		java.sql.Date dt = new java.sql.Date(new java.util.Date().getTime());
		
		q = "insert into transactions values('" + tid + "','" + amount + "','" + dt + "','" + cardno + "','" + type + "')";
		db.executeNonSelect(q);
		
		int cash = Integer.parseInt(request.getParameter("cash"));
		int credit = Integer.parseInt(request.getParameter("credit"));
		
		int temp;
		if(amount > credit){
			q = "update cards set creditlimit=0 where cardno='" + cardno + "'";
			db.executeNonSelect(q);
			
			temp = amount - credit;
			q = "update cards set cashlimit=cashlimit-" + temp + " where cardno='" + cardno + "'";
			db.executeNonSelect(q);
		}else{
			q = "update cards set creditlimit=creditlimit-" + amount + " where cardno='" + cardno + "'";
			db.executeNonSelect(q);
		}
		
		out.println("<p style='color:black;'>");
		out.println("Transaction accepted successfully.");
		out.println("<br/>Your transaction id is <span style='color:red;'>" + tid + "</span> for future reference.");
		out.println("</p>");
	}catch(Exception ex){
		ex.printStackTrace();
	}

	%>
	</div>
</div>
<%@ include file="rightsidebaruser.jsp"%>
<%@ include file="footer.jsp"%>