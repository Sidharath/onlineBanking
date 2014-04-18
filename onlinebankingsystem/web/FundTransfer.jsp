<%@ include file="adminheader.jsp"%>
<%@ include file="leftsidebaradmin.jsp"%>
<div class="post">
	<h2 class="title">Funds Transfer</h2>
	<div class="entry">
						<form method="post" action="transfer.php" name='transferform'>
						<table cellspacing="10" cellpadding="1"> 
						<tr>
                            <td style="font-size:16px">Account Number</td>
                            <td><input type="text" size="30" name="accno" /></td>
						</tr>

						<tr>
                            <td style="font-size:16px">Amount</td>
                            <td><input type="text" size="30" name="amount" /></td>
						</tr>

						<tr>
                            <td></td><td>
                            <input type="submit" style="width:150px;height:24px;" value="Transfer Now"/></td>
						</tr>
						</table>

						<br><br>
						</form>							
	</div>
</div>
<%@ include file="rightsidebaradmin.jsp"%>
<%@ include file="footer.jsp"%>
