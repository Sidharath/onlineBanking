	<!-- start sidebar1 -->
	<div id="sidebar1" class="sidebar">
		<ul>
			<li id="calendar">
				<h2>Welcome</h2>
                <div style="text-align:right;margin-right:10px;">
				<%
					session = request.getSession();
					String uid = (String) session.getAttribute("logged");
					out.println("<h4>"+uid+"</h4>");
					out.println("<span style='font-size:9px;'>" + new java.util.Date() + "</span>");
				%>
                </div>
			</li>
			<li>
				<h2>Credit Card</h2>
				<ul>
					<%
                    com.model.Card card = new com.model.Utility().getCustomerCard(Integer.parseInt(uid));
                    if(!card.cardno.equals("0")){
                        out.println("<table><tr><td>Card# </td><td>" + card.cardno + "</td></tr>");
                        out.println("<tr><td>Cash# </td><td>" + card.cashlimit + "</td></tr>");
                        out.println("<tr><td>Credit# </td><td>" + card.creditlimit + "</td></tr></table>");
                    }else{
                        out.println("<h3>No Card Activated.</h3>");
                    }
                                        
					%>
				</ul>
			</li>
                        <li>
				<h2 style="color:red;">Recent Transactions</h2>
                                <%
					String cid = session.getAttribute("logged").toString();
					String tq = "select * from transactions, cards where cards.cardno=transactions.cardno and cards.customerid='" + cid + "' order by tid desc";
					com.model.DatabaseConnection con = new com.model.DatabaseConnection();
					con.executeSelect(tq);
					int count = 0;
                                        out.println("<table>");
					while(con.rs.next()){
						count++;
						out.println("<tr><td>" + con.rs.getInt("amount") + " $. spent on " + con.rs.getDate("transdate") + "</td></tr>");						
						if(count == 5)
							break;
					}
                                        out.println("</table>");
                                %>
                        </li>
                        
		</ul>
	</div>
	<!-- end sidebar1 -->
	<!-- start content -->
	<div id="content">
