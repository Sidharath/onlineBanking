<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<br/><br/>
<center>
    <span style="font-size:20px;"><a href="AddNewAccount.jsp">Create New Account</a></span>
</center>
<br/>

    <%
		java.util.ArrayList mainList = util.getAccounts("select * from accounts");
		out.println("<center><table cellspacing='10' width='400'>");
		out.println("<tr style='font-weight:bolder;color:black;'><td>Account No.</td><td>Customer<br/>ID</td><td>Balance Amount</td><td>Deposit</td><td>Withdraw</td><td>Transfer</td><td>Details</td></tr>");
                int cuid=0;
		for(int i=0; i<mainList.size(); i++)
		{
                    account = (Account) mainList.get(i);
                    cuid = account.customerid;
                    out.println("<tr><td>" + account.accountno + "</td>");
                    out.println("<td>" + account.customerid + "</td>");
                    out.println("<td>" + account.balamount + "</td>");
                    out.println("<td><a href='accounttransaction.jsp?custid=" + cuid + "&type=deposit'>deposit</a></td>");
                    out.println("<td><a href='accounttransaction.jsp?custid=" + cuid + "&type=withdraw'>withdraw</a></td>");
                    out.println("<td><a href='accounttransaction.jsp?custid=" + cuid + "&type=transfer'>transfer</a></td>");
                    out.println("<td><a href='customerdetails.jsp?custid=" + cuid + "'>details</a></td></tr>");
 		}
		out.println("</table></center>");
	%>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>