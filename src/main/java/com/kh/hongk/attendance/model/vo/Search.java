package com.kh.hongk.attendance.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class Search {
	@DateTimeFormat(pattern = "yyyy-MM")
	private Date SearchValue; // 날짜검색
	private int searchCondition; // 지각, 미퇴근 조회
	private int mno;
	
	public Search() {}

	public Search(Date searchValue, int searchCondition, int mno) {
		super();
		SearchValue = searchValue;
		this.searchCondition = searchCondition;
		this.mno = mno;
	}

	public Date getSearchValue() {
		return SearchValue;
	}

	public void setSearchValue(Date searchValue) {
		SearchValue = searchValue;
	}

	public int getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(int searchCondition) {
		this.searchCondition = searchCondition;
	}

	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	@Override
	public String toString() {
		return "Search [SearchValue=" + SearchValue + ", searchCondition=" + searchCondition + ", mno=" + mno + "]";
	}
	
	

	

}
