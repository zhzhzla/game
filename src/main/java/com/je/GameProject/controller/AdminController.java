package com.je.GameProject.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.je.GameProject.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
public class AdminController {
	
	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/members")
	public String getAllmembers(Model model) {
		
		log.info("members");
		
		model.addAttribute("members", memberService.selectAllMembers());
		
		return "/admin/members";
	}
	
}
