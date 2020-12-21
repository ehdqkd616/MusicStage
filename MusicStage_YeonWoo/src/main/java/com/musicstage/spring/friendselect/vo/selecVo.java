package com.musicstage.spring.friendselect.vo;

import java.util.Arrays;

/**
 * @author khj
 *
 */
public class selecVo {
	private int fir;
	private int sce;
	private int thi;
	private int fourth;
	private String userid;
	private int like_interest;
	private int like_interest_user;
	
	
	public selecVo() {
		// TODO Auto-generated constructor stub
	}
	
	
	
	
	public int getLike_interest_user() {
		return like_interest_user;
	}




	public void setLike_interest_user(int like_interest_user) {
		this.like_interest_user = like_interest_user;
	}




	public selecVo(int fir, int sce, int thi, int fourth, String userid, int like_interest, int like_interest_user) {
		super();
		this.fir = fir;
		this.sce = sce;
		this.thi = thi;
		this.fourth = fourth;
		this.userid = userid;
		this.like_interest = like_interest;
		this.like_interest_user = like_interest_user;
	}




	public selecVo(int fir, int sce, int thi, int fourth, String userid) {
		this.fir = fir;
		this.sce = sce;
		this.thi = thi;
		this.fourth = fourth;
		this.userid = userid;
	}




	public selecVo(int fir, int sce, int thi, int fourth, String userid, int like_interest) {
		super();
		this.fir = fir;
		this.sce = sce;
		this.thi = thi;
		this.fourth = fourth;
		this.userid = userid;
		this.like_interest = like_interest;
	}

	



	public int getLike_interest() {
		return like_interest;
	}



	public void setLike_interest(int like_interest) {
		this.like_interest = like_interest;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public int getFir() {
		return fir;
	}

	public void setFir(int fir) {
		this.fir = fir;
	}

	public int getSce() {
		return sce;
	}

	public void setSce(int sce) {
		this.sce = sce;
	}

	public int getThi() {
		return thi;
	}

	public void setThi(int thi) {
		this.thi = thi;
	}

	public int getFourth() {
		return fourth;
	}

	public void setFourth(int fourth) {
		this.fourth = fourth;
	}




	@Override
	public String toString() {
		return "selecVo [fir=" + fir + ", sce=" + sce + ", thi=" + thi + ", fourth=" + fourth + ", userid=" + userid
				+ ", like_interest=" + like_interest + ", like_interest_user=" + like_interest_user + "]";
	}


	








	
	
	
}
