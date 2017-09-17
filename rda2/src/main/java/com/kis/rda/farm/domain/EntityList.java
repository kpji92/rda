package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.Entity;
 
public class EntityList extends Entity   {
	private String	   farm_id	;

	private String	   rnum	;
	private String	 birth_NUMBER;
	
	private	String		BIRTH1;
	private	String	    BIRTH2;
	private	String		BIRTH3;
	private	String		BIRTH4;
	
	public String getBirth_NUMBER() {
		return birth_NUMBER;
	}

	public void setBirth_NUMBER(String birth_NUMBER) {
		this.birth_NUMBER = birth_NUMBER;
	}

	public String getRnum() {
		return rnum;
	}

	public void setRnum(String rnum) {
		this.rnum = rnum;
	}
	public String getFarm_id() {
		return farm_id;
	}

	public void setFarm_id(String farm_id) {
		this.farm_id = farm_id;
	}

	public String getBIRTH1() {
		return BIRTH1;
	}
	public void setBIRTH1(String bIRTH1) {
		BIRTH1 = bIRTH1;
	}
	public String getBIRTH2() {
		return BIRTH2;
	}
	public void setBIRTH2(String bIRTH2) {
		BIRTH2 = bIRTH2;
	}
	public String getBIRTH3() {
		return BIRTH3;
	}
	public void setBIRTH3(String bIRTH3) {
		BIRTH3 = bIRTH3;
	}
	public String getBIRTH4() {
		return BIRTH4;
	}
	public void setBIRTH4(String bIRTH4) {
		BIRTH4 = bIRTH4;
	}
}
