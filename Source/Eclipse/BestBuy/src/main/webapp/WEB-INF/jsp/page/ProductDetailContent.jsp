<%-- 
    Document   : ProductDetailContent
    Created on : Dec 5, 2013, 1:54:14 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<!DOCTYPE html>
<div class="container-2">
	<div style="clear: both; display: block; height: 40px"></div>
	<div class="prod">
		<div class="clearfix">
			<a
				href="${pageContext.request.contextPath}/resources/images/${requestScope.Product.getImages().iterator().next().path}"
				class="jqzoom" rel='gal1' title="triumph"> <img
				src="${pageContext.request.contextPath}/resources/images/${requestScope.Product.getImages().iterator().next().path}"
				style="border: 4px solid #e5e5e5;">
			</a>

		</div>
		<div class="clearfix">
			<ul id="thumblist" class="clearfix">
				<c:forEach var="itemImage"
					items="${requestScope.Product.getImages().iterator()}">
					<c:if test="${itemImage.typeId == 2}">
						<li><a href='javascript:void(0);'
							rel="{gallery: 'gal1', smallimage: '${pageContext.request.contextPath}/resources/images/${itemImage.path}',largeimage: '${pageContext.request.contextPath}/resources/images/${itemImage.path}'}"><img
								src='${pageContext.request.contextPath}/resources/images/${itemImage.path}'></a></li>
					</c:if>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!--end:prod-->
	<div class="prod-detail">
		<h2>${requestScope.Product.name}</h2>
		<span class="price"><fmt:formatNumber type="number"
				value="${requestScope.Product.getPrice()}" /> VND</span>
		<form action="#">
			Choose you sizes :&nbsp; <select>
				<option>Large</option>
				<option>Medium</option>
				<option>Small</option>
				<option>X-Large</option>
				<option>X-Small</option>
			</select> &nbsp;&nbsp; Quantity:&nbsp; <input value="1" type="text">
		</form>
		<span class="cart-button"><a
			href="${pageContext.request.contextPath}/Cart/Add.do?maSP=${requestScope.Product.id}">Add
				to Cart</a><a
			href="${pageContext.request.contextPath}/WishList/Add.do?maSP=${requestScope.Product.id}">Add
				to Wishlist</a><a href="${pageContext.request.contextPath}/ProductCompare/AddProductToListCompare.do?idProduct=${requestScope.Product.id}">Add to Compare</a></span>

	</div>
	<div id="tab">
		<ul class="nav">
			<li class="nav-one"><a href="#details" class="current">Overviews</a></li>
			<li class="nav-two"><a href="#specs">Specification</a></li>
			<li class="nav-three"><a href="#reviews">Reviews</a></li>
			<li class="nav-four last"><a href="#products">Additional
					Accessories</a></li>
		</ul>
		<div class="list-wrap">
			<div id="details">
				<p>${requestScope.Product.overview}</p>
			</div>
			<ul id="specs" class="hide">
				${requestScope.Product.specification}
			</ul>
			<div id="reviews" class="hide">
				<h1>Best Buy Customer Reviews</h1>
				<div class="rating-detail">
					<div id="rate1" class="rating"></div>
					<br /> <span>${requestScope.AvarageRating} reviews</span>
				</div>

				<div class="feedback-wrap">
					<h3>
						${requestScope.Product.comments.size()} Comment &mdash; <span><a href="#">Single Blog Post</a></span>
					</h3>
					<br>
					<c:forEach var="item" items="${requestScope.Product.comments.iterator()}">
						<div class="dvision">
							<div class="feedback">
								<img
									src="${pageContext.request.contextPath}/resources/images/no-avatar.jpg"
									alt="">
								<div>
									<h4>
										<a href="#">${item.account.username}</a>
									</h4>
									<span><a href="#">${item.createDate}</a></span>
									<p>${item.text}</p>
								</div>
							</div>			
						</div>
					</c:forEach>
					
				</div>
				<!--end:feedback-wrap--> 
				<c:if test="${sessionScope.Account != null}">
					<div class="commentf">
						<h3>Leave a comment</h3>
						<form:form method="post" id="commentform" action="${pageContext.request.contextPath}/Comment/Add.do" modelAttribute="comment">
							<fieldset>
								<div id="rate2" class="rating"></div>
								<br /> 
								<label>Name (required)</label> <br style="clear: both" />
								<input type="text" name="mail" id="mail" size="30" value=""
									class="input" /> 
								<label>Mail (will not be published)	(required)</label> <br style="clear: both" />
								<form:textarea path="text" cols="25" rows="5" name="message" id="message" value="Message"
									class="textarea" />
								<form:errors path="text" htmlEscape="false" cssClass="error"/>
								<br style="clear: both" /> 
								
								<form:hidden path="productId" value="${requestScope.Product.id}"/>
								<input type="submit" name="submit"
									class="button" value="Write a review" />
							</fieldset>
						</form:form>
					</div>
				</c:if>
				<!--end:comment-->

			</div>
			<ul id="products" class="list clearfix hide">
				<c:forEach var="item"
					items="${requestScope.Product.accessorydetailsForProductId}">
					<li class="da-thumbs item">
						<div class="product-thumb-hover">
							<section class="left">
								<img
									src="${pageContext.request.contextPath}/resources/images/${item.productByAccessoryId.images.iterator().next().path}"
									alt="">
								<p class="sale">${item.productByAccessoryId.productstate.name}</p>
								<article class="da-animate da-slideFromBottom"
									style="display: block;">
									<h3>${item.productByAccessoryId.name}</h3>
									<p>
										<a
											href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.productByAccessoryId.id}"
											class="link tip" original-title="View Detail"></a>&nbsp; <a
											href="${pageContext.request.contextPath}/Cart/Add.do?maSP=${item.productByAccessoryId.id}"
											class="cart tip" original-title="Add to cart"></a>&nbsp;&nbsp;
										<a
											href="${pageContext.request.contextPath}/resources/images/${item.productByAccessoryId.images.iterator().next().path}"
											rel="prettyPhoto[gallery1]" class="zoom tip"
											original-title="Zoom"></a>
									</p>
								</article>
							</section>
						</div>
						<section class="center">
							<h3>${item.productByAccessoryId.name}</h3>
							<em>Category: <a href="#">${item.productByAccessoryId.producttype.name}</a></em>
						</section>
						<section class="right">
							<span class="price"><small>$320.00</small>&nbsp;&nbsp; <fmt:formatNumber
									type="number" value="${item.productByAccessoryId.price}" />
								VND</span>
							<ul class="menu-button">
								<li><a
									href="${pageContext.request.contextPath}/Cart/Add.do?maSP=${item.productByAccessoryId.id}"
									class="cart tip" original-title="Add to Cart"></a></li>
								<li><a
									href="${pageContext.request.contextPath}/resources/images/${item.productByAccessoryId.images.iterator().next().path}"
									rel="prettyPhoto[gallery1]" class="zoom tip"
									original-title="Zoom"></a></li>
								<li><a
									href="${pageContext.request.contextPath}/WishList/Add.do?maSP=${item.productByAccessoryId.id}"
									class="wishlist tip" original-title="Add to Wishlist"></a></li>								
								<li><a
									href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.productByAccessoryId.id}"
									class="link tip" original-title="View Detail"></a></li>
							</ul>
						</section>
					</li>
				</c:forEach>
			</ul>
		</div>
	</div>
	<!--prodetail-->
	<div class="relatedprod">
<!-- 		<h4>Related Products</h4> -->
	</div>
</div>

<!--STAR RATE-->
<script type="text/javascript"
	src="${pageContext.request.contextPath}/resources/js/jquery.rating.js"></script>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/rating.css" />
<script type="text/javascript">
	$(document)
			.ready(function() {
						$('#rate1').rating('',{maxvalue : 5,curvalue : ${requestScope.AvarageRating}});
						$('#rate2').rating("${pageContext.request.contextPath}/Comment/Rating.do",{maxvalue : 5,curvalue : 0});
					});
</script>