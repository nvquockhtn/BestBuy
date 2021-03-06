<%-- 
    Document   : LoginContent
    Created on : Dec 7, 2013, 11:26:38 AM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<div class="container-2">
    <section class="content">
        <h2>Login</h2>
        <form name='f' action="<c:url value='/j_spring_security_check' />" method='POST' class="form-register">    
        <div class="registerbox">
                <fieldset>
                    <div class="control-group">
                        <label class="control-label"><span class="red">*</span> Tên đăng nhập:</label>
                        <div class="controls">
                            <input type='text' name='j_username' value='' class="input-xlarge" />                           
                        </div>
                    </div>
                    <div class="control-group">
                        <label class="control-label"><span class="red">*</span> Mật khẩu:</label>
                        <div class="controls">
                            <input type='password' name='j_password' class="input-xlarge" />
                        </div>
                    </div> 
                    <div class="control-group">
                        <label class="control-label"><span class="red"></span> &nbsp;</label>
                        <div class="controls">
                            <font color="#FF0000" style="font-size: 13px;">${requestScope.Error}</font>
                        </div>
                        <div class="controls">
                            <label class="control-label"><span class="red"></span> &nbsp;</label>
                            <div class="pull-right">                                
                                <a href="${pageContext.request.contextPath}/Account/GetRegistration.do">
                                    <input type ="button" class ="submit" value ="Đăng kí" style="width:80px; text-align:center" onclick="register()"/>
                                </a>
                                <input type ="submit" class ="submit" value ="Đăng nhập" style="width:80px; text-align:center"/>
                            </div>
                        </div>

                    </div>
                </fieldset>
            </div> 
        </form>
    </section>

</div>
