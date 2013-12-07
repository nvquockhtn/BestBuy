<%-- 
    Document   : Header
    Created on : Dec 4, 2013, 11:23:19 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<div id="top">
    <span>Hello! default welcome message</span>
    <div>
        <p>Language:
            <label>
                <select>
                    <option selected>English </option>
                    <option>German</option>
                    <option>Spanish</option>
                </select>
            </label>?
        </p>
        <p>Currency:
            <label>
                <select>
                    <option selected>US Dollar - USD </option>
                    <option>Euro - EUR</option>
                    <option>British Pound - GBP</option>
                </select>
            </label>?
        </p>
    </div>
</div><!--end:top-->
<div id="top2">
    <ul class="myaccountmenu">
        <li><a href="account.html" class="first">My Account</a></li>
        <li><a href="wishlist.html">My Wishlist</a></li>
        <li><a href="cart.html">My Cart</a></li>
        <li><a href="checkout.html">Checkout</a></li>
        <li class="login"><a href="#login-box" class="last login-window">Login</a></li>
    </ul>
    <div id="login-box" class="login-popup">
        <a href="#" class="close"><img src="${pageContext.request.contextPath}/resources/images/process-stop.png" class="btn_close" title="Close Window" alt="Close" /></a>
        <form:form method="post" class="signin" action="${pageContext.request.contextPath}/Account/Login.do" modelAttribute="account">
            <fieldset class="textbox">
                <label class="username">
                    <span>Username or email</span>
                    <form:input path="username" id="username" name="username" value="" type="text" autocomplete="on" placeholder="Username" />
                </label>
                <label class="password">
                    <span>Password</span>
                    <form:input path="password" id="password" name="password" value="" type="password" placeholder="Password" />
                </label>
                <button type="submit" class="submit button" type="submit">Sign in</button>
                <p>
                    <a class="forgot" href="#">Forgot your password?</a> / <a class="register" href="register.html">Create an Account</a>
                </p>        
            </fieldset>
        </form:form>
    </div>
    <div id="demo-header">
        <a id="cart-link" href="#cart" title="Cart">2 Items - $295.00</a>
        <div id="cart-panel">
            <div class="item-cart">
                <table>
                    <tbody>
                        <tr>
                            <td class="image"><a href="product.html"><img width="60" height="60" sr="${pageContext.request.contextPath}/resources/images/products/product-thumb-1.jpg" alt="product" title="product"></a></td>
                            <td class="name"><a href="product.html">Women's Saucony</a></td>
                            <td class="quantity">x&nbsp;1</td>
                            <td class="total">$59.95</td>
                            <td class="remove"><i class="icon-remove"></i></td>
                        </tr>
                        <tr>
                            <td class="image"><a href="product.html"><img width="60" height="60" src="${pageContext.request.contextPath}/resources/images/products/product-thumb-1.jpg" alt="product" title="product"></a></td>
                            <td class="name"><a href="product.html">Women's Saucony</a></td>
                            <td class="quantity">x&nbsp;1</td>
                            <td class="total">$59.95</td>
                            <td class="remove"><i class="icon-remove "></i></td>
                        </tr>
                    </tbody>
                </table>
                <table>
                    <tbody>
                        <tr>
                            <td class="textright"><b>Sub-Total:</b></td>
                            <td class="textright">$119.90</td>
                        </tr>
                        <tr>
                            <td class="textright"><b>Eco Tax (-2.00):</b></td>
                            <td class="textright">$2.00</td>
                        </tr>
                        <tr>
                            <td class="textright"><b>VAT (10%):</b></td>
                            <td class="textright">$32.00</td>
                        </tr>
                        <tr>
                            <td class="textright"><b>Total:</b></td>
                            <td class="textright">$151.90</td>
                        </tr>
                    </tbody>
                </table>
                <div class="buttoncart">
                    <a href="cart.html">View Cart</a>
                    <a href="checkout.html">Checkout</a>
                </div>
            </div>
        </div><!-- /login-panel -->
    </div><!-- /demoheader -->	
</div><!--end:top2-->
<div id="top3">
    <h1 class="logo"><a href="index-2.html">Shopy Mart</a></h1>
    <form action="#" method="post" class="search_bar">
        <fieldset>
            <input type="text" name="search" class="search" value="Enter a keywords..." onBlur="if (this.value == '') {
                              this.value = 'Enter a keywords...';
                          }" onFocus="if (this.value == 'Enter a keywords...') {
                              this.value = '';
                          }" />
            <input type="submit" name="submit" value="Search" class="submit" />
        </fieldset>
    </form>
</div><!--end:top3-->
