package com.je.GameProject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.je.GameProject.domain.MemberVO;

public interface MemberMapper {

	void insertMember(MemberVO memberVO);
	List <MemberVO> selectAllMembers();
	MemberVO selectMember(String memberId);
	void updateMember(MemberVO memberVO);

	List <MemberVO> selectAllMembersByPage(@Param("page") int page, @Param("rowsPerPage") int rowsPerPage); 
	List <MemberVO> selectMembersBySearch(@Param("searchKindFld") String searchKindFld, @Param("searchKind") String searchKind,
			@Param("searchWord") String searchWord, 
			@Param("page") int page, @Param("rowsPerPage") int rowsPerPage);
	int selectMembersCountBySearch(@Param("searchKindFld") String searchKindFld, @Param("searchKind") String searchKind, 
			@Param("searchWord") String searchWord);

}
