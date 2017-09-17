package com.kis.rda.common.domain;

public class TbSenseEnv {
	private	String	NODEID	;
	
	private	String	CO2	;
	private	String	TEMP	;
	private	String	HUM	;
	private	String	DTIME	;
	
	public String getNODEID() {
		return NODEID;
	}
	public void setNODEID(String nODEID) {
		NODEID = nODEID;
	}
	public String getCO2() {
		return CO2;
	}
	public void setCO2(String cO2) {
		CO2 = cO2;
	}
	public String getTEMP() {
		return TEMP;
	}
	public void setTEMP(String tEMP) {
		TEMP = tEMP;
	}
	public String getHUM() {
		return HUM;
	}
	public void setHUM(String hUM) {
		HUM = hUM;
	}
	public String getDTIME() {
		return DTIME;
	}
	public void setDTIME(String dTIME) {
		DTIME = dTIME;
	}

}
