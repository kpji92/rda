package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.Istat;

public class Istatentity extends Istat{
	private String	   farm_id	;
	private String	   rnum	;
	private String	   istat_gat1	;
	private String	   istat_gat2	;
	private String	   istat_gat3	;
	private String	   istat_gat4	;
	
	
	
	
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
	public String getIstat_gat1() {
		return istat_gat1;
	}
	public void setIstat_gat1(String istat_gat1) {
		this.istat_gat1 = istat_gat1;
	}
	public String getIstat_gat2() {
		return istat_gat2;
	}
	public void setIstat_gat2(String istat_gat2) {
		this.istat_gat2 = istat_gat2;
	}
	public String getIstat_gat3() {
		return istat_gat3;
	}
	public void setIstat_gat3(String istat_gat3) {
		this.istat_gat3 = istat_gat3;
	}
	public String getIstat_gat4() {
		return istat_gat4;
	}
	public void setIstat_gat4(String istat_gat4) {
		this.istat_gat4 = istat_gat4;
	}
}
