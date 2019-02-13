package com.je.GameProject.service;

import org.springframework.stereotype.Service;

import com.je.GameProject.domain.PageVO;

@Service
public class PageServiceImpl implements PageService {

	@Override
	public PageVO getPageInfo(int memberNum, PageVO pageVo) {

		// 페이징 관련 변수 설정
		pageVo.setTotPage((int)((memberNum-1) 
				/ pageVo.getRowsPerPage()) + 1);

		pageVo.setEndPage((pageVo.getTotPage() == 1) ?
				1 : pageVo.getStartPage() + 
				pageVo.getTotPage() - 1); // 마지막 페이지

		pageVo.setPrePage((pageVo.getCurPage() <= 1) ? 
				1 : pageVo.getCurPage() - 1); // 이전 페이지

		pageVo.setNextPage((pageVo.getTotPage() == 1) ? 1 :
			(pageVo.getCurPage() >= pageVo.getEndPage()) ? 
					pageVo.getEndPage() : pageVo.getCurPage() + 1); // 다음 페이지

		pageVo.setCurPage((pageVo.getCurPage() >= pageVo.getEndPage()) ? 
				pageVo.getEndPage() : pageVo.getCurPage()); // 현재 페이지

		return pageVo;
	}
}


