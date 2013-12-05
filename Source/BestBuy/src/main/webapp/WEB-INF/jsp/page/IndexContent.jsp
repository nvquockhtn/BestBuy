<%-- 
    Document   : IndexContent
    Created on : Dec 4, 2013, 11:34:13 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-2">
    <section class="content">
        <div class="list_work">
            <h4>Featured Products</h4>
            <ul id="mycarousel" class="jcarousel-skin-tango item da-thumbs">
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-1.jpg" alt="" />
                    <span>American Dress<br><small class="sale">$320.00</small>&nbsp;&nbsp;<small>$99.25</small></span>
                    <span class="sale">Sale</span>
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <h3>American Dress</h3>
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-2.jpg" alt="" />
                    <span>Women's Dress<br><small>$56.25</small></span>
                    <span class="new">New</span>
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <h3>Women's Dress</h3>
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </li>
                <li>
                    <img src="images/products/product-3.jpg" alt="" />
                    <span>Casual Dress<br><small>$120.99</small></span>
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <h3>Casual Dress</h3>
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-1.jpg" alt="" />
                    <span>American Dress<br><small>$99.25</small></span>
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <h3>American Dress</h3>
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-2.jpg" alt="" />
                    <span>Women's Dress<br><small>$56.25</small></span>
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <h3>Women's Dress</h3>
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="" />
                    <span>Casual Dress<br><small>$120.99</small></span>
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <h3>Casual Dress</h3>
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </li>                        
            </ul>
        </div><!--end:list_work-->
        <div class="list_work list_work2">
            <h4>New Arrival</h4>
            <ul id="mycarouselnew" class="jcarousel-skin-tango item">
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-4.jpg" alt="" />
                    <span>American Dress<br><small class="sale">$320.00</small>&nbsp;&nbsp;<small>$99.25</small></span>
                    <span class="sale">Sale</span>
                    <ul>
                        <li><a href="cart.html" class="cart tip" title="Add to Cart">Cart</a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom">Zoom</a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist">Add Wishlist</a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare">Compare</a></li>
                    </ul>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-5.jpg" alt="" />
                    <span>Women's Dress<br><small>$56.25</small></span>
                    <ul>
                        <li><a href="cart.html" class="cart tip" title="Add to Cart">Cart</a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom">Zoom</a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist">Add Wishlist</a></li>
                        <li><a href="http://html5awesome.com/themeforest/shopymart/compare.html.html" class="compare tip" title="Compare">Compare</a></li>
                    </ul>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-6.jpg" alt="" />
                    <span>Casual Dress<br><small>$120.99</small></span>
                    <ul>
                        <li><a href="cart.html" class="cart tip" title="Add to Cart">Cart</a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom">Zoom</a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist">Add Wishlist</a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare">Compare</a></li>
                    </ul>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-1.jpg" alt="" />
                    <span>American Dress<br><small>$99.25</small></span>
                    <ul>
                        <li><a href="cart.html" class="cart tip" title="Add to Cart">Cart</a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom">Zoom</a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist">Add Wishlist</a></li>
                        <li><a href="http://html5awesome.com/themeforest/shopymart/compare.html.html" class="compare tip" title="Compare">Compare</a></li>
                    </ul>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-2.jpg" alt="" />
                    <span>Women's Dress<br><small>$56.25</small></span>
                    <ul>
                        <li><a href="cart.html" class="cart tip" title="Add to Cart">Cart</a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom">Zoom</a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist">Add Wishlist</a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare">Compare</a></li>
                    </ul>
                </li>
                <li>
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="" />
                    <span>Casual Dress<br><small>$120.99</small></span>
                    <ul>
                        <li><a href="cart.html" class="cart tip" title="Add to Cart">Cart</a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom">Zoom</a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist">Add Wishlist</a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare">Compare</a></li>
                    </ul>
                </li>                        
            </ul>
        </div><!--end:list_work-->
    </section>
    <aside class="sidebar">
        <div class="side">
            <h4>Bestsellers</h4>
            <div class="entry">
                <div class="da-thumbs">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/images/products/thumb-1.jpg" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <p><a href="product-detail.html" class="link"></a></p>
                        </article>
                    </div>
                </div>
                <h3><a href="product-detail.html">Athletic Shoes</a></h3>
                <small>$59.95</small>
            </div>
            <div class="entry">
                <div class="da-thumbs">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/images/products/thumb-2.jpg" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <p><a href="product-detail.html" class="link"></a></p>
                        </article>
                    </div>
                </div>
                <h3><a href="product-detail.html">Athletic Shoes</a></h3>
                <small>$59.95</small>
            </div>
        </div><!--end:side-->
        <div class="side">
            <h4>Recent Blog</h4>
            <div class="entry">
                <div class="da-thumbs">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/images/products/thumb-1.jpg" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <p><a href="blog.html" class="link"></a></p>
                        </article>
                    </div>
                </div>
                <h3><a href="blog.html">Pellentesque habitant morbi..</a></h3>
                <span><a href="blog.html">Posted on:02/28/13</a></span>
            </div>
            <div class="entry">
                <div class="da-thumbs">
                    <div>
                        <img src="${pageContext.request.contextPath}/resources/images/products/thumb-2.jpg" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <p><a href="blog.html" class="link"></a></p>
                        </article>
                    </div>
                </div>
                <h3><a href="blog.html">Pellentesque habitant morbi ...</a></h3>
                <span><a href="blog.html">Posted on:02/28/13</a></span>
            </div>
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