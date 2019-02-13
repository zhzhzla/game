package com.je.GameProject.service;

import java.util.List;

import com.je.GameProject.domain.MemberVO;

public interface MemberService {
	
	void insertMember(MemberVO memberVO);
	List <MemberVO> selectAllMembers();
	MemberVO selectMember(String memberId);
	void updateMember(MemberVO memberVO);
	
	List <MemberVO> selectAllMembersByPage(int page, int rowsPerPage);
	List <MemberVO> selectMembersBySearch(String searchKind, String searchWord, 
											int page, int rowsPerPage);
	int selectMembersCountBySearch(String searchKind, String searchWord);
}
