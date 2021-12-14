package com.team.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.team.domain.HotKeywordDTO;
import com.team.service.ListService;

@RestController
public class JSONController {

	@Inject
	private ListService listService;

	@RequestMapping(value = "/mainRank", method = RequestMethod.GET)
	public ResponseEntity<List<HotKeywordDTO>> insertSearch() {

		List<HotKeywordDTO> aa = listService.hotKeyword();

		ResponseEntity<List<HotKeywordDTO>> entity = new ResponseEntity<List<HotKeywordDTO>>(aa, HttpStatus.OK);

		return entity;
	}

	@RequestMapping(value = "/mainPro1", method = RequestMethod.GET)
	public String insertSearchPro(HotKeywordDTO hotKeywordDTO) {

		listService.insertSearch(hotKeywordDTO);
		return "redirect:/sub_list_search";
	}



			
	}
	
