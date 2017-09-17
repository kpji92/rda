package com.kis.rda.common.domain;

public class TbSense {
	
	private	String	CU_ID	;
	private	String	NODEID	;
	
	private	String	ACTIONVALUE	;
	private	String	DEVTYPE	;
	private	String	DTIME	;
	public String getCU_ID() {
		return CU_ID;
	}
	public void setCU_ID(String cU_ID) {
		CU_ID = cU_ID;
	}
	public String getNODEID() {
		return NODEID;
	}
	public void setNODEID(String nODEID) {
		NODEID = nODEID;
	}
	public String getACTIONVALUE() {
		return ACTIONVALUE;
	}
	public void setACTIONVALUE(String aCTIONVALUE) {
		ACTIONVALUE = aCTIONVALUE;
	}
	public String getDEVTYPE() {
		return DEVTYPE;
	}
	public void setDEVTYPE(String dEVTYPE) {
		DEVTYPE = dEVTYPE;
	}
 
	public String getDTIME() {
		return DTIME;
	}
	public void setDTIME(String dTIME) {
		DTIME = dTIME;
	}
 
}
