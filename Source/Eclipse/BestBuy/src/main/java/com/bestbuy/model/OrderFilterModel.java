package com.bestbuy.model;

import java.util.Date;

public class OrderFilterModel {

	private int orderStateId;
	private String fromDate;
	private String toDate;

	/**
	 * @return the orderStateId
	 */
	public int getOrderStateId() {
		return orderStateId;
	}

	/**
	 * @param orderStateId
	 *            the orderStateId to set
	 */
	public void setOrderStateId(int orderStateId) {
		this.orderStateId = orderStateId;
	}

	/**
	 * @return the fromDate
	 */
	public String getFromDate() {
		return fromDate;
	}

	/**
	 * @param fromDate
	 *            the fromDate to set
	 */
	public void setFromDate(String fromDate) {
		this.fromDate = fromDate;
	}

	/**
	 * @return the toDate
	 */
	public String getToDate() {
		return toDate;
	}

	/**
	 * @param toDate
	 *            the toDate to set
	 */
	public void setToDate(String toDate) {
		this.toDate = toDate;
	}
}
