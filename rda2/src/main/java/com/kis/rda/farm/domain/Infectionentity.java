package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.Infection;

public class Infectionentity extends Infection{
	private String	   farm_id	;
	private String	   rnum	;
	private String	   infect_gat1	;
	private String	   infect_gat2	;
	private String	   infect_gat3	;
	private String	   infect_gat4	;
	
	
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
	public String getInfect_gat1() {
		return infect_gat1;
	}
	public void setInfect_gat1(String infect_gat1) {
		this.infect_gat1 = infect_gat1;
	}
	public String getInfect_gat2() {
		return infect_gat2;
	}
	public void setInfect_gat2(String infect_gat2) {
		this.infect_gat2 = infect_gat2;
	}
	public String getInfect_gat3() {
		return infect_gat3;
	}
	public void setInfect_gat3(String infect_gat3) {
		this.infect_gat3 = infect_gat3;
	}
	public String getInfect_gat4() {
		return infect_gat4;
	}
	public void setInfect_gat4(String infect_gat4) {
		this.infect_gat4 = infect_gat4;
	}
 
}
