<%@page import="utils.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<%  Utils.page_title = "Cart"; %>
<%@include file = "include/header.jsp"%>


<body>
<%@include file = "include/navbar.jsp"%>
<section>
<div class="container">


<div class="container my-3">

<div class="d-flex py-3">
<h3>Total Price: $${total > 0 ? dcf.format(total) : 0.0}</h3>
<a href="favorite.jsp" class="btn mx-3"><i class="fa-regular fa-heart fa-2x"></i></a>
<a href="cart-check-out" class="btn btn-primary mx-3">Check Out</a>
</div>
<table class="table table-light">
<thead>
<tr>
<th scope="col">
Name
</th>
<th scope="col">
Category
</th>
<th scope="col">
Price
</th>
<th scope="col">
Buy Now
</th>
<th scope="col">
Cancel
</th>
</tr>
</thead>
<tbody>
<% 
if(cart_list != null){
	for(Cart c: cartProduct){%>
		<tr>
		<td><%= c.getName() %></td>
		<td><%= c.getCategory() %></td>
		<td>$ <%= dcf.format(c.getPrice()) %></td>
		<td>
		<form method="post" class="form-inline" action="order-now" >
		<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input" />
		<div class="form-group d-flex justify-content-between">
		<a class="btn btn-sm btn-danger btn-decre" href="<%= c.getQuantity() <= 1 ? "javascript:void(0)" : "quantity-update?action=dec&id=" + c.getId()  %>"><i class="fas fa-minus-square"></i></a>
		<input type="text" name="quantity" class="form-control" value="<%= c.getQuantity() %>" readonly />
		<a class="btn btn-sm btn-primary btn-incre" href="quantity-update?action=inc&id=<%= c.getId() %>"><i class="fas fa-plus-square"></i></a>
		</div>
		<button type="submit" class="btn btn-primary btn-sm">Buy</button>
		</form>
		</td>
		<td>
		<a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%= c.getId()%>">Remove</a>
		</td>
		</tr>
	<%}
}
%>


</tbody>

</table>
</div>



</div>
</section>

<%@include file = "include/footer.jsp"%></body>
</html>