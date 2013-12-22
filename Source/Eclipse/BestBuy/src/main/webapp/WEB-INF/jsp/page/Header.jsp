<%-- 
    Document   : Header
    Created on : Dec 4, 2013, 11:23:19 PM
    Author     : VanQuoc-CNTT
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div id="top">
	<c:if test="${sessionScope.Account != null}">
		<span>Hello! ${sessionScope.Account.username}</span>
	</c:if>
	<div>
		<p>
			Language: <label> <select>
					<option selected>English</option>
					<option>German</option>
					<option>Spanish</option>
			</select>
			</label>?
		</p>
		<p>
			Currency: <label> <select>
					<option selected>US Dollar - USD</option>
					<option>Euro - EUR</option>
					<option>British Pound - GBP</option>
			</select>
			</label>?
		</p>
	</div>
</div>
<!--end:top-->
<div id="top2">
	<ul class="myaccountmenu">
		<li><a href="${pageContext.request.contextPath}/Account/Index.do"
			class="first">My Account</a></li>
		<li><a
			href="${pageContext.request.contextPath}/WishList/Index.do">My
				Wishlist</a></li>
		<li><a href="${pageContext.request.contextPath}/Cart/Index.do">My
				Cart</a></li>
		<li><a href="${pageContext.request.contextPath}/Cart/Checkout.do">Checkout</a></li>
		<li><a
			href="${pageContext.request.contextPath}/ProductCompare/ProductsCompare.do">My
				Compare</a></li>
		<li class="login"><c:choose>
				<c:when test="${sessionScope.Account == null}">
					<a href="#login-box" class="last login-window">Login</a>
				</c:when>
				<c:otherwise>
					<a href="${pageContext.request.contextPath}/j_spring_security_logout"
						class="last login-window">Logout</a>
				</c:otherwise>
			</c:choose></li>
	</ul>
	<div id="login-box" class="login-popup">
		<a href="#" class="close"><img
			src="${pageContext.request.contextPath}/resources/images/process-stop.png"
			class="btn_close" title="Close Window" alt="Close" /></a>
		<form:form method="post" class="signin" name="f"
			action="${pageContext.request.contextPath}/j_spring_security_check"
			modelAttribute="account">
			<fieldset class="textbox">
				<label class="username"> <span>Username or email</span> 
				<input type='text' name='j_username' value='' autocomplete="on" placeholder="Username" id="username"/>
				
				</label> <label class="password"> <span>Password</span> 
				<input type='password' name='j_password' placeholder="Password" id="password"/>
				
				</label>
				<button type="submit" class="submit button" type="submit">Sign
					in</button>
				<p>
					<a class="forgot" href="#">Forgot your password?</a> / <a
						class="register"
						href="${pageContext.request.contextPath}/Account/GetRegistration.do">Create
						an Account</a>
				</p>
			</fieldset>
		</form:form>
	</div>
	<div id="demo-header">
	<c:if test="${sessionScope.ShoppingCart != null}">
		<c:set var="subTotal" value="0" />
		<a id="cart-link" href="#cart" title="Cart">${sessionScope.ShoppingCart.size()} Items</a>
		<div id="cart-panel">
			<div class="item-cart">
				<table>
					<tbody>						
							<c:forEach var="item" items="${sessionScope.ShoppingCart}">
								<c:set var="imageURL" />
								<c:forEach var="itemImage"
									items="${item.getProduct().getImages().iterator()}">
									<c:if test="${itemImage.typeId == 1}">
										<c:set var="imageURL" value="${itemImage}" />
									</c:if>
								</c:forEach>
								<c:set var="subTotal"
									value="${subTotal + item.getProduct().getPrice() * item.getQuantity()}" />
								<tr>
									<td class="image"><a
										href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getProduct().getId()}"><img
											width="60" height="60"
											sr="${pageContext.request.contextPath}/resources/images/${imageURL.path}"
											alt="product" title="product"></a></td>
									<td class="name"><a
										href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getProduct().getId()}">${item.getProduct().getName()}</a></td>
									<td class="quantity">x&nbsp;${item.getQuantity()}</td>
									<td class="total"><fmt:formatNumber type="number"
											value="${item.getProduct().getPrice() * item.getQuantity()}" />
										VND</td>
									<td class="remove"><i class="icon-remove"></i></td>
								</tr>
							</c:forEach>
						
					</tbody>
				</table>
				<table>
					<tbody>
						<tr>
							<td class="textright"><b>Sub-Total:</b></td>
							<td class="textright"><fmt:formatNumber type="number"
								value="${subTotal}" /> VNĐ</td>
						</tr>						
						<tr>
							<td class="textright"><b>VAT (10%):</b></td>
							<td class="textright"><fmt:formatNumber type="number"
								value="${subTotal * 0.1}" /> VNĐ</td>
						</tr>
						<tr>
							<td class="textright"><b>Total:</b></td>
							<td class="textright"><fmt:formatNumber type="number"
								value="${subTotal * 1.1}" /> VNĐ</td>
						</tr>
					</tbody>
				</table>
				<div class="buttoncart">
					<a href="${pageContext.request.contextPath}/Cart/Index.do">View Cart</a> <a href="${pageContext.request.contextPath}/Cart/Checkout.do">Checkout</a>
				</div>
			</div>
		</div>
	</c:if>
		<!-- /login-panel -->
	</div>
	<!-- /demoheader -->
</div>
<!--end:top2-->
<div id="top3">
	<h1 class="logo">
		<a href="${pageContext.request.contextPath}/Home/Index.do">Best
			Buy</a>
	</h1>
	<form action="${pageContext.request.contextPath}/Product/GetProducts.do" method="get" class="search_bar">
		<fieldset>
			<input type="hidden" value = "1" name = "page"/>
			<input type="text" name="search" class="search"
				value="Enter a keywords..."
				onBlur="if (this.value == '') {
                        this.value = 'Enter a keywords...';
                    }"
				onFocus="if (this.value == 'Enter a keywords...') {
                        this.value = '';
                    }" />
			<input type="submit" name="submit" value="Search" class="submit" />
		</fieldset>
	</form>
</div>
<!--end:top3-->
