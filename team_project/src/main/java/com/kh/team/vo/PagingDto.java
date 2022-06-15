package com.kh.team.vo;

public class PagingDto {
	private int page = 1;
	private int startRow;
	private int endRow;
	private String searchType;
	private String keyword;
	private int perPage = 10;
	private int totalPage;
	private int count;
	private int startPage;
	private int endPage;
	private int page_block = 10;
	
	
	
	public PagingDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public PagingDto(int perPage, int count, int page_block) {
		super();
		this.perPage = perPage;
		this.count = count;
		this.page_block = page_block;
	}

	public PagingDto(int page, int startRow, int endRow, String searchType, String keyword, int perPage, int totalPage,
			int count, int startPage, int endPage) {
		super();
		this.page = page;
		this.startRow = startRow;
		this.endRow = endRow;
		this.searchType = searchType;
		this.keyword = keyword;
		this.perPage = perPage;
		this.totalPage = totalPage;
		this.count = count;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
		System.out.println("PagingDto setPage, page: " + page);
		// page 	startRow		endRow
		//	1			1			 10
		//	2			11			 20
		//	3			21			 30
		//  1			1			 5
		//  2			6			 10
		//  3			11			 15
		
		this.startRow = (page-1)*this.perPage + 1;
//		System.out.println("startRow: " + startRow);
		this.endRow = this.page*this.perPage;
//		System.out.println("endRow: " + endRow);
		this.totalPage = (int)(Math.ceil(((double)count/this.perPage)));
		
		this.startPage = page_block*((page-1)/page_block)+1;
		this.endPage = this.startPage + (page_block - 1);
		
		if(this.endPage > this.totalPage) {
			this.endPage = this.totalPage;
		}
	}

	public int getStartRow() {
		return startRow;
	}

	public void setStartRow(int startRow) {
		this.startRow = startRow;
	}

	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPAGE_BLOCK() {
		return page_block;
	}

	@Override
	public String toString() {
		return "PagingDto [page=" + page + ", startRow=" + startRow + ", endRow=" + endRow + ", searchType="
				+ searchType + ", keyword=" + keyword + ", perPage=" + perPage + ", totalPage=" + totalPage + ", count="
				+ count + ", startPage=" + startPage + ", endPage=" + endPage + ", PAGE_BLOCK=" + page_block + "]";
	}

}
