package com.kis.rda.util;

public class Paging {

	private int pageNum;
	private int beginRow;
	private int endRow;
	private int pagePerRow;
	private int startPage;
	private int pageSize;
	private int endPage;
	private int lastPage;

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getBeginRow() {
		return beginRow;
	}

	public void setBeginRow(int beginRow) {
		this.beginRow = beginRow;
	}

	
	public int getEndRow() {
		return endRow;
	}

	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}

	public int getPagePerRow() {
		return pagePerRow;
	}

	public void setPagePerRow(int pagePerRow) {
		this.pagePerRow = pagePerRow;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getLastPage() {
		return lastPage;
	}

	public void setLastPage(int lastPage) {
		this.lastPage = lastPage;
	}

	@Override
	public String toString() {
		return "Paging [pageNum=" + pageNum + ", beginRow=" + beginRow + ", endRow=" + endRow + ", pagePerRow="
				+ pagePerRow + ", startPage=" + startPage + ", pageSize=" + pageSize + ", endPage=" + endPage
				+ ", lastPage=" + lastPage + "]";
	}	
}
