<%@ page import="com.model.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title><%= com.model.Info.project %></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
<script type="text/javascript" src="scripts.js">
</script>
</head>
<body>
<div id="header">
	<div id="logo">
		<h1><a href="#"><%= com.model.Info.project %></a></h1>
	</div>
	<div id="menu">
		<ul>
			<li><a href="userhome.jsp">Homepage</a></li>
			<li><a href="transaction.jsp">Credit Card Payment</a></li>
			<li><a href="transactionreport.jsp">Credit Card History</a></li>
			<li><a href="myfds.jsp">Fixed Deposits</a></li>
			<li><a href="accountstatement.jsp">account statement</a></li>
			<li><a href="index.jsp">Logout</a></li>
		</ul>
	</div>
</div>
<!-- end #header -->
<div id="page">
<%
	java.util.ArrayList catlist;
	java.util.ArrayList frndlist;
	String cat;
	Utility util = new Utility();
	Account account;
        FD fd;
	Customer u;
	String query;
%>