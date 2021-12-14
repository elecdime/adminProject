package com.team.service;

import java.sql.Timestamp;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.MemberDAO;
import com.team.dao.OrderDAO;
import com.team.domain.MemberDTO;
import com.team.domain.OrderDTO;

@Service
public class MemberServiceImpl implements MemberService{


	@Inject
	MemberDAO memberDAO;
	
	@Inject
	OrderDAO orderDAO;

	@Override
	public MemberDTO findIdOk(MemberDTO mDTO) {
		System.out.println("memberServiceImpl findIdOk()");
		return memberDAO.findIdOk(mDTO);
	}
	
	@Override
	public void insertMember(MemberDTO mDTO) {
		System.out.println("MemberServiceImpl insertMember()");
		mDTO.setDate(new Timestamp(System.currentTimeMillis()));
		// 주입된 의존관계 사용
		memberDAO.insertMember(mDTO);
	}

	@Override
	public MemberDTO userCheck(MemberDTO mDTO) {
		System.out.println("service pass");
		return memberDAO.userCheck(mDTO);
	}

	@Override
	public void deleteMember(MemberDTO mDTO) {
		System.out.println("service pass");
		memberDAO.deleteMember(mDTO);
		
	}

	@Override
	public int updateMember(MemberDTO mDTO) {
		System.out.println("service pass");
		return memberDAO.updateMember(mDTO);
	}

	@Override
	public MemberDTO getMember(MemberDTO mDTO) {
		System.out.println("service pass");
		return memberDAO.getMember(mDTO);
		
	}

	@Override
	public String idCheck(String id) {
		System.out.println("service pass");
		return memberDAO.idCheck(id);
	}

	@Override
	public MemberDTO findPass(MemberDTO memberDTO) {
		System.out.println("find pass service pass");
		return memberDAO.findPass(memberDTO);
	}

	@Override
	public int findPassOk(MemberDTO mDTO) {
		System.out.println("findPassOk service pass");
		return memberDAO.findPassOk(mDTO);
	}

	@Override
	public List<OrderDTO> getOrderList(MemberDTO memberDTO) {
		System.out.println("findPassOk service pass");
		return orderDAO.getOrderList(memberDTO);
	}




	
	
	
	
	
	
}
