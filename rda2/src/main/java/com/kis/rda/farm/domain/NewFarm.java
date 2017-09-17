package com.kis.rda.farm.domain;

//신규 목장 테이블 DTO
public class NewFarm {

	private int rnum;
	private String farmId; //목장 ID
	private String farmName; //목장 이름
	private String address;	//목장 주소
	private String hp1; //목장(주) 휴대폰1
	private String hp2; //목장(주) 휴대폰2
	private String hp3; //목장(주) 휴대폰3
	private String phone1; //목장(주) 전화1
	private String phone2; //목장(주) 전화2
	private String phone3; //목장(주) 전화3
	private String email; //목장(주) 이메일
	private String name; //목장주 이름
	private String mc; //젖소 사육두수
	private String cmoney;
	private String chc;
	private String career;
	private String diarrhea;
	private String diarrheado;
	private String chcdie;
	private String chcyn;
	private String kmkc;
	private String kmpi;
	private String kmmc;
	private String kmetc;
	private String year;
	private String disinfectant;
	private String temp;
	private String humidity;
	private String illuminance;
	private String wind;
	private String janitor;
	private String veterinarian;	
	private String inputdate; //입력일자
	private String updatedate; //수정일자
	private String cuNum;
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
	public String getFarmName() {
		return farmName;
	}
	public void setFarmName(String farmName) {
		this.farmName = farmName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getHp1() {
		return hp1;
	}
	public void setHp1(String hp1) {
		this.hp1 = hp1;
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
	public String getPhone1() {
		return phone1;
	}
	public void setPhone1(String phone1) {
		this.phone1 = phone1;
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
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getMc() {
		return mc;
	}
	public void setMc(String mc) {
		this.mc = mc;
	}
	public String getCmoney() {
		return cmoney;
	}
	public void setCmoney(String cmoney) {
		this.cmoney = cmoney;
	}
	public String getChc() {
		return chc;
	}
	public void setChc(String chc) {
		this.chc = chc;
	}
	public String getCareer() {
		return career;
	}
	public void setCareer(String career) {
		this.career = career;
	}
	public String getDiarrhea() {
		return diarrhea;
	}
	public void setDiarrhea(String diarrhea) {
		this.diarrhea = diarrhea;
	}
	public String getDiarrheado() {
		return diarrheado;
	}
	public void setDiarrheado(String diarrheado) {
		this.diarrheado = diarrheado;
	}
	public String getChcdie() {
		return chcdie;
	}
	public void setChcdie(String chcdie) {
		this.chcdie = chcdie;
	}
	public String getChcyn() {
		return chcyn;
	}
	public void setChcyn(String chcyn) {
		this.chcyn = chcyn;
	}
	public String getKmkc() {
		return kmkc;
	}
	public void setKmkc(String kmkc) {
		this.kmkc = kmkc;
	}
	public String getKmpi() {
		return kmpi;
	}
	public void setKmpi(String kmpi) {
		this.kmpi = kmpi;
	}
	public String getKmmc() {
		return kmmc;
	}
	public void setKmmc(String kmmc) {
		this.kmmc = kmmc;
	}
	public String getKmetc() {
		return kmetc;
	}
	public void setKmetc(String kmetc) {
		this.kmetc = kmetc;
	}
	public String getYear() {
		return year;
	}
	public void setYear(String year) {
		this.year = year;
	}
	public String getDisinfectant() {
		return disinfectant;
	}
	public void setDisinfectant(String disinfectant) {
		this.disinfectant = disinfectant;
	}
	public String getTemp() {
		return temp;
	}
	public void setTemp(String temp) {
		this.temp = temp;
	}
	public String getHumidity() {
		return humidity;
	}
	public void setHumidity(String humidity) {
		this.humidity = humidity;
	}
	public String getIlluminance() {
		return illuminance;
	}
	public void setIlluminance(String illuminance) {
		this.illuminance = illuminance;
	}
	public String getWind() {
		return wind;
	}
	public void setWind(String wind) {
		this.wind = wind;
	}
	public String getJanitor() {
		return janitor;
	}
	public void setJanitor(String janitor) {
		this.janitor = janitor;
	}
	public String getVeterinarian() {
		return veterinarian;
	}
	public void setVeterinarian(String veterinarian) {
		this.veterinarian = veterinarian;
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
	public String getCuNum() {
		return cuNum;
	}
	public void setCuNum(String cuNum) {
		this.cuNum = cuNum;
	}
	
	@Override
	public String toString() {
		return "NewFarm [rnum=" + rnum + ", farmId=" + farmId + ", farmName=" + farmName + ", address=" + address
				+ ", hp1=" + hp1 + ", hp2=" + hp2 + ", hp3=" + hp3 + ", phone1=" + phone1 + ", phone2=" + phone2
				+ ", phone3=" + phone3 + ", email=" + email + ", name=" + name + ", mc=" + mc + ", cmoney=" + cmoney
				+ ", chc=" + chc + ", career=" + career + ", diarrhea=" + diarrhea + ", diarrheado=" + diarrheado
				+ ", chcdie=" + chcdie + ", chcyn=" + chcyn + ", kmkc=" + kmkc + ", kmpi=" + kmpi + ", kmmc=" + kmmc
				+ ", kmetc=" + kmetc + ", year=" + year + ", disinfectant=" + disinfectant + ", temp=" + temp
				+ ", humidity=" + humidity + ", illuminance=" + illuminance + ", wind=" + wind + ", janitor=" + janitor
				+ ", veterinarian=" + veterinarian + ", inputdate=" + inputdate + ", updatedate=" + updatedate
				+ ", cuNum=" + cuNum + "]";
	}
	
	
	
}
