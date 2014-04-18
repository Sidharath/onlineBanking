<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
	<%
		int custid = Integer.parseInt(request.getParameter("custid"));
		u = util.getCustomer(custid);
                
		out.println("<div class='post'>");
                if(u.getCustomerId()!=0){
                    out.println("<h2 class='title'>Customer ID : <a href='#' rel='bookmark' title=''>" + u.getCustomerId() + "</a></h2>");
                    out.println("<p class='meta'><small style='color:black;'>Belong To : " + u.getCity() + ", " + u.getState() + ", " + u.getCountry());
                    out.println(" - " + u.getPincode() + "</small></p>");
                    out.println("<div class='entry'>");
                    out.println("<div style='width:60%;float:left;margin-left:10px;'>");

                    out.println("<table cellspacing='15'>");
                    out.println("<tr><td colspan='2' class='heading'>Personal Details</td></tr>");
                    out.println("<tr><td>Name</td><td>" + u.getFirstname() + " " + u.getLastname() + "</td></tr>");
                    out.println("<tr><td>D.O.B.</td><td>" + u.getDob() + "</td></tr>");
                    out.println("<tr><td>Gender</td><td>" + u.getGender() + "</td></tr>");
                    out.println("<tr><td>Mobile</td><td>" + u.getMobile() + "</td></tr>");
                    out.println("<tr><td>Email ID</td><td>" + u.getEmail() + "</td></tr>");
                    out.println("<tr><td>Address</td><td>" + u.getAddress() + "</td></tr>");

                    card = util.getCustomerCard(custid);
                    if(!card.cardno.equals("0")){
                        out.println("<tr><td colspan='2' class='heading'>Credit Card Details</td></tr>");
                        out.println("<tr><td>Card Number</td><td>" + card.cardno + "</td></tr>");
                        out.println("<tr><td>Cash Limit</td><td>" + card.cashlimit + "</td></tr>");
                        out.println("<tr><td>Credit Limit</td><td>" + card.creditlimit + "</td></tr>");
                        out.println("<tr><td colspan='2'>");
                        out.println("<a style='color:red;' onclick='return confirm(\"Are you sure to delete card?\");' href='deletecard.jsp?cardno="+card.cardno+"'>delete card</a>&nbsp;&nbsp;");
                        out.println("<a href='blockcard.jsp?cardno="+card.cardno+"' onclick='return confirm(\"Are you sure to block card?\");'>block card</a>&nbsp;&nbsp;");
                        out.println("</td></tr>");
                    }

                    account = util.getCustomerAccount(custid);
                    if(!account.accountno.equals("0")){
                        out.println("<tr><td colspan='2' class='heading'>Account Details</td></tr>");
                        out.println("<tr><td>Account Number</td><td>" + account.accountno + "</td></tr>");
                        out.println("<tr><td>Balance Limit</td><td>" + account.balamount + "</td></tr>");
                        out.println("<tr><td colspan='2'>");
                        out.println("<a style='color:red;' onclick='return confirm(\"Are you sure to delete account?\");' href='deleteaccount.jsp?accountno="+account.accountno+"'>delete account</a>&nbsp;&nbsp;");
                        out.println("<a href='blockaccount.jsp?accountno="+account.accountno+"' onclick='return confirm(\"Are you sure to block account?\");'>block account</a>&nbsp;&nbsp;");
                        out.println("</td></tr>");
                    }
                    out.println("</table>");

                    out.println("</div>");
                    out.println("</div>");
                }else{
                    out.println("<h2>Customer Not Found!</h2>");
                }
		out.println("</div>");
	%>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>
