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
			<c:set var="vat" value="0" />

			<c:if test="${sessionScope.ShoppingCart != null}">
				<c:forEach var="item" items="${sessionScope.ShoppingCart}">
					<c:set var="imageURL" />
					<c:forEach var="itemImage"
						items="${item.getProduct().getImages().iterator()}">
						<c:if test="${itemImage.typeId == 1}">
							<c:set var="imageURL" value="${itemImage}" />
						</c:if>
					</c:forEach>
					<c:set var="subTotal"
						value="${subTotal + item.getProduct().getPrice() * item.getQuantity()}" />
					<tr>
						<td class="image"><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getProduct().getId()}"><img title="product"
								alt="product"
								src="${pageContext.request.contextPath}/resources/images/${imageURL.path}" height="50"
								width="50"></a></td>
						<td class="name"><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getProduct().getId()}">${item.getProduct().getName()}</a></td>
						<td class="model">${item.getProduct().productstate.getName()}</td>
						<td class="quantity"><input type="number" size="1"
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
						</a>
							<button type="submit" class="tip update" alt="" name="capNhat">
								<img src="${pageContext.request.contextPath}/resources/images/update.png"
									alt="">
							</button></td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
	<div class="contentbox">
		
		<!--cartoptionbox-->
		<div class="alltotal one-half">
			<table class="alltotal">
				<tr>
					<td><span class="extra">Sub-Total :</span></td>
					<td><span><fmt:formatNumber type="number"
								value="${subTotal}" /> VNĐ</span></td>
				</tr>				
				<tr>
					<td><span class="extra">VAT (10%) :</span></td>
					<td><span><fmt:formatNumber type="number"
								value="${subTotal * 0.1}" /> VNĐ</span></td>
				</tr>
				<tr>
					<td><span class="extra grandtotal">Total :</span></td>
					<td><span class="grandtotal"><fmt:formatNumber type="number"
								value="${subTotal * 1.1}" /> VNĐ</span></td>
				</tr>
			</table>
			<a href="${pageContext.request.contextPath}/Product/GetProducts.do"><input type="button" value="Continue Shopping"></a>
			<a href="${pageContext.request.contextPath}/Cart/Checkout.do"><input type="button" value="CheckOut"></a>
		</div>
		<!--end:alltotal-->
	</div>
	<!--end:contentbox-->
	<div style="clear: both; display: block; height: 40px"></div>
</div>