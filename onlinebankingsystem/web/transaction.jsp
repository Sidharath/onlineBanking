<%@ include file="userheader.jsp"%>
<%@ include file="leftsidebaruser.jsp"%>
<%
    Card cc=new Utility().getCustomerCard(Integer.parseInt(session.getAttribute("logged").toString()));
%>
<div class="post">
	<h2 class="title">New Transaction</h2>
	<div class="entry">
						<form method="post" action="performtransaction.jsp" name='transferform'>
						<table cellspacing="10" cellpadding="1"> 
						<tr>
                            <td style="font-size:16px">Card Number</td>
                            <td><input type="text" size="30" name="cardno" maxlength="16" /></td>
						</tr>

						<tr>
                            <td style="font-size:16px">CVV</td>
                            <td><input type="text" size="3" name="cvv" maxlength="3" />Please check your card backside.</td>
						</tr>

						<tr>
                            <td style="font-size:16px">Expiry Date</td>
                            <td>
                            	MM
                                <select name="month">
                                <%
									for(int i=1; i<=12; i++)
									{
										out.println("<option value='" + i + "'>" + i + "</option>");
									}
								%>
                                </select>
                            	YY
                                <select name="year">
                                <%
									for(int i=2012; i<=2020; i++)
									{
										out.println("<option value='" + i + "'>" + i + "</option>");
									}
								%>
                                </select>
                                
                            </td>
						</tr>

						<tr>
                            <td style="font-size:16px">Amount</td>
                            <td><input type="text" size="30" name="amount" /></td>
						</tr>
                                                <tr>
                                                    <td>Payment Type</td>
                                                    <td>
                                                        <select name="type">
                                                            <option value="billpayment">Bill Payment</option>
                                                            <option value="premiumdeposit">Premium Deposit</option>
                                                            <option value="taxdeposit">Tax Deposit</option>
                                                        </select>
                                                    </td>
                                                </tr>

						<tr>
                            <td></td><td>
                            <input type="submit" style="width:150px;height:24px;" value="Perform Transaction"/></td>
						</tr>
						</table>

						<br><br>
						</form>							
	</div>
</div>
<%@ include file="rightsidebaruser.jsp"%>
<%@ include file="footer.jsp"%>