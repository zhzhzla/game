package com.je.GameProject.domain;


import lombok.Data;

@Data
public class GameClipInfoVO {

	private int id;
	private int gameId;
	private String clipKind;
	private String clipPath;
	
}
