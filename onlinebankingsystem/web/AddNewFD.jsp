<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<div class="post">
	<h2 class="title">Select Customer Type for New FD</h2>
	<div class="entry">
						<form method="post" action="NewFD.jsp" name='registerform'>
						<table cellspacing="10" cellpadding="1">
						<tr>
						<td colspan="2" style="font-size:19px;font-weight:bold">
						<u>Enter Customer Type Details</u></td>
						</tr>

						<tr>
						<td style="font-size:16px">Select Customer Type: </td>
						<td>
                                                    <select name="custype" onchange="getCustomerId(this.value);">
                                                        <option value="">Select</option>
                                                        <option value="new">New Customer</option>
                                                        <option value="old">Existing Customer</option>
                                                    </select>
                                                </td>
						</tr>
                                                
                                                <tr id="custid">
                                                    
                                                </tr>

						<tr>
						<td colspan="2" style="text-align:center">
						<input type="submit" style="width:150px;height:24px;" value="Create, Now."/>						</td>
						</tr>
						</table>

						<br><br>
						</form>							
	</div>
</div>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>