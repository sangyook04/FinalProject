package com.scorpion.domain;

import java.util.Date;

import org.springframework.web.util.UriComponentsBuilder;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Criteria {
	private int pageNum;	//페이지 번호
	private int amount;		//한 페이지 당 출력 개수
	private String type;	//검색 조건
	private String keyword;//검색어
	private String start;	//시작 날짜
	private String end;	//끝 날짜
	//페이지 번호와 개수를 지정하지 않은 경우
	public Criteria() {
		this(1, 10);//기본 pageNum은 1, amount은 10개로 지정
//		start = new Date(2000,10,20);
//		end = new Date(2020,10,24);
	}
	
	//페이지 번호와 개수를 지정한 경우
	public Criteria(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
	
	public String[] getTypeArr() {
		return type == null ? new String[] {} : type.split("");
	}
	
	public String[] getStartArr() {
		return start == null ? new String[] {} : new String[] {start};
	}
	
	public String[] getEndArr() {
		return end == null ? new String[] {} : new String[] {end};
	}
	
	//링크 생성 처리
	public String getListLink() {
		UriComponentsBuilder builder
		= UriComponentsBuilder.fromPath("")
							.queryParam("pageNum", this.pageNum)
							.queryParam("amount", this.getAmount())
							.queryParam("type", this.getType())
							.queryParam("keyword", this.getKeyword());
		return builder.toUriString();
	}
}









