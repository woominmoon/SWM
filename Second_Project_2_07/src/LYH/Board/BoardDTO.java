package LYH.Board;

import java.io.Serializable;

public class BoardDTO implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int c_board_num;
	private String c_board_author;
	private String c_board_title;
	private String c_board_content;
	private String c_board_writeday;
	private int c_board_readcnt;
	private int c_board_repRoot;
	private int c_board_repStep;
	private int c_board_repIndent;
	private int c_board_recom;
	private int c_board_decom;
	
	public BoardDTO() {
		// TODO Auto-generated constructor stub
	}

	public BoardDTO(int c_board_num, String c_board_author, String c_board_title, String c_board_content,
			String c_board_writeday, int c_board_readcnt, int c_board_repRoot, int c_board_repStep,
			int c_board_repIndent, int c_board_recom, int c_board_decom) {
		super();
		this.c_board_num = c_board_num;
		this.c_board_author = c_board_author;
		this.c_board_title = c_board_title;
		this.c_board_content = c_board_content;
		this.c_board_writeday = c_board_writeday;
		this.c_board_readcnt = c_board_readcnt;
		this.c_board_repRoot = c_board_repRoot;
		this.c_board_repStep = c_board_repStep;
		this.c_board_repIndent = c_board_repIndent;
		this.c_board_recom = c_board_recom;
		this.c_board_decom = c_board_decom;
	}

	public int getC_board_num() {
		return c_board_num;
	}

	public void setC_board_num(int c_board_num) {
		this.c_board_num = c_board_num;
	}

	public String getC_board_author() {
		return c_board_author;
	}

	public void setC_board_author(String c_board_author) {
		this.c_board_author = c_board_author;
	}

	public String getC_board_title() {
		return c_board_title;
	}

	public void setC_board_title(String c_board_title) {
		this.c_board_title = c_board_title;
	}

	public String getC_board_content() {
		return c_board_content;
	}

	public void setC_board_content(String c_board_content) {
		this.c_board_content = c_board_content;
	}

	public String getC_board_writeday() {
		return c_board_writeday;
	}

	public void setC_board_writeday(String c_board_writeday) {
		this.c_board_writeday = c_board_writeday;
	}

	public int getC_board_readcnt() {
		return c_board_readcnt;
	}

	public void setC_board_readcnt(int c_board_readcnt) {
		this.c_board_readcnt = c_board_readcnt;
	}

	public int getC_board_repRoot() {
		return c_board_repRoot;
	}

	public void setC_board_repRoot(int c_board_repRoot) {
		this.c_board_repRoot = c_board_repRoot;
	}

	public int getC_board_repStep() {
		return c_board_repStep;
	}

	public void setC_board_repStep(int c_board_repStep) {
		this.c_board_repStep = c_board_repStep;
	}

	public int getC_board_repIndent() {
		return c_board_repIndent;
	}

	public void setC_board_repIndent(int c_board_repIndent) {
		this.c_board_repIndent = c_board_repIndent;
	}

	public int getC_board_recom() {
		return c_board_recom;
	}

	public void setC_board_recom(int c_board_recom) {
		this.c_board_recom = c_board_recom;
	}

	public int getC_board_decom() {
		return c_board_decom;
	}

	public void setC_board_decom(int c_board_decom) {
		this.c_board_decom = c_board_decom;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + c_board_num;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		BoardDTO other = (BoardDTO) obj;
		if (c_board_num != other.c_board_num)
			return false;
		return true;
	}
	

}
