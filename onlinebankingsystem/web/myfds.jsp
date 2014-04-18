<%@ include file="userheader.jsp"%>
<%@ include file="leftsidebaruser.jsp"%>
<br/>
<center>
    <span style="font-size:20px;">Persoanl FDs</span>
</center>
    <%
        String fq = "select * from fds where customerid='"+session.getAttribute("logged").toString() + "'";
		java.util.ArrayList mainList = util.getFds(fq);
		out.println("<center><table cellspacing='10' style='width:100%;'>");
		out.println("<tr style='font-weight:bolder;color:black;'><td>FD No.</td><td>Customer<br/>ID</td><td>Amount</td><td>Months</td><td>R.O.I.</td></tr>");
                int cuid=0;
                if(mainList.size()==0)
                    out.println("<tr><td>You have no FD Available.</td></tr>");
		for(int i=0; i<mainList.size(); i++)
		{
                    fd = (FD) mainList.get(i);
                    cuid = fd.customerid;
                    out.println("<tr><td>" + fd.fdno + "</td>");
                    out.println("<td>" + fd.customerid + "</td>");
                    out.println("<td>" + fd.amount + "</td>");
                    out.println("<td>" + fd.months + "</td>");
                    out.println("<td>" + fd.roi + "</td>");
 		}
		out.println("</table></center>");
	%>
<%@ include file="rightsidebaruser.jsp"%>
<%@ include file="footer.jsp"%>