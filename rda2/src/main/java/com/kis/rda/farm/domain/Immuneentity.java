package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.Immune;

public class Immuneentity extends Immune {
	private String	   farm_id	;
	private String	   rnum	;
	
	private String	  im_gat1;
	private String	  im_gat2;
	private String	  im_gat3;
	private String	  im_gat4;
	
	
	public String getFarm_id() {
		return farm_id;
	}
	public void setFarm_id(String farm_id) {
		this.farm_id = farm_id;
	}
	public String getRnum() {
		return rnum;
	}
	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getIm_gat1() {
		return im_gat1;
	}
	public void setIm_gat1(String im_gat1) {
		this.im_gat1 = im_gat1;
	}
	public String getIm_gat2() {
		return im_gat2;
	}
	public void setIm_gat2(String im_gat2) {
		this.im_gat2 = im_gat2;
	}
	public String getIm_gat3() {
		return im_gat3;
	}
	public void setIm_gat3(String im_gat3) {
		this.im_gat3 = im_gat3;
	}
	public String getIm_gat4() {
		return im_gat4;
	}
	public void setIm_gat4(String im_gat4) {
		this.im_gat4 = im_gat4;
	}
}
