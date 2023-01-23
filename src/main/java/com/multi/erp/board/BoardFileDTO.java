package com.multi.erp.board;

public class BoardFileDTO {
	private String board_no;
	private String originalFilename;
	private String storeFilename;
	private String boardFileno;
	public BoardFileDTO() {
		
	}
	
	public BoardFileDTO(String originalFilename, String storeFilename) {
		super();
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
	}
	
	//boardfile의 상세정보 - insert
	public BoardFileDTO(String originalFilename, String storeFilename, String boardFileno) {
		super();
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
		this.boardFileno = boardFileno;
	}
	
	//select
	public BoardFileDTO(String board_no, String originalFilename, String storeFilename, String boardFileno) {
		super();
		this.board_no = board_no;
		this.originalFilename = originalFilename;
		this.storeFilename = storeFilename;
		this.boardFileno = boardFileno;
	}

	
	
	@Override
	public String toString() {
		return "BoardFileDTO [board_no=" + board_no + ", originalFilename=" + originalFilename + ", storeFilename="
				+ storeFilename + ", boardFileno=" + boardFileno + "]";
	}

	public String getBoard_no() {
		return board_no;
	}
	public void setBoard_no(String board_no) {
		this.board_no = board_no;
	}
	public String getOriginalFilename() {
		return originalFilename;
	}
	public void setOriginalFilename(String originalFilename) {
		this.originalFilename = originalFilename;
	}
	public String getStoreFilename() {
		return storeFilename;
	}
	public void setStoreFilename(String storeFilename) {
		this.storeFilename = storeFilename;
	}

	public String getBoardFileno() {
		return boardFileno;
	}

	public void setBoardFileno(String boardFileno) {
		this.boardFileno = boardFileno;
	}
		
}
