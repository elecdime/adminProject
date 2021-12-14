package com.team.service;

import java.util.List;

import com.team.domain.MemberDTO;
import com.team.domain.OrderDTO;


public interface MemberService {

	public void insertMember(MemberDTO mDTO);
	public MemberDTO userCheck(MemberDTO mDTO);
	public void deleteMember(MemberDTO mDTO);
	public int updateMember(MemberDTO mDTO);
	public MemberDTO getMember(MemberDTO mDTO);
	public String idCheck(String id);
	public MemberDTO findIdOk(MemberDTO mDTO);
	public MemberDTO findPass(MemberDTO memberDTO);
	public int findPassOk(MemberDTO mDTO);
	public List<OrderDTO> getOrderList(MemberDTO memberDTO);
}
