<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib uri="http://ckeditor.com" prefix="ckeditor" %>

<div class="product-content">
    <h2>EDIT PRODUCT</h2>

    <form:form cssClass="left" modelAttribute="productModel" method="post" action="${pageContext.request.contextPath}/Product/Admin/Edit.do?productId=${productModel.id }" >
                    
        <fieldset>

            <div class="editor-label">
                <label>Product type:</label>
            </div>
            <div class="editor-field">
	            <form:select path="idproducttype">
		     		<form:options items="${requestScope.listProducttypes}" itemValue="id" itemLabel="name"/>
	   			</form:select>

				<form:errors path="idproducttype" htmlEscape="false" cssClass="error"/>
            </div>
            
            <div class="editor-label">
                <label>Manufacturer:</label>
            </div>
            <div class="editor-field">
	            <form:select path="idmanufacturer">
		     		<form:options items="${requestScope.listManufacturers}" itemValue="id" itemLabel="name"/>
	   			</form:select>

				<form:errors path="idmanufacturer" htmlEscape="false" cssClass="error"/>
            </div>

            <div class="editor-label">
                <label><span class="red">*</span>
							Product name:</label>
            </div>
            <div class="editor-field">
            	<form:input path="name" />
                <form:errors path="name" htmlEscape="false" cssClass="error"/>
            </div>
            
            <div class="editor-label">
                <label>Overview:</label>
            </div>
            <div class="editor-field">
            	<form:textarea path="overview"  />
	            		
                <form:errors path="overview" htmlEscape="false" cssClass="error"/>
            </div>

            <div class="editor-label">
                <label>Feature:</label>
            </div>

            <div class="feature">
                <form:textarea path="specification" id="editor1" ></form:textarea>                
            </div>
            <div class="editor-label">
                <label><span class="red">*</span>
							Price:</label>
            </div>
            <div class="editor-field">
            	<form:input path="price" cssClass="" type="number"/>
                <form:errors path="price" htmlEscape="false" cssClass="error"/>
            </div>
            
            <div class="editor-label">
                <label>Discount:</label>
            </div>
            <div class="editor-field">
            	<form:input path="discount" cssClass="" type="number"/>
            </div>
            
            <div class="editor-label">
            	<label>State:</label>
            </div>
            <div class="editor-field">
	            <form:select path="idproductstate">
		     		<form:options items="${requestScope.listProductstates}" itemValue="id" itemLabel="name"/>
	   			</form:select>
            </div>

            <div class="editor-label">
            	<label><span class="red">*</span>Large Image:</label>
            </div>

            <div class="editor-field">
            	<form:input path="largeImgPath" cssClass="" type="text" id="link"/>
            	<form:errors path="largeImgPath" htmlEscape="false" cssClass="error"/>
                <input class="test button_test" type="button" value="Test" onclick="testImage($(this.parentNode))" /><br />
                <img id="bigImage" src="../../resources/images/${productModel.largeImgPath }" alt=""/>

            </div>
            <div class="editor-label">
            	<label><span class="red">*</span>Small Image:</label>
            </div>
            <div class="editor-field">
                <form:input path="smallImgPath" id="link" value=""/>
                <form:errors path="smallImgPath" htmlEscape="false" cssClass="error"/>
                <input class="test button_test" type="button" value="Test" onclick="testImage($(this.parentNode))" /><br />
                <img id="smallImage" src="../../resources/images/${productModel.smallImgPath }" alt=""/>

            </div>
            <p>
                <input id="submit-button" type="submit" value="Save" onclick="" />
            </p>
        </fieldset>
	</form:form>
</div>

<ckeditor:replace replace="editor1" basePath="${pageContext.request.contextPath}/resources/ckeditor/" />
