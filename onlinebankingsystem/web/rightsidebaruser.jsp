	</div>
	<!-- end content -->
	<!-- start sidebar2 -->
	<div id="sidebar2" class="sidebar">
		<ul>
			<li>
				<h2>Card Limits</h2>
				<div>
				<%
                                    session = request.getSession();
                                    String custid = (String) session.getAttribute("logged");
                                    String bal = new com.model.Utility().getLimit(custid);
					String[] bl = bal.split("/");
					System.out.println(bal);
					out.println("<div>");
					out.println("<ul>");
					out.println("<li><span style='font-size:14px;margin-left:20px;font-weight:bolder;'>CASH : " + bl[0] + " Rs.</span></li>");
					//out.println("<li><span style='font-size:14px;margin-left:20px;font-weight:bolder;'>CREDIT : " + bl[1] + " Rs.</span></li>");
					out.println("</ul>");
					out.println("</div>");
				%>
				</div>
			</li>
			<li id="recent-posts">
				<h2>Bank Account</h2>
				<ul>
				<%
                            com.model.Account acc = new com.model.Utility().getCustomerAccount(Integer.parseInt(custid));
                            
                            if(!acc.accountno.equals("0")){
                                out.println("<table><tr><td>Acc# </td><td>" + acc.accountno + "</td></tr>");
                                out.println("<tr><td>Bal# </td><td>" + acc.balamount + "</td></tr></table>");
                            }else{
                                out.println("<h3>No Account Activated.</h3>");
                            }
				%>
				</ul>
			</li>
                        <li>
				<h2 style="color:red;">Recent Transactions</h2>
                                <%
					String ccid = session.getAttribute("logged").toString();
					String ttq = "select * from acctrans, accounts where accounts.accountno=acctrans.accountno and accounts.customerid='" + cid + "' order by transid desc";
					com.model.DatabaseConnection ccon = new com.model.DatabaseConnection();
					ccon.executeSelect(ttq);
					int ccount = 0;
                                        out.println("<table>");
					while(ccon.rs.next()){
						ccount++;
						out.println("<tr><td>" + ccon.rs.getInt("amount") + " " + ccon.rs.getDate("transdate") + " " + ccon.rs.getString("type") +"</td></tr>");						
						if(ccount == 5)
							break;
					}
                                        out.println("</table>");
                                %>
                        </li>
		</ul>
	</div>
	<!-- end sidebar2 -->
