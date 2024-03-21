package com.kh.picachubaedal.vo;

public class StoreVO {
	
	@Override
	public String toString() {
		return "PageVO [column=" + column + ", keyword=" + keyword + ", count=" + count + ", page=" + page + ", size="
				+ size + ", blockSize=" + blockSize + "]";
	}
	
	private String column, keyword;
	private int count;
	private int page=1;
	private int size=15;
	private int blockSize=10;
	
	public String getColumn() {
		return column;
	}
	public void setColumn(String column) {
		this.column = column;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public int getCount() {
		return count;
	}
	public void setCount(int count) {
		this.count = count;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getSize() {
		return size;
	}
	public void setSize(int size) {
		this.size = size;
	}
	public int getBlockSize() {
		return blockSize;
	}
	public void setBlockSize(int blockSize) {
		this.blockSize = blockSize;
	}
	public StoreVO() {
		super();
	}
	
	//계산
	public boolean isSearch() {
		return column != null && keyword != null;
	}
	
	public int getBeginRow() {
		return page * size - (size-1);
	}
	
	public int getEndRow() {
		return page * size;
	}
	
	public int getTotalPage() {
		return (count - 1) / size + 1;
	}
	
	public int getBeginBlock() {
		return (page-1) / blockSize * blockSize + 1;
	}
	
	public int getEndBlock() {
		int number = (page-1) / blockSize * blockSize + blockSize;
		return Math.min(getTotalPage(), number);
	}
	
	//논리 반환
	public boolean isFirstBlock() {
		return getBeginBlock() == 1;
	}
	public boolean isLastBlock() {
		return getEndBlock() == getTotalPage();
	}
	
	public String getQueryString() {
		return "size="+size+"&column="+getColumn()+"&keyword="+getKeyword();
	}
	
	public boolean isCurrentPage(int i) {
		return page == i;
	}
	
	public int getPrevBlock() {
		return getBeginBlock()-1;
	}
	public int getNextBlock() {
		return getEndBlock() + 1;
	}
	
	
}
