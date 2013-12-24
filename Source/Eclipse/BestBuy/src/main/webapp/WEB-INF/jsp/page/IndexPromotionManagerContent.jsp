<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


  
<!DOCTYPE html>
<div class="container-2">
	<div style="clear: both; display: block; height: 40px"></div>
	<h2>
		Promotion List &nbsp;<small>List promotions of systems</small>
	</h2>
	<c:if test="${requestScope.notify.equals('')==false}">
				<h4>${requestScope.notify}</h4>
			</c:if>
<%-- 	<div class="ctrl">
      	<form:form modelAttribute="CustomerFilterModel"
				action="${pageContext.request.contextPath}/Customer/Administrator/GetCustomer.do"
				method="get" cssClass="left">
			Search by name :<form:input path="fullName" type="text" class="input-medium" placeholder="name..." />              
			Search by email :<form:input path="email" type="text" class="input-medium" placeholder="email..."/>
			Is block: <form:checkbox path="isBlock"/>
			Is active: <form:checkbox path="isActive" />
			Type user: <form:select path="typeid" cssStyle="width: 100px;">
								<form:option value="-1" label="-- All --"></form:option>
								<form:options items="${requestScope.listAccounttypes }" itemLabel="name" itemValue="id" />
							</form:select>
			<input type="hidden" name = "page" value="1"/>
				<input type="submit" name="submit"  value="Submit" />         
			</form:form>
          <span class="list-style-buttons">
               <a href="#" style="height: 38px;" class="switcher"></a>
          </span>
      </div> --%>
		<table class="shopping-cart">
			<tr>
				<th class="image">No.</th>
				<th class="name">Name</th>
				<th class="total">Description</th>
				<th class="quantity">DateStart</th>
				<th class="quantity">DateEnd</th>
				<th class="action">Action</th>
			</tr>
			<c:if test="${requestScope.listPromotions != null}">
			<c:forEach var="item" items="${requestScope.listPromotions}"
				varStatus="status">
				<tr>
					<td class="image">${status.index}</td>
					<td class="name">${item.name }</td>
					<td class="total">${item.description }</td>
					<td class="quantity">${item.datestart }</td>
					<td class="quantity">${item.dateend }</td>
					<td class="remove-update"><a
						href="${pageContext.request.contextPath}/Product/Admin/DeletePromotion.do?idPromotion=${item.id}"
						class="tip remove" title="Delete"> <img
							src="${pageContext.request.contextPath}/resources/images/remove.png"
							alt="">
					</a> <a
						href="${pageContext.request.contextPath}/Product/Admin/ProductManager.do?idpromotion=${item.id}"
						class="tip update" title="Update"> <img
							src="${pageContext.request.contextPath}/resources/images/update.png"
							alt="">
					</a></td>
				</tr>
			</c:forEach>
		</c:if>
		</table>
	<ul id="pagination">
        	<c:if test = "${requestScope.page <= requestScope.pageCount && requestScope.page >1 }" >
        		<li><a href="${pageContext.request.contextPath}/Product/Admin/IndexPromotion.do/?page=1&"> << </a></li>
        		<li><a href="${pageContext.request.contextPath}/Product/Admin/IndexPromotion.do/?page=${requestScope.page-1 }"> Prev </a></li>
        	</c:if>
        	<c:if test="${requestScope.page>3 }">
        		<c:set var="end" value="${requestScope.page+2 }"/>
        	</c:if>
        	<c:if test="${requestScope.page<=3 }">
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
             		<c:if test ="${i==requestScope.page}">
             			<li><a href="${pageContext.request.contextPath}/Product/Admin/IndexPromotion.do/?page=${i }" class = "current"> ${i} </a></li>
             		</c:if>
             		<c:if test ="${i!=requestScope.page}">
             			<li><a href="${pageContext.request.contextPath}/Product/Admin/IndexPromotion.do/?page=${i }"> ${i} </a></li>
             		</c:if>
             	</c:if>
             </c:forEach>
            <c:if test = "${product.requestScope <requestScope.pageCount-1 }" >
            	<li><a href="${pageContext.request.contextPath}/Product/Admin/IndexPromotion.do/?page=${end+1 }"> Next </a></li>
        		<li><a href="${pageContext.request.contextPath}/Product/Admin/IndexPromotion.do/?page=${requestScope.pageCount }"> >> </a></li>
        		
        	</c:if>
        	<a href="${pageContext.request.contextPath}/Product/Admin/GetAddPromotion.do" style="float: right;"><input type="button" value="Add Promotion" style="float: right;"></a>
        </ul>
	<!--end:contentbox-->
	<div style="clear: both; display: block; height: 40px"></div>
</div>
