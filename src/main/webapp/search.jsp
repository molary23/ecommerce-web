<%@page import="utils.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<!DOCTYPE html>
<html>
<%
Utils.page_title = "Search";
%>
<%@include file="include/header.jsp"%>
<%
ProductDoa pd = new ProductDoa(DbCon.getConnection());
String q = request.getParameter("q");
List<Product> products = null;
if(q != null){
	 products = pd.getSearchProducts(q);
}


%>
<body>
	<%@include file="include/navbar.jsp"%>
	<section>
		<div class="container">
			<div class="card-header my-3">
				<h1>Searched Products</h1>
			</div>
			<div class="row">
				<%
				if (!products.isEmpty()) {
					for (Product p : products) {
				%>
				<div class="col-md-3 mb-3">
					<div class="card w-100" style="width: 18rem;">
						<img src="product-images/<%=p.getImage()%>" class="card-img-top"
							alt="..." />
						<div class="card-body">
							<h5 class="card-title"><%=p.getName()%></h5>
							<h6 class="price">
								Price: $<%=p.getPrice()%></h6>
							<h6 class="category">
								Category:
								<%=p.getCategory()%></h6>
							<div class="mt-3 d-flex justify-content-between">
								<a href="add-to-cart?id=<%=p.getId()%>" class="btn btn__add"
									title="Add to Cart" aria-label="Add to Cart"><i
									class="fa-solid fa-cart-plus"></i></a>
								<div>
									<%
									if (favorites != null) {
										if (favorites.stream().anyMatch(fav -> fav.getId() == p.getId())) {
									%>
									<a href="remove-favorite?id=<%=p.getId()%>"
										class="btn btn__favorite" title="Remove from Favorite"
										aria-label="Remove from Favorite"><i
										class="fa-solid fa-heart"></i></a>
									<%
									} else {
									%>
									<a href="add-favorite?id=<%=p.getId()%>"
										class="btn btn__favorite" title="Add to Favorite"
										aria-label="Add to Favorite"><i
										class="fa-regular fa-heart"></i></a>
									<%
									}
									}
									%>
								</div>
								<a href="#" class="btn btn__share" title="Share Product"
									aria-label="Share product" data-trigger="focus"
									data-toggle="popover" data-placement="bottom"
									data-content="<div class='share__links'><a href='https://wa.me/2348137530659/?text=<%=p.getId()%>'><i class='fa-brands fa-whatsapp'></i></a> <a href='https://www.facebook.com/sharer/sharer.php?u=<%=p.getId()%>' target='_blank'><i class='fa-brands fa-facebook'></i></a><a href='https://twitter.com/intent/tweet?text=<%=p.getId()%>' target='_blank'><i class='fa-brands fa-x-twitter'></i></a></div>"
									data-html="true"><i class="fa-solid fa-share-nodes"></i></a>
							</div>
						</div>

					</div>

				</div>
				<%
				}
				} else {
				%>
				<div class="col-12 d-flex justify-content-center">
					<p>No Product found</p>
				</div>
				<%
				}
				%>


			</div>


		</div>
	</section>
	<%@include file="include/footer.jsp"%>
</body>
</html>
