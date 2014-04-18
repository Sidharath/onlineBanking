<%
    String accno = request.getParameter("accountno");
    String q = "delete from accounts where accountno='"+accno+"'";
    com.model.DatabaseConnection db = new com.model.DatabaseConnection();
    db.executeNonSelect(q);
    response.sendRedirect("Accounts.jsp");
%>