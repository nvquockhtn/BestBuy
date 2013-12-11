package com.bestbuy.model;

import java.util.HashSet;
import java.util.Set;

import com.bestbuy.pojo.Comment;
import com.bestbuy.pojo.Image;
import com.bestbuy.pojo.Manufacturer;
import com.bestbuy.pojo.Orderdetail;
import com.bestbuy.pojo.Productstate;
import com.bestbuy.pojo.Producttype;

public class ProductModel {
	private int id  =-1;
    private int producttype =-1;
    private int manufacturer =-1;
    private int productstate =-1;
    private String name = "";
    private String overview;
    private String specification;
    private int price;
    private float discount;
    private int productId;
    private int fromprice = -1;
    private int endprice = -1;
    
	public int getFromprice() {
		return fromprice;
	}
	public void setFromprice(int fromprice) {
		this.fromprice = fromprice;
	}
	public int getEndprice() {
		return endprice;
	}
	public void setEndprice(int endprice) {
		this.endprice = endprice;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getProducttype() {
		return producttype;
	}
	public void setProducttype(int producttype) {
		this.producttype = producttype;
	}
	public int getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(int manufacturer) {
		this.manufacturer = manufacturer;
	}
	public int getProductstate() {
		return productstate;
	}
	public void setProductstate(int productstate) {
		this.productstate = productstate;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOverview() {
		return overview;
	}
	public void setOverview(String overview) {
		this.overview = overview;
	}
	public String getSpecification() {
		return specification;
	}
	public void setSpecification(String specification) {
		this.specification = specification;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public float getDiscount() {
		return discount;
	}
	public void setDiscount(float discount) {
		this.discount = discount;
	}
	public int getProductId() {
		return productId;
	}
	public void setProductId(int productId) {
		this.productId = productId;
	}
	
}
