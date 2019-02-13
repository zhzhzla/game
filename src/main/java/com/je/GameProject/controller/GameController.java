package com.je.GameProject.controller;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.je.GameProject.domain.GameInfoVO;
import com.je.GameProject.domain.PageVO;
import com.je.GameProject.service.GameInfoService;
import com.je.GameProject.service.PageService;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/game")
public class GameController {

	@Autowired
	private GameInfoService svc;
	
	@Autowired
	private PageService pageService;

	@RequestMapping("/")
	public String home(Model model) {

		log.info("home");
		model.addAttribute("gameInfoVO",new GameInfoVO());

		return "/game/game_info_join";
	}

	@RequestMapping(value = "game_reg.do", method = RequestMethod.POST)
	public String gameReg(@Valid @ModelAttribute("gameInfoVO") GameInfoVO gameInfoVO,
			BindingResult result,
			RedirectAttributes ra)
	{
		log.info("gameReg");
		log.info("gameInfoVO : {}",gameInfoVO);

		if(result.hasErrors()) {

			log.info("error");

			if(result.hasFieldErrors("gameName")) {
				log.error("게임명 에러");
				List<FieldError> gameNameErrList = result.getFieldErrors("gameName");
				ra.addFlashAttribute("gameName_error",
						gameNameErrList.get(gameNameErrList.size()-1).getDefaultMessage());  
			}

			if(result.hasFieldErrors("gameDetail")) {
				log.error("게임설명 에러");
				List<FieldError> gameDetailErrList = result.getFieldErrors("gameDetail");
				ra.addFlashAttribute("gameDetail_error",
						gameDetailErrList.get(gameDetailErrList.size()-1).getDefaultMessage());  
			}

			ra.addFlashAttribute("org.springframework.validation.BindingResult.gameInfoVO",result);
			return "redirect:/";

		}else {
			log.info("정상 데이터 입력시 ");
			log.info("gameInfoVO : {}",gameInfoVO);
			svc.insertGameInfo(gameInfoVO);//게임정보 생성
		}
		return "/game/game_reg_success";
	}//

	@RequestMapping("/game_all_view.do")
	public String gameAllView(@RequestParam("curPage") int curPage, Model model) {

		log.info("전체게임정보보기");

		PageVO pageVO = null; // 페이징 객체
		int gameNum = 0; // 총 게임수

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


		List <GameInfoVO> list = svc.getAllGameInfo();
		gameNum = list.size();//총 게임수

		if(curPage<1) {

			log.error("현재 페이지 번호 인자를 입력하세요");
			curPage=1;
		}else {
			list=svc.selectAllGamesByPage(curPage,rowsPerPage);
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
		pageVO=pageService.getPageInfo(gameNum,pageVO);

		//전송 인자
		model.addAttribute("pageVO", pageVO);//페이지 관련 인자
		model.addAttribute("gameNum", gameNum);
		model.addAttribute("gameList",list);

		//페이지 주소
		model.addAttribute("pageLocation","game_all_view.do");
		//
		return "/game/game_all_view";
	}
	
	//검색게임조회
	@RequestMapping(value="gameListSearchProc.do", method = {RequestMethod.POST,RequestMethod.GET},
			produces="text/html; charset=UTF-8")
	public String gameListSearch(
			@RequestParam("searchKind") String searchKind,
			@RequestParam("searchWord") String searchWord,
			@RequestParam("curPage") int page,
			@RequestParam("rowsPerPage") int rowsPerPage,
			Model model) {
		
		log.info("###################### gameListSearch");
		
				//인자 
				log.info("searchKind:"+searchKind);
				log.info("searchWord:"+searchWord);
				log.info("page:"+page);
				log.info("rowsPerPage:"+rowsPerPage);
				
				rowsPerPage = 5;
				
				//
				PageVO pageVO = null; // 페이징 객체
				int gameNum = 0; // 총 게임수

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

				List <GameInfoVO> list = svc.getAllGameInfo();
				//gameNum = list.size();//총 게임수
				gameNum = svc.selectGamesCountBySearch(searchKind,searchWord); // 총게임수
				
				log.info("############################ gameNum:"+gameNum);

				if(page<1) {

					log.error("현재 페이지 번호 인자를 입력하세요");
					page=1;
				}else {
					list=svc.selectGamesBySearch(searchKind,searchWord,page,rowsPerPage);
				}

				log.info("###################### list size:"+list.size());
				
				// 페이징 인자 객체 형성
				pageVO = new PageVO(page,
						startPage,
						endPage,
						rowsPerPage,
						totPage,
						prePage,
						nextPage);

				//페이징 처리
				pageVO=pageService.getPageInfo(gameNum,pageVO);

				//전송 인자
				model.addAttribute("pageVO", pageVO);//페이지 관련 인자
				model.addAttribute("gameNum", gameNum);//총 게임수
				model.addAttribute("gameList",list);
				model.addAttribute("searchKind",searchKind);//검색구분
				model.addAttribute("searchWord",searchWord);//검색어
				
				//페이지 주소(검색)
				model.addAttribute("pageLocation","gameListSearchProc.do");
				
				return "/game/game_all_view";
	}

	@RequestMapping("/game_view.do")
	public String gameView(@RequestParam("gameName") String gameName, Model model) {

		log.info("게임정보보기");
		model.addAttribute("game",svc.getGameInfo(gameName));
		return "/game/game_view";
	}

	@RequestMapping("/game_clip_view.do")
	public String gameClipView(@RequestParam("gameName") String gameName, Model model) {

		log.info("게임정보보기(영상 포함)");
		model.addAttribute("game",svc.getGameInfo(gameName));
		model.addAttribute("gameClip",svc.getGameClipInfo(gameName));
		return "/game/game_clip_view";
	}

}
