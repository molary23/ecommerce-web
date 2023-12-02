<%@page import="com.connection.*" %>
<%@page import="com.models.*" %>
<%@page import="utils.*" %>
<%@page import="doa.*" %>
<%@page import="java.util.*" %>
<%@page import="java.text.DecimalFormat" %>
<%
User auth = (User)request.getSession().getAttribute("auth");
List<Order> orders = null;
List<Favorite> favorites = null;
if(auth != null){
	request.setAttribute("auth", auth);
	 orders = new OrderDoa(DbCon.getConnection()).getUserOrders(auth.getId());
	 favorites = new FavoriteDoa(DbCon.getConnection()).getAllUserFavorites(auth.getId());
}else{
	// open login modal
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if(cart_list != null){
	ProductDoa pDoa = new ProductDoa(DbCon.getConnection());
	cartProduct = pDoa.getCartProducts(cart_list);
	 double total = pDoa.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total); 
}


DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);
%>




<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title> <%= Utils.page_title  %> - Shopping Cart</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous"/>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"/>
<link rel="stylesheet" href="./styles/style.css"/>
<link rel="icon" href="images/mattire-appicon.png"/>
</head>