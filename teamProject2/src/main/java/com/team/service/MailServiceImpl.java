package com.team.service;

import java.sql.Timestamp;
import java.util.Random;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team.dao.MemberDAO;
import com.team.domain.MemberDTO;

@Service
public class MailServiceImpl implements MailService {

	@Inject
	MemberDAO memberDAO;

	public String Code(){
		Random random = new Random();
		String code = "";
		
		for (int i = 0; i < 6; i++) {
			int num = random.nextInt(3);
			switch (num) {
			case 0:
				code += (char)((random.nextInt(26)) + 97);
				break;
			case 1:
				code += (char)((random.nextInt(26)) + 65);
				break;
			case 2:
				code += (int)(random.nextInt(10));
				break;
			}
		}
		return code;
		//이메일 코드 생성
	}
	
	
	
	
	
	@Override
	public int mailCodeInsert(MemberDTO mDTO) {
		System.out.println("code insert service pass");
		
		String code = Code();
		
		mDTO.setMalCode(code);
		mDTO.setMalCreateDt(new Timestamp(System.currentTimeMillis()));
		return memberDAO.mailCodeInsert(mDTO);
		 
	}

	
	
	
	@Override
	public int mailCodeUpdate(MemberDTO mDTO) {
		
		System.out.println("code insert service pass");
		
		String code = Code();
		
		mDTO.setMalCode(code);
		
		return memberDAO.mailCodeUpdate(mDTO);
	}
	
	
	@Override
	public String mailCodeSelect(String email) {
		
		System.out.println("service email select pass");
		return memberDAO.mailCodeSelect(email);
	}
	

}
