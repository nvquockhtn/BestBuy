<%-- 
    Document   : WishListContent
    Created on : Dec 5, 2013, 3:32:07 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<div class="container-2">
	<div style="clear: both; display: block; height: 40px"></div>
	<h2>
		Wishlist &nbsp;<small>Your wishlist shopping</small>
	</h2>
	<table class="shopping-cart">
		<tr>
			<th class="image">Image</th>
			<th class="name">Product Name</th>
			<th class="model">Type</th>
			<th class="stock">State</th>
			<th class="price">Unit Price</th>
			<th class="action">Action</th>
		</tr>
		<c:if test="${sessionScope.WishList != null}">
			<c:forEach var="item" items="${sessionScope.WishList}">
				<c:set var="imageURL" />
				<c:forEach var="itemImage" items="${item.getImages().iterator()}">
					<c:if test="${itemImage.typeId == 1}">
						<c:set var="imageURL" value="${itemImage}" />
					</c:if>
				</c:forEach>
				<tr>
					<td class="image"><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getId()}"><img title="product"
							alt="product"
							src="${pageContext.request.contextPath}/resources/images/${imageURL.path}"
							height="50" width="50"></a></td>
					<td class="name"><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getId()}">${item.getName()}</a></td>
					<td class="model">${item.producttype.getName()}</td>
					<td class="stock">${item.productstate.getName()}</td>
					<td class="price"><fmt:formatNumber type="number"
							value="${item.getPrice()}" /> VND</td>
					<td class="remove-update"><a
						href="${pageContext.request.contextPath}/WishList/Delete.do?maSP=${item.getId()}"
						class="tip remove" title="Remove"><img
							src="${pageContext.request.contextPath}/resources/images/remove.png"
							alt=""></a> <a
						href="${pageContext.request.contextPath}/Cart/Add.do?maSP=${item.getId()}"
						class="tip addtocart" title="Add to cart"><img
							src="${pageContext.request.contextPath}/resources/images/icon-addcart.png"
							alt=""></a></td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
	<div style="clear: both; display: block; height: 40px"></div>
</div>
<!--end:container-2-->