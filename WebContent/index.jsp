<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Search Events</title>
<link href="css/bootstrap.css" type="text/css" rel="stylesheet" />
<link href="css/index.css" type="text/css" rel="stylesheet" />
</head>
<body>
	<form method="get" action="search.jsp">
		<div class="main_content">
			<input type="text" id="query" class="qry_box" autocomplete="on"
				name="qry" size=60 placeholder="Enter event keyword to search">
			<input type="text" id="location" class="loc_box" autocomplete="on"
				name="location"
				size=60 autofocuss="on" onchange="locChange()" placeholder="Enter City"/>
			<input id="srch" class="srch_btn_ele btn btn-md btn-info" type="submit" value="Search">
			<br>
			<input type="radio" id="id_myloc" name="myloc" onclick="usecurrloc()"/> Use my current location 
			
			<span class="dist_fld">
				<span class="dist_txt">
					Within
				</span>
				<select
					class="dist_ele" name="dist" id="dist">
					<option value="10">10</option>
					<option value="15">15</option>
					<option value="30">30</option>
					<option value="50" selected>50</option>
					<option value="100">100</option>
				</select> Miles
			</span>
			
		</div>
	</form>
	<script	src="http://maps.googleapis.com/maps/api/js?sensor=false&amp;libraries=places" type="text/javascript"></script>
	<script src="js/index.js" type="text/javascript"></script>
</body>
</html>