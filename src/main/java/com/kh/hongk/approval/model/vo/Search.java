package com.kh.hongk.approval.model.vo;

public class Search {
	private String searchCondition; // 상태
	private String searchDrafter; // 기안자
	private String searchTitle; // 문서제목
	private String searchFormName; // 양식명
	private String existFile; // 파일 유무
	private int mno; 
	
	public int getMno() {
		return mno;
	}

	public void setMno(int mno) {
		this.mno = mno;
	}

	public Search() {}

	public Search(String searchCondition, String searchDrafter, String searchTitle, String searchFormName,
			String existFile) {
		super();
		this.searchCondition = searchCondition;
		this.searchDrafter = searchDrafter;
		this.searchTitle = searchTitle;
		this.searchFormName = searchFormName;
		this.existFile = existFile;
	}

	public Search(String searchDrafter, String searchTitle, String searchFormName, String existFile) {
		super();
		this.searchDrafter = searchDrafter;
		this.searchTitle = searchTitle;
		this.searchFormName = searchFormName;
		this.existFile = existFile;
	}

	public String getSearchCondition() {
		return searchCondition;
	}

	public void setSearchCondition(String searchCondition) {
		this.searchCondition = searchCondition;
	}

	public String getSearchDrafter() {
		return searchDrafter;
	}

	public void setSearchDrafter(String searchDrafter) {
		this.searchDrafter = searchDrafter;
	}

	public String getSearchTitle() {
		return searchTitle;
	}

	public void setSearchTitle(String searchTitle) {
		this.searchTitle = searchTitle;
	}

	public String getSearchFormName() {
		return searchFormName;
	}

	public void setSearchFormName(String searchFormName) {
		this.searchFormName = searchFormName;
	}

	public String getExistFile() {
		return existFile;
	}

	public void setExistFile(String existFile) {
		this.existFile = existFile;
	}

	@Override
	public String toString() {
		return "Search [searchCondition=" + searchCondition + ", searchDrafter=" + searchDrafter + ", searchTitle="
				+ searchTitle + ", searchFormName=" + searchFormName + ", existFile=" + existFile + "]";
	}

	
	
}
