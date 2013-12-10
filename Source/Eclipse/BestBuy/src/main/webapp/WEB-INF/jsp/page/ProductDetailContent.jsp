<%-- 
    Document   : ProductDetailContent
    Created on : Dec 5, 2013, 1:54:14 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
		<span class="cart-button"><a href="cart.html">Add to Cart</a><a
			href="wishlist.html">Add to Wishlist</a><a href="compare.html">Add
				to Compare</a></span>

	</div>
	<div id="tab">
		<ul class="nav">
			<li class="nav-one"><a href="#details" class="current">Overviews</a></li>
			<li class="nav-two"><a href="#specs">Specification</a></li>
			<li class="nav-three"><a href="#reviews">Reviews</a></li>
			<li class="nav-four last"><a href="#tags">Additional & Accessories</a></li>
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
					<div id="rate1" class="rating"></div><br />
					<span>3.9 reviews</span>
				</div>
				
                        <div class="feedback-wrap">
                        <h3>4 Comment &mdash; <span><a href="#">Single Blog Post</a></span></h3><br>
                            <div class="dvision">
                                <div class="feedback">
                                    <img src="${pageContext.request.contextPath}/resources/images/user-1.jpg" alt="">
                                    <div>
                                        <h4><a href="#">Louie Jie Mahusay</a></h4>
                                        <span><a href="#">January 26, 2013 at 10:38 am</a></span>
                                        <p>Mauris vestibulum elementum condimentum. Donec eget turpis eget arcu aliquam fermentum. Donec tincidunt ipsum et nisl laoreet id mattis ante mollis.</p>
                                        <span class="reply"><a href="#">Reply</a></span>
                                    </div>
                                </div>
                                <div class="feedback feed2">
                                    <img src="${pageContext.request.contextPath}/resources/images/user-2.jpg" alt="">
                                    <div>
                                        <h4><a href="#">Divine Grace Mahusay</a></h4>
                                        <span><a href="#">January 26, 2013 at 10:38 am</a></span>
                                        <p>Mauris vestibulum elementum condimentum. Donec eget turpis eget arcu aliquam fermentum. Donec tincidunt ipsum et nisl laoreet id mattis ante mollis.</p>
                                        <span class="reply"><a href="#">Reply</a></span>
                                    </div>
                                </div>
                                <div class="feedback feed3">
                                    <img src="${pageContext.request.contextPath}/resources/images/user-3.jpg" alt="">
                                    <div>
                                        <h4><a href="#">Belfred Charcus</a></h4>
                                        <span><a href="#">January 26, 2013 at 10:38 am</a></span>
                                        <p>Mauris vestibulum elementum condimentum. Donec eget turpis eget arcu aliquam fermentum. Donec tincidunt ipsum et nisl laoreet id mattis ante mollis.</p>
                                        <span class="reply"><a href="#">Reply</a></span>
                                    </div>
                                </div>
                            </div>
                            <div class="dvision">
                                <div class="feedback">
                                    <img src="${pageContext.request.contextPath}/resources/images/user-1.jpg" alt="">
                                    <div>
                                        <h4><a href="#">Louie Jie Mahusay</a></h4>
                                        <span><a href="#">January 26, 2013 at 10:38 am</a></span>
                                        <p>Mauris vestibulum elementum condimentum. Donec eget turpis eget arcu aliquam fermentum. Donec tincidunt ipsum et nisl laoreet id mattis ante mollis.</p>
                                        <span class="reply"><a href="#">Reply</a></span>
                                    </div>
                                </div>
                            </div>
                        </div><!--end:feedback-wrap-->
                        <div class="commentf">
                            <h3>Leave a comment</h3>
                            <form id="commentform" action="#" method="post">
                                <fieldset>
                                <label>Name (required)</label>
                                <br style="clear:both" />
                                <input type="text" name="mail" id="mail" size="30" value="" class="input" />
                                <label>Mail (will not be published) (required)</label>
                                <br style="clear:both" />
                                <textarea cols="25" rows="5" name="message" id="message" class="textarea"></textarea>
                                <br style="clear:both" />
                                <input type="submit" name="submit" class="button"  value="Write a review"/>
                                </fieldset>
                            </form>
                        </div><!--end:comment-->
                    
			</div>
			<ul id="tags" class="hide">
				<ul id="products" class="list clearfix">
                        	<li class="da-thumbs item">
                            	<div class="product-thumb-hover">
                                    <section class="left">
                                        <img src="${pageContext.request.contextPath}/resources/images/products/product-20.jpg" alt="">
                                        <p class="sale">Sale</p>
                                        <article class="da-animate da-slideFromBottom" style="display: block;">
                                            <h3>Shoes</h3>
                                            <p>
                                            <a href="product-detail.html" class="link tip" original-title="View Detail"></a>&nbsp;
                                            <a href="cart.html" class="cart tip" original-title="Add to cart"></a>&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" original-title="Zoom"></a></p>
                                        </article>
                                    </section>
                                </div>
                                <section class="center">
                                	<h3>Shoes</h3>
                                    <em>Category: <a href="#">Men's Dress</a></em>
                                </section>
                                <section class="right">
                                    <span class="price"><small>$320.00</small>&nbsp;&nbsp; $95.00</span>
                                    <ul class="menu-button">
                                        <li><a href="cart.html" class="cart tip" original-title="Add to Cart"></a></li>
                                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" original-title="Zoom"></a></li>
                                        <li><a href="wishlist.html" class="wishlist tip" original-title="Add to Wishlist"></a></li>
                                        <li><a href="compare.html" class="compare tip" original-title="Compare"></a></li>
                                        <li><a href="product-detail.html" class="link tip" original-title="View Detail"></a></li>
                                    </ul>
                                </section>
                            </li>
                            <li class="da-thumbs item">
                            	<div class="product-thumb-hover">
                                    <section class="left">
                                        <img src="${pageContext.request.contextPath}/resources/images/products/product-20.jpg" alt="">
                                        <p class="sale">Sale</p>
                                        <article class="da-animate da-slideFromBottom" style="display: block;">
                                            <h3>Shoes</h3>
                                            <p>
                                            <a href="product-detail.html" class="link tip" original-title="View Detail"></a>&nbsp;
                                            <a href="cart.html" class="cart tip" original-title="Add to cart"></a>&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" original-title="Zoom"></a></p>
                                        </article>
                                    </section>
                                </div>
                                <section class="center">
                                	<h3>Shoes</h3>
                                    <em>Category: <a href="#">Men's Dress</a></em>
                                </section>
                                <section class="right">
                                    <span class="price"><small>$320.00</small>&nbsp;&nbsp; $95.00</span>
                                    <ul class="menu-button">
                                        <li><a href="cart.html" class="cart tip" original-title="Add to Cart"></a></li>
                                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" original-title="Zoom"></a></li>
                                        <li><a href="wishlist.html" class="wishlist tip" original-title="Add to Wishlist"></a></li>
                                        <li><a href="compare.html" class="compare tip" original-title="Compare"></a></li>
                                        <li><a href="product-detail.html" class="link tip" original-title="View Detail"></a></li>
                                    </ul>
                                </section>
                            </li>
                            <li class="da-thumbs item">
                            	<div class="product-thumb-hover">
                                    <section class="left">
                                        <img src="${pageContext.request.contextPath}/resources/images/products/product-20.jpg" alt="">
                                        <p class="sale">Sale</p>
                                        <article class="da-animate da-slideFromBottom" style="display: block;">
                                            <h3>Shoes</h3>
                                            <p>
                                            <a href="product-detail.html" class="link tip" original-title="View Detail"></a>&nbsp;
                                            <a href="cart.html" class="cart tip" original-title="Add to cart"></a>&nbsp;&nbsp;
                                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" original-title="Zoom"></a></p>
                                        </article>
                                    </section>
                                </div>
                                <section class="center">
                                	<h3>Shoes</h3>
                                    <em>Category: <a href="#">Men's Dress</a></em>
                                </section>
                                <section class="right">
                                    <span class="price"><small>$320.00</small>&nbsp;&nbsp; $95.00</span>
                                    <ul class="menu-button">
                                        <li><a href="cart.html" class="cart tip" original-title="Add to Cart"></a></li>
                                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" original-title="Zoom"></a></li>
                                        <li><a href="wishlist.html" class="wishlist tip" original-title="Add to Wishlist"></a></li>
                                        <li><a href="compare.html" class="compare tip" original-title="Compare"></a></li>
                                        <li><a href="product-detail.html" class="link tip" original-title="View Detail"></a></li>
                                    </ul>
                                </section>
                            </li>
                        </ul>
			</ul>
		</div>
	</div>
	<!--prodetail-->
	<div class="relatedprod">
		<h4>Related Products</h4>
		<div class="entry first">
			<div class="da-thumbs">
				<div class="div-related">
					<img
						src="${pageContext.request.contextPath}/resources/images/products/product-5.jpg"
						alt="">
					<article class="da-animate da-slideFromRight"
						style="display: block;">
						<p>
							<a href="product-detail.html" class="link tip"
								title="View Detail"></a>&nbsp; <a href="cart.html"
								class="cart tip" title="Add to cart"></a>&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg"
								rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a>
						</p>
					</article>
				</div>
			</div>
			<h3>
				<a href="product-detail.html">Athletic Shoes</a>
			</h3>
			<span>$59.95</span>
		</div>
		<div class="entry">
			<div class="da-thumbs">
				<div class="div-related">
					<img
						src="${pageContext.request.contextPath}/resources/images/products/product-4.jpg"
						alt="">
					<article class="da-animate da-slideFromRight"
						style="display: block;">
						<p>
							<a href="product-detail.html" class="link tip"
								title="View Detail"></a>&nbsp; <a href="cart.html"
								class="cart tip" title="Add to cart"></a>&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg"
								rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a>
						</p>
					</article>
				</div>
			</div>
			<h3>
				<a href="product-detail.html">Athletic Shoes</a>
			</h3>
			<span>$59.95</span>
		</div>
		<div class="entry">
			<div class="da-thumbs">
				<div class="div-related">
					<img
						src="${pageContext.request.contextPath}/resources/images/products/product-6.jpg"
						alt="">
					<article class="da-animate da-slideFromRight"
						style="display: block;">
						<p>
							<a href="product-detail.html" class="link tip"
								title="View Detail"></a>&nbsp; <a href="cart.html"
								class="cart tip" title="Add to cart"></a>&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg"
								rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a>
						</p>
					</article>
				</div>
			</div>
			<h3>
				<a href="product-detail.html">Athletic Shoes</a>
			</h3>
			<span>$59.95</span>
		</div>
		<div class="entry">
			<div class="da-thumbs">
				<div class="div-related">
					<img
						src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg"
						alt="">
					<article class="da-animate da-slideFromRight"
						style="display: block;">
						<p>
							<a href="product-detail.html" class="link tip"
								title="View Detail"></a>&nbsp; <a href="cart.html"
								class="cart tip" title="Add to cart"></a>&nbsp;&nbsp; <a
								href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg"
								rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a>
						</p>
					</article>
				</div>
			</div>
			<h3>
				<a href="product-detail.html">Athletic Shoes</a>
			</h3>
			<span>$59.95</span>
		</div>
	</div>
</div>

<!--STAR RATE-->    
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery.rating.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/rating.css" />
<script type="text/javascript">
    $(document).ready(function() {
    	$('#rate1').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:3});
	});
</script>