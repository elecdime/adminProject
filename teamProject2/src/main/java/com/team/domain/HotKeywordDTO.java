package com.team.domain;

import java.sql.Timestamp;

public class HotKeywordDTO {
	private int pp_id;
	private String keyword; //검색어
	private Timestamp pp_date;
	private String pp_ip;
	
	
	public int getPp_id() {
		return pp_id;
	}
	public void setPp_id(int pp_id) {
		this.pp_id = pp_id;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Timestamp getPp_date() {
		return pp_date;
	}
	public void setPp_date(Timestamp pp_date) {
		this.pp_date = pp_date;
	}
	public String getPp_ip() {
		return pp_ip;
	}
	public void setPp_ip(String pp_ip) {
		this.pp_ip = pp_ip;
	}
}
