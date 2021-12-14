package com.team.domain;

import java.sql.Timestamp;

/**
 * @author TEAM
 *
 */
public class BoardDTO {
	  private int ntcNo;
	  private String memId;
	  private String pass;
	  private String ntcTitle;
	  private String ntcCont;
	  private int ntcHit;
	  private Timestamp regDt;
	  private Timestamp chgDt;
	  //파일추가
	  private String ntcFile;
	  private int ntc_type;
	  
	// set get 메서드 정의 alt shift s -> r	  
	  
	public int getNtc_type() {
		return ntc_type;
	}
	public void setNtc_type(int ntc_type) {
		this.ntc_type = ntc_type;
	}
	public int getNtcNo() {
		return ntcNo;
	}
	public void setNtcNo(int ntcNo) {
		this.ntcNo = ntcNo;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNtcTitle() {
		return ntcTitle;
	}
	public void setNtcTitle(String ntcTitle) {
		this.ntcTitle = ntcTitle;
	}
	public String getNtcCont() {
		return ntcCont;
	}
	public void setNtcCont(String ntcCont) {
		this.ntcCont = ntcCont;
	}
	public int getNtcHit() {
		return ntcHit;
	}
	public void setNtcHit(int ntcHit) {
		this.ntcHit = ntcHit;
	}
	public Timestamp getRegDt() {
		return regDt;
	}
	public void setRegDt(Timestamp regDt) {
		this.regDt = regDt;
	}
	public Timestamp getChgDt() {
		return chgDt;
	}
	public void setChgDt(Timestamp chgDt) {
		this.chgDt = chgDt;
	}
	public String getNtcFile() {
		return ntcFile;
	}
	public void setNtcFile(String ntcFile) {
		this.ntcFile = ntcFile;
	}
	  
	  
	
	
	  
	 
	  
}
