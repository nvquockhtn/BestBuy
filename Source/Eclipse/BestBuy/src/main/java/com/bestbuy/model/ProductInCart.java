/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.bestbuy.model;

import com.bestbuy.pojo.Product;


/**
 *
 * @author VanQuocIT
 */
public class ProductInCart {
    private Product product;

    public ProductInCart(Product product, int quantity) {
        this.setProduct(product);
        this.quantity = quantity;
    }

    

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    /**
	 * @return the product
	 */
	public Product getProduct() {
		return product;
	}



	/**
	 * @param product the product to set
	 */
	public void setProduct(Product product) {
		this.product = product;
	}
	private int quantity;
}
