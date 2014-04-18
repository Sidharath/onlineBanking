<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<div class="post">
	<h2 class="title">New Credit Card Information Form</h2>
	<div class="entry">
						<form method="post" action="addcard.jsp" name='registerform'>
						<table cellspacing="10" cellpadding="1">
                        <tr>
                        	<td colspan="2">
                                    <%!
                                        String firstname="", lastname="", dob="", gender="",address="",city="",state="",country="",pincode="",mobile="",email="";
                                        int custid=0;
                                        boolean found = false, cardfound = false;
                                        
                                        String cardno="", cvvno="", expirydate="", cash="", credit="";
                                    %>
                            	<%
                                String q = "";
                                com.model.DatabaseConnection db = new com.model.DatabaseConnection();
                                
				try{
        				String sts = request.getParameter("sts");
					if(sts != null)
                                            out.println("<span style='color:red;'>Card Added Successfully.</span>");
					}catch(Exception ex){
					}
                                                                      
                                        try{
                                            custid = Integer.parseInt(request.getParameter("custid"));
                                            q = "select * from customers where customerid='"+custid+"'";
                                            db.executeSelect(q);
                                            if(db.rs.next()){
                                                found=true;
                                                firstname=db.rs.getString("firstname");
                                                lastname=db.rs.getString("lastname");
                                                city=db.rs.getString("city");
                                                address=db.rs.getString("address");
                                                state=db.rs.getString("state");
                                                country=db.rs.getString("country");
                                                pincode=db.rs.getString("pincode");
                                                mobile=db.rs.getString("mobile");
                                                email=db.rs.getString("email");
                                                dob=db.rs.getDate("dob").toString();
                                                gender=db.rs.getString("gender");
                                            }
                                            
                                            q = "select * from cards where customerid='"+custid+"'";
                                            db.executeSelect(q);
                                            if(db.rs.next()){
                                                cardfound=true;
                                                cardno=db.rs.getString("cardno");
                                                cvvno=""+db.rs.getInt("cvvno");
                                                expirydate=db.rs.getDate("expirydate").toString();
                                                cash=""+db.rs.getInt("cashlimit");
                                                credit=""+db.rs.getInt("creditlimit");
                                            }
                                        }catch(Exception ex){
                                            
                                  }
                                
                                if(!found){
                                    custid = 1001;
                                    q="select customerid from customers where customerid=(select max(customerid) from customers)";
                                    db.executeSelect(q);
                                    if(db.rs.next())
                                        custid=db.rs.getInt("customerid")+1;
                                }
				%>
                            </td>
                        </tr>
						<tr>
						<td colspan="2" style="font-size:19px;font-weight:bold">
						<u>Enter Customer's Login details</u></td>
						</tr>

						<tr>
						<td style="font-size:16px">Customer Id: </td>
						<td><input style="background-color:yellow;" readonly type="text" size="30" name="custid" value="<%= custid %>" /></td>
						</tr>
						<tr><td></td></tr>
						<tr>
						<td colspan="2" style="font-size:19px;font-weight:bold">
						<u>Enter Customer's Personal Details</u></td>
						</tr>


						<tr>
						<td style="font-size:16px">First Name: </td>
						<td><input type="text" size="30" name="fname" value="<%= firstname %>" /></td>
						</tr>

						<tr>
						<td style="font-size:16px">Lastname: </td>
						<td><input type="text" size="30" name="lname" value="<%= lastname %>" /></td>
						</tr>

						<tr>
						<td style="font-size:16px">DOB:</td>
						<td>
                        	<input type="text" name="dob" size="20" value="<%= dob %>" />YYYY-MM-DD
                        </td>
						
						
						</tr>
						<tr>
						<td style="font-size:16px">Gender: </td>
						<td><select name="gender">
                                                        <%
                                                            if(gender.equals("female"))
                                                                out.println("<option value='male'>Male</option><option value='female' selected>Female</option>");
                                                            else
                                                                out.println("<option value='male' selected>Male</option><option value='female'>Female</option>");
                                                        %>
						</select>
						</td>
						</tr>
						<tr>
						<td style="font-size:16px">Address: </td>
						<td><input value="<%= address %>" type="text" size="30" name="add" />						</td>
						</tr>

						<tr>
						<td style="font-size:16px">City: </td>
						<td><input value="<%= city %>" type="text" size="30" name="city" />						</td>
						</tr>

						<tr>
						<td style="font-size:16px">State: </td>
						<td><input value="<%= state %>" type="text" size="30" name="state" />						</td>
						</tr>
						<tr>
						<td style="font-size:16px">Country: </td>
						<td><input value="<%= country %>" type="text" size="30" name="country" />						</td>
						</tr>

						<tr>
						<td style="font-size:16px">Pincode: </td>
						<td><input value="<%= pincode %>" type="text" size="30" name="pin" />						</td>
						</tr>
						<tr>
						<td style="font-size:16px">Mobile:</td>
						<td><input value="<%= mobile %>" type="text" size="30" name="mob" />						</td>
						</tr>
						<tr>
						<td style="font-size:16px">Email: </td>
						<td><input value="<%= email %>" type="text" size="30" name="email" />						</td>
						</tr>
						<tr><td></td></tr>
						<tr>
						<td colspan="2" style="font-size:19px;font-weight:bold">
						<u>Enter Customer's Card details</u></td>
						</tr>
						<tr>
							<td style="font-size:16px">Card Number : </td>
							<td><input value="<%= cardno %>" size="16" type="text" size="30" name="cardno" /></td>
						</tr>
						<tr>
						<td style="font-size:16px">CVV Number : </td>
						<td><input value="<%= cvvno %>" type="text" size="30" name="cvv" />					</td>
						</tr>
						<tr>
						<td style="font-size:16px">Expirty Date : </td>
						<td><input value="<%= expirydate %>" type="text" size="20" name="expiry" />YYYY-MM-DD</td>
						</tr>
						
						<tr>
						<td></td>
						<td style="font-size:16px">Card Amount Limit : </td>
						</tr>
						<tr>
						<td style="font-size:16px">Cash Limit : </td>
						<td><input value="<%= cash %>" type="text" size="30" name="cash" />					</td>
						</tr>
						<tr>
						<td style="font-size:16px">Credit Limit : </td>
						<td><input value="<%= credit %>" type="text" size="30" name="credit" />					</td>
						</tr>
                                                <tr>
						<td colspan="2" style="text-align:center">
                                                    <%
                                                        if(!cardfound)
                                                            out.println("<input type='submit' style='width:150px;height:24px;' value='Activate Now' />");
                                                        else
                                                            out.println("<h2>Card already issued.</h2>");
                                                    %>
                                                </td>
						</tr>
						</table>

						<br><br>
						</form>							
	</div>
</div>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>