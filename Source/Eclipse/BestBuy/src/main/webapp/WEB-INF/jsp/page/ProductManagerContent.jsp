<%-- 
    Document   : ProductContent
    Created on : Dec 5, 2013, 1:50:49 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="container-2">
    <section class="content">
        <div class="ctrl">
        	<form:form cssClass="left" modelAttribute="product" method="get" action="${pageContext.request.contextPath}/Product/Admin/ProductManager.do" >
            	<div class = "formProduct">
	            	<div class = "formSearch">
	            		<div class ="formPagg">
	            			<label> &nbsp; &nbsp; Search: </label>
	            			<form:input path="search" cssClass="myinputext" cssStyle="width: 120px" placeholder = "search..."/>
	            		</div>
	            	</div>
	            	<div class= "formClear"></div>
            	</div>
            	<form:hidden path="page" value = "1"/>
            	<div class = "formProduct">
	            	<div class = "formSearch">
	            		<div class ="formPagg">
	            			<label> &nbsp; &nbsp; Price from: </label>
	            			<form:select path="fromprice">
			            		<form:option label="-- Choose price --" value = "-1"/>
			            		<form:options items="${requestScope.listFromPrices}" itemValue="id" itemLabel="price"/>
	            			</form:select>
	            		</div>
	            	</div>
	            	<div class = "formSearch">
	            		<div class ="formPagg">
	            			<label> &nbsp; &nbsp; Price end: </label>
	            			<form:select path="endprice">
			            		<form:option label="-- Choose price --" value = "-1"/>
			            		<form:options items="${requestScope.listFromPrices}" itemValue="id" itemLabel="price"/>
	            			</form:select>
	            		</div>
	            	</div>
	            	<div class="formClear"></div>
            	</div>
            	<div class = "formProduct" >
	            	<div class = "formSearch">
	            		<div class ="formPagg">
	            			<label>&nbsp; &nbsp; Manufacturer: </label>
	            			<form:select path="idmanufacturer">
	                			<form:option value="-1" label="-- All --"/>
	                			<form:options items = "${requestScope.listManufacturers}" itemValue="id" itemLabel="name"/>
	               			</form:select>
	            		</div>
	            	</div>
	            	<div class = "formSearch">
	            		<div class ="formPagg">
	            			<label>&nbsp; &nbsp; Product type: </label>
	            			<form:select path="idproducttype">
	                			<form:option value="-1" label="-- All --"/>
	                			<form:options items = "${requestScope.listProducttypes}" itemValue="id" itemLabel="name"/>
	                		</form:select>
	            		</div>
	            	</div>
	            	<div class="formClear"></div>
            	</div>
                <div class = "formProduct" >
	            	<div class = "formSearch">
	            		<div class ="formPagg">
	            			<label>&nbsp; &nbsp; Product state: </label>
	            			<form:select path="idproductstate">
	                			<form:option value="-1" label="-- All --"/>
	                			<form:options items = "${requestScope.listProductstates}" itemValue="id" itemLabel="name"/>
	                		</form:select>
	            		</div>
	            	</div>
	            	<div class = "formSearch">
	            		<div class ="formPagg">
	            			<label>&nbsp; &nbsp; Pomotion: </label>
	            			<form:select path="idpromotion">
	                			<form:option value="-1" label="-- All --"/>
	                			<form:options items = "${requestScope.listPromotions}" itemValue="id" itemLabel="name"/>
	                		</form:select>
	            		</div>
	            	</div>
	            	<div class="formClear"></div>
                </div>
                <input type="submit" value="submit">
            </form:form>
            <span class="list-style-buttons">
                <a href="#" id="gridview" class="switcher"><img src="${pageContext.request.contextPath}/resources/images/grid-view.png" alt="Grid"></a>
                <a href="#" id="listview" class="switcher active"><img src="${pageContext.request.contextPath}/resources/images/list-view-active.png" alt="List"></a>
            </span>
        </div>
        <ul id="products" class="list clearfix">
        	<c:forEach items="${listProducts}" var ="item">
        		<c:set var="imageURL"/>
            		<c:forEach var="itemImage" items="${item.getImages().iterator()}">
            			<c:if test="${itemImage.typeId == 1}">
							<c:set var="imageURL" value="${itemImage}" />
						</c:if>
            		</c:forEach>
        		<li class="da-thumbs">
                <div class="product-thumb-hover">
                    <section class="left">
                        <img src="${pageContext.request.contextPath}/resources/images/${imageURL.path}" alt="">
                        <p class="sale">Sale</p>
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <h3>${item.name}</h3>
                            <p>
                                <a href="product-detail.html" class="link tip" title="View Detail"></a>&nbsp;
                                <a href="cart.html" class="cart tip" title="Add to cart"></a>&nbsp;&nbsp;
                                <a href="${pageContext.request.contextPath}/resources/images/${imageURL.path}" rel="prettyPhoto[gallery1]" class="zoom tip" title="Zoom" ></a></p>
                        </article>
                    </section>
                </div>
                <section class="center">
                    <h3>${item.name}</h3>
                    <em>Category: <a href="#">${item.producttype.name }</a></em>
                </section>
                <section class="right">
                	<c:set var = "valPrice"/>
                	<c:if test="${item.discount!=0 }">
                		<c:set var="valPrice" value = "${item.price*item.discount }" />
                	</c:if>
                	<c:if test = "${item.discount==0 }">
                		<c:set var="valPrice" value = "${item.price}" />
                	</c:if>
                    <span class="price"><small style = "text-decoration: none">Price: </small>&nbsp;&nbsp; 
                    <fmt:formatNumber type="number"
								value="${valPrice}" /> VND
                    </span>
                    <ul class="menu-button">
                    	<form:form modelAttribute="productStateChange" action ="${pageContext.request.contextPath}/Product/Admin/ProductChangeState.do">
                    		<div style="width: inherit; height: inherit">
                    			<label style="float:left;display:inline">Discount: </label>
                    			<form:input path="discountChange" cssStyle="display:block;float: left; width: 70px; margin-left: 10px;" value = "${item.discount}"/>
                    		</div>
                    		<%-- <div style="width: inherit; height: inherit">
                    			<label style="float:left;display:inline">Discount: </label>
                    			<form:input path="discountChange" cssStyle="display:block;float: left; width: 70px; margin-left: 10px;" value = "${item.discount}"/>
                    		</div> --%>
							<%-- <form:select path="idproductstateChange" onchange="submitProductStateChange('${item.id }')" cssStyle="background: none;">
									<form:option label="-- All --" value = "-1"/>
	                				<form:options items = "${requestScope.listProductstates}" itemValue="id" itemLabel="name"/>
							</form:select> --%>
							<form:select path="idpromotionChange" onchange="submitProductStateChange('${item.id }')" cssStyle="background: none;">
									<form:option label="-- None --" value = "-1"/>
	                				<form:options items = "${requestScope.listPromotions}" itemValue="id" itemLabel="name"/>
							</form:select>
							<form:hidden path="idmanufacturerChange" value = "${requestScope.manufacturerSelected }"/>
							<form:hidden path="idproductstateChange" value = "${requestScope.productstateSelected }"/>
							<form:hidden path="idproducttypeChange" value = "${requestScope.producttypeSelected }"/>
							<form:hidden path="frompriceChange" value = "${requestScope.frompriceSelected }"/>
							<form:hidden path="endpriceChange" value = "${requestScope.endpriceSelected }"/>
							<form:hidden path="searchChange" value = "${requestScope.searchNameSelected }"/>
							<form:hidden path="page" value = "${requestScope.pageSelected }"/>
							<%-- <form:hidden path="idpromotionChange" value = "${requestScope.promotionSelected }"/> --%>
							<form:hidden path="idChange" value = "${item.id}"/>
							<input type="submit" value = "Change" />
						</form:form>
						</ul>
                </section>
            </li>
        	</c:forEach>
        </ul><!--end:products-->
        <script type="text/javascript">
        	function submitProductStateChange(idProduct)
        	{
        		var id = "#idsubmitProductSateChange" + idProduct;
        		$(id).submit(); 
        	}
        </script>
        <ul id="pagination">
        	<c:if test = "${product.page <= requestScope.pageCount && product.page >1 }" >
        		<li><a href="${pageContext.request.contextPath}/Product/Admin/ProductManager.do/?page=1&search=${product.search }&idmanufacturer=${product.idmanufacturer }&idproducttype=${product.idproducttype }&idproductstate=${product.idproductstate }&fromprice=${product.fromprice }&endprice=${product.endprice }"> << </a></li>
        		<li><a href="${pageContext.request.contextPath}/Product/Admin/ProductManager.do/?page=${product.page-1 }&search=${product.search }&idmanufacturer=${product.idmanufacturer }&idproducttype=${product.idproducttype }&idproductstate=${product.idproductstate }&fromprice=${product.fromprice }&endprice=${product.endprice }"> Prev </a></li>
        	</c:if>
        	<c:if test="${product.page>3 }">
        		<c:set var="end" value="${product.page+2 }"/>
        	</c:if>
        	<c:if test="${product.page<=3 }">
        		<c:set var = "end" value = "4"/>
        	</c:if>
        	<c:if test="${end>requestScope.pageCount }">
        		<c:set var = "end" value = "${requestScope.pageCount}"/>
        	</c:if>
        	<c:set var = "start" value = "${end-3 }" />
        	<c:if test = "${(end-3)<1 }">
        		<c:set var ="start" value = "1" />
        	</c:if>
             <c:forEach var = "i" begin="${start }" end ="${end}">
             	<c:if test="${i<=requestScope.pageCount && i>0}">
             		<c:if test ="${i==product.page}">
             			<li><a href="${pageContext.request.contextPath}/Product/Admin/ProductManager.do/?page=${i }&search=${product.search }&idmanufacturer=${product.idmanufacturer }&idproducttype=${product.idproducttype }&idproductstate=${product.idproductstate }&fromprice=${product.fromprice }&endprice=${product.endprice }" class = "current"> ${i} </a></li>
             		</c:if>
             		<c:if test ="${i!=product.page}">
             			<li><a href="${pageContext.request.contextPath}/Product/Admin/ProductManager.do/?page=${i }&search=${product.search }&idmanufacturer=${product.idmanufacturer }&idproducttype=${product.idproducttype }&idproductstate=${product.idproductstate }&fromprice=${product.fromprice }&endprice=${product.endprice }"> ${i} </a></li>
             		</c:if>
             	</c:if>
             </c:forEach>
            <c:if test = "${product.page <requestScope.pageCount-1 }" >
            	<li><a href="${pageContext.request.contextPath}/Product/Admin/ProductManager.do/?page=${end+1 }&search=${product.search }&idmanufacturer=${product.idmanufacturer }&idproducttype=${product.idproducttype }&idproductstate=${product.idproductstate }&fromprice=${product.fromprice }&endprice=${product.endprice }"> Next </a></li>
        		<li><a href="${pageContext.request.contextPath}/Product/Admin/ProductManager.do/?page=${requestScope.pageCount }&search=${product.search }&idmanufacturer=${product.idmanufacturer }&idproducttype=${product.idproducttype }&idproductstate=${product.idproductstate }&fromprice=${product.fromprice }&endprice=${product.endprice }"> >> </a></li>
        		
        	</c:if>
        	<a href="${pageContext.request.contextPath}/Product/Admin/IndexPromotion.do?page=1" style="float: right;"><input type="button" value="Back" style="float: right;"></a>
        </ul>
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