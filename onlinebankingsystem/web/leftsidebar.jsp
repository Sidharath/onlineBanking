	<!-- start sidebar1 -->
	<div id="sidebar1" class="sidebar">
		<ul>
			<li id="calendar">
				<h2>Customer Login</h2>
				<form method="post" action="login">
                    <table style="border-style:none">
					<tr>
						<td align="left" style="border-style:none">
						Login  Id:<br/>
						<input type="text" id="nm" name="nm" value="" />
						</td>
					</tr>
					<tr>
						<td align="left" style="border-style:none">
						Password:
						<input type="Password" id="ps" name="ps" value="" />
						</td>
					</tr>
                    <tr>
                    	<td>
                        Login As Admin ? <input type="checkbox" name="admin" /> Yes
                        </td>
                    </tr>
					<tr>
						<td align="center" style="border-style:none">
						<input style="width:70px;height:22px;" type="submit" id="x" value="Login" onclick="return validateform();" />
						<input style="width:70px;height:22px;" type="Reset" id="x" value="Reset" />
						</td>
					</tr>
                                        <tr>
                                            <td align="center" style="color:red;" colspan="2">
                                                <%
                                                    try{
                                                        String val = null;
                                                        val =request.getParameter("attempt");
                                                        if(val != null)
                                                            out.println("Login Attempt Failed.");
                                                    }catch(Exception ex){
                                                       
                                                    }
                                                    
                                                %>
                                            </td>
                                        </tr>
					</table>
				</form>
			</li>
			<li>
				<h2>Credit Cards</h2>
				<ul>
					<%
					/*
						catlist = new Utility().getLoans();
						for(int i=0; i<catlist.size(); i++)
						{	
							cat = (String) catlist.get(i);
							out.println("<li><a href='showloanwl.jsp?ct="+cat+"'>"+cat+"</a></li>");
						}
					*/
					%>
				</ul>
			</li>
		</ul>
	</div>
	<!-- end sidebar1 -->
	<!-- start content -->
	<div id="content">
