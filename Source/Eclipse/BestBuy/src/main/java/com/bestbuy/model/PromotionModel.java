package com.bestbuy.model;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class PromotionModel  implements java.io.Serializable {


  private Integer id;
  private String name;
  private String description;
  private String datestart;
  private String dateend;

 public PromotionModel() {
 }

 public PromotionModel(String name, String description, String datestart, String dateend) {
    this.name = name;
    this.description = description;
    this.datestart = datestart;
    this.dateend = dateend;
 }
public Integer getId() {
	return id;
}

public void setId(Integer id) {
	this.id = id;
}
@NotNull
@Size(min = 1, max = 50)
public String getName() {
	return name;
}

public void setName(String name) {
	this.name = name;
}
@NotNull
@Size(min = 1, max = 50)
public String getDescription() {
	return description;
}

public void setDescription(String description) {
	this.description = description;
}
@NotNull
public String getDatestart() {
	return datestart;
}

public void setDatestart(String datestart) {
	this.datestart = datestart;
}
@NotNull
public String getDateend() {
	return dateend;
}

public void setDateend(String dateend) {
	this.dateend = dateend;
}
 
 
}


