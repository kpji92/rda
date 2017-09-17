package com.kis.rda.farm.controller;				
				
import java.util.Map;				
				
import org.springframework.beans.factory.annotation.Autowired;				
import org.springframework.http.HttpHeaders;				
import org.springframework.http.HttpStatus;				
import org.springframework.http.ResponseEntity;				
import org.springframework.ui.Model;				
import org.springframework.web.bind.annotation.RequestMapping;				
import org.springframework.web.bind.annotation.RequestMethod;				
import org.springframework.web.bind.annotation.RequestParam;				
import org.springframework.web.bind.annotation.RestController;

import com.kis.rda.common.domain.Environment;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.EntityUpdate;
import com.kis.rda.farm.domain.EnvUpdate;
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.service.EntityService;				
				
@RestController				
public class EntityRestController {				
				
@Autowired				
private EntityService entityService;				
@RequestMapping(value = "/ajax/entityList", method = RequestMethod.POST)				
public Map<String,Object> ajaxentityList(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {			
Map<String, Object> map = entityService.selectFarmListServ(pageNum, searchOption, searchValue);			

System.out.println("ajaxentityList");
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
				
				
return map;				
}				



@RequestMapping(value = "/ajax/entityEntityList", method = RequestMethod.POST)				
public Map<String,Object> ajaxentityEntityList(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,EntityList entityEntityList) {	
	String farmId=entityEntityList.getFarm_id();
 Map<String, Object> map = entityService.ajaxentityEntityList(entityEntityList );	
  //entityEntityList =entityService.ajaxentityEntityList(farmId);
  
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장"+ farmId);
 //model.addAttribute("entityEntityList",entityEntityList  );				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
				
				
return map;				
}				
@RequestMapping(value = "/ajax/entityEntityInsertDo", method = RequestMethod.POST)		
public int ajaxentityEntityInsertDo(Model model,Farm farm,String farm_Id,EntityList  entityInsert) {		
		
 		
//System.out.println(" 객체 입력하기   "+environment.getFARM_ID());		
	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
	String birth = entityInsert.getBIRTH1()+"년"+entityInsert.getBIRTH2()+"월"+entityInsert.getBIRTH3()+"일"+entityInsert.getBIRTH4()+"시";

	entityInsert.setENTITY_ID(entity_id);
	entityInsert.setBIRTH(birth);
	System.out.println(" 객체 입력하기   "+entityInsert.getFarm_id());		
int result = entityService.ajaxentityEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");		
		
model.addAttribute("result", result);		
		
return result;		
}		
		
 		
//!!! DB 설계에 문제가 있음...객체자료 한개 항목만 쿼리해오기. 		
//parent.center.location.href='/list/entity/entity_list_env.jsp?farm_id=005&farm_fname=산청)남산목장'		
// 		
@RequestMapping(value = "/ajax/entityEntitySelectOneDo", method = RequestMethod.POST)		
public EntityList ajaxenvEntitySelectOneDo(Model model,Farm farm,String entity_id,EntityList entityUpdate) {		
		
//String farmId= environment.getFARM_ID();		
		
entityUpdate = (EntityList) entityService.ajaxenvEntitySelectOneBeforUpdate(entity_id);		
//System.out.println("목장   "+map.get("envList").toString());		

//날짜 자르기...
String birth=entityUpdate.getBIRTH();
int idx = birth.indexOf("년"); 
String birth1 = birth.substring(0, idx); //년
String birth11 = birth.substring(idx+1);

int idx1 = birth11.indexOf("월");
String birth2 = birth11.substring(0,idx1); //월

String birth12 = birth11.substring(idx1+1);
int idx2 = birth12.indexOf("일");
String birth3 = birth12.substring(0,idx2); //일

String birth13 = birth12.substring(idx2+1);
int idx3 = birth13.indexOf("시");
String birth4 = birth13.substring(0,idx3); //시

entityUpdate.setBIRTH1(birth1);
entityUpdate.setBIRTH2(birth2);
entityUpdate.setBIRTH3(birth3);
entityUpdate.setBIRTH4(birth4);
return entityUpdate;		
}		
		
//객체 수정하기			
@RequestMapping(value = "/ajax/entityEntityUpdatetDo", method = RequestMethod.POST)		
public int ajaxentityEntityUpdatetDo(Model model,Farm farm,String farm_Id,EntityList  entityUpdate) {		
		
//	String entity_id = entityUpdate.getFarm_id()+entityUpdate.getENTITY_ID();	
	String birth = entityUpdate.getBIRTH1()+"년"+entityUpdate.getBIRTH2()+"월"+entityUpdate.getBIRTH3()+"일"+entityUpdate.getBIRTH4()+"시";
	//entityUpdate.setENTITY_ID(entity_id);
		entityUpdate.setBIRTH(birth);
		System.out.println(" 객체  수정"+entityUpdate.getENTITY_ID());

		System.out.println(" 객체  수정"+entityUpdate.getBIRTH());
//String eNV_GATHERDATE= entityUpdate.getEnv_date1()+"년"+entityUpdate.getEnv_res2()+"월"+entityUpdate.getEnv_res3()+"일"+entityUpdate.getEnv_res4()+"시";		
//entityUpdate.setENV_GATHERDATE(eNV_GATHERDATE);		
		
int result = entityService.ajaxentityEntityUpdatetDo(entityUpdate);		
		
model.addAttribute("result", result);		
		
return result;		
}		
//객체삭제하기 envEntityDeleteDo
@RequestMapping(value = "/ajax/entityEntityDeleteDo", method = RequestMethod.POST)
public int ajaxentityEntityDeleteDo(Model model,Farm farm,String farm_Id,EntityList  entityUpdate) {

	System.out.println(" 객체  삭제   "+entityUpdate.getENTITY_ID() );
int result = entityService.ajaxentityEntityDeleteDo(entityUpdate);


model.addAttribute("result", result);

return result;
}


}				
				
				
