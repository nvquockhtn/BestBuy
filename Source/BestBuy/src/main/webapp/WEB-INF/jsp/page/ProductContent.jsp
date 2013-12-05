<%-- 
    Document   : ProductContent
    Created on : Dec 5, 2013, 1:50:49 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-2">
    <section class="content">
        <div class="ctrl">
            <form class="left">
                Sort By :&nbsp;
                <select>
                    <option>Position</option>
                    <option>Name</option>
                    <option>Price</option>
                    <option>Rating </option>
                    <option>Color</option>
                </select>
                &nbsp;&nbsp;
                Show:&nbsp;
                <select>
                    <option>6</option>
                    <option>10</option>
                    <option>25</option>
                </select>
            </form>
            <span class="list-style-buttons">
                <a href="#" id="gridview" class="switcher"><img src="${pageContext.request.contextPath}/resources/images/grid-view.png" alt="Grid"></a>
                <a href="#" id="listview" class="switcher active"><img src="${pageContext.request.contextPath}/resources/images/list-view-active.png" alt="List"></a>
            </span>
        </div>
        <ul id="products" class="list clearfix">
            <li class="da-thumbs">
                <div class="product-thumb-hover">
                    <section class="left">
                        <img src="${pageContext.request.contextPath}/resources/images/products/product-1.jpg" alt="">
                        <p class="sale">Sale</p>
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <h3>American Dress</h3>
                            <p>
                                <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                                <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                        </article>
                    </section>
                </div>
                <section class="center">
                    <h3>American Dress</h3>
                    <em>Category: <a href="#">Men's Dress</a></em>
                </section>
                <section class="right">
                    <span class="price"><small>$320.00</small>&nbsp;&nbsp; $95.00</span>
                    <ul class="menu-button">
                        <li><a href="cart.html" class="cart tip" title="Add to Cart"></a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist"></a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare"></a></li>
                        <li><a href="product-detail.html" class="link tip" title="View Detail"></a></li>
                    </ul>
                </section>
            </li>
            <li class="da-thumbs">
                <div class="product-thumb-hover">
                    <section class="left">
                        <img src="${pageContext.request.contextPath}/resources/images/products/product-2.jpg" alt="">
                        <p class="new">New</p>
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <h3>Women's Dress</h3>
                            <p>
                                <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                                <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/resources/images/preview/work_2_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                        </article>
                    </section>
                </div>
                <section class="center">
                    <h3>Women's Dress</h3>
                    <em>Category: <a href="#">Women's Dress</a></em>
                </section>
                <section class="right">
                    <span class="price">$56.00</span>
                    <ul class="menu-button">
                        <li><a href="cart.html" class="cart tip" title="Add to Cart"></a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_2_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist"></a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare"></a></li>
                        <li><a href="product-detail.html" class="link tip" title="View Detail"></a></li>
                    </ul>
                </section>
            </li>
            <li class="da-thumbs">
                <div class="product-thumb-hover">
                    <section class="left">
                        <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="">
                        <p class="new">New</p>
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <h3>Casual Dress</h3>
                            <p>
                                <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                                <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/resources/images/preview/work_3_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                        </article>
                    </section>
                </div>
                <section class="center">
                    <h3>Casual Dress</h3>
                    <em>Category: <a href="#">Women's Dress</a></em>
                </section>
                <section class="right">
                    <span class="price">$120.00</span>
                    <ul class="menu-button">
                        <li><a href="cart.html" class="cart tip" title="Add to Cart"></a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_3_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist"></a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare"></a></li>
                        <li><a href="product-detail.html" class="link tip" title="View Detail"></a></li>
                    </ul>
                </section>
            </li>
            <li class="da-thumbs">
                <div class="product-thumb-hover">
                    <section class="left">
                        <img src="${pageContext.request.contextPath}/resources/images/products/product-4.jpg" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <h3>Sandals</h3>
                            <p>
                                <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                                <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/resources/images/preview/work_4_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                        </article>
                    </section>
                </div>
                <section class="center">
                    <h3>Sandals</h3>
                    <em>Category: <a href="#">Women's Shoes</a></em>
                </section>
                <section class="right">
                    <span class="price">$99.00</span>
                    <ul class="menu-button">
                        <li><a href="cart.html" class="cart tip" title="Add to Cart"></a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_4_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist"></a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare"></a></li>
                        <li><a href="product-detail.html" class="link tip" title="View Detail"></a></li>
                    </ul>
                </section>
            </li>
            <li class="da-thumbs">
                <div class="product-thumb-hover">
                    <section class="left">
                        <img src="${pageContext.request.contextPath}/resources/images/products/product-5.jpg" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <h3>Formal Polo Shirt</h3>
                            <p>
                                <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                                <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/resources/images/preview/work_5_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                        </article>
                    </section>
                </div>
                <section class="center">
                    <h3>Formal Polo Shirt</h3>
                    <em>Category: <a href="#">Men's Dress</a></em>
                </section>
                <section class="right">
                    <span class="price">$99.00</span>
                    <ul class="menu-button">
                        <li><a href="cart.html" class="cart tip" title="Add to Cart"></a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_5_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist"></a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare"></a></li>
                        <li><a href="product-detail.html" class="link tip" title="View Detail"></a></li>
                    </ul>
                </section>
            </li>
            <li class="da-thumbs">
                <div class="product-thumb-hover">
                    <section class="left">
                        <img src="${pageContext.request.contextPath}/resources/images/products/product-6.jpg" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <h3>Polo Shirt</h3>
                            <p>
                                <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                                <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/resources/images/preview/work_6_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                        </article>
                    </section>
                </div>
                <section class="center">
                    <h3>Polo Shirt</h3>
                    <em>Category: <a href="#">Men's Dress</a></em>
                </section>
                <section class="right">
                    <span class="price">$99.00</span>
                    <ul class="menu-button">
                        <li><a href="cart.html" class="cart tip" title="Add to Cart"></a></li>
                        <li><a href="${pageContext.request.contextPath}/resources/images/preview/work_6_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom"></a></li>
                        <li><a href="wishlist.html" class="wishlist tip" title="Add to Wishlist"></a></li>
                        <li><a href="compare.html" class="compare tip" title="Compare"></a></li>
                        <li><a href="product-detail.html" class="link tip" title="View Detail"></a></li>
                    </ul>
                </section>
            </li>
        </ul><!--end:products-->
        <ul id="pagination">
            <li><a class="current" href="#">1</a></li>
            <li><a href="#">2</a></li>
            <li><a href="#">3</a></li>
            <li><a href="#">4</a></li>
            <li><a href="#">next</a></li>
        </ul>
    </section>
    <aside class="sidebar">
        <div class="side">
            <h4>Category</h4>
            <ul class="cat">
                <li><a href="#">Women's Clothes</a></li>
                <li><a href="#">Men's Clothes</a></li>
                <li><a href="#">Accessories</a></li>
                <li><a href="#">Men's Shoes</a></li>
                <li><a href="#">Women's Shoes</a></li>
            </ul>
        </div><!--end:side-->
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
</div>