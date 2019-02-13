package com.je.GameProject.domain;

import java.util.Date;

import javax.persistence.Entity;
import javax.validation.constraints.Size;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
//@Entity
public class GameInfoVO {

	private int id;//게임아이디

	//@Size(min=2,max=25,message="게임이름을 입력하십시오")
	private String gameName;//게임이름

	//@Size(min=2,max=10,message="게임장르를 선택하십시오")
	private String gameGenre;//게임 장르
	
	//@Size(min=2,max=25,message="게임개발사를 선택하십시오")
	private String gameCompany;//게임 개발사
	
	//게임 출시일
	private Date gamePubDate;//게임 출시일
	
	//@Size(min=2,max=2000,message="게임설명을 입력하십시오")
	private String gameDetail;//게임 설명

}
