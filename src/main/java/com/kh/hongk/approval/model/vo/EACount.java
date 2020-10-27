package com.kh.hongk.approval.model.vo;

public class EACount {
	
	private int countWp;
	private int countCp;
	private int countBp;
	
	private int countR;
	private int countT;
	private int countC;
	private int countB;
	
	public EACount() {}
	public EACount(int countWp, int countCp, int countBp, int countR, int countT, int countC, int countB) {
		super();
		this.countWp = countWp;
		this.countCp = countCp;
		this.countBp = countBp;
		this.countR = countR;
		this.countT = countT;
		this.countC = countC;
		this.countB = countB;
	}
	public int getCountWp() {
		return countWp;
	}
	public void setCountWp(int countWp) {
		this.countWp = countWp;
	}
	public int getCountCp() {
		return countCp;
	}
	public void setCountCp(int countCp) {
		this.countCp = countCp;
	}
	public int getCountBp() {
		return countBp;
	}
	public void setCountBp(int countBp) {
		this.countBp = countBp;
	}
	public int getCountR() {
		return countR;
	}
	public void setCountR(int countR) {
		this.countR = countR;
	}
	public int getCountT() {
		return countT;
	}
	public void setCountT(int countT) {
		this.countT = countT;
	}
	public int getCountC() {
		return countC;
	}
	public void setCountC(int countC) {
		this.countC = countC;
	}
	public int getCountB() {
		return countB;
	}
	public void setCountB(int countB) {
		this.countB = countB;
	}
	@Override
	public String toString() {
		return "EACount [countWp=" + countWp + ", countCp=" + countCp + ", countBp=" + countBp + ", countR=" + countR
				+ ", countT=" + countT + ", countC=" + countC + ", countB=" + countB + "]";
	}
}
