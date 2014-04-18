<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
	<div class="post">
	<h2 class="title">New Account Information Form</h2>
	<div class="entry">
                                    <%!
                                        String firstname="", lastname="", dob="", gender="",address="",city="",state="",country="",pincode="",mobile="",email="";
                                        int custid=0;
                                        boolean found = false, accountfound = false;
                                        
                                        String accountno="", balamt="";
                                    %>
                            	<%
                                String q = "";
                                com.model.DatabaseConnection db = new com.model.DatabaseConnection();
                                
				try{
        				String sts = request.getParameter("sts");
					if(sts != null)
                                            out.println("<span style='color:red;'>Account Added Successfully.</span>");
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
                                            
                                            q = "select * from accounts where customerid='"+custid+"'";
                                            //out.println(q);
                                            db.executeSelect(q);
                                            if(db.rs.next()){
                                                accountfound=true;
                                                accountno=db.rs.getString("accountno");
                                                balamt=""+db.rs.getInt("balamt");
                                            }
                                        }catch(Exception ex){
                                            
                                  }
                                
                                if(!found){
                                    custid = 1001;
                                    q="select customerid from customers where customerid=(select max(customerid) from customers)";
                                    db.executeSelect(q);
                                    if(db.rs.next()){
                                        custid=db.rs.getInt("customerid")+1;
                                    }
                                }
				%>
                                    
						<form method="post" action="register.jsp" name='registerform'>
						<table cellspacing="10" cellpadding="1"> 
						<tr>
						<td colspan="2" style="font-size:19px;font-weight:bold">
						<u>Enter Customer's Login details</u></td>
						</tr>

						<tr>
						<td style="font-size:16px">Customer Id: </td>
						<td><input style="background-color:yellow;" readonly value="<%= custid %>" type="text" size="30" name="custid" /></td>
						</tr>
						<tr><td></td></tr>
						<tr>
						<td colspan="2" style="font-size:19px;font-weight:bold">
						<u>Enter Customer's Personal Details</u></td>
						</tr>
						<tr>
						<td style="font-size:16px">First Name: </td>
						<td><input value="<%= firstname %>" type="text" id="fn" size="30" name="fname" /></td>
						</tr>

						<tr>
						<td style="font-size:16px">Lastname: </td>
						<td><input value="<%= lastname %>" type="text" id="ln" size="30" name="lname" /></td>
						</tr>

						<tr>
						<td style="font-size:16px">DOB:</td>
						<td>
                                                    <input type="text" id="dob" name="dob" size="20" value="<%= dob %>" />YYYY-MM-DD
                                                    
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
						<td><input value="<%= address %>" type="text" id="add" size="30" name="add" />						</td>
						</tr>

						<tr>
						<td style="font-size:16px">City: </td>
						<td><input value="<%= city %>" id="cty" type="text" size="30" name="city" />						</td>
						</tr>

						<tr>
						<td style="font-size:16px">State: </td>
						<td><input value="<%= state %>" type="text" id="st" size="30" name="state" />						</td>
						</tr>
						<tr>
						<td style="font-size:16px">Country: </td>
						<td><input value="<%= country %>" type="text" id="cn" size="30" name="country" />						</td>
						</tr>

						<tr>
						<td style="font-size:16px">Pincode: </td>
						<td><input value="<%= pincode %>" type="text" id="pin" size="30" name="pin" />						</td>
						</tr>
						<tr>
						<td style="font-size:16px">Mobile:</td>
						<td><input value="<%= mobile %>" type="text" id="mb" size="30" name="mob" />						</td>
						</tr>
						<tr>
						<td style="font-size:16px">Email: </td>
						<td><input value="<%= email %>" type="text"  id="em" size="30" name="email" />						</td>
						</tr>

						<tr>
						<td colspan="2" style="font-size:19px;font-weight:bold">
						<u>Enter Customer's Account Details</u></td>
						</tr>
						<tr>
							<td style="font-size:16px">Account Number : </td>
							<td><input value="<%= accountno %>" type="text" id="An" size="30" name="accno" /></td>
						</tr>
						
						<tr>
						<td style="font-size:16px">Opening Balance Amount : </td>
						<td><input value="<%= balamt %>" type="text" id="opb" size="30" name="balance" />					</td>
						</tr>


						<tr>
						<td colspan="2" style="text-align:center">
                                                    <%
                                                        if(!accountfound)
                                                            out.println("<input type='submit' style='width:150px;height:24px;' value='Activate Now' onclick='return validateNu();'  />");
                                                        else
                                                            out.println("<h2>Account already opened.</h2>");
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
        
<script type="text/javascript">
            function validateNu()
            {
                var a, b, c,d,e,f,g,h,i,j,k,l,m;
	a = document.getElementById("fn").value;
	b = document.getElementById("ln").value;
        c = document.getElementById("dob").value;
        d = document.getElementById("add").value;
        e = document.getElementById("cty").value;
        f = document.getElementById("st").value;
        g = document.getElementById("cn").value;
        h = document.getElementById("pin").value;
        i = document.getElementById("mb").value;
        k = document.getElementById("em").value;
        l = document.getElementById("An").value;
        m = document.getElementById("opb").value;
	
	if(a == "")
	{
		alert("missing value");
		return false;
	}

	if(b == "")
	{
		alert("missing value");
		return false;
	}
        if(c == "")
	{
		alert("missing value");
		return false;
	}
        if(d == "")
	{
		alert("missing value");
		return false;
	}
        if(e == "")
	{
		alert("missing value");
		return false;
	}
        if(f == "")
	{
		alert("missing value");
		return false;
	}
        if(g == "")
	{
		alert("missing value");
		return false;
	}
        if(h == "")
	{
		alert("missing value");
		return false;
	}
        if(i == "")
	{
		alert("missing value");
		return false;
	}
        if(k == "")
	{
		alert("missing value");
		return false;
	}
        if(l == "")
	{
		alert("missing value");
		return false;
	}
        if(m == "")
	{
		alert("missing value");
		return false;
	}

	return true;
            };

        </script>