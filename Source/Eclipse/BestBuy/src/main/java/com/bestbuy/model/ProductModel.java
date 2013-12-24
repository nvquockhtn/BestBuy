package com.bestbuy.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.NumberFormat;


public class ProductModel {
	private int id  =-1;
    private int idproducttype =-1;
    private int idmanufacturer =-1;
    private int idproductstate =-1;
    private String search = "";
    private String overview;
    private String specification;
    private int price;
    private float discount;
    private int productId;
    private int fromprice = -1;
    private int endprice = -1;
    private int page = 1;
    private int idpromotion=-1;
    
    public int getIdpromotion() {
		return idpromotion;
	}
	public void setIdpromotion(int idpromotion) {
		this.idpromotion = idpromotion;
	}
	private String name;
    /**
	 * @return the name
	 */
    
    @NotNull
	@Size(min = 1, max = 500)
	public String getName() {
		return name;
	}
	/**
	 * @param name the name to set
	 */
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * @return the smallImgPath
	 */
	
	@NotNull
	@Size(min = 1, max = 200)	
	public String getSmallImgPath() {
		return smallImgPath;
	}
	/**
	 * @param smallImgPath the smallImgPath to set
	 */
	public void setSmallImgPath(String smallImgPath) {
		this.smallImgPath = smallImgPath;
	}
	/**
	 * @return the largeImgPath
	 */
	
	@NotNull
	@Size(min = 1, max = 200)
	public String getLargeImgPath() {
		return largeImgPath;
	}
	/**
	 * @param largeImgPath the largeImgPath to set
	 */
	public void setLargeImgPath(String largeImgPath) {
		this.largeImgPath = largeImgPath;
	}
	private String smallImgPath;
    private String largeImgPath;
    
    
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getIdproducttype() {
		return idproducttype;
	}
	public void setIdproducttype(int idproducttype) {
		this.idproducttype = idproducttype;
	}
	public int getIdmanufacturer() {
		return idmanufacturer;
	}
	public void setIdmanufacturer(int idmanufacturer) {
		this.idmanufacturer = idmanufacturer;
	}
	public int getIdproductstate() {
		return idproductstate;
	}
	public void setIdproductstate(int idproductstate) {
		this.idproductstate = idproductstate;
	}
	public String getSearch() {
		return search;
	}
	public void setSearch(String search) {
		this.search = search;
	}
	
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
