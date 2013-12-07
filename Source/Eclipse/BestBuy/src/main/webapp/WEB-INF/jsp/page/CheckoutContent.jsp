<%-- 
    Document   : CheckoutContent
    Created on : Dec 5, 2013, 1:16:52 PM
    Author     : VanQuoc-CNTT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="container-2">
    <div style="clear:both; display:block; height:40px"></div>
    <h2>Checkout: &nbsp;<small>Checkout Steps</small></h2>
    <div id="tab" class="tab2">
        <ul class="nav nav2">
            <li class="nav-one"><a href="#checkout" class="current">1. Checkout Option</a></li>
            <li class="nav-two"><a href="#billing">2. Billing Details</a></li>
            <li class="nav-three"><a href="#delivery">3. Delivery Details</a></li>
            <li class="nav-four"><a href="#deliverymethod">4. Delivery Method</a></li>
            <li class="nav-five"><a href="#payment">5. Payment Method</a></li>
            <li class="nav-six"><a href="#confirm">6. Confirm Order</a></li>
        </ul>
        <div class="list-wrap checkoutbox">
            <div id="checkout">	
                <div class="one-half first log">
                    <h4>Customers with a registered account</h4>
                    <form method="post" class="signin" action="#">
                        <fieldset class="textbox">
                            <label class="username">
                                <span>Username or email</span>
                                <input id="username" name="username" value="" type="text" autocomplete="on" placeholder="Username">
                            </label>
                            <label class="password">
                                <span>Password</span>
                                <input id="password" name="password" value="" type="password" placeholder="Password">
                            </label>
                            <button class="submit button" type="button">Sign in</button>
                            <p>
                                <a class="forgot" href="#">Forgot your password?</a> / <a class="register" href="register.html">Create an account</a>
                            </p>        
                        </fieldset>
                    </form>
                </div>
                <div class="one-half log">
                    <h4>Not registered yet?</h4>
                    <p>Welcome! Register today for handy features and quicker checkout.</p>
                    <span><a href="register.html" class="reg">Register</a></span>
                </div>
            </div>
            <div id="billing" class="hide">
                <form action="#" class="form-register">
                    <div class="one-third first">
                        <h3>Your Personal Details</h3>
                        <div class="registerbox">
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> First Name:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Last Name:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Email:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Telephone:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"> Fax:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="one-third">
                        <h3>Your Address</h3>
                        <div class="registerbox">
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label"> Company:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Last Name:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Address 1:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"> Address 2:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        <span class="red">*</span>City:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        <span class="red">*</span>Post Code:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="select01" class="control-label">
                                        <span class="red">*</span>Country:</label>
                                    <div class="controls">
                                        <select id="select01" class="span3">
                                            <option>Country:</option>
                                            <option>Philippines</option>
                                            <option>Germany</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        <span class="red">*</span>Region / State:</label>
                                    <div class="controls">
                                        <select id="select02" class="span3">
                                            <option>Region / State:</option>
                                            <option>Manila</option>
                                            <option>Cagayan de Oro City</option>
                                        </select>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="one-third">
                        <h3>Your Password</h3>
                        <div class="registerbox">
                            <fieldset>
                                <div class="control-group">
                                    <label  class="control-label"><span class="red">*</span> Password:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label  class="control-label"><span class="red">*</span> Password Confirm::</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div><!--end:billing-->
            <div id="delivery" class="hide">
                <form action="#" class="form-register">
                    <div class="one-third first">
                        <h3>Your Personal Details</h3>
                        <div class="registerbox">
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> First Name:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Last Name:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Email:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Telephone:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"> Fax:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="one-third">
                        <h3>Your Address</h3>
                        <div class="registerbox">
                            <fieldset>
                                <div class="control-group">
                                    <label class="control-label"> Company:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Last Name:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"><span class="red">*</span> Address 1:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label"> Address 2:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        <span class="red">*</span>City:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        <span class="red">*</span>Post Code:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label for="select01" class="control-label">
                                        <span class="red">*</span>Country:</label>
                                    <div class="controls">
                                        <select id="select01" class="span3">
                                            <option>Country:</option>
                                            <option>Philippines</option>
                                            <option>Germany</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label class="control-label">
                                        <span class="red">*</span>Region / State:</label>
                                    <div class="controls">
                                        <select id="select02" class="span3">
                                            <option>Region / State:</option>
                                            <option>Manila</option>
                                            <option>Cagayan de Oro City</option>
                                        </select>
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                    <div class="one-third">
                        <h3>Your Password</h3>
                        <div class="registerbox">
                            <fieldset>
                                <div class="control-group">
                                    <label  class="control-label"><span class="red">*</span> Password:</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                                <div class="control-group">
                                    <label  class="control-label"><span class="red">*</span> Password Confirm::</label>
                                    <div class="controls">
                                        <input type="text"  class="input-xlarge">
                                    </div>
                                </div>
                            </fieldset>
                        </div>
                    </div>
                </form>
            </div><!--end:delivery-->
            <div id="deliverymethod" class="hide">
                <p>Please select the preferred shipping method to use on this order.</p>
                <label class="inline">
                    <input type="radio"  value="option1">
                    Flat Shipping Rate
                </label>
                <textarea rows="3" >Add Comment here...</textarea>
                <br>
                <span><a href="#">Continue</a></span>
            </div><!--end:deliverymethod-->
            <div id="payment" class="hide">
                <p>Please select the preferred payment method to use on this order.</p>
                <label class="inline">
                    <input type="radio"  value="option1">
                    Cash on delivery
                </label>
                <textarea rows="3" >Add Comment here...</textarea>
                <br>
                <span><a href="#">Continue</a></span>
            </div><!--end:payment-->
            <div id="confirm" class="hide">
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
                        <td class="image"><a href="#"><img title="product" alt="product" src="${pageContext.request.contextPath}/resources/images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
                        <td  class="name"><a href="#">T-shirt</a></td>
                        <td class="model">Sample Model</td>
                        <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
                        <td class="price">$48.50</td>
                        <td class="total">$48.50</td>
                        <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="${pageContext.request.contextPath}/resources/images/remove.png" alt=""></a>
                            <a href="#" class="tip update" title="Update"><img src="${pageContext.request.contextPath}/resources/images/update.png" alt=""></a></td>  
                    </tr>
                    <tr>
                        <td class="image"><a href="#"><img title="product" alt="product" src="${pageContext.request.contextPath}/resources/images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
                        <td  class="name"><a href="#">T-shirt</a></td>
                        <td class="model">Sample Model</td>
                        <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
                        <td class="price">$48.50</td>
                        <td class="total">$48.50</td>
                        <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="images/remove.png" alt=""></a>
                            <a href="#" class="tip update" title="Update"><img src="${pageContext.request.contextPath}/resources/images/update.png" alt=""></a></td>  
                    <tr>
                        <td class="image"><a href="#"><img title="product" alt="product" src="${pageContext.request.contextPath}/resources/images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
                        <td  class="name"><a href="#">T-shirt</a></td>
                        <td class="model">Sample Model</td>
                        <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
                        <td class="price">$48.50</td>
                        <td class="total">$48.50</td>
                        <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="images/remove.png" alt=""></a>
                            <a href="#" class="tip update" title="Update"><img src="${pageContext.request.contextPath}/resources/images/update.png" alt=""></a></td>  
                    </tr>
                    <tr>
                        <td class="image"><a href="#"><img title="product" alt="product" src="${pageContext.request.contextPath}/resources/images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
                        <td  class="name"><a href="#">T-shirt</a></td>
                        <td class="model">Sample Model</td>
                        <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
                        <td class="price">$48.50</td>
                        <td class="total">$48.50</td>
                        <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="${pageContext.request.contextPath}/resources/images/remove.png" alt=""></a>
                            <a href="#" class="tip update" title="Update"><img src="${pageContext.request.contextPath}/resources/images/update.png" alt=""></a></td>  
                    </tr>
                    <tr>
                        <td class="image"><a href="#"><img title="product" alt="product" src="${pageContext.request.contextPath}/resources/images/products/product-cart-thumb-1.jpg" height="50" width="50"></a></td>
                        <td  class="name"><a href="#">T-shirt</a></td>
                        <td class="model">Sample Model</td>
                        <td class="quantity"><input type="text" size="1" value="1" name="quantity[40]" class="span1"></td>
                        <td class="price">$48.50</td>
                        <td class="total">$48.50</td>
                        <td class="remove-update"> <a href="#" class="tip remove" title="Remove"><img src="${pageContext.request.contextPath}/resources/images/remove.png" alt=""></a>
                            <a href="#" class="tip update" title="Update"><img src="${pageContext.request.contextPath}/resources/images/update.png" alt=""></a></td>  
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
            </div><!--end:confirm-->
        </div>
    </div>
    <div style="clear:both; display:block; height:40px"></div> 
</div>