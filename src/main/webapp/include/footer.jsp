<%@ page import="java.time.*" %>
<!-- The Modal -->
<div class="modal mt-10" id="myModal">
  <div class="modal-dialog">
    <div class="modal-content">

      <!-- Modal Header -->
      <div class="modal-header">
        <h4 class="modal-title">Modal Heading</h4>
        <button type="button" class="close" data-dismiss="modal">&times;</button>
      </div>

      <!-- Modal body -->
      <div class="modal-body">
        <div class="container">
	<div class="container">
	<div class ="card mx-auto my-5">
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
      </div>

      <!-- Modal footer -->
      <div class="modal-footer">
        <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
      </div>

    </div>
  </div>
</div>


<nav class="navbar navbar-expand-sm  navbar-light bg-light">
<div class="container d-flex justify-content-between">
  <span class="navbar-text">
    Mattire &copy;  <%= LocalDate.now().getYear() == 2023 ? "2023" : "2023 - " + LocalDate.now().getYear()  %>
  </span>
  <ul class="navbar-nav">
    <li class="nav-item">
      <a class="nav-link" href="terms.jsp">Terms</a>
    </li>
  </ul>
  </div>
</nav>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
<script src="./js/default.js" type="text/javascript"></script>
