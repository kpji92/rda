package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.Cbc;

public class Cbcentity extends Cbc {
	private String farm_id;
	private String rnum;

	private String cbc_gat1;
	private String cbc_gat2;
	private String cbc_gat3;
	private String cbc_gat4;

	public String getCbc_gat1() {
		return cbc_gat1;
	}

	public void setCbc_gat1(String cbc_gat1) {
		this.cbc_gat1 = cbc_gat1;
	}

	public String getCbc_gat2() {
		return cbc_gat2;
	}

	public void setCbc_gat2(String cbc_gat2) {
		this.cbc_gat2 = cbc_gat2;
	}

	public String getCbc_gat3() {
		return cbc_gat3;
	}

	public void setCbc_gat3(String cbc_gat3) {
		this.cbc_gat3 = cbc_gat3;
	}

	public String getCbc_gat4() {
		return cbc_gat4;
	}

	public void setCbc_gat4(String cbc_gat4) {
		this.cbc_gat4 = cbc_gat4;
	}

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
}
