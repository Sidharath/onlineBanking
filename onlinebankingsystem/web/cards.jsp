<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<br/><br/>
<center>
    <span style="font-size:20px;"><a href="AddNewCard.jsp">Create New Card</a></span>
</center>
<br/>
        <%
		java.util.ArrayList mainList = util.getCards("select * from cards");
		out.println("<center><table cellspacing='10' width='400'>");
		out.println("<tr style='font-weight:bolder;color:black;'><td>Card No.</td><td>Customer ID</td><td>Cash Limit</td><td>Credit Limit</td></tr>");
		for(int i=0; i<mainList.size(); i++)
		{
			card = (Card) mainList.get(i);
			out.println("<tr><td>" + card.cardno + "</td>");
			out.println("<td>" + card.customerid + "</td>");
			out.println("<td>" + card.cashlimit + "</td>");
			out.println("<td>" + card.creditlimit + "</td>");
			out.println("<td><a href='customerdetails.jsp?custid=" + card.customerid + "'>details</a></td></tr>");
 		}
		out.println("</table></center>");
	%>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>