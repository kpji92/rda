package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.Environment;

public class EnvUpdate  extends Environment{
	private String	   farmId	;
	private	String	env_date1	;
	private	String	env_res2	;
	private	String	env_res3	;
	private	String	env_res4	;
	public String getFarmId() {
		return farmId;
	}
	public void setFarmId(String farmId) {
		this.farmId = farmId;
	}
	public String getEnv_date1() {
		return env_date1;
	}
	public void setEnv_date1(String env_date1) {
		this.env_date1 = env_date1;
	}
	public String getEnv_res2() {
		return env_res2;
	}
	public void setEnv_res2(String env_res2) {
		this.env_res2 = env_res2;
	}
	public String getEnv_res3() {
		return env_res3;
	}
	public void setEnv_res3(String env_res3) {
		this.env_res3 = env_res3;
	}
	public String getEnv_res4() {
		return env_res4;
	}
	public void setEnv_res4(String env_res4) {
		this.env_res4 = env_res4;
	}
}
