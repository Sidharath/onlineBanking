	<!-- start sidebar1 -->
	<div id="sidebar1" class="sidebar">
		<ul>
			<li id="search">
				<h2>Search Customer</h2>
				<form id="searchform" method="get" action="customerdetails.jsp">
					<div style="text-align:right;">
						 <input type="text" name="custid" id="s" size="20" />
						<br />
						<input name="submit" type="submit" value="Search" onclick='return validateS();' style="width:70px;height:22px;" />
					
                                         </div>
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
							out.println("<li><a href='showloan.jsp?ct="+cat+"'>"+cat+"</a></li>");
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

            <script type="text/javascript">
            function validateS()
            {
                var a;
                a = document.getElementById("s").value;

	
	if(a == "")
	{
		alert("missing value");
		return false;
	}

	
	return true;
            };

        </script>