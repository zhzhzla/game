package com.je.GameProject.domain;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class PageVO {

    // 현재 페이지
    private int curPage = 1;
    // 시작 페이지
    private int startPage = 1;
    // 마지막 페이지
    private int endPage = 1;
    // 페이지별 글수
    private int rowsPerPage = 10;
    // 총 페이지
    private int totPage = 0;
    // 이전 페이지
    private int prePage = 0;
    // 다음 페이지
    private int nextPage = 0;
	
}
