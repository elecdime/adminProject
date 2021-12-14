package com.team.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.domain.AEventDTO;
import com.team.service.AEventService;

@RestController
public class AjaxController {
	
	@Inject
	private AEventService AEventService;
	
	@RequestMapping(value = "/aEvent/giveCouponSearch", method = RequestMethod.GET)
	public ResponseEntity<List<AEventDTO>> giveCouponSearch(HttpServletRequest re) {
		String searchText = re.getParameter("searchText");
		List<AEventDTO> result = AEventService.giveCouponSearch(searchText);
		
		ResponseEntity<List<AEventDTO>> entity = new ResponseEntity<List<AEventDTO>>(result, HttpStatus.OK);
		return entity;
		
	}
	
	
	@RequestMapping(value = "/aEvent/giveCouponSearch_coup", method = RequestMethod.GET)
	public ResponseEntity<List<AEventDTO>> giveCouponSearch_coup(HttpServletRequest re) {
		String searchText = re.getParameter("searchText");
		List<AEventDTO> result = AEventService.giveCouponSearch_coup(searchText);
		
		ResponseEntity<List<AEventDTO>> entity = new ResponseEntity<List<AEventDTO>>(result, HttpStatus.OK);
		return entity;
		
	}
	
	@RequestMapping(value = "/aEvent/delCouponSearch", method = RequestMethod.GET)
	public ResponseEntity<List<AEventDTO>> delCouponSearch(HttpServletRequest re) {
		String searchText = re.getParameter("searchText");
		List<AEventDTO> result = AEventService.delCouponSearch(searchText);
		
		ResponseEntity<List<AEventDTO>> entity = new ResponseEntity<List<AEventDTO>>(result, HttpStatus.OK);
		return entity;
		
	}
	
}
