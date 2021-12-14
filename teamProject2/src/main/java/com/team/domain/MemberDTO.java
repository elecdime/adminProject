package com.team.domain;

import java.sql.Timestamp;

public class MemberDTO {
	// Member정보를 담아서 전달
	// 멤버변수: 아무나 접근 못하게 막아줌(데이터 은닉)
	private String memId;
	private String memPw;
	private String memNm;
	private Timestamp date;
	private String mal_cert;
	private String email;
	private String phone;
	private String birthDt;
	private String zipcode;
	private String address;
	private String addressSub;
	private String addressReference;
	private String Accumulation;
	private String memberFA;
	private int malId;
	private int malTylpe;
	private String malCode;
	private Timestamp malCreateDt;
	private Timestamp malUpdateDt;
	private int malStatus;
	private int cartCount;
	
	public int getCartCount() {
		return cartCount;
	}
	public void setCartCount(int cartCount) {
		this.cartCount = cartCount;
	}
	
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getMemPw() {
		return memPw;
	}
	public void setMemPw(String memPw) {
		this.memPw = memPw;
	}
	public String getMemNm() {
		return memNm;
	}
	public void setMemNm(String memNm) {
		this.memNm = memNm;
	}
	public Timestamp getDate() {
		return date;
	}
	public void setDate(Timestamp date) {
		this.date = date;
	}
	public String getMal_cert() {
		return mal_cert;
	}
	public void setMal_cert(String mal_cert) {
		this.mal_cert = mal_cert;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getBirthDt() {
		return birthDt;
	}
	public void setBirthDt(String birthDt) {
		this.birthDt = birthDt;
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
	public String getAddressReference() {
		return addressReference;
	}
	public void setAddressReference(String addressReference) {
		this.addressReference = addressReference;
	}
	public String getAccumulation() {
		return Accumulation;
	}
	public void setAccumulation(String accumulation) {
		Accumulation = accumulation;
	}

	public String getMemberFA() {
		return memberFA;
	}
	public void setMemberFA(String memberFA) {
		this.memberFA = memberFA;
	}
	public int getMalId() {
		return malId;
	}
	public void setMalId(int malId) {
		this.malId = malId;
	}
	public int getMalTylpe() {
		return malTylpe;
	}
	public void setMalTylpe(int malTylpe) {
		this.malTylpe = malTylpe;
	}
	public String getMalCode() {
		return malCode;
	}
	public void setMalCode(String malCode) {
		this.malCode = malCode;
	}
	public Timestamp getMalCreateDt() {
		return malCreateDt;
	}
	public void setMalCreateDt(Timestamp malCreateDt) {
		this.malCreateDt = malCreateDt;
	}
	public Timestamp getMalUpdateDt() {
		return malUpdateDt;
	}
	public void setMalUpdateDt(Timestamp malUpdateDt) {
		this.malUpdateDt = malUpdateDt;
	}
	public int getMalStatus() {
		return malStatus;
	}
	public void setMalStatus(int malStatus) {
		this.malStatus = malStatus;
	}
	
	
	
}
