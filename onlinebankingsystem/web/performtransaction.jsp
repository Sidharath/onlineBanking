<%@ include file="userheader.jsp"%>
<%@ include file="leftsidebaruser.jsp"%>
<div class="post">
	<h2 class="title">Transaction Status</h2>
	<div class="entry">
    <%
	try{
		String cardno, amt;
		int amount, month, year, cvvno;
		cardno = (String) request.getParameter("cardno");
		amt = (String) request.getParameter("amount");
		amount = Integer.parseInt(amt);
		month = Integer.parseInt(request.getParameter("month").toString());
		year = Integer.parseInt(request.getParameter("year").toString());
		cvvno = Integer.parseInt(request.getParameter("cvv").toString());
		com.model.DatabaseConnection db = new com.model.DatabaseConnection();
		String qry = "select * from cards, customers where cardno='" + cardno + "' and cards.customerid=customers.customerid";
		db.executeSelect(qry);
		
		out.println("<div class='post'>");
		out.println("<h2 class='title'>Card Confirmation</h3><br/>");
		out.println("<form action='confirmtransaction.jsp' method='post'>");
		out.println("<input type='hidden' value='" + cardno + "' name='cardno' />");
		out.println("<input type='hidden' value='" + amount + "' name='amount' />");
                out.println("<input type='hidden' value='"+request.getParameter("type")+"' name='type' />");
		if(db.rs.next()){
			String cuid = session.getAttribute("logged").toString();
			int cash, credit, total, cvv;
			cash = db.rs.getInt("cashlimit");
			credit = db.rs.getInt("creditlimit");
		out.println("<input type='hidden' value='" + cash + "' name='cash' />");
		out.println("<input type='hidden' value='" + credit + "' name='credit' />");
			total = cash + credit;
			u = util.getCustomer(Integer.parseInt(cuid));
			out.println("<h3 class='title'>Customer ID : <a href='#' rel='bookmark' title=''>" + u.getCustomerId() + "</a></h3>");
			out.println("<p class='meta'><small style='color:black;'>Name : " + u.getFirstname() + " " + u.getLastname());
			out.println("<br/>Belong To : " + u.getCity() + ", " + u.getState() + ", " + u.getCountry());
			out.println(" - " + u.getPincode());
			out.println("<br/><br/>Cash limit : " + cash);
			out.println("<br/>Credit Limit : " + credit);
			out.println("<br/>Total Limit : " + total);
			out.println("</small></p>");			
			if(amount > total){
				out.println("<h3 class='title'>Invalid Amount Crossing total limit of card.</h3>");
			}else{
				cvv = db.rs.getInt("cvvno");
				if(cvv != cvvno){
					out.println("<h3 class='title'>Invalid CVV Number Entered.</h3>");
				}else{
					query = "select * from cards where customerid='" + cuid + "' and month(expirydate)='" + month + "' and year(expirydate)='" + year + "'";
					db.executeSelect(query);
					if(db.rs.next()){
						out.println("<h3 class='title'>Congratulations your card is to be approved</h3>");
						out.println("<input type='submit' value='Confirm Transaction' style='border-style:none;width:200px;height:25px;' />");
					}else{
						out.println("<h3 class='title'>Invalid Expiry Date of Card</h3>");
					}
				}
				
			}
			
		}else{
			out.println("<h3 class='title'>Invalid Card Number Entered.</h3>");
		}
		out.println("</form>");		
		session = request.getSession();
		String loggedid = (String) session.getAttribute("logged");
		out.println("</div>");
	}catch(Exception ex){
		ex.printStackTrace();
	}

	%>
	</div>
</div>
<%@ include file="rightsidebaruser.jsp"%>
<%@ include file="footer.jsp"%>