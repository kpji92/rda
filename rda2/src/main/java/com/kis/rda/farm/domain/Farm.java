package com.kis.rda.farm.domain;

//목장 테이블 DTO
public class Farm {

	private int rnum;
	private String farmId; //목장 ID
	private String address;	//목장 주소
	private String location; //목장 위치(위도/경도)
	private String fname;	//목장 이름
	private String phone1; //목장(주) 전화1
	private String email; //목장(주) 이메일
	private int kc; //한우 사육두수
	private int mc; //젖소 사육두수
	private int calf; //송아지 수
	private String hp1; //목장(주) 휴대폰1
	private String name; //목장주 이름
	private String phone2; //목장(주) 전화2
	private String phone3; //목장(주) 전화3
	private String hp2; //목장(주) 휴대폰2
	private String hp3; //목장(주) 휴대폰3
	private String inputdate; //입력일자
	private String updatedate; //수정일자
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
	public String getFarmId() {
		return farmId;
	}
	public void setFarmId(String farmId) {
		this.farmId = farmId;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getKc() {
		return kc;
	}
	public void setKc(int kc) {
		this.kc = kc;
	}
	public int getMc() {
		return mc;
	}
	public void setMc(int mc) {
		this.mc = mc;
	}
	public int getCalf() {
		return calf;
	}
	public void setCalf(int calf) {
		this.calf = calf;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPhone2() {
		return phone2;
	}
	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}
	public String getPhone3() {
		return phone3;
	}
	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}
	public String getHp2() {
		return hp2;
	}
	public void setHp2(String hp2) {
		this.hp2 = hp2;
	}
	public String getHp3() {
		return hp3;
	}
	public void setHp3(String hp3) {
		this.hp3 = hp3;
	}
	public String getInputdate() {
		return inputdate;
	}
	public void setInputdate(String inputdate) {
		this.inputdate = inputdate;
	}
	public String getUpdatedate() {
		return updatedate;
	}
	public void setUpdatedate(String updatedate) {
		this.updatedate = updatedate;
	}
	@Override
	public String toString() {
		return "Farm [rnum=" + rnum + ", farmId=" + farmId + ", address=" + address + ", location=" + location
				+ ", fname=" + fname + ", phone1=" + phone1 + ", email=" + email + ", kc=" + kc + ", mc=" + mc
				+ ", calf=" + calf + ", hp1=" + hp1 + ", name=" + name + ", phone2=" + phone2 + ", phone3=" + phone3
				+ ", hp2=" + hp2 + ", hp3=" + hp3 + ", inputdate=" + inputdate + ", updatedate=" + updatedate + "]";
	}	
}
