package com.scorpion.domain;

import lombok.Data;

@Data
public class PictureDTO {

	private String uuid;
	private String uploadPath;
	private String fileName;
	private boolean image;

}
