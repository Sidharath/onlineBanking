<%@ include file="header.jsp"%>
<%@ include file="leftsidebar.jsp"%>
	<%
		String key = request.getParameter("search");
		java.util.ArrayList mainList = util.getOrdigs("select * from ordigs where title like '%"+key+"%' or details like '%"+key+"%' order by ordigid desc");

		for(int i=0; i<mainList.size(); i++)
		{
			ordig = (Ordig) mainList.get(i);
			out.println("<div class='post'>");
			out.println("<h2 class='title'><a href='#' rel='bookmark' title=''>" + ordig.getTitle() + "</a></h2>");
			out.println("<p class='meta'><small>Posted By " + ordig.getUserid() + "</small></p>");
			out.println("<div class='entry'><p>" + ordig.getDetails() + "</p></div>");
			out.println("</div>");
		}
	%>
<%@ include file="rightsidebar.jsp"%>
<%@ include file="footer.jsp"%>