package com.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.AMemberDAO;
import com.team.domain.AMemberDTO;
import com.team.domain.AOrderDTO;

@Service
public class AMemberServiceImpl implements AMemberService{
	
	@Inject
	AMemberDAO AMemberDAO;

	@Override
	public List<AMemberDTO> memberList() {
		return AMemberDAO.memberList();
	}

	@Override
	public AMemberDTO memberInfo(String memId) {
		return AMemberDAO.memberInfo(memId);
	}

	@Override
	public int memberCount() {
		return AMemberDAO.memberCount();
	}

	@Override
	public List<AMemberDTO> searchMemberList(AMemberDTO aDTO) {
		return AMemberDAO.searchMemberList(aDTO);
	}

	@Override
	public List<AMemberDTO> membersOrder(String memId) {
		return AMemberDAO.membersOrder(memId);
	}

	@Override
	public int membersOrderCount(String memId) {
		return AMemberDAO.membersOrderCount(memId);
	}

	@Override
	public void insertBlack(AMemberDTO aDTO) {
		AMemberDAO.insertBlack(aDTO);
	}

	@Override
	public List<AMemberDTO> blackList() {
		return AMemberDAO.blackList();
	}

	@Override
	public void resetBlack(AMemberDTO aDTO) {
		AMemberDAO.resetBlack(aDTO);
	}


	
	
}
