<%@page import="utils.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   

<!DOCTYPE html>
<html>
<% Utils.page_title = "Contact Us"; %>
<%@include file = "include/header.jsp"%>

<body>
<%@include file = "include/navbar.jsp"%>
<section>
<div class="container">
<div class="card-header my-3">
<h1>Contact Us</h1>
</div>

<div class="form-box">
<form>
  <div class="row">
   <div class="col-6 mb-3">
      <input type="text" class="form-control" id="name" placeholder="Enter your name" name="name" aria-label="Enter your name">
    </div>
    <div class="col-6 mb-3">
      <input type="text" class="form-control" id="email" placeholder="Enter your email" name="email" aria-label="Enter your email">
    </div>
    <div class="col-6 mb-3">
      <input type="text" class="form-control" placeholder="Enter phone number" name="phone" aria-label="Enter your phone">
    </div>
    <div class="col-6 mb-3">
      <input type="text" class="form-control" placeholder="Enter message subject" name="subject" aria-label="Enter message subject">
    </div>
    <div class="col-12 mb-3">
    <textarea rows="5" class="form-control" placeholder="Enter message" name="message" aria-label="Enter your message"></textarea>
     </div>
     <div class="col-12">
      <input type="submit" name="Submit" class="btn btn-primary form-control"/>
     </div>
  </div>
 
</form>

</div>

</div>
</section>
<%@include file = "include/footer.jsp"%>
</body>
</html>