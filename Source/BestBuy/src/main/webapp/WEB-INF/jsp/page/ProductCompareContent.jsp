<%-- 
    Document   : CompareContent
    Created on : Dec 4, 2013, 11:38:18 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<div class="container-2">
    <div style="clear:both; display:block; height:40px"></div>
    <h2>Compare Products &nbsp;<small>compare other products</small></h2>
    <table class="compare">
        <tbody>
            <tr>
                <td class="name">Product</td>
                <td class="name"><a href="#">T-shirts</a></td>
                <td class="name"><a href="#">Shoes</a></td>
                <td class="name"><a href="#">Jeans</a></td>
            </tr>
            <tr>
                <td class="name">Image</td>
                <td><img src="${pageContext.request.contextPath}/resources/images/products/thumb-2.jpg" alt=""></td>
                <td><img src="${pageContext.request.contextPath}/resources/images/products/thumb-1.jpg" alt=""></td>
                <td><img src="${pageContext.request.contextPath}/resources/images/products/thumb-2.jpg" alt=""></td>
            </tr>
            <tr>
                <td class="name">Price</td>
                <td> $105.00 </td>
                <td> $40.00 </td>
                <td> $200.00 </td>
            </tr>
            <tr>
                <td class="name">Model</td>
                <td>Model 1</td>
                <td>Model 2</td>
                <td>Model 3</td>
            </tr>
            <tr>
                <td class="name">Brand</td>
                <td>Levis</td>
                <td>Adidas</td>
                <td>Lee</td>
            </tr>
            <tr>
                <td class="name">Availability</td>
                <td>Out of Stock</td>
                <td>In Stock</td>
                <td>In Stock</td>
            </tr>
            <tr>
                <td class="name">Rating</td>
                <td><div id="rate1" class="rating">&nbsp;</div></td>
                <td><div id="rate2" class="rating">&nbsp;</div></td>
                <td><div id="rate3" class="rating">&nbsp;</div></td>
            </tr>
            <tr class="description">
                <td class="name">Summary</td>
                <td ><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p></td>
                <td ><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p></td>
                <td><p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,</p></td>
            </tr>
        </tbody>
        <tbody>
            <tr>
                <td></td>
                <td></td>
                <td></td>
                <td class="button"> <a href="#" class="tip remove" title="Remove"><img src="${pageContext.request.contextPath}/resources/images/remove.png" alt=""></a>
                    <a href="#" class="tip addtocart" title="Add to cart"><img src="${pageContext.request.contextPath}/resources/images/icon-addcart.png" alt=""></a></td>
            </tr>
        </tbody>
    </table>
    <div style="clear:both; display:block; height:40px"></div>
</div>