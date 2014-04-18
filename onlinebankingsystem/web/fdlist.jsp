<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<br/><br/>
<center>
    <span style="font-size:20px;"><a href="AddNewFD.jsp">Create New FD</a></span>
</center>
<br/>
    <%
		java.util.ArrayList mainList = util.getFds("select * from fds");
		out.println("<center><table cellspacing='10' width='400'>");
		out.println("<tr style='font-weight:bolder;color:black;'><td>FD No.</td><td>Customer<br/>ID</td><td>Amount</td><td>Months</td><td>R.O.I.</td><td>Details</td></tr>");
                int cuid=0;
		for(int i=0; i<mainList.size(); i++)
		{
                    fd = (FD) mainList.get(i);
                    cuid = fd.customerid;
                    out.println("<tr><td>" + fd.fdno + "</td>");
                    out.println("<td>" + fd.customerid + "</td>");
                    out.println("<td>" + fd.amount + "</td>");
                    out.println("<td>" + fd.months + "</td>");
                    out.println("<td>" + fd.roi + "</td>");
                    out.println("<td><a href='customerdetails.jsp?custid=" + cuid + "'>details</a></td></tr>");
 		}
		out.println("</table></center>");
	%>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>