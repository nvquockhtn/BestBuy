<%-- 
    Document   : Slider
    Created on : Dec 4, 2013, 11:25:04 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="featured">
    <div class="camera_wrap camera_emboss " id="camera_wrap_1">
        <div data-thumb="${pageContext.request.contextPath}/resources/images/slider-banners/slider1.jpg" data-src="${pageContext.request.contextPath}/resources/images/slider-banners/slider1.jpg">
            <div class="camera_caption moveFromLeft">
                <h2>Awesome Responsive Online Store</h2>
                <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                <div class="button">
                    <a href="cart.html">View Cart</a>
                    <a href="checkout.html">Checkout</a>
                </div>
            </div>
        </div>
        <div data-thumb="${pageContext.request.contextPath}/resources/images/slider-banners/slider2.jpg" data-src="${pageContext.request.contextPath}/resources/images/slider-banners/slider2.jpg">
            <div class="camera_caption moveFromLeft">
                <h2>You can Order Through You Mobile Phone</h2>
                <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                <div class="button">
                    <a href="cart.html">View Cart</a>
                    <a href="checkout.html">Checkout</a>
                </div>
            </div>
        </div>
        <div data-thumb="images/slides/thumbs/road.jpg" data-src="${pageContext.request.contextPath}/resources/images/slider-banners/slider3.jpg">
            <div class="camera_caption moveFromLeft">
                <h2>Compatible in any Browsers</h2>
                <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                <div class="button">
                    <a href="cart.html">View Cart</a>
                    <a href="checkout.html">Checkout</a>
                </div>
            </div>
        </div>
        <div data-thumb="${pageContext.request.contextPath}/resources/images/slides/thumbs/road.jpg" data-src="${pageContext.request.contextPath}/resources/images/slider-banners/slider4.jpg">
            <div class="camera_caption moveFromLeft">
                <h2>Easy to use in any Mobile Device</h2>
                <p>Lorem ipsum dolor sit amet conse ctetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. </p>
                <div class="button">
                    <a href="cart.html">View Cart</a>
                    <a href="checkout.html">Checkout</a>
                </div>
            </div>
        </div>
    </div><!-- #camera_wrap_1 -->
    <div style="clear:both; display:block; height:40px"></div>
</div><!--end:featured-->