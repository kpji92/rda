package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.TbSensetime;

public class TbSenseCount extends TbSensetime {
	private	String NO;	
	private	String CDTIME;
	 

	public String getCDTIME() {
		return CDTIME;
	}

	public void setCDTIME(String cDTIME) {
		CDTIME = cDTIME;
	}

	public String getNO() {
		return NO;
	}

	public void setNO(String nO) {
		NO = nO;
	}
 
}
