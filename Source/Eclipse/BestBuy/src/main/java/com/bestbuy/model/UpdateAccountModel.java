package com.bestbuy.model;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class UpdateAccountModel {

	private String u_fullName="";
	private String u_email ="";
	private String u_address ="";
	private String u_phoneNumber;
	private String u_company;
	private String u_username;
	private String u_password;
	private Boolean u_isReset=false;
	private String u_confirmPassword;
	private Boolean u_isBlock = false;
    private Boolean u_isActive = true;
    private int u_idAccount;
    private int u_accounttype = -1;
    
    
	public Boolean getU_isReset() {
		return u_isReset;
	}
	public void setU_isReset(Boolean u_isReset) {
		this.u_isReset = u_isReset;
	}
	@NotNull
	@Size(min = 1, max = 50)
	public String getU_fullName() {
		return u_fullName;
	}
	public void setU_fullName(String u_fullName) {
		this.u_fullName = u_fullName;
	}
	@NotNull
	@Size(min = 1, max = 50)
	@Email
	public String getU_email() {
		return u_email;
	}
	public void setU_email(String u_email) {
		this.u_email = u_email;
	}
	@NotNull
	@Size(min = 1, max = 50)
	public String getU_address() {
		return u_address;
	}
	public void setU_address(String u_address) {
		this.u_address = u_address;
	}
	@NotNull
	@Size(min = 1, max = 50)
	public String getU_phoneNumber() {
		return u_phoneNumber;
	}
	public void setU_phoneNumber(String u_phoneNumber) {
		this.u_phoneNumber = u_phoneNumber;
	}
	@NotNull
	@Size(min = 1, max = 50)
	public String getU_company() {
		return u_company;
	}
	public void setU_company(String u_company) {
		this.u_company = u_company;
	}
	@NotNull
	@Size(min = 1, max = 50)
	public String getU_username() {
		return u_username;
	}
	public void setU_username(String u_username) {
		this.u_username = u_username;
	}
	@NotNull
	@Size(min = 6, max = 50)
	public String getU_password() {
		return u_password;
	}
	public void setU_password(String u_password) {
		this.u_password = u_password;
	}
	@NotNull
	@Size(min = 6, max = 50)
	public String getU_confirmPassword() {
		return u_confirmPassword;
	}
	public void setU_confirmPassword(String u_confirmPassword) {
		this.u_confirmPassword = u_confirmPassword;
	}

	public Boolean getU_isBlock() {
		return u_isBlock;
	}
	public void setU_isBlock(Boolean u_isBlock) {
		this.u_isBlock = u_isBlock;
	}
	public Boolean getU_isActive() {
		return u_isActive;
	}
	public void setU_isActive(Boolean u_isActive) {
		this.u_isActive = u_isActive;
	}
	public int getU_idAccount() {
		return u_idAccount;
	}
	public void setU_idAccount(int u_idAccount) {
		this.u_idAccount = u_idAccount;
	}
	public int getU_accounttype() {
		return u_accounttype;
	}
	public void setU_accounttype(int u_accounttype) {
		this.u_accounttype = u_accounttype;
	}
    
	
}
