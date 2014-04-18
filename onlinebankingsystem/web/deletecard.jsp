<%
    String cardno = request.getParameter("cardno");
    String q = "delete from cards where cardno='"+cardno+"'";
    com.model.DatabaseConnection db = new com.model.DatabaseConnection();
    db.executeNonSelect(q);
    response.sendRedirect("cards.jsp");
%>