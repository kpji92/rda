package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.Phos;

public class Phosentity extends Phos{
	private String	   farm_id	;
	private String	   rnum	;
	private String	 phos_gat1;
	private String	 phos_gat2;
	private String	 phos_gat3;
	private String	 phos_gat4;
	
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
	public String getPhos_gat1() {
		return phos_gat1;
	}
	public void setPhos_gat1(String phos_gat1) {
		this.phos_gat1 = phos_gat1;
	}
	public String getPhos_gat2() {
		return phos_gat2;
	}
	public void setPhos_gat2(String phos_gat2) {
		this.phos_gat2 = phos_gat2;
	}
	public String getPhos_gat3() {
		return phos_gat3;
	}
	public void setPhos_gat3(String phos_gat3) {
		this.phos_gat3 = phos_gat3;
	}
	public String getPhos_gat4() {
		return phos_gat4;
	}
	public void setPhos_gat4(String phos_gat4) {
		this.phos_gat4 = phos_gat4;
	}
}
