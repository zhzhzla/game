package com.je.GameProject.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.je.GameProject.domain.MemberVO;
import com.je.GameProject.domain.PageVO;
import com.je.GameProject.service.MemberService;
import com.je.GameProject.service.PageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberListController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private PageService pageService;
	
	@RequestMapping(value="memberList.do",produces="text/html; charset=UTF-8")
	public String memberList(@RequestParam("curPage") int curPage,Model model) {

		log.info("memberList.do");

		PageVO pageVO = null; // 페이징 객체
		int memberNum = 0; // 총 인원수

		// 페이지 관련 변수들
		// 시작 페이지
		int startPage = 1;
		// 마지막 페이지
		int endPage = 1;
		// 페이지별 글수
		int rowsPerPage = 10;
		// 총 페이지
		int totPage = 0;
		// 이전 페이지
		int prePage = 0;
		// 다음 페이지
		int nextPage = 0;

		List<MemberVO> members = null;
		members = memberService.selectAllMembers();
		memberNum = members.size(); // 총인원수

		if(curPage<1) {

			log.error("현재 페이지 번호 인자를 입력하세요");
			curPage=1;
		}else {
			members=memberService.selectAllMembersByPage(curPage,10);
		}

		// 페이징 인자 객체 형성
		pageVO = new PageVO(curPage,
				startPage,
				endPage,
				rowsPerPage,
				totPage,
				prePage,
				nextPage);

		//페이징 처리
		pageVO=pageService.getPageInfo(memberNum,pageVO);

		//전송 인자
		model.addAttribute("pageVO", pageVO);//페이지 관련 인자
		model.addAttribute("memberNum", memberNum);//총 인원수
		model.addAttribute("members",members);
		
		//페이지 주소
		model.addAttribute("pageLocation","memberList.do");

		return "/member/member_list"; 
	} 
	
	//검색회원조회
	@RequestMapping(value="memberListSearchProc.do",method= {RequestMethod.POST,RequestMethod.GET},
					produces="text/html; charset=UTF-8")
	public String memberListSearch(@RequestParam("searchKind") String searchKind,
									@RequestParam("searchWord") String searchWord,
									@RequestParam("curPage") int page,
									@RequestParam("rowsPerPage") int rowsPerPage,
									Model model) {
		
		log.info("memberListSearch");
		
		//인자
		log.info("searchKind:"+searchKind);
		log.info("searchWord:"+searchWord);
		log.info("page:"+page);
		log.info("rowsPerPage:"+rowsPerPage);
		
		rowsPerPage=5;
		
		//
		PageVO pageVO = null; // 페이징 객체
		int memberNum = 0; // 총 인원수

		// 페이지 관련 변수들
		// 시작 페이지
		int startPage = 1;
		// 마지막 페이지
		int endPage = 1;
		// 총 페이지
		int totPage = 0;
		// 이전 페이지
		int prePage = 0;
		// 다음 페이지
		int nextPage = 0;

		List<MemberVO> members = null;
		memberNum = memberService.selectMembersCountBySearch(searchKind,searchWord); // 총인원수

		if(page<1) {

			log.error("현재 페이지 번호 인자를 입력하세요");
			page=1;
		}else {
			members=memberService.selectMembersBySearch(searchKind,searchWord,page,rowsPerPage);
		}

		// 페이징 인자 객체 형성
		pageVO = new PageVO(page,
				startPage,
				endPage,
				rowsPerPage,
				totPage,
				prePage,
				nextPage);

		//페이징 처리
		pageVO=pageService.getPageInfo(memberNum,pageVO);

		//전송 인자
		model.addAttribute("pageVO", pageVO);//페이지 관련 인자
		model.addAttribute("memberNum", memberNum);//총 인원수
		model.addAttribute("members",members);
		model.addAttribute("searchKind",searchKind);//검색구분
		model.addAttribute("searchWord",searchWord);//검색어
		
		//페이지 주소(검색)
		model.addAttribute("pageLocation","memberListSearchProc.do");
		
		return "/member/member_list";	
	}
}
