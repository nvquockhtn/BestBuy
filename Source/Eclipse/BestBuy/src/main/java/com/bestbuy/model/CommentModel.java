package com.bestbuy.model;

import java.util.Date;

public class CommentModel {

	private int id;
	private String text;
	private int productId;

	/**
	 * @param id
	 * @param text
	 * @param createDate
	 * @param productId
	 * @param accountId
	 * @param rating
	 */
	public CommentModel(int id, String text, Date createDate, int productId,
			int accountId, float rating) {
		super();
		this.id = id;
		this.text = text;
		this.productId = productId;
	}

	/**
	 * @return the id
	 */
	public int getId() {
		return id;
	}

	/**
	 * @param id
	 *            the id to set
	 */
	public void setId(int id) {
		this.id = id;
	}

	/**
	 * @return the text
	 */
	public String getText() {
		return text;
	}

	/**
	 * @param text
	 *            the text to set
	 */
	public void setText(String text) {
		this.text = text;
	}

	/**
	 * @return the productId
	 */
	public int getProductId() {
		return productId;
	}

	/**
	 * @param productId
	 *            the productId to set
	 */
	public void setProductId(int productId) {
		this.productId = productId;
	}

	public CommentModel() {
		// TODO Auto-generated constructor stub
	}

}
