package com.kis.rda.util;

public class UtilPaging {

	private static final int pagePerRow = 10; // 한페이지에 보여줄 row수
	private static final int pageSize = 5; // 한싸이클의 페이지 사이즈

	public Paging pagingMethod(int pageNum, int totalCount) {

		int beginRow = (pageNum - 1) * pagePerRow + 1; // 페이지의 처음 시작 index
		int endRow = pageNum * pagePerRow;
		
		// 한싸이클의 시작페이지번호
		int startPage = ((pageNum - 1) / pageSize) * pageSize + 1;
		// 한싸이클의 마지막페이지번호
		int endPage = startPage + pageSize - 1;
		// 총 페이지숫자의 마지막번호
		int lastPage = totalCount / pagePerRow;
		if (totalCount % pagePerRow != 0) {
			lastPage++;
		}
		if (endPage > lastPage) {
			endPage = lastPage;
		}

		Paging paging = new Paging();
		paging.setPageNum(pageNum);
		paging.setBeginRow(beginRow);
		paging.setEndRow(endRow);
		paging.setPagePerRow(pagePerRow);
		paging.setStartPage(startPage);
		paging.setPageSize(pageSize);
		paging.setEndPage(endPage);
		paging.setLastPage(lastPage);

		return paging;
	}
}
