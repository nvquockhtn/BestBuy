<%-- 
    Document   : CheckoutContent
    Created on : Dec 5, 2013, 1:16:52 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container-2">
	<div style="clear: both; display: block; height: 40px"></div>
	<h2>
		Checkout: &nbsp;<small>Checkout Steps</small>
	</h2>
	<div id="tab" class="tab2">
		<ul class="nav nav2">
			<li class="nav-one"><a href="#checkout" class="current">
					Checkout Option</a></li>
			<li class="nav-five"><a href="#payment"> Payment Method</a></li>
			<li class="nav-six"><a href="#confirm"> Confirm Order</a></li>
			<li class="nav-two"><a href="#billing"> Billing Details</a></li>
		</ul>
		<div class="list-wrap checkoutbox">
			<div id="checkout">
				<div class="one-half log">
					<form:form method="post" cssClass="signin" action="${pageContext.request.contextPath}/Account/PostLogin.do" modelAttribute="account">
						<fieldset class="textbox">
							<c:if test="${sessionScope.Account!=null }">
								<h4>Hi! ${sessionScope.Account.username}</h4>
							</c:if>
							<c:if test="${sessionScope.Account==null }">
								<h4>Please login</h4>
								<label class="username"> <span>Username or email</span>
									<!-- <input id="username" name="username" value="" type="text"
									autocomplete="on" placeholder="Username"> -->
									<form:input path="username" autocomplete="on" placeholder="Username"/>
								</label>
								<label class="password"> <span>Password</span> 
									<form:input path="password" autocomplete="on" placeholder="password" type="password"/>
								</label>
								
								<button class="submit button" type="submit">Sign in</button>
								<p>
									<a class="forgot" href="#">Forgot your password?</a> / <a
										class="register" href="${pageContext.request.contextPath}/Account/GetRegistration.do">Create an account</a>
								</p>
							</c:if>
						</fieldset>
					</form:form>

				</div>

			</div>
			<div id="billing" class="hide">
				<form:form
					action="${pageContext.request.contextPath}/Cart/SaveCheckout.do"
					cssClass="form-register" modelAttribute="receiverModel"
					method="post"
					>
					<div class="one-third first">
						<h3>Your Personal Details</h3>
						<div class="registerbox">
							<fieldset>
								<div class="control-group">
									<label class="control-label"><span class="red">*</span>
										Full Name:</label>
									<div class="controls">
											<form:input path="fullName" cssClass="input-xlarge" />
												<form:errors path="fullName">
													<form:errors path="fullName" htmlEscape="false"
														cssClass="error" />
												</form:errors>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span class="red">*</span>
										Email:</label>
									<div class="controls">
										<form:input path="email" cssClass="input-xlarge" />
										<form:errors path="email">
											<form:errors path="email" htmlEscape="false" cssClass="error" />
										</form:errors>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span class="red">*</span>
										Address:</label>
									<div class="controls">
										<form:input path="address" cssClass="input-xlarge" />
										<form:errors path="address">
											<form:errors path="address" htmlEscape="false"
												cssClass="error" />
										</form:errors>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span class="red">*</span>
										Telephone:</label>
									<div class="controls">
										<form:input path="phone" cssClass="input-xlarge" />
										<form:errors path="phone">
											<form:errors path="phone" htmlEscape="false" cssClass="error" />
										</form:errors>
									</div>
								</div>
								<div class="control-group">
									<label class="control-label"><span class="red">*</span>
										Company:</label>
									<div class="controls">
										<form:input path="company" cssClass="input-xlarge" />
										<form:errors path="company">
											<form:errors path="company" htmlEscape="false"
												cssClass="error" />
										</form:errors>
									</div>
								</div>
								<div class="control-group">
									<div class="controls">
										<input type="submit"  id = "idsubmit" value = "Checkout"/>
									</div>
								</div>
							</fieldset>
						</div>
					</div>
				</form:form>
			</div>
			<!--end:billing-->

			<div id="payment" class="hide">
				<p>Please select the preferred payment method to use on this
					order.</p>
				<label class="inline"> <input type="radio" value="option1">
					Pay by vietcombank
				</label> <label class="inline"> <input type="radio" value="option1">
					Pay by saccombank
				</label> <br> <span><a href="#">Continue</a></span>
			</div>
			<!--end:payment-->
			<div id="confirm" class="hide">
				<c:set var="total" value="0" />
				<c:if test="${sessionScope.ShoppingCart !=null}">
					<table class="shopping-cart">
						<tr>
							<th class="image">Image</th>
							<th class="name">Product Name</th>
							<th class="model">Model</th>
							<th class="quantity">Quantity</th>
							<th class="price">Unit Price</th>
							<th class="total">Total</th>
							<th class="action">Action</th>
						</tr>
						<c:forEach var="item" items="${sessionScope.ShoppingCart}">
							<c:set var="imageURL" />
							<c:forEach var="itemImage"
								items="${item.getProduct().getImages().iterator()}">
								<c:if test="${itemImage.typeId == 1}">
									<c:set var="imageURL" value="${itemImage}" />
								</c:if>
							</c:forEach>
							<c:set var="total"
								value="${item.getProduct().getPrice() * item.getQuantity() + total }" />
							<tr>
								<td class="image"><a
									href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getProduct().getId()}"><img
										title="product" alt="product"
										src="${pageContext.request.contextPath}/resources/images/${imageURL.path}"
										height="50" width="50"></a></td>
								<td class="name"><a
									href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getProduct().getId()}">${item.getProduct().getName()}</a></td>
								<td class="model">${item.getProduct().productstate.getName()}</td>
								<td class="quantity">${item.getQuantity()}</td>
								<td class="price"><fmt:formatNumber type="number"
										value="${item.getProduct().getPrice()}" /> VND</td>
								<td class="total"><fmt:formatNumber type="number"
										value="${item.getProduct().getPrice() * item.getQuantity()}" />
									VND</td>
								<td class="remove-update"><a
									href="${pageContext.request.contextPath}/Cart/Delete.do?maSP=${item.getProduct().getId()}"
									class="tip remove" title="Remove"> <img
										src="${pageContext.request.contextPath}/resources/images/remove.png"
										alt="">
								</a></td>
							</tr>
						</c:forEach>
					</table>

				</c:if>
				<div class="contentbox">
					<div class="cartoptionbox one-half first">
						<h4>Total price for these products:</h4>
					</div>
					<!--cartoptionbox-->
					<div class="alltotal one-half">
						<table class="alltotal">
							<tr>
								<td><span class="extra">Sub-Total :</span></td>
								<td><span> <fmt:formatNumber type="number"
											value="${total}" /> VNĐ
								</span></td>
							</tr>
							<tr>
								<td><span class="extra">VAT (10%) :</span></td>
								<td><span><fmt:formatNumber type="number"
											value="${total * 0.1}" /> VNĐ</span></td>
							</tr>
							<tr>
								<td><span class="extra grandtotal">Total :</span></td>
								<td><span class="grandtotal"> <fmt:formatNumber
											type="number" value="${total * 1.1}" /> VNĐ
								</span></td>
							</tr>
						</table>
						<a href="${pageContext.request.contextPath}/Home/Index.do">
							<input type="button" value="Continue Shopping" />
						</a>
						<%-- <a href="${pageContext.request.contextPath}/Cart/Checkout.do">
							<input type="button" value="CheckOut" onclick="clickToSubmit()">
						</a> --%>
						
					</div>
					<!--end:alltotal-->
				</div>
				<!--end:contentbox-->
			</div>
			<!--end:confirm-->
			<script type="text/javascript">
				function clickToSubmit()
				{
					$("#idsubmit").submit();
				}
        	</script>
		</div>
	</div>
	<div style="clear: both; display: block; height: 40px"></div>
</div>
<!--end:container-2-->
<div>