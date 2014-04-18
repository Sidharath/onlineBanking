<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<br/>
<center>
    <span style="font-size:20px;">Bank Transactions Report</span>
</center>
    <%
        String q = "select * from acctrans order by transid desc";
        com.model.DatabaseConnection db = new com.model.DatabaseConnection();
        db.executeSelect(q);
        out.println("<center><table cellspacing='10' style='width:100%;'>");
	out.println("<tr style='font-weight:bolder;color:black;'>");
        out.println("<td>ID</td>");
        out.println("<td>Date</td>");
        out.println("<td>Account No.</td>");
        out.println("<td>Amount</td>");
        out.println("<td>Type</td>");
        out.println("<td>Status</td>");
        out.println("<td>Summary</td></tr>");
        String cls = "tblue";
        String transts = "";
        while(db.rs.next()){
            transts = db.rs.getString("status");
            if(transts.equals("failed"))
                cls="tred";
            else
                cls="tblue";
            out.println("<tr class='"+cls+"'>");
            out.println("<td>" + db.rs.getInt("transid") + "</td>");
            out.println("<td>" + db.rs.getDate("transdate") + "</td>");
            out.println("<td>" + db.rs.getString("accountno") + "</td>");
            out.println("<td>" + db.rs.getInt("amount") + "</td>");
            out.println("<td>" + db.rs.getString("type") + "</td>");
            out.println("<td>" + transts + "</td>");
            out.println("<td>" + db.rs.getString("summary") + "</td>");
            out.println("</tr>");
        }
	out.println("</table></center>");
	%>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>