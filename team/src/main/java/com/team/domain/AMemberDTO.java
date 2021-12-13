package com.team.domain;

import java.sql.Timestamp;

public class AMemberDTO {
	
	private String memId;
	private String memNm;
	private String memPw;
	private String memberFl;
	private String sexFl;
	private Timestamp birthDt;
	private String email;
	private String zipcode;
	private String address;
	private String addressSub;
	private String addressReference;
	

	private String phone;
	private double deposit;
	
	private int memberCount;
	private String searchCulumn;
	private String searchText;
	
	private String orderId;
	private Timestamp orderDate;
	private double amount;
    private String orderProduct;
    private String orderStat;
    
    private String blackReason;
    private String blackPeriod;
    private String permanent;
	
	public String getPermanent() {
		return permanent;
	}

	public void setPermanent(String permanent) {
		this.permanent = permanent;
	}

	public String getBlackReason() {
		return blackReason;
	}

	public void setBlackReason(String blackReason) {
		this.blackReason = blackReason;
	}

	public String getBlackPeriod() {
		return blackPeriod;
	}

	public void setBlackPeriod(String blackPeriod) {
		this.blackPeriod = blackPeriod;
	}

	public String getOrderProduct() {
		return orderProduct;
	}

	public void setOrderProduct(String orderProduct) {
		this.orderProduct = orderProduct;
	}

	public String getOrderStat() {
		return orderStat;
	}

	public void setOrderStat(String orderStat) {
		this.orderStat = orderStat;
	}

	public String getAddressReference() {
		return addressReference;
	}
	
	public void setAddressReference(String addressReference) {
		this.addressReference = addressReference;
	}
	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public Timestamp getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Timestamp orderDate) {
		this.orderDate = orderDate;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getSearchCulumn() {
		return searchCulumn;
	}

	public void setSearchCulumn(String searchCulumn) {
		this.searchCulumn = searchCulumn;
	}

	public String getSearchText() {
		return searchText;
	}

	public void setSearchText(String searchText) {
		this.searchText = searchText;
	}

	public int getMemberCount() {
		return memberCount;
	}

	public void setMemberCount(int memberCount) {
		this.memberCount = memberCount;
	}

	public String getMemNm() {
		return memNm;
	}

	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}

	public double getDeposit() {
		return deposit;
	}

	public void setDeposit(double deposit) {
		this.deposit = deposit;
	}

	public String getMemPw() {
		return memPw;
	}

	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}

	public String getMemberFl() {
		return memberFl;
	}

	public void setMemberFl(String memberFl) {
		this.memberFl = memberFl;
	}

	public String getSexFl() {
		return sexFl;
	}

	public void setSexFl(String sexFl) {
		this.sexFl = sexFl;
	}

	public Timestamp getBirthDt() {
		return birthDt;
	}

	public void setBirthDt(Timestamp birthDt) {
		this.birthDt = birthDt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAddressSub() {
		return addressSub;
	}

	public void setAddressSub(String addressSub) {
		this.addressSub = addressSub;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}


	public String getMemId() {
		return memId;
	}

	public void setMemId(String memId) {
		this.memId = memId;
	}
	
}
