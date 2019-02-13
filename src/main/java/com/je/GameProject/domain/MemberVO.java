package com.je.GameProject.domain;

import java.sql.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode
public class MemberVO {
	private String memberId; //회원 아이디
	private String memberPassword;//회원 기존 비밀번호
	private String memberPassword1;//회원 신규 비밀번호
	private String memberPassword2;//회원 비밀번호 확인
	private String memberNickname;//회원 닉네임
	private String memberName;//회원 이름
	private String memberGender;//회원 성별
	private int memberAge;//회원 나이
	private String memberEmail;//회원 이메일
	private String memberPhone;//회원 핸드폰번호
	private Date memberBirth;//회원 생년월일
	private String memberZip;//회원 우편번호
	private String memberAddressBasic;//회원 기본주소
	private String memberAddressDetail;//회원 상세주소
	
	
}
