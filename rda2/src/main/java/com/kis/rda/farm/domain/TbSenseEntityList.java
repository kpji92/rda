package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.TbSense;

public class TbSenseEntityList extends TbSense  {
	

	private	String	SENSECUID  	;
	private	String	SENSENODEID  	;
	private	String	SENSEDEVTIPE 	;
	private	String	SENSEDEVTIPE1 	;
	private	String	TEMDATE1 	;
	private	String	TEMDATE2  	;
	private	String	TEMC  	;
	private	String	TEMAVR  	;
	private	String	TEMS  	;
	private	String	TEMMIN 	;
	private	String	TEMMAX  	;
	private	String	TEMMIN1 	;
	private	String	TEMMAX1 	;
	private	String	NUM	;
	
	private	String	renoide  	;
	
	public String getSENSECUID() {
		return SENSECUID;
	}
	public void setSENSECUID(String sENSECUID) {
		SENSECUID = sENSECUID;
	}
	public String getSENSENODEID() {
		return SENSENODEID;
	}
	public void setSENSENODEID(String sENSENODEID) {
		NUM = sENSENODEID.substring(10,12);
		if(NUM.equals("01")){
			NUM = "1";
		}else if(NUM.equals("02")){
			NUM = "2";
		}else if(NUM.equals("03")){
			NUM = "3";
		}else if(NUM.equals("04")){
			NUM = "4";
		}else if(NUM.equals("05")){
			NUM = "5";
		}else if(NUM.equals("06")){
			NUM = "6";
		}else if(NUM.equals("07")){
			NUM = "7";
		}else if(NUM.equals("08")){
			NUM = "8";
		}else if(NUM.equals("09")){
			NUM = "9";
		}
		
		SENSENODEID = sENSENODEID;
	}
	public String getSENSEDEVTIPE() {
		
		return SENSEDEVTIPE;
	}
	public void setSENSEDEVTIPE(String sENSEDEVTIPE) {

		if(sENSEDEVTIPE.equals("1")){
			SENSEDEVTIPE1="활동량";
		}else if(sENSEDEVTIPE.equals("2")){
			SENSEDEVTIPE1="체온";
		}else{
			SENSEDEVTIPE1 = "";
		}
		
		SENSEDEVTIPE = sENSEDEVTIPE;
	}
	public String getTEMDATE1() {
		return TEMDATE1;
	}
	public void setTEMDATE1(String tEMDATE1) {
		TEMMIN1 = tEMDATE1.substring(0,16);
		
		TEMDATE1 = tEMDATE1;
	}
	public String getTEMDATE2() {
		return TEMDATE2;
	}
	public void setTEMDATE2(String tEMDATE2) {
		TEMMAX1= tEMDATE2.substring(0,16);
		TEMDATE2 = tEMDATE2;
	}
	public String getTEMC() {
		return TEMC;
	}
	public void setTEMC(String tEMC) {
		TEMC = tEMC;
	}
	public String getTEMAVR() {
		return TEMAVR;
	}
	public void setTEMAVR(String tEMAVR) {
		TEMAVR = tEMAVR;
	}
	public String getTEMS() {
		return TEMS;
	}
	public void setTEMS(String tEMS) {
		TEMS = tEMS;
	}
	public String getTEMMIN() {
		return TEMMIN;
	}
	public void setTEMMIN(String tEMMIN) {
		TEMMIN = tEMMIN;
	}
	public String getTEMMAX() {
		return TEMMAX;
	}
	public void setTEMMAX(String tEMMAX) {
		TEMMAX = tEMMAX;
	}
	public String getNUM() {
		return NUM;
	}
	public void setNUM(String nUM) {
		NUM = nUM;
	}
	public String getSENSEDEVTIPE1() {
		return SENSEDEVTIPE1;
	}
	public void setSENSEDEVTIPE1(String sENSEDEVTIPE1) {
		SENSEDEVTIPE1 = sENSEDEVTIPE1;
	}
	public String getTEMMIN1() {
		return TEMMIN1;
	}
	public void setTEMMIN1(String tEMMIN1) {
		TEMMIN1 = tEMMIN1;
	}
	public String getTEMMAX1() {
		return TEMMAX1;
	}
	public void setTEMMAX1(String tEMMAX1) {
		TEMMAX1 = tEMMAX1;
	}
	public String getRenoide() {
		return renoide;
	}
	public void setRenoide(String renoide) {
		this.renoide = renoide;
	}
 
	
}
