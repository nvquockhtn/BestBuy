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
			Update customer &nbsp;<small>update a account of custome</small>
		</h2>
		<form:form method="post" class="form-register"
			action="${pageContext.request.contextPath}/Customer/Administrator/PostUpdateCustomer.do"
			modelAttribute="CustomerSeleted">
			<h3>Update Account</h3>
			<c:if test="${requestScope.error.equals('')==false}">
				<h4 style="color: red;">${requestScope.error}</h4>
			</c:if>
			
			<form:hidden path="u_idAccount" value = "${CustomerSeleted.u_idAccount }"/>
			<form:hidden path="u_confirmPassword" value = "${CustomerSeleted.u_confirmPassword }"/>
			<form:hidden path="u_password" value = "${CustomerSeleted.u_password }"/>
			
			<div class="registerbox">
				<fieldset>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Full Name:</label>
						<div class="controls">
							<form:input path="u_fullName" class="input-xlarge" />
							<form:errors path="u_fullName">
								<form:errors path="u_fullName" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>

					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Email:</label>
						<div class="controls">
							<form:input path="u_email" class="input-xlarge" />
							<form:errors path="u_email">
								<form:errors path="u_email" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Telephone:</label>
						<div class="controls">
							<form:input path="u_phoneNumber" class="input-xlarge" />
							<form:errors path="u_phoneNumber">
								<form:errors path="u_phoneNumber" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
				</fieldset>
			</div>
			<div class="registerbox">
				<fieldset>
					<div class="control-group">
						<label class="control-label"> Company:</label>
						<div class="controls">
							<form:input path="u_company" class="input-xlarge" />
							<form:errors path="u_company">
								<form:errors path="u_company" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Address:</label>
						<div class="controls">
							<form:input path="u_address" class="input-xlarge" />
							<form:errors path="u_address">
								<form:errors path="u_address" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
				</fieldset>
			</div>
			<div class="registerbox">
				<fieldset>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							User name:</label>
						<div class="controls">
							<form:input path="u_username" class="input-xlarge" />
							<form:errors path="u_username">
								<form:errors path="u_username" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Block account:</label>
						<div class="controls">
							<form:checkbox path="u_isBlock" cssStyle="width: inherit;"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Active account:</label>
						<div class="controls">
							<form:checkbox path="u_isActive" cssStyle="width: inherit;"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Set type:</label>
						<div class="controls">
							<form:select path="u_accounttype">
								<form:options items="${requestScope.listAccounttypes }" itemLabel="name" itemValue="id"/>
							</form:select>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Reset password:</label>
						<div class="controls">
							<form:checkbox path="u_isReset" cssStyle="width: inherit;"/>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red"></span> &nbsp;</label>
                        <div class="controls">
                            <font color="#FF0000" class="error">${requestScope.Error}</font>
                        </div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							 :</label>
						<div class="controls">
							<input type="Submit" class="submit" value="Submit">
						</div>
					</div>
				</fieldset>
			</div>
		</form:form>
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