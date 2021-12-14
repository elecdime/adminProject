package com.team.dao;

import com.team.domain.MemberDTO;

public interface MemberDAO {

	void insertMember(MemberDTO memberDTO);
	MemberDTO userCheck(MemberDTO memberDTO);
	void deleteMember(MemberDTO memberDTO);
	int updateMember(MemberDTO memberDTO);
	MemberDTO getMember(MemberDTO memberDTO);
	String idCheck(String id);
	MemberDTO findIdOk(MemberDTO memberDTO);
	int mailCodeInsert(MemberDTO memberDTO);
	String mailCodeSelect(String malCode);
	int mailCodeUpdate(MemberDTO memberDTO);
	MemberDTO findPass (MemberDTO memberDTO);
	int findPassOk(MemberDTO memberDTO);
}
