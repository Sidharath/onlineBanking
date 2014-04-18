<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<%
    String type = request.getParameter("type");
    int transid = 10001;
    transid = new Utility().getAccountTransaction();
    String custid = request.getParameter("custid");
%>
<div class="post">
	<h2 class="title">Account Transaction Details</h2>
	<div class="entry">
	<form method="post" action="addtransaction.jsp" name='registerform'>
            <input type="hidden" name="custid" value="<%= custid %>" />
        <table cellspacing="10" cellpadding="1">
            <tr>
                <td>Transaction ID</td>
                <td><input type="text" style="background-color:#FFFFBB;" name="transid" value="<%= transid %>" /></td>
            </tr>
                <tr>
                    <td>Amount</td>
                    <td><input type="text" name="amount" /></td>
                </tr>
                <tr>
                    <td>Transaction type</td>
                    <td><input style="background-color:#FFFFBB;" type="text" name="type" value="<%= type %>" readonly /></td>
                </tr>
                <%
                    if(type.equals("transfer")){
                        out.println("<tr><td>To Account No</td><td><input type='text' name='toaccount' /></td></tr>");
                    }
                %>
	<tr>
	<td colspan="2" style="text-align:center">
		<input type="submit" style="width:150px;height:24px;" value="Add Transaction."/>						</td>
	</tr>
	</table>
	<br><br>
	</form>							
	</div>
</div>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>