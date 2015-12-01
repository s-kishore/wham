<%@ page import="java.io.*,java.util.*,java.*"%>
<!DOCTYPE html>
<html>
<head>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="css/search.css" type="text/css" rel="stylesheet" />
<title>WhatsNearMe - Search Results</title>
</head>
<body onload=initialize()>
	<div id="top_content">
		<%
			String loc = request.getParameter("location");
			String dist = request.getParameter("dist");
			String qry = request.getParameter("qry");
		%>
		<div class="srch_box">
			<input type="text" id="query" class="qry_box" autocomplete="on"
				name="qry" size=40 placeholder="Enter event keyword to search" value="<%= qry%>">

			<input type="text" id="location" class="loc_box" autocomplete="on"
				name="location" size=60 placeholder="Enter City" value="<%=loc%>" />

			Within <select class="dist_ele" name="dist" id="dist">
				<option value="10">10</option>
				<option value="15">15</option>
				<option value="30">30</option>
				<option value="50" selected>50</option>
				<option value="100">100</option>
			</select> Miles <input id="srch" class="srch_btn_ele srch_btn_ele btn btn-md btn-info" type="button"
				value="Search" onclick="rerender()"> <input type="hidden"
				id="eventdetails">
		</div>
	</div>
	<div id="map" class="map_view_box"></div>
</body>
<script
	src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places"
	type="text/javascript"></script>

<script type="text/javascript" src="js/search.js"></script>
</html>