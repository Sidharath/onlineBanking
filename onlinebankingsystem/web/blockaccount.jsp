<%
    String accountno = request.getParameter("accountno");
    String q = "update accounts set status='blocked' where accountno='"+accountno+"'";
    com.model.DatabaseConnection db = new com.model.DatabaseConnection();
    db.executeNonSelect(q);
    response.sendRedirect("Accounts.jsp");
%>