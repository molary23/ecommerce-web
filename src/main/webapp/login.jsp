<%@ page import="com.models.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<% String pageTitle = "Login"; %>
<%@include file = "include/header.jsp"%>
<body>
<div class="container">
<%@include file = "include/navbar.jsp"%>
	<div class="container">
	<div class ="card w-50 mx-auto my-5">
	<div class = "card-header text-center">User Login</div>
	<div class ="card-body">
	<form action="user-login" method="post">
	
	<div class = "form-group">
	<label>Email Address</label>
	<input type="email" class="form-control" name="login-email" placeholder="Enter you email" required>
	</div>
	
	<div class = "form-group">
	<label>Password</label>
	<input type="password" class="form-control" name="login-password" placeholder="***********" required>
	</div>
	
	<div class ="text-center">
	
	<button type="submit" class="btn btn-primary">Login</button>
	</div>
	
	
	</form>
	
	</div>

</div>

</div>
</div>


<%@include file = "include/footer.jsp"%></body>
</html>