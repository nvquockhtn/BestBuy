<%-- 
    Document   : CompareContent
    Created on : Dec 4, 2013, 11:38:18 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" 
uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<div class="container-2">
    <div style="clear:both; display:block; height:40px"></div>
    <h2>Compare Products &nbsp;<small> 
    	<c:if test="${sessionScope.listProductsCompare.size()<2}">Please add more product to compare</c:if>
    </small></h2>
    <table class="compare">
        <tbody>
        
		        <tr>
		        	<td class="name">Product ${sessionScope.listProductsCompare.size()}</td>
			        <c:forEach var ="item" items ="${sessionScope.listProductsCompare}" >
			        	<td class="name"><a href="#">${item.getName()}</a></td>
			        </c:forEach>
		        </tr>
		            <tr>
		                <td class="name">Image</td>
		                <c:forEach var ="item" items ="${sessionScope.listProductsCompare}" >
		                	<c:set var="imageURL"/>
		            		<c:forEach var="itemImage" items="${item.getImages().iterator()}">
		            			<c:if test="${itemImage.typeId == 1}">
									<c:set var="imageURL" value="${itemImage}" />
								</c:if>
		            		</c:forEach>
			        		<td><img src="${pageContext.request.contextPath}/resources/images/${imageURL.getPath()}" alt=""></td>
			        	</c:forEach>
		            </tr>
		            <tr>
		            	
		                <td class="name">Price</td>
		                <c:forEach var ="item" items ="${sessionScope.listProductsCompare}" >
		                	<td> 
		                	<fmt:formatNumber type="number" value= "${item.getPrice()}"  groupingUsed="true" /> vnd
		                	
		                	</td>
			        	</c:forEach>
		            </tr>
		            <tr>
		                <td class="name">Type</td>
		                <c:forEach var ="item" items ="${sessionScope.listProductsCompare}" >
		                		<td> ${item.getProducttype().getName() } </td>
			        	</c:forEach>
		            </tr>
		            <tr class="description">
		                <td class="name">View Detail</td>
		                <c:forEach var ="item" items ="${sessionScope.listProductsCompare}" >
		                		<td ><a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${item.getId()}">view detail</a></td>
			        	</c:forEach>
		            </tr>
		        
        </tbody>
        <c:if test="${paramScope.numCompares>3 }">
        	<script type="text/javascript">
            $(document).ready(function($) {
                alert("Can't compare more than four product");
                window.location.href("/ProductCompare/ProductsCompare.do");
            });
        </script>
        </c:if>
        <tbody>
            <tr>
            	<td></td>
            	<c:if test = "${sessionScope.listProductsCompare.size()>0}">
		                <c:forEach var ="item" items ="${sessionScope.listProductsCompare}" >
		                		<td class="button"> <a href="${pageContext.request.contextPath}/ProductCompare/DeleteProductFromListCompare.do?idProduct=${item.getId()}" class="tip remove" title="Remove"><img src="${pageContext.request.contextPath}/resources/images/remove.png" alt=""></a>
                    			<a href="#" class="tip addtocart" title="Add to cart"><img src="${pageContext.request.contextPath}/resources/images/icon-addcart.png" alt=""></a></td>
			        	</c:forEach>
			    </c:if>
            </tr>
        </tbody>
    </table>
    <div style="clear:both; display:block; height:40px"></div>
</div>

<!--STAR RATE-->    
<script type="text/javascript" src="js/jquery.rating.js"></script>
<link rel="stylesheet" type="text/css" href="css/rating.css" />
<script type="text/javascript">
    $(document).ready(function() {
    $('#rate1').rating({
    	  readOnly:  true,
    	  start:     2
    	});
	$('#rate2').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:5});
	$('#rate3').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:4});
	$('#rate4').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:2});
	$('#rate5').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:2});
	$('#rate6').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:0});
	$('#rate7').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:4});
	$('#rate8').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:1});
	$('#rate9').rating('http://html5awesome.com/themeforest/shopymart/www.url.php', {maxvalue:5, curvalue:3});
});
</script>   