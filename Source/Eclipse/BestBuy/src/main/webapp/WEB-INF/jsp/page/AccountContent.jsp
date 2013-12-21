<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div class="container-2">
	<section class="content">
	<h2>
		My Accounts: &nbsp;<small>View all your account information</small>
	</h2>
	<div id="tab" class="tab2">
		<ul class="nav nav2">
			<li class="nav-one"><a href="#account" class="current">My
					Accounts</a></li>
			<li class="nav-two"><a href="#order">My Orders</a></li>
			<li class="nav-three"><a href="#newsletter">Newsletter</a></li>
		</ul>
		<div class="list-wrap myaccount">
			<ul id="account">
				<li><a href="#">Edit you account information</a></li>
				<li><a href="#">Change your password</a></li>
				<li><a href="#">Modify you address book entries</a></li>
				<li><a href="#">Modify you wishlist</a></li>
			</ul>
			<ul id="order" class="hide">
				<li><a href="${pageContext.request.contextPath}/Order/Index.do">View your order history</a></li>
				<li><a href="#">Downloads</a></li>
				<li><a href="#">View your return request</a></li>
				<li><a href="#">Your transactions</a></li>
			</ul>
			<ul id="newsletter" class="hide">
				<li><a href="#">Subscribe</a></li>
				<li><a href="#">Unsubscribe</a></li>
			</ul>
		</div>
	</div>
	</section>
	<aside class="sidebar">
        <div class="side">
            <h4>Category</h4>
            <ul class="cat">
                <li><a href="${pageContext.request.contextPath}/Product/GetProducts.do/?page=1">Laptops</a></li>
                <li><a href="${pageContext.request.contextPath}/Product/GetProducts.do/?page=1">Tablets</a></li>
                <li><a href="#">Desktops</a></li>
                <!-- <li><a href="#">Men's Shoes</a></li>
                <li><a href="#">Women's Shoes</a></li> -->
            </ul>
        </div><!--end:side-->
        <div class="side">
            <h4>Promotions</h4>
            <c:forEach items = "${requestScope.listProductDiscountDescs}" var = "item">
	            <div class="entry">
	                <div class="da-thumbs">
	                    <div>
	                    <c:set var="imageURL"/>
			            		<c:forEach var="itemImage" items="${item.getImages().iterator()}">
			            			<c:if test="${itemImage.typeId == 1}">
										<c:set var="imageURL" value="${itemImage}" />
									</c:if>
            					</c:forEach>
	                        <img src="${pageContext.request.contextPath}/resources/images/${imageURL.path}" alt="" width="85px" height="75px">
	                        <article class="da-animate da-slideFromRight" style="display: block;">
	                            <p><a href="product-detail.html" class="link"></a></p>
	                        </article>
	                    </div>
	                </div>
	                <h3><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.id}">${item.name }</a></h3>
	                <small style="font-size: 10px">
	                <fmt:formatNumber type="number"
								value="${item.price}" /> VND
	                </small>
	            </div>
            </c:forEach>
        </div><!--end:side-->
        <div class="side">
            <h4>News</h4>
            <c:forEach var="item" items ="${requestScope.listProductNews }">
            	<c:set var="imageURL"/>
			            		<c:forEach var="itemImage" items="${item.getImages().iterator()}">
			            			<c:if test="${itemImage.typeId == 1}">
										<c:set var="imageURL" value="${itemImage}" />
									</c:if>
            					</c:forEach>
            	<div class="entry">
                <div class="da-thumbs">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/images/${imageURL.path}" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <p><a href="blog.html" class="link"></a></p>
                        </article>
                    </div>
                </div>
                <h3><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.id}" >
                	${item.name}
                </a></h3>
                <small style="font-size: 10px">
	                <fmt:formatNumber type="number"
								value="${item.price}" /> VND
	                </small>
            </div>
            </c:forEach>
        </div><!--end:side-->
	<div class="side">
		<h4>Our Customer Love Us!</h4>
		<ul class="fade">
			<li class="feed">Easy shopping experience! Pricing is
				attractive! Lots of styles to choose from and great pics!<br> <small><a
					href="#">&mdash; Louie Jie Mahusay</a></small>
			</li>
			<li class="feed">Easy shopping experience! Pricing is
				attractive! Lots of styles to choose from and great pics!<br> <small><a
					href="#">&mdash; Louie Jie Mahusay</a></small>
			</li>
			<li class="feed">Easy shopping experience! Pricing is
				attractive! Lots of styles to choose from and great pics!<br> <small><a
					href="#">&mdash; Louie Jie Mahusay</a></small>
			</li>
			<li class="feed">Easy shopping experience! Pricing is
				attractive! Lots of styles to choose from and great pics!<br> <small><a
					href="#">&mdash; Louie Jie Mahusay</a></small>
			</li>
		</ul>
	</div>
	</aside>
</div>