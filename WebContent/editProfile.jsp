<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="wham.core.User"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <title>Edit Profile</title>

 <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" integrity="sha512-dTfge/zgoMYpP7QbHy4gWMEGsbsdZeCXz7irItjcC3sPUFtf0kuFbDz/ixG7ArTxmDjLXDmezHubeNikyKGVyQ==" crossorigin="anonymous">

<!-- Optional theme -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap-theme.min.css" integrity="sha384-aUGj/X2zp5rLCbBxumKTCw2Z50WgIr1vs/PFN4praOTvYXWlVyh2UtNUU0KAUhAX" crossorigin="anonymous">

<!-- Latest compiled and minified JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js" integrity="sha512-K1qjQ+NcF2TYO/eI3M6v8EiNYZfA95pQumfvcVrTHtwQVDG+aHRqLi/ETn2uB+1JqwYqVG3LIvdm9lj6imS/pQ==" crossorigin="anonymous"></script>

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    	
</head>
</head>
<body>
   <% User currentUser = (User)(session.getAttribute("currentSessionUser"));%>
    <% request.setAttribute("currentSessionUser",currentUser);%>
			
             <%if(currentUser==null){%>
            	<b>Invalid credentials, Redirecting in a 5 seconds...</b> 
            	<script>setTimeout(function(){window.location.href='Login.jsp'},5000);</script>
            	<a href="http://localhost:8080/wham/Login.jsp">Click here if it doesn't redirect</a>
            <% }else{ %>
            Welcome<%=currentUser.getFirstName() + " " + currentUser.getLastName()+" "+currentUser.getCity() %>
            
	<div class="container-fluid">
    <!-- Second navbar for categories -->
    
    <!-- Second navbar for sign in -->
    <nav class="navbar navbar-inverse">
      <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar-collapse-2">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">WHAM	</a>
        </div>
    
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="navbar-collapse-2">
          <ul class="nav navbar-nav navbar-right">
            <li><a href="userHome.jsp">Home</a></li>
            <li><a href="http://localhost:8080/wham/editProfile.jsp">Profile</a></li>
            <li><a href="#">Services</a></li>
            <li><a href="#">Contact</a></li>
            <li>
              <a class="btn btn-default btn-outline btn-circle collapsed"  data-toggle="collapse" href="Logout" aria-expanded="false" aria-controls="nav-collapse2">Sign out</a>
            </li>
          </ul>
          <div class="collapse nav navbar-nav nav-collapse slide-down" id="nav-collapse2">
            <form class="navbar-form navbar-right form-inline" role="form">
              <div class="form-group">
                <label class="sr-only" for="Email">Email</label>
                <input type="email" class="form-control" id="Email" placeholder="Email" autofocus required />
              </div>
              <div class="form-group">
                <label class="sr-only" for="Password">Password</label>
                <input type="password" class="form-control" id="Password" placeholder="Password" required />
              </div>
              <button type="submit" class="btn btn-success">Sign in</button>
            </form>
          </div>
        </div><!-- /.navbar-collapse -->
      </div><!-- /.container -->
    </nav><!-- /.navbar -->
    
    
    
</div><!-- /.container-fluid -->
    
    <br><br><br><br><br><br><br><br>
<form class="form-horizontal" role="form" action="UpdateProfile" method="post">
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">User ID:</label>
    <div class="col-sm-4">
      <span class="control-label col-sm-2"><%=currentUser.getFirstName()%></span>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Old Password:</label>
    <div class="col-sm-4"> 
      <input type="password" class="form-control" name="oldPassword" id="pwd" placeholder="Enter password">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Password:</label>
    <div class="col-sm-4"> 
      <input type="password" class="form-control" name="password" id="pwd" placeholder="Enter password">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">Confirm Password:</label>
    <div class="col-sm-4"> 
      <input type="password" class="form-control" name="confirmPassword" id="pwd" placeholder="Enter password">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Email id:</label>
    <div class="col-sm-4">
      <input type="email" class="form-control" name="emailId" id="email" placeholder="<%=currentUser.getFirstName()%>">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">First Name:</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="firstName" id="email" placeholder="<%=currentUser.getFirstName()%>">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Last Name:</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" name="lastName" id="email" placeholder="<%=currentUser.getLastName()%>">
    </div>
    
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">City:</label>
    <div class="col-sm-4"> 
      <input type="text" class="form-control" name="city" id="pwd" placeholder="<%=currentUser.getCity()%>">
    </div>
  </div>
  
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <div class="checkbox">
        <label><input type="checkbox"> Remember me</label>
      </div>
    </div>
  </div>
  <div class="form-group"> 
    <div class="col-sm-offset-2 col-sm-10">
      <button type="submit" class="btn btn-default">Submit</button>
    </div>
  </div>
</form>

      <center>
 
         </center>

</body>
</html>
<% } %>