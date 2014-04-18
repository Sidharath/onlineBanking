<%
    String cardno = request.getParameter("cardno");
    String q = "update cards set status='blocked' where cardno='"+cardno+"'";
    com.model.DatabaseConnection db = new com.model.DatabaseConnection();
    db.executeNonSelect(q);
    response.sendRedirect("cards.jsp");
%>