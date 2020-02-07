package LYH;

import java.util.List;

import LYH.Board.BoardDTO;
import LYH.Member.MemberDTO;

public class PageTO {
	private int curPage = 1;
	private int perPage = 10;
	private int pageLine = 10;
	private int amount;
	private int totalPage;
	private int starNum;
	private int endNum;
	private int beginPageNum;
	private int stopPageNum;
	
	private List<BoardDTO> list;
	private List<MemberDTO> mlist;
	
	public PageTO() {
		executeAll();
	}

	public PageTO(int curPage) {
		this.curPage = curPage;
		executeAll();
	}
	
	public List<BoardDTO> getList() {
		return list;
	}

	public void setList(List<BoardDTO> list) {
		this.list = list;
	}

	public List<MemberDTO> getMlist() {
		return mlist;
	}

	public void setMlist(List<MemberDTO> mlist) {
		this.mlist = mlist;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
		executeAll();
	}

	public int getPerPage() {
		return perPage;
	}

	public void setPerPage(int perPage) {
		this.perPage = perPage;
	}

	public int getPageLine() {
		return pageLine;
	}

	public void setPageLine(int pageLine) {
		this.pageLine = pageLine;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
		executeAll();
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getStarNum() {
		return starNum;
	}

	public void setStarNum(int starNum) {
		this.starNum = starNum;
	}

	public int getEndNum() {
		return endNum;
	}

	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}

	public int getBeginPageNum() {
		return beginPageNum;
	}

	public void setBeginPageNum(int beginPageNum) {
		this.beginPageNum = beginPageNum;
	}

	public int getStopPageNum() {
		return stopPageNum;
	}

	public void setStopPageNum(int stopPageNum) {
		this.stopPageNum = stopPageNum;
	}
	
	public void executeAll() {
		totalPage = (amount-1)/perPage + 1;
		starNum = (curPage-1)*perPage + 1;
		endNum = curPage * perPage;
		if (endNum > amount) {
			endNum = amount;
		}
		beginPageNum = ((curPage-1)/pageLine)*pageLine + 1;
		stopPageNum = beginPageNum + (pageLine-1);
		if (stopPageNum > totalPage) {
			stopPageNum = totalPage;
		}
	}
	
}
