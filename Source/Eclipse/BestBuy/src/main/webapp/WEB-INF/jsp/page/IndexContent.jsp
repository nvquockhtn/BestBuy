<%-- 
    Document   : IndexContent
    Created on : Dec 4, 2013, 11:34:13 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="container-2">
    <section class="content">
        <div class="list_work">
            <h4>New Laptops</h4>
            <ul id="mycarousel" class="jcarousel-skin-tango item da-thumbs">
            	<c:forEach var ="item" items="${requestScope.NewLaptopProduct}">
            		<c:set var="imageURL"/>
            		<c:forEach var="itemImage" items="${item.getImages().iterator()}">
            			<c:if test="${itemImage.typeId == 1}">
							<c:set var="imageURL" value="${itemImage}" />
						</c:if>
            		</c:forEach>
            		<li>
	                    <img src="${pageContext.request.contextPath}/resources/images/${imageURL.path }" alt="" />
	                    <span>${item.name }<br><small class="sale" style="text-decoration: none;">Price: </small>&nbsp;&nbsp;<small><fmt:formatNumber type="number"
								value="${item.price}" /> VND</small></span>
	                    <span class="sale">
	                    	<c:if test = "${item.discount!=0 }">
	                    		Saleoff
	                    	</c:if>
	                    	<c:if test = "${item.discount==0 }">
	                    		Sale
	                    	</c:if>
	                    </span>
	                    <article class="da-animate da-slideFromRight" style="display: block;">
	                        <h3>${item.name }</h3>
	                        <p>
	                            <a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.id}" class="link tip" title="View Detail"></a>&nbsp;
	                            <a href="${pageContext.request.contextPath}/Cart/Add.do?maSP=${item.id}" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
	                            <a href="${pageContext.request.contextPath}/resources/images/${imageURL.path }" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
	                    </article>
                	</li>
            	</c:forEach>
            </ul>
        </div><!--end:list_work-->
        <div class="list_work list_work2">
            <h4>New Tablets</h4>
            <ul id="mycarouselnew" class="jcarousel-skin-tango item">
            	<c:forEach var="item" items = "${requestScope.NewTabletProduct }">
            		<c:set var="imageURL"/>
            		<c:forEach var="itemImage" items="${item.getImages().iterator()}">
            			<c:if test="${itemImage.typeId == 1}">
							<c:set var="imageURL" value="${itemImage}" />
						</c:if>
            		</c:forEach>
            			<li>
		                    <img src="${pageContext.request.contextPath}/resources/images/${imageURL.path }" alt="" />
		                    <span>${item.name }<br><small class="sale" style = "text-decoration: none;">Price: </small>&nbsp;&nbsp;<small ><fmt:formatNumber type="number"
								value="${item.price }" /> VND</small></span>
		                    <span class="sale">Sale</span>
		                    <ul>
		                        <li><a href="${pageContext.request.contextPath}/Cart/Add.do?maSP=${item.id}" class="cart tip" title="Add to Cart">Cart</a></li>
		                        <li><a href="${pageContext.request.contextPath}/resources/images/${imageURL.path }" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom">Zoom</a></li>
		                        <li><a href="${pageContext.request.contextPath}/WishList/Add.do?maSP=${item.id}" class="wishlist tip" title="Add to Wishlist">Add Wishlist</a></li>
		                        <li><a href="${pageContext.request.contextPath}/ProductCompare/AddProductToListCompare.do?idProduct=${item.id}" class="compare tip" title="Compare">Compare</a></li>
                    		</ul>
                		</li>
            	</c:forEach>
            </ul>
        </div><!--end:list_work-->
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
	                            <p><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.id}" class="link"></a></p>
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
                            <p><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.id}" class="link"></a></p>
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
                <li class="feed">Easy shopping experience! Pricing is attractive! Lots of styles to choose from and great pics!<br>
                    <small><a href="#">&mdash; Louie Jie Mahusay</a></small>
                </li>
                <li class="feed">Easy shopping experience! Pricing is attractive! Lots of styles to choose from and great pics!<br>
                    <small><a href="#">&mdash; Louie Jie Mahusay</a></small>
                </li>
                <li class="feed">Easy shopping experience! Pricing is attractive! Lots of styles to choose from and great pics!<br>
                    <small><a href="#">&mdash; Louie Jie Mahusay</a></small>	
                </li>
                <li class="feed">Easy shopping experience! Pricing is attractive! Lots of styles to choose from and great pics!<br>
                    <small><a href="#">&mdash; Louie Jie Mahusay</a></small>
                </li>
            </ul>
        </div>
    </aside>
</div><!--end:container-2-->
<div class="container-2">
    <div style="clear:both; display:block; height:40px"></div>
    <div class="one-third first">
        <h4>About Us</h4>
        <p>Suspendisse rhoncus facilisis adipiscing. Vestibulum eu ligula lorem. Vivamus orci sem, consectetur ut vestibulum a, semper ac dui. Aenean tellus nisl, commodo eu aliquet ut, pulvinar ut sapien.</p>
        <p>Praesent sollicitudin, nibh nec mattis lobortis, dui massa eleifend magna, eget consequat risus felis dignissim ligula. </p>
    </div>
    <div class="one-third">
        <div class='tweet query'></div>
    </div>
    <div class="one-third">
        <div class="fb-like-box" data-href="http://www.facebook.com/HTML5Awesome" data-width="280" data-show-faces="true" data-stream="false" data-border-color="#e5e5e5" data-header="false"></div>
    </div>
</div><!--end:container-2-->