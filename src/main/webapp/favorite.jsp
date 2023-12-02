<%@page import="utils.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   

<!DOCTYPE html>
<html>
<% Utils.page_title = "Favorites"; %>
<%@include file = "include/header.jsp"%>

<body>
<%@include file = "include/navbar.jsp"%>
<section>
<div class="container">
<div class="card-header my-3">
<h3>My Favorites</h3>
</div>

<div class="favorite__content">
<table class ="table table-light">
		<thead>
			<tr>
				<td scope="col">Date</td>
				<td scope="col">Name</td>
				<td scope="col">Category</td>
				<td scope="col">Price</td>
				<td scope="col">Add</td>
				<td scope="col">Remove</td>
			</tr>
		</thead>
		<tbody>
		<%
		if(favorites != null){
			for(Favorite fav : favorites){%>
			<tr>
				<td><%= fav.getDate()%></td>
				<td><%= fav.getName()%></td>
				<td><%= fav.getCategory()%></td>
				<td><%=dcf.format(fav.getPrice()) %> </td>
				<td><a class="btn btn-sm btn-info" href="add-to-cart?id=<%=fav.getId()%>">Add to Cart</a></td>	
				<td><a class="btn btn-sm btn-danger" href="remove-favorite?id=<%=fav.getId()%>">Remove Favorite</a></td>		
			</tr>
		<%}
		}
		%>
		
		</tbody>
	
	</table>
</div>

</div>
</section>
<%@include file = "include/footer.jsp"%>
</body>
</html>