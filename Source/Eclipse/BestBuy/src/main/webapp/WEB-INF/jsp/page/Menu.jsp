<%-- 
    Document   : Menu
    Created on : Dec 4, 2013, 11:24:13 PM
    Author     : VanQuoc-CNTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<nav>  
    <ul id="mega-menu-3" class="mega-menu">
        <li class="first"><a href="${pageContext.request.contextPath}/Home/Index.do" class="current">Home</a></li>
<!--         <li><a href="Templates/clothing.html">Clothing</a> -->
<!--             <ul> -->
<!--                 <li><a href="Templates/clothing.html">Women's Clothing</a> -->
<!--                     <ul class="menu-1"> -->
<!--                         <li><a href="http://html5awesome.com/themeforest/shopymart/newarrival.html">New Arrival</a></li> -->
<!--                         <li><a href="http://html5awesome.com/themeforest/shopymart/sale.html">On Sale</a></li> -->
<!--                         <li><a href="Templates/brands.html">Brands</a></li> -->
<!--                     </ul> -->
<!--                     <ul> -->
<!--                         <li><a href="#">Coats</a></li> -->
<!--                         <li><a href="#">Dresses &amp; Skirts</a></li> -->
<!--                         <li><a href="#">Hoodies &amp; Sweatshirts</a></li> -->
<!--                         <li><a href="#">Jackets</a></li> -->
<!--                         <li><a href="#">Pants &amp; Shorts</a></li> -->
<!--                         <li><a href="#">Jeans</a></li> -->
<!--                     </ul> -->
<!--                 </li> -->
<!--                 <li><a href="http://html5awesome.com/themeforest/shopymart/clothing">Men's Clothing</a> -->
<!--                     <ul class="menu-1"> -->
<!--                         <li><a href="http://html5awesome.com/themeforest/shopymart/newarrival.html">New Arrival</a></li> -->
<!--                         <li><a href="http://html5awesome.com/themeforest/shopymart/sale.html">On Sale</a></li> -->
<!--                         <li><a href="Templates/brands.html">Brands</a></li> -->
<!--                     </ul> -->
<!--                     <ul> -->
<!--                         <li><a href="#">Coats</a></li> -->
<!--                         <li><a href="#">T-Shirts</a></li> -->
<!--                         <li><a href="#">Hoodies &amp; Sweatshirts</a></li> -->
<!--                         <li><a href="#">Jackets</a></li> -->
<!--                         <li><a href="#">Pants &amp; Shorts</a></li> -->
<!--                         <li><a href="#">Jeans</a></li> -->
<!--                     </ul> -->
<!--                 </li> -->
<!--             </ul> -->
<!--         </li> -->
<!--         <li><a href="Templates/shoes.html">Shoes</a></li> -->
<!--         <li><a href="Templates/brands.html">Brands</a> -->
<!--             <ul> -->
<!--                 <li><a href="#">Lee</a></li> -->
<!--                 <li><a href="#">Jag</a></li> -->
<!--                 <li><a href="#">Hangten</a></li> -->
<!--                 <li><a href="#">Addidas</a></li> -->
<!--                 <li><a href="#">Nike</a></li> -->
<!--                 <li><a href="#">Levi's</a></li> -->
<!--             </ul> -->
<!--         </li> -->
<!--         <li><a href="Templates/product.html">Products</a> -->
<!--             <ul> -->
<!--                 <li> -->
<!--                     <ul class="menu-1"> -->
<!--                         <li><a href="http://html5awesome.com/themeforest/shopymart/newarrival.html">New Arrival</a></li> -->
<!--                         <li><a href="http://html5awesome.com/themeforest/shopymart/sale.html">On Sale</a></li> -->
<!--                         <li><a href="Templates/brands.html">Brands</a></li> -->
<!--                     </ul> -->
<!--                     <ul> -->
<!--                         <li><a href="#">Women's Clothing</a></li> -->
<!--                         <li><a href="#">Mens Clothing</a></li> -->
<!--                         <li><a href="#">Shoes</a></li> -->
<!--                         <li><a href="#">Accessories</a></li> -->
<!--                         <li><a href="#">Product 1</a></li> -->
<!--                         <li><a href="#">Product 2</a></li> -->
<!--                     </ul> -->
<!--                 </li> -->
<!--                 <li> -->
<!--                     <ul> -->
<!--                         <li><img src="images/products/product-menu.jpg" alt=""></li> -->
<!--                     </ul> -->
<!--                 </li> -->
<!--             </ul> -->
<!--         </li> -->
<!--         <li><a href="Templates/blog.html">Blog</a> -->
<!--             <ul> -->
<!--                 <li><a href="Templates/single.html">Single</a></li> -->
<!--             </ul> -->
<!--         </li> -->
<!--         <li><a href="#">Features</a> -->
<!--             <ul> -->
<!--                 <li><a href="Templates/index-2.html">Camera Slider</a></li> -->
<!--                 <li><a href="Templates/index2.html">Item Slider</a></li> -->
<!--                 <li><a href="Templates/typography.html">Typography</a></li> -->
<!--                 <li><a href="Templates/button.html">Button</a></li> -->
<!--                 <li><a href="Templates/column.html">Column</a></li> -->
<!--                 <li><a href="Templates/list.html">Ordered &amp; Unordered List</a></li> -->
<!--                 <li><a href="Templates/404page.html">404 Error Page</a></li> -->
<!--             </ul> -->
<!--         </li> -->
        <li><a href="${pageContext.request.contextPath}/Product/GetProducts.do?page=1&idproducttype=1">Laptops</a></li>
        <li><a href="${pageContext.request.contextPath}/Product/GetProducts.do?page=1&idproducttype=2">Taplets</a></li>
        <li><a href="${pageContext.request.contextPath}/Product/GetProducts.do?page=1&idproducttype=3">Desktops</a></li>
        <li><a href="${pageContext.request.contextPath}/Product/GetProducts.do?page=1&idproducttype=1">Promotions</a></li>
        <c:if test = "${sessionScope.Account != null}">
			<c:if test="${sessionScope.Account.accounttype.id==1}">
				<li><a>Admin manager</a>
					<ul>
						<li><a href="${pageContext.request.contextPath}/Customer/Administrator/GetCustomer.do?page=1">Customers</a></li>
						<li><a href="${pageContext.request.contextPath}/Product/GetProducts.do?page=1">Products</a></li>
						<li><a href="${pageContext.request.contextPath}/Product/Admin/ProductManager.do">Promotions</a></li>
						<li><a href="${pageContext.request.contextPath}/Order/Administrator/Index.do">Orders</a></li>
					</ul></li>
			</c:if>
		</c:if>
	</ul>
</nav><!--end:grey-->