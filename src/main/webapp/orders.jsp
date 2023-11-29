<%@page import="utils.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<% Utils.page_title = "Orders"; %>
<%@include file = "include/header.jsp"%>
<body>

<%@include file = "include/navbar.jsp"%>
<section>
<div class="container">
<div class ="card-header my-3">All Orders</div>
	<table class ="table table-light">
		<thead>
			<tr>
				<td scope="col">Date</td>
				<td scope="col">Name</td>
				<td scope="col">Category</td>
				<td scope="col">Quantity</td>
				<td scope="col">Price</td>
				<td scope="col">Cancel</td>
			</tr>
		</thead>
		<tbody>
		<%
		if(orders != null){
			for(Order o : orders){%>
			<tr>
				<td><%= o.getDate()%></td>
				<td><%= o.getName()%></td>
				<td><%= o.getCategory()%></td>
				<td><%= o.getQuantity()%></td>
				<td><%=dcf.format(o.getPrice()) %> </td>
				<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>		
			</tr>
		<%}
		}
		%>
		
		</tbody>
	
	</table>

</div>
</section>
<%@include file = "include/footer.jsp"%>
</body>
</html>