<%@ include file="userheader.jsp"%>
<%@ include file="leftsidebaruser.jsp"%>
<div class="post">
    <h2>Recent Transactions On Credit Card</h2>
    <table style="margin-left:20px;" cellspacing="10" style="width:100%;">
        <tr>
            <td>
                    ID
            </td>
            <td>
                    Amount
            </td>
            <td>
                    Date
            </td>
        </tr>
	<%
            String id = session.getAttribute("logged").toString();
            String tq2 = "select * from transactions, cards where cards.cardno=transactions.cardno and cards.customerid='" + id + "' order by tid desc";
            com.model.DatabaseConnection con2 = new com.model.DatabaseConnection();
            con2.executeSelect(tq2);
            int cnt = 0;
            while(con2.rs.next()){
                cnt++;
		out.println("<tr style='color:black;'><td>" + con2.rs.getInt("tid") + "</td><td>" + con2.rs.getInt("amount") + " Rs. </td><td>" + con2.rs.getDate("transdate") + "</td></tr>");						
		if(cnt == 5)
                    break;
					}
	%>
</table>
</div>
<%@ include file="rightsidebaruser.jsp"%>
<%@ include file="footer.jsp"%>