<%-- 
    Document   : ProductDetailContent
    Created on : Dec 5, 2013, 1:54:14 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-2">
    <div style="clear:both; display:block; height:40px"></div>
    <div class="prod">
        <div class="clearfix"> 
            <a href="${pageContext.request.contextPath}/resources/images/products/product_big1.jpg" class="jqzoom" rel='gal1'  title="triumph" > <img src="images/products/product_small1.jpg" style="border: 4px solid #e5e5e5;"> </a>
        </div>
        <div class="clearfix" >
            <ul id="thumblist" class="clearfix" >
                <li>
                    <a class="zoomThumbActive" href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/products/product_small1.jpg',largeimage: './images/products/product_big1.jpg'}"><img src='images/products/product_small1.jpg'></a>
                </li>
                <li><a href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/products/product_small2.jpg',largeimage: './images/products/product_big2.jpg'}"><img src='images/products/product_small2.jpg'></a></li>
                <li><a  href='javascript:void(0);' rel="{gallery: 'gal1', smallimage: './images/products/product_small3.jpg',largeimage: './images/products/product_big3.jpg'}"><img src='images/products/product_small3.jpg'></a></li>
            </ul>
        </div>
    </div><!--end:prod-->
    <div class="prod-detail">
        <h2>Long Sleeve V-Neck T-Shirt - Black</h2>
        <span class="price">$48.00</span>
        <form action="#">
            Choose you sizes :&nbsp;
            <select>
                <option>Large</option>
                <option>Medium</option>
                <option>Small</option>
                <option>X-Large</option>
                <option>X-Small</option>
            </select>
            &nbsp;&nbsp;
            Quantity:&nbsp;
            <input value="1" type="text">                             
        </form>
        <span class="cart-button"><a href="cart.html">Add to Cart</a><a href="wishlist.html">Add to Wishlist</a><a href="compare.html">Add to Compare</a></span>
        <div id="tab">
            <ul class="nav">
                <li class="nav-one"><a href="#details" class="current">Details</a></li>
                <li class="nav-two"><a href="#specs">Specification</a></li>
                <li class="nav-three"><a href="#reviews">Reviews</a></li>
                <li class="nav-four last"><a href="#tags">Tags</a></li>
            </ul>
            <div class="list-wrap">
                <div id="details">
                    <p>Vivamus orci sem, consectetur ut vestibulum a, semper ac dui. Aenean tellus nisl, commodo eu aliquet ut, pulvinar ut sapien. Praesent sollicitudin, nibh nec mattis lobortis, dui massa eleifend magna, eget consequat risus felis dignissim ligula. </p>
                    <ul>
                        <li><a href="#">Lorem ipsum dolor sit amet Consectetur adipiscing elit</a></li>
                        <li><a href="#">Integer molestie lorem at massa Facilisis in pretium nisl aliquet</a></li>
                        <li><a href="#">Nulla volutpat aliquam velit </a></li>
                    </ul>
                </div>
                <ul id="specs" class="hide">
                    <li><span>Product Code:</span> Product 01</li>
                    <li><span>Availability:</span> In Stock</li>
                    <li><span>Price:</span> $48.00</li>
                    <li><span>Eco Tax:</span> $1</li>
                    <li><span>Vat(10%):</span> $7</li>
                </ul>
                <div id="reviews" class="hide">
                    <form action="#">
                        <fieldset>
                            <label>Input Text</label>
                            <input type="text" name="input">
                            <label>Review</label>
                            <textarea rows="3"></textarea>
                        </fieldset>
                        <input type="submit" class="submit" value="Write a review">
                    </form>
                </div>
                <ul id="tags" class="hide">
                    <li><a href="#">Women's Clothes</a></li>
                    <li><a href="#">Men's Clothes</a></li>
                    <li><a href="#">Women's Shoes</a></li>
                    <li><a href="#">Men's Shoes</a></li>
                    <li><a href="#">Accessories</a></li>
                    <li><a href="#">Brand</a></li>
                </ul>
            </div>
        </div>
    </div><!--prodetail-->
    <div class="relatedprod">
        <h4>Related Products</h4>
        <div class="entry first">
            <div class="da-thumbs">
                <div class="div-related">
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-5.jpg" alt="">
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </div>
            </div>
            <h3><a href="product-detail.html">Athletic Shoes</a></h3>
            <span>$59.95</span>
        </div>
        <div class="entry">
            <div class="da-thumbs">
                <div class="div-related">
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-4.jpg" alt="">
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </div>
            </div>
            <h3><a href="product-detail.html">Athletic Shoes</a></h3>
            <span>$59.95</span>
        </div>
        <div class="entry">
            <div class="da-thumbs">
                <div class="div-related">
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-6.jpg" alt="">
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </div>
            </div>
            <h3><a href="product-detail.html">Athletic Shoes</a></h3>
            <span>$59.95</span>
        </div>
        <div class="entry">
            <div class="da-thumbs">
                <div class="div-related">
                    <img src="${pageContext.request.contextPath}/resources/images/products/product-3.jpg" alt="">
                    <article class="da-animate da-slideFromRight" style="display: block;">
                        <p>
                            <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                            <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                            <a href="${pageContext.request.contextPath}/resources/images/preview/work_1_l.jpg" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                    </article>
                </div>
            </div>
            <h3><a href="product-detail.html">Athletic Shoes</a></h3>
            <span>$59.95</span>
        </div>
    </div>
</div>