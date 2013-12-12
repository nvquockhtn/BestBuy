<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<!DOCTYPE html>
<div class="container-2">
	<div style="clear: both; display: block; height: 40px"></div>
	<h2>
		Orders List &nbsp;<small>Your orders</small>
	</h2>
	<div class="ctrl">
      	<form:form modelAttribute="orderState"
				action="${pageContext.request.contextPath}/Order/Filter.do"
				method="post" cssClass="left">
              Sort By :&nbsp;
              <select>
                <option>Time</option>
                <option>Total</option>
              </select>
              &nbsp;&nbsp;
              State:&nbsp;
			
				<form:select path="id" onchange="submit();">
					<form:option value="-1" label="--- All ---" />
					<form:options items="${requestScope.OrderStates}" itemLabel="name" itemValue="id"/>
				</form:select>
			</form:form>

          <span class="list-style-buttons">
               <a href="#" style="height: 38px;" class="switcher"></a>
          </span>
      </div>
	<form name="gioHang" action="<c:url value="/Cart/Update.do"/>"
		method="get">
		<table class="shopping-cart">
			<tr>
				<th class="image">No.</th>
				<th class="name">The Order Date</th>
				<th class="total">Total</th>
				<th class="quantity">State</th>
				<th class="action">Action</th>
			</tr>

			<c:if test="${requestScope.MyOrders != null}">
				<c:forEach var="item" items="${requestScope.MyOrders}" varStatus="status">
					<tr>
						<td class="image">${status.index}</td>
						<td class="name"><a href="${pageContext.request.contextPath}/"><fmt:formatDate value="${item.createDate}" type="both"/></a></td>						
						<td class="total"><fmt:formatNumber type="number"
								value="${item.total}" />
							VND</td>
						<td class="quantity">${item.orderstate.name}</td>
						<td class="remove-update">
						<c:if test="${item.orderstate.id == 1}"> <%-- chi hien cho phep huy khi dang chuyen giao hang --%>
						<a href="${pageContext.request.contextPath}/Order/Cancel.do?orderId=${item.id}"
							class="tip remove" title="Remove"> <img
								src="${pageContext.request.contextPath}/resources/images/remove.png"
								alt="">
						</a>
						</c:if>
							</td>
					</tr>
				</c:forEach>
			</c:if>
		</table>
	</form>
	
	<!--end:contentbox-->
	<div style="clear: both; display: block; height: 40px"></div>
</div>