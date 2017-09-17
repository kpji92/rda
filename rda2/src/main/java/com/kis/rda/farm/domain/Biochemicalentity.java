package com.kis.rda.farm.domain;

import com.kis.rda.common.domain.Biochemical;

public class Biochemicalentity extends  Biochemical {
	private String	   farm_id	;
	private String	   rnum	;
	private String  bio_gat1;
	private String 	bio_gat2;
	private String 	bio_gat3;
	private String 	bio_gat4;
	
	
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
	public String getBio_gat1() {
		return bio_gat1;
	}
	public void setBio_gat1(String bio_gat1) {
		this.bio_gat1 = bio_gat1;
	}
	public String getBio_gat2() {
		return bio_gat2;
	}
	public void setBio_gat2(String bio_gat2) {
		this.bio_gat2 = bio_gat2;
	}
	public String getBio_gat3() {
		return bio_gat3;
	}
	public void setBio_gat3(String bio_gat3) {
		this.bio_gat3 = bio_gat3;
	}
	public String getBio_gat4() {
		return bio_gat4;
	}
	public void setBio_gat4(String bio_gat4) {
		this.bio_gat4 = bio_gat4;
	}
}
