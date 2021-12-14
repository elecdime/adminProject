package com.team.service;

import com.team.domain.MemberDTO;

public interface MailService {

	public String Code();
	public int mailCodeInsert(MemberDTO memberDTO);
	public int mailCodeUpdate(MemberDTO memberDTO);
	public String mailCodeSelect(String email);
}
