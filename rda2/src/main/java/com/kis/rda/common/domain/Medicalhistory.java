package com.kis.rda.common.domain;

public class Medicalhistory {
	private String ENTITY_ID;
	private String CURE_DATE;
	private String OCCUR_DATE;
	private String DISEASE;
	private String PRESCRIBE;
	private String RECOVERY_DATE;
	private String INPUTDATE;
	private String UPDATEDATE;
	private String SEQNO;

	public String getSEQNO() {
		return SEQNO;
	}

	public void setSEQNO(String sEQNO) {
		SEQNO = sEQNO;
	}

	public String getENTITY_ID() {
		return ENTITY_ID;
	}

	public void setENTITY_ID(String eNTITY_ID) {
		ENTITY_ID = eNTITY_ID;
	}

	public String getCURE_DATE() {
		return CURE_DATE;
	}

	public void setCURE_DATE(String cURE_DATE) {
		CURE_DATE = cURE_DATE;
	}

	public String getOCCUR_DATE() {
		return OCCUR_DATE;
	}

	public void setOCCUR_DATE(String oCCUR_DATE) {
		OCCUR_DATE = oCCUR_DATE;
	}

	public String getDISEASE() {
		return DISEASE;
	}

	public void setDISEASE(String dISEASE) {
		DISEASE = dISEASE;
	}

	public String getPRESCRIBE() {
		return PRESCRIBE;
	}

	public void setPRESCRIBE(String pRESCRIBE) {
		PRESCRIBE = pRESCRIBE;
	}

	public String getRECOVERY_DATE() {
		return RECOVERY_DATE;
	}

	public void setRECOVERY_DATE(String rECOVERY_DATE) {
		RECOVERY_DATE = rECOVERY_DATE;
	}

	public String getINPUTDATE() {
		return INPUTDATE;
	}

	public void setINPUTDATE(String iNPUTDATE) {
		INPUTDATE = iNPUTDATE;
	}

	public String getUPDATEDATE() {
		return UPDATEDATE;
	}

	public void setUPDATEDATE(String uPDATEDATE) {
		UPDATEDATE = uPDATEDATE;
	}

}
