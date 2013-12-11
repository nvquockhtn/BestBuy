package com.bestbuy.dao;

public class Price {
		private int id;
		private String price;
		private Integer value;
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getPrice() {
			return price;
		}
		public void setPrice(String price) {
			this.price = price;
		}
		public Integer getValue() {
			return value;
		}
		public void setValue(Integer value) {
			this.value = value;
		}
		public Price()
		{
		}
		public Price(int id,String price, Integer value)
		{
			this.id = id;
			this.price = price;
			this.value = value;
		}
}

