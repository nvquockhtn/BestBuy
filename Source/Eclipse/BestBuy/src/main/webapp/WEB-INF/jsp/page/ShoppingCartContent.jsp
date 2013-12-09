<%-- 
    Document   : ShoppingCartContent
    Created on : Dec 4, 2013, 11:31:13 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="container-2">
	<div style="clear: both; display: block; height: 40px"></div>
	<h2>
		Shopping Cart &nbsp;<small>Your shopping cart</small>
	</h2>
	<form name="gioHang" action="<c:url value="/Cart/Update.do"/>"
		method="get">
		<table class="shopping-cart">
			<tr>
				<th class="image">Image</th>
				<th class="name">Product Name</th>
				<th class="model">State</th>
				<th class="quantity">Quantity</th>
				<th class="price">Unit Price</th>
				<th class="total">Total</th>
				<th class="action">Action</th>
			</tr>

			<c:set var="subTotal" value="0" />

			<c:if test="${sessionScope.ShoppingCart != null}">
				<c:forEach var="item" items="${sessionScope.ShoppingCart}">
					<c:set var="subTotal"
						value="${subTotal + item.getProduct().getPrice() * item.getQuantity()}" />
					<tr>
						<td class="image"><a href="#"><img title="product"
								alt="product"
								src="${pageContext.request.contextPath}/resources/images/products/product-cart-thumb-1.jpg"
								height="50" width="50"></a></td>
						<td class="name"><a href="#">${item.getProduct().getName()}</a></td>
						<td class="model">${item.getProduct().producttype.getName()}</td>
						<td class="quantity"><input type="text" size="1"
							value="${item.getQuantity()}" name="soLuong" class="span1"></td>
						<td class="price"><fmt:formatNumber type="number"
								value="${item.getProduct().getPrice()}" /> VND</td>
						<td class="total"><fmt:formatNumber type="number"
								value="${item.getProduct().getPrice() * item.getQuantity()}" />
							VND</td>
						<td class="remove-update"><a
							href="${pageContext.request.contextPath}/Cart/Delete.do?maSP=${item.getProduct().getId()}"
							class="tip remove" title="Remove"> <img
								src="${pageContext.request.contextPath}/resources/images/remove.png"
								alt="">
						</a> <input type="submit"
							style="background-image: ${pageContext.request.contextPath}/resources/images/update.png;"
							alt="" name="capNhat"></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
	<div class="contentbox">
		<div class="cartoptionbox one-half first">
			<h4>Choose if you have a discount code or reward points you want
				to use or would like to estimate your delivery cost.</h4>
			<input type="radio" class="radio"> <span>Use Coupon
				Code</span> <br> <input type="radio" class="radio"> <span>Use
				Gift Voucher</span> <br> <input type="radio" class="radio"
				checked="checked"> <span>Estimate Shipping &amp;
				Taxes</span> <br> <br>
			<form action="#" class="ship">
				<h4>Enter your destination to get a shipping estimate.</h4>
				<fieldset>
					<div class="control-group">
						<label>Select list</label> <select class="span3 cartcountry">
							<option>Country:</option>
							<option>Philippines</option>
							<option>United States</option>
						</select> <select class="span3 cartstate">
							<option>Region / State:</option>
							<option>Manila</option>
							<option>Los Angeles</option>
						</select> <input type="submit" value="Submit" class="submit">
					</div>
				</fieldset>
			</form>
		</div>
		<!--cartoptionbox-->
		<div class="alltotal one-half">
			<table class="alltotal">
				<tr>
					<td><span class="extra">Sub-Total :</span></td>
					<td><span><fmt:formatNumber type="number"
								value="${subTotal}" /> VNĐ</span></td>
				</tr>
				<tr>
					<td><span class="extra">Eco Tax (-2.00) :</span></td>
					<td><span>$11.0</span></td>
				</tr>
				<tr>
					<td><span class="extra">VAT (18.2%) :</span></td>
					<td><span>$21.0</span></td>
				</tr>
				<tr>
					<td><span class="extra grandtotal">Total :</span></td>
					<td><span class="grandtotal">$150.28</span></td>
				</tr>
			</table>
			<input type="submit" value="Continue Shopping"> <input
				type="submit" value="CheckOut">
		</div>
		<!--end:alltotal-->
	</div>
	<!--end:contentbox-->
	<div style="clear: both; display: block; height: 40px"></div>
</div>