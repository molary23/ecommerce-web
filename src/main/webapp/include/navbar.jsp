<nav class="navbar navbar-expand-sm navbar-light bg-light">
	<div class="container d-flex justify-content-between">
		<a class="navbar-brand" href="index.jsp"><img
			class="img-responsive" alt="Mattire App" src="images/launchIcon.png" /></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="search-box">
			<form method="get" class="form-inline" action="search.jsp">
				<div class="input-group mb-3">
					<input type="text" class="form-control"
						placeholder="Search for products" name="q" value="<%= q != null ? q : "" %>">
					<div class="input-group-append">
						<button class="btn btn-outline-success" type="submit">
							<i class="fa-solid fa-magnifying-glass"></i>
						</button>
					</div>
				</div>
			</form>
		</div>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav ml-auto">
				<li class="nav-item active"><a class="nav-link"
					href="index.jsp">Home</a></li>
				<li class="nav-item"><a class="nav-link" href="cart.jsp">Cart
						<%
				if (cart_list != null && cart_list.size() > 0) {
				%> <span
						class="badge badge-danger"><%=cart_list.size()%></span> <%
 }
 %>
				</a></li>
				<li class="nav-item"><a class="nav-link" href="contact.jsp">Contact
						Us</a></li>
				<%
				if (auth != null) {
				%>
				<li class="nav-item"><a class="nav-link" href="orders.jsp">Order</a>
				</li>
				<li class="nav-item"><a class="nav-link" href="log-out">Logout</a>
				</li>
				<%
				} else {
				%>
				<li class="nav-item">
					<button class="btn btn-default" data-toggle="modal"
						data-target="#myModal">Login</button>
				</li>
				<%
				}
				%>

			</ul>
		</div>
	</div>
</nav>