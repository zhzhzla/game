package com.je.GameProject.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.je.GameProject.domain.MemberVO;
import com.je.GameProject.service.MemberService;

import lombok.extern.slf4j.Slf4j;

@Controller
@SessionAttributes("defaultMember")
@RequestMapping("/member")
@Slf4j
public class MemberController {

	@Autowired private MemberService svc;

	@RequestMapping("/")
	public String memberHome() {

		log.info("memberHome");
		return "redirect:/member/memberJoin.do";
	}

	@RequestMapping(value="/memberJoin.do",
			method=RequestMethod.GET)
	public String memberJoin(Model model) {

		log.info("memberJoin");
		String result="";

		model.addAttribute("member",new MemberVO());
		return "/member/member_join";
	}

	@RequestMapping(value="/memberJoinProc.do",
			method={RequestMethod.GET,RequestMethod.POST},
			produces="text/html;charset=UTF-8")

	@ResponseBody
	public String memberJoinAction(@ModelAttribute("member") MemberVO member) {

		log.info("memberJoinAction");
		String result="";

		log.info("member:"+member.toString());

		//회원정보 저장
		svc.insertMember(member);

		return member.toString();
	}

	@RequestMapping("memberView.do")
	public String memberView(@RequestParam("memberId") String id, Model model) {

		log.info("memberView.do");
		model.addAttribute("member",svc.selectMember(id));

		return "/member/member_view";
	}

	@RequestMapping("memberUpdate.do")
	public String memberUpdate(@RequestParam("memberId") String id, Model model) {

		log.info("memberUpdate.do");

		//기존 데이터 불러오기
		model.addAttribute("defaultMember",svc.selectMember(id));
		//새 데이터
		model.addAttribute("member",new MemberVO());
		return "/member/member_update";
	}

	@RequestMapping(value="memberUpdateProc.do",
			method=RequestMethod.POST,produces="text/html;charset=UTF-8")
	@ResponseBody
	public String memberUpdateAction(@ModelAttribute("member") MemberVO member, 
			HttpSession session, SessionStatus sessionStatus) {
		log.info("memberUpdateAction");
		String result="";

		log.info("member"+member.toString());//신규
		log.info("member"+session.getAttribute("defaultMember").toString());//기존

		log.info("기존/신규 회원 정보 일치 여부: " + member.equals(session.getAttribute("defaultMember")));
		
		//신규 정보가 업데이트 되었을 때
		if(!member.equals(session.getAttribute("defaultMember"))) {
			//패쓰워드 교체
			member.setMemberPassword(member.getMemberPassword1());
			
			svc.updateMember(member);//신규 정보 업데이트
			
		}
		
		sessionStatus.setComplete();//기존 정보 제거

		return "/member/member_update";
	}


}
