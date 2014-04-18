function showother()
{
	var cat = document.getElementById("cat").value;
	if(cat == "other")
	{
		document.getElementById("otherlabel").innerHTML = "Specify Other";
		document.getElementById("othertext").innerHTML = "<input type='text' name='ifother' style='width:400px' />";
	}
	else
	{
		document.getElementById("otherlabel").innerHTML = "";
		document.getElementById("othertext").innerHTML = "";
	}
}

function getCustomerId(type)
{
    if(type=="old")
        document.getElementById("custid").innerHTML = "<td style='font-size:16px;'>Enter Customer ID</td><td><input type='text' name='custid' /></td>";
    else
        document.getElementById("custid").innerHTML = "";
}

function validateform()
{
	var u, p;
	u = document.getElementById("nm").value;
	p = document.getElementById("ps").value;
	
	if(u == "")
	{
		alert("missing username");
		return false;
	}

	if(p == "")
	{
		alert("missing password");
		return false;
	}

	return true;
}function validateNewUser()
{
	var u, p;
	u = document.getElementById("nm").value;
	p = document.getElementById("ps").value;
	
	if(u == "")
	{
		alert("missing username");
		return false;
	}

	if(p == "")
	{
		alert("missing password");
		return false;
	}

	return true;
}



function validateregister()
{
	var u, p, c;
	u = document.myform.nm.value;
	p = document.myform.ps.value;
	c = document.myform.ps2.value;
	if(u == "")
	{
		alert("missing username");
		return false;
	}

	if(p == "")
	{
		alert("missing password");
		return false;
	}
	if(c == "")
	{
		alert("please confirm password");
		return false;
	}
	if(p != c)
	{
		alert("mismatch password");
		return false;
	}

	return true;
}