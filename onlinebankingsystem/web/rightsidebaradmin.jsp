	</div>
	<!-- end content -->
	<!-- start sidebar2 -->
	<div id="sidebar2" class="sidebar">
		<ul>
			<li id="recent-posts">
				<h2>New Cards</h2>
				<ul>
				<% 
                                    com.model.Utility utilcards = new com.model.Utility();
					java.util.ArrayList rList = utilcards.getCards("select * from cards");
					out.println("<ul>");
                                        com.model.Card tempcard;
					for(int i=0; i<rList.size(); i++)
					{
						tempcard = (com.model.Card) rList.get(i);
						out.println("<li><a href='customerdetails.jsp?custid=" + tempcard.customerid + "'>" + tempcard.cardno + "</a></li>");
					}
					out.println("</ul>");
				%>
				</ul>
			</li>
		</ul>
	</div>
	<!-- end sidebar2 -->
