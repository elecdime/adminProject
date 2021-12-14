package com.team.service;

import java.util.List;

import com.team.domain.AMemberDTO;
import com.team.domain.AOrderDTO;

public interface AMemberService {

	public List<AMemberDTO> memberList();
	public AMemberDTO memberInfo(String memId);
	public int memberCount();
	public List<AMemberDTO> searchMemberList(AMemberDTO aDTO);
	public List<AMemberDTO> membersOrder(String memId);
	public int membersOrderCount(String memId);
	public void insertBlack(AMemberDTO aDTO);
	public List<AMemberDTO> blackList();
	public void resetBlack(AMemberDTO aDTO);

}
