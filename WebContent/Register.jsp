<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <title>Registration</title>

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
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#">WHAM</a>
        </div>
        <div id="navbar" class="navbar-collapse collapse">
          <form class="navbar-form navbar-right" action="LoginServlet" method="post">
            <div class="form-group">
              <input type="text" id="userName" required="required" pattern="[a-zA-Z0-9.-]+" name="userName" placeholder="User Name" class="form-control">
            </div>
            <div class="form-group">
              <input type="password" id="password" name="password" placeholder="password" class="form-control">
            </div>
            <button type="submit" class="btn btn-success">Sign in</button>
          </form>
        </div><!--/.navbar-collapse -->
        
      </div>
    </nav>
    
    <br><br><br><br><br><br><br><br>
<form class="form-horizontal" role="form" action="Register" method="post">
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">User ID:</label>
    <div class="col-sm-4">
      <input type="text" required="required" pattern="[a-zA-Z0-9.-]+" class="form-control" name="userName" id="email" placeholder="Enter User ID">
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
      <input type="password" class="form-control" name="cPassword" id="pwd" placeholder="Enter password">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Email id:</label>
    <div class="col-sm-4">
      <input type="email" class="form-control" name="emailId" id="email" placeholder="Enter email">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">First Name:</label>
    <div class="col-sm-4">
      <input type="text" required="required" pattern="[a-zA-Z]+" class="form-control" name="firstName" id="firstname" placeholder="First Name">
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="email">Last Name:</label>
    <div class="col-sm-4">
      <input type="text" class="form-control" required="required" pattern="[a-zA-Z]+"  name="lastName" id="lastname" placeholder="Enter Last Name">
    </div>
    
  </div>
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">City:</label>
    <div class="col-sm-4"> 
      <input type="text" class="form-control" name="city" id="pwd" placeholder="Enter city">
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
    
</body>
</html>