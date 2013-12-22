<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<h3>Are you confirm to delete this product?</h3>
 
<ul id="products" class="list clearfix"> 
            <li class="da-thumbs item">
                <div class="product-thumb-hover">
                    <section class="left">
                        <img src="${pageContext.request.contextPath}/resources/images/${productModel.largeImgPath}" alt="">
                        <article class="da-animate da-slideFromRight" style="display: block;">
                            <h3>${productModel.name}</h3>
                            <p>
                            	<a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${productModel.id }">Detail</a>
                                
                            </p>
                        </article>
                    </section>
                </div>
                <section class="center">
                    <h1>${productModel.name}</h1>
                </section>
                <section class="right">
                    <span class="price">
                        <price><fmt:formatNumber type="number"	value="${productModel.price}" /> VND</price>
                    </span> 
                </section>
            </li> 
    </ul>
<form:form method="post" action="${pageContext.request.contextPath}/Product/Admin/Delete.do" modelAttribute="productModel">
	<form:hidden path="id"/>
	<p>
        <input type="submit" id="xoa_sp" value="OK" /> |
       <a href="${pageContext.request.contextPath}/Product/Detail.do?maSP=${productModel.id }">Back</a>
    </p>
</form:form>
