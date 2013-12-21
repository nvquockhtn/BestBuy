<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


  
<!DOCTYPE html>
<div class="container-2">
	<div style="clear: both; display: block; height: 40px"></div>
	<h2>
		Orders List &nbsp;<small>Customer's orders</small>
	</h2>
	<div class="ctrl">
      	<form:form modelAttribute="OrderFilterModel"
				action="${pageContext.request.contextPath}/Order/Administrator/Filter.do"
				method="post" cssClass="left">
              
              State:&nbsp;			
				<form:select path="orderStateId" onchange="submit();">
					<form:option value="-1" label="--- All ---" />
					<form:options items="${requestScope.OrderStates}" itemLabel="name" itemValue="id"/>
				</form:select>
			&nbsp;&nbsp;	
			From date :<form:input path="fromDate" type="text" class="input-medium" id="fromDate" placeholder="From begin" readonly="readonly"/>              
			To date :<form:input path="toDate" type="text" class="input-medium" id="toDate" placeholder="To now" readonly="readonly"/>
			
				<input type="submit" name="submit"  value="Submit" />         
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

			<c:if test="${requestScope.Orders != null}">
				<c:forEach var="item" items="${requestScope.Orders}" varStatus="status">
					<tr>
						<td class="image">${status.index}</td>
						<td class="name"><a href="${pageContext.request.contextPath}/Cart/HistoryCheckout.do?idOrder=${item.id}"><fmt:formatDate value="${item.createDate}" type="both"/></a></td>						
						<td class="total"><fmt:formatNumber type="number"
								value="${item.total}" />
							VND</td>
						<td class="quantity">${item.orderstate.name}</td>
						<td class="remove-update">
						<c:if test="${item.orderstate.id != 3 && item.orderstate.id != 4 && item.orderstate.id != 2}"> <%-- chi hien cho phep huy khi khac (da huy boi ad va da giao hang va da huy boi khach hang) --%>
						<a href="${pageContext.request.contextPath}/Order/Administrator/Cancel.do?orderId=${item.id}"
							class="tip remove" title="Remove"> <img
								src="${pageContext.request.contextPath}/resources/images/remove.png"
								alt="">
						</a>
						</c:if>
						<c:if test="${item.orderstate.id == 3}"> <%-- chi hien cho phep reactive khi da huy boi ad --%>
						<a href="${pageContext.request.contextPath}/Order/Administrator/Reactive.do?orderId=${item.id}"
							class="tip update" title="Reactive"> <img
								src="${pageContext.request.contextPath}/resources/images/update.png"
								alt="">
						</a>
						</c:if>
						<c:if test="${item.orderstate.id == 5}"> <%-- chi hien cho phep approve khi dang cho --%>
						<a href="${pageContext.request.contextPath}/Order/Administrator/Approve.do?orderId=${item.id}"
							class="tip update" title="Approve"> <img
								src="${pageContext.request.contextPath}/resources/images/process-accept.png"
								alt="">
						</a>
						</c:if>
						<c:if test="${item.orderstate.id == 1}"> <%-- chi hien cho phep da giao hang khi dang giao hang--%>
						<a href="${pageContext.request.contextPath}/Order/Administrator/Delivered.do?orderId=${item.id}"
							class="tip delivered" title="Delivered"> <img
								src="${pageContext.request.contextPath}/resources/images/icon-addcart.png"
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

<script>
  $(function() {
    $( "#fromDate" ).datepicker({dateFormat: 'yy-mm-dd'});
  });
  </script>
  <script>
  $(function() {
    $( "#toDate" ).datepicker({dateFormat: 'yy-mm-dd'});
  });
  </script>