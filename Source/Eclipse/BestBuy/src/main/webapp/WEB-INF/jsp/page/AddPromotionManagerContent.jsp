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
			Add Promotion &nbsp;<small>add promotion to list promotion</small>
		</h2>
		<form:form method="post" class="form-register"
			action="${pageContext.request.contextPath}/Product/Admin/PostAddPromotion.do"
			modelAttribute="Promotion">
			<h3>Add promotion</h3>
			<c:if test="${requestScope.notify.equals('')==false}">
				<h4 style="color: red;">${requestScope.notify}</h4>
			</c:if>
			
			<%-- <form:hidden path="u_idAccount" value = "${CustomerSeleted.u_idAccount }"/>
			<form:hidden path="u_confirmPassword" value = "${CustomerSeleted.u_confirmPassword }"/>
			<form:hidden path="u_password" value = "${CustomerSeleted.u_password }"/> --%>
			
			<div class="registerbox">
				<fieldset>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Name:</label>
						<div class="controls">
							<form:input path="name" class="input-xlarge" />
							<form:errors path="name">
								<form:errors path="name" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>

					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Description:</label>
						<div class="controls">
							<form:input path="description" class="input-xlarge" />
							<form:errors path="description">
								<form:errors path="description" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Date start:</label>
						<div class="controls">
							<form:input path="datestart" type="text" class="input-xlarge" id="datestart" placeholder="From begin" readonly="readonly"/>
							<form:errors path="datestart">
								<form:errors path="datestart" htmlEscape="false" cssClass="error"/>
							</form:errors>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label"><span class="red">*</span>
							Date end:</label>
						<div class="controls">
							<form:input path="dateend" type="text" class="input-xlarge" id="dateend" placeholder="From begin" readonly="readonly"/>
							<form:errors path="dateend">
								<form:errors path="dateend" htmlEscape="false" cssClass="error"/>
							</form:errors>
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
<script>
  $(function() {
    $( "#datestart" ).datepicker({dateFormat: 'dd/mm/yy'});
  });
  </script>
  <script>
  $(function() {
    $( "#dateend" ).datepicker({dateFormat: 'dd/mm/yy'});
  });
  </script>