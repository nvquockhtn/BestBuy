<%-- 
    Document   : RegisterContent
    Created on : Dec 5, 2013, 1:11:47 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>


<div class="container-2">
	<section class="content">
		<h2>
			Register Account &nbsp;<small>Register your information
				details.</small>
		</h2>
		<form:form method="post" class="form-register"
			action="${pageContext.request.contextPath}/Account/PostRegistration.do"
			modelAttribute="account">


			<h3>Your Personal Details</h3>
			<div class="registerbox">
				<fieldset>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Full Name:</label>
						<div class="controls">
							<form:input path="fullName" class="input-xlarge" />
							<form:errors path="fullName">
								<form:errors path="fullName" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>

					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Email:</label>
						<div class="controls">
							<form:input path="email" class="input-xlarge" />
							<form:errors path="email">
								<form:errors path="email" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Telephone:</label>
						<div class="controls">
							<form:input path="phoneNumber" class="input-xlarge" />
							<form:errors path="phoneNumber">
								<form:errors path="phoneNumber" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
				</fieldset>
			</div>
			<h3>Your Address</h3>
			<div class="registerbox">
				<fieldset>
					<div class="control-group">
						<label class="control-label"> Company:</label>
						<div class="controls">
							<form:input path="company" class="input-xlarge" />
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Address 1:</label>
						<div class="controls">
							<form:input path="address" class="input-xlarge" />
							<form:errors path="address">
								<form:errors path="address" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"> Address 2:</label>
						<div class="controls">
							<input type="text" class="input-xlarge">
						</div>
					</div>
				</fieldset>
			</div>
			<h3>Your Account</h3>
			<div class="registerbox">
				<fieldset>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							User name:</label>
						<div class="controls">
							<form:input path="username" class="input-xlarge" />
							<form:errors path="username">
								<form:errors path="username" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Password:</label>
						<div class="controls">
							<form:password path="password" class="input-xlarge" />
							<form:errors path="password">
								<form:errors path="password" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Password Confirm::</label>
						<div class="controls">
							<form:password path="confirmPassword" class="input-xlarge" />
							<form:errors path="confirmPassword">
								<form:errors path="confirmPassword" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red"></span> &nbsp;</label>
                        <div class="controls">
                            <font color="#FF0000" class="error">${requestScope.Error}</font>
                        </div>
					</div>
				</fieldset>
			</div>
			<div class="pull-right">
				<label class="checkbox inline"> <input type="checkbox"
					value="option2">
				</label> I have read and agree to the <a href="#">Privacy Policy</a> &nbsp;
				<input type="Submit" class="submit" value="Submit">
			</div>
		</form:form>
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
		</div>
		<!--end:side-->
		<div class="side">
			<h4>Bestsellers</h4>
			<div class="entry">
				<div class="da-thumbs">
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/images/products/thumb-1.jpg"
							alt="">
						<article class="da-animate da-slideFromRight"
							style="display: block;">
							<p>
								<a href="product-detail.html" class="link"></a>
							</p>
						</article>
					</div>
				</div>
				<h3>
					<a href="product-detail.html">Athletic Shoes</a>
				</h3>
				<small>$59.95</small>
			</div>
			<div class="entry">
				<div class="da-thumbs">
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/images/products/thumb-2.jpg"
							alt="">
						<article class="da-animate da-slideFromRight"
							style="display: block;">
							<p>
								<a href="product-detail.html" class="link"></a>
							</p>
						</article>
					</div>
				</div>
				<h3>
					<a href="product-detail.html">Athletic Shoes</a>
				</h3>
				<small>$59.95</small>
			</div>
		</div>
		<!--end:side-->
		<div class="side">
			<h4>Recent Blog</h4>
			<div class="entry">
				<div class="da-thumbs">
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/images/products/thumb-1.jpg"
							alt="">
						<article class="da-animate da-slideFromRight"
							style="display: block;">
							<p>
								<a href="blog.html" class="link"></a>
							</p>
						</article>
					</div>
				</div>
				<h3>
					<a href="blog.html">Pellentesque habitant morbi..</a>
				</h3>
				<span><a href="blog.html">Posted on:02/28/13</a></span>
			</div>
			<div class="entry">
				<div class="da-thumbs">
					<div>
						<img
							src="${pageContext.request.contextPath}/resources/images/products/thumb-2.jpg"
							alt="">
						<article class="da-animate da-slideFromRight"
							style="display: block;">
							<p>
								<a href="blog.html" class="link"></a>
							</p>
						</article>
					</div>
				</div>
				<h3>
					<a href="blog.html">Pellentesque habitant morbi ...</a>
				</h3>
				<span><a href="blog.html">Posted on:02/28/13</a></span>
			</div>
		</div>
		<!--end:side-->
		<div class="side">
			<h4>Our Customer Love Us!</h4>
			<ul class="fade">
				<li class="feed">Easy shopping experience! Pricing is
					attractive! Lots of styles to choose from and great pics!<br>
					<small><a href="#">&mdash; Louie Jie Mahusay</a></small>
				</li>
				<li class="feed">Easy shopping experience! Pricing is
					attractive! Lots of styles to choose from and great pics!<br>
					<small><a href="#">&mdash; Louie Jie Mahusay</a></small>
				</li>
				<li class="feed">Easy shopping experience! Pricing is
					attractive! Lots of styles to choose from and great pics!<br>
					<small><a href="#">&mdash; Louie Jie Mahusay</a></small>
				</li>
				<li class="feed">Easy shopping experience! Pricing is
					attractive! Lots of styles to choose from and great pics!<br>
					<small><a href="#">&mdash; Louie Jie Mahusay</a></small>
				</li>
			</ul>
		</div>
	</aside>
</div>