package com.scorpion.domain;

import lombok.Data;

@Data
public class QnaVO {

	private Long qnaIndex;
	private String qnaTitle;
	private String qnaContent;
	private String qnaWriter;
	private String qnaDate;
	private String qnaAnswer;
	private String qnaAnsState;
	private String qnaAnsDate;
	private String qnaPassword;
}
