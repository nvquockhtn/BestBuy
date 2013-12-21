<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<div class="container-2">
	<div style="clear: both; display: block; height: 40px"></div>
	<h2>
		History checkout: &nbsp;<small>Review products you had choose</small>
	</h2>
<%-- 	<c:if test="${requestScope.notify.equals('')==false}">
				<h4>${requestScope.notify}</h4>
			</c:if> --%>
		<table class="shopping-cart">
			<tr>
				<th class="image">No.</th>
				<th class="name">Name product</th>
				<th class="total">Quality</th>
				<th class="quantity">Price</th>
				<th class="quantity">Total</th>
			</tr>
			<c:if test="${requestScope.listorderdetails != null}">
			<c:set var="totalAll" value = "0"/>
			<c:forEach var="item" items="${requestScope.listorderdetails}"
				varStatus="status">
				<tr>
					<td class="image">${status.index+1}</td>
					<td class="name">${item.getProduct().getName()}</td>
					<td class="total">${item.quantity }</td>
					<td class="quantity">${item.unitPrice}</td>
					<td class="quantity">${item.unitPrice*item.quantity }</td>
					<c:set var="totalAll" value = "${totalAll+item.unitPrice*item.quantity}"/>
				</tr>
			</c:forEach>
				<tr>
					<td class="image"> </td>
					<td class="name"> </td>
					<td class="total"> </td>
					<td class="quantity">Tax(10%): </td>
					<td class="quantity">
					<fmt:formatNumber type="number"
											value="${totalAll * 0.1}" /> VND
					</td>
				</tr>
				<tr>
					<td class="image"> </td>
					<td class="name"> </td>
					<td class="total"> </td>
					<td class="quantity">Total All: </td>
					<td class="quantity"> <fmt:formatNumber
											type="number" value="${totalAll * 1.1}" /> VND</td>
				</tr>
		</c:if>
		</table>
	<!--end:contentbox-->
	<div style="clear: both; display: block; height: 40px"></div>
</div>
