<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<br/>
<center>
    <span style="font-size:20px;">Credit Card Transactions Report</span>
</center>
    <%
        String q = "select * from transactions order by tid desc";
        com.model.DatabaseConnection db = new com.model.DatabaseConnection();
        db.executeSelect(q);
        out.println("<center><table cellspacing='10' style='width:100%;'>");
	out.println("<tr style='font-weight:bolder;color:black;'>");
        out.println("<td>ID</td>");
        out.println("<td>Date</td>");
        out.println("<td>Card No.</td>");
        out.println("<td>Amount</td>");
        out.println("<td>Type</td>");
        while(db.rs.next()){
            out.println("<tr class='tblue'>");
            out.println("<td>" + db.rs.getInt("tid") + "</td>");
            out.println("<td>" + db.rs.getDate("transdate") + "</td>");
            out.println("<td>" + db.rs.getString("cardno") + "</td>");
            out.println("<td>" + db.rs.getInt("amount") + "</td>");
            out.println("<td>" + db.rs.getString("type") + "</td>");
            out.println("</tr>");
        }
	out.println("</table></center>");
	%>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>