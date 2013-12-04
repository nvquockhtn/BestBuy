<%-- 
    Document   : ShoppingCartContent
    Created on : Dec 4, 2013, 11:31:13 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-2">
    <div style="clear:both; display:block; height:40px"></div>
    <h2>Shopping Cart &nbsp;<small>Your shopping cart</small></h2>
    <table class="shopping-cart">
        <tr>
            <th class="image">Image</th>
            <th class="name">Product Name</th>
            <th class="model">Model</th>
            <th class="quantity">Quantity</th>
            <th class="price">Unit Price</th>
            <th class="total">Total</th>
            <th class="action">Action</th>
        </tr>
        <tr>
            <td class="image"><a href="#"><img title="product" alt="product" src="images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
            <td  class="name"><a href="#">T-shirt</a></td>
            <td class="model">Sample Model</td>
            <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
            <td class="price">$48.50</td>
            <td class="total">$48.50</td>
            <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="images/remove.png" alt=""></a>
                <a href="#" class="tip update" title="Update"><img src="images/update.png" alt=""></a></td>  
        </tr>
        <tr>
            <td class="image"><a href="#"><img title="product" alt="product" src="images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
            <td  class="name"><a href="#">T-shirt</a></td>
            <td class="model">Sample Model</td>
            <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
            <td class="price">$48.50</td>
            <td class="total">$48.50</td>
            <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="images/remove.png" alt=""></a>
                <a href="#" class="tip update" title="Update"><img src="images/update.png" alt=""></a></td>  
        <tr>
            <td class="image"><a href="#"><img title="product" alt="product" src="images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
            <td  class="name"><a href="#">T-shirt</a></td>
            <td class="model">Sample Model</td>
            <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
            <td class="price">$48.50</td>
            <td class="total">$48.50</td>
            <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="images/remove.png" alt=""></a>
                <a href="#" class="tip update" title="Update"><img src="images/update.png" alt=""></a></td>  
        </tr>
        <tr>
            <td class="image"><a href="#"><img title="product" alt="product" src="images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
            <td  class="name"><a href="#">T-shirt</a></td>
            <td class="model">Sample Model</td>
            <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
            <td class="price">$48.50</td>
            <td class="total">$48.50</td>
            <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="images/remove.png" alt=""></a>
                <a href="#" class="tip update" title="Update"><img src="images/update.png" alt=""></a></td>  
        </tr>
        <tr>


            <td class="image"><a href="#"><img title="product" alt="product" src="images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
            <td  class="name"><a href="#">T-shirt</a></td>
            <td class="model">Sample Model</td>
            <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
            <td class="price">$48.50</td>
            <td class="total">$48.50</td>
            <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="images/remove.png" alt=""></a>
                <a href="#" class="tip update" title="Update"><img src="images/update.png" alt=""></a></td>  
        </tr>
    </table>
    <div class="contentbox">
        <div class="cartoptionbox one-half first">
            <h4> Choose if you have a discount code or reward points you want to use or would like to estimate your delivery cost. </h4>
            <input type="radio" class="radio">
            <span>Use Coupon Code</span> <br>
            <input type="radio" class="radio">
            <span>Use Gift Voucher</span> <br>
            <input type="radio" class="radio" checked="checked">
            <span>Estimate Shipping &amp; Taxes</span> <br><br>
            <form action="#" class="ship">
                <h4> Enter your destination to get a shipping estimate.</h4>
                <fieldset>
                    <div class="control-group">
                        <label>Select list</label>
                        <select  class="span3 cartcountry">
                            <option>Country:</option>
                            <option>Philippines</option>
                            <option>United States</option>
                        </select>
                        <select class="span3 cartstate">
                            <option>Region / State:</option>
                            <option>Manila</option>
                            <option>Los Angeles</option>
                        </select>
                        <input type="submit" value="Submit" class="submit">
                    </div>
                </fieldset>
            </form>
        </div><!--cartoptionbox-->
        <div class="alltotal one-half">
            <table class="alltotal">
                <tr>
                    <td><span class="extra">Sub-Total :</span></td>
                    <td><span>$101.0</span></td>
                </tr>
                <tr>
                    <td><span class="extra">Eco Tax (-2.00) :</span></td>
                    <td><span>$11.0</span></td>
                </tr>
                <tr>
                    <td><span class="extra">VAT (18.2%) :</span></td>
                    <td><span>$21.0</span></td>
                </tr>
                <tr>
                    <td><span class="extra grandtotal">Total :</span></td>
                    <td><span class="grandtotal">$150.28</span></td>
                </tr>
            </table>
            <input type="submit" value="Continue Shopping">
            <input type="submit" value="CheckOut">
        </div><!--end:alltotal-->
    </div><!--end:contentbox-->
    <div style="clear:both; display:block; height:40px"></div>
</div>