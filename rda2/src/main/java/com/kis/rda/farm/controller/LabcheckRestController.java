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

import com.kis.rda.farm.domain.Biochemicalentity;
import com.kis.rda.farm.domain.BirUpdate;
import com.kis.rda.farm.domain.Cbcentity;
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.Immuneentity;
import com.kis.rda.farm.domain.Infectionentity;
import com.kis.rda.farm.domain.Istatentity;
import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.farm.domain.Phosentity;
import com.kis.rda.farm.service.LabcheckService;				
				
@RestController				
public class LabcheckRestController {				
				
@Autowired				
private LabcheckService labcheckService;				
@RequestMapping(value = "/ajax/labcheckList", method = RequestMethod.POST)				
public Map<String,Object> ajaxlabcheckList(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {			
Map<String, Object> map = labcheckService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
				
				
return map;				
}		

//=================== [  CBC  ] =======================================================================


@RequestMapping(value = "/ajax/cbcEntityListDetail", method = RequestMethod.POST)			
public Map<String,Object> ajaxcbcEntityListDetail(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String entity_id,String searchValue,Cbcentity  entityDetail) {		
	  System.out.println("목장birEntityListDetail"+ entity_id);	
 
 Map<String, Object> map =labcheckService.ajaxcbcEntityListDetail(entityDetail );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장birEntityListDetail"+ entity_id);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}	

// 입력
@RequestMapping(value = "/ajax/cbcEntityInsertDo", method = RequestMethod.POST)		
public int ajaxcbcEntityInsertDo(Model model,Farm farm,String farm_Id,Cbcentity  entityInsert) {		
		
 		
//System.out.println("  입력하기   "+environment.getFARM_ID());		
			
//	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
	//String checkday = entityInsert.getCheck1()+"년"+entityInsert.getCheck2()+"월"+entityInsert.getCheck3()+"일"+entityInsert.getCheck4()+"시";

	//entityInsert.setENTITY_ID(entity_id);
	//entityInsert.setCHECK_DATE(checkday);
	//System.out.println(" 객체 입력하기   "+entityInsert.getCHECK_DATE());		
	//System.out.println(" 객체 입력하기   "+entityInsert.getENTITY_ID());
	
	int result = labcheckService.ajaxcbcEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");					
return result;		
}		
		
// 수정하기			
@RequestMapping(value = "/ajax/cbcEntityUpdateDo", method = RequestMethod.POST)		
public int ajaxcbcEntityUpdateDo(Model model,Farm farm,String farm_Id,Cbcentity  entityUpdate) {		
					
System.out.println("  수정하기   "+entityUpdate.getSEQNO());		
//String checkday = entityUpdate.getCheck1()+"년"+entityUpdate.getCheck2()+"월"+entityUpdate.getCheck3()+"일"+entityUpdate.getCheck4()+"시";

//entityUpdate.setCHECK_DATE(checkday);			
int result = labcheckService.ajaxcbcEntityUpdateDo(entityUpdate);		
		
model.addAttribute("result", result);		
		
return result;		
}		
		
//삭제하기 envEntityDeleteDo		
@RequestMapping(value = "/ajax/cbcEntityDeleteDo", method = RequestMethod.POST)		
public int ajaxcbcEntityDeleteDo(Model model,Farm farm,String farm_Id,Cbcentity  environment) {		
	System.out.println("   삭제   "+environment.getSEQNO());	
int result = labcheckService.ajaxcbcEntityDeleteDo(environment);		
	
		
model.addAttribute("result", result);		
		
return result;		
}		
		
//========================[  생화학   ]==================================================================

@RequestMapping(value = "/ajax/biochemicalEntityListDetail", method = RequestMethod.POST)			
public Map<String,Object> ajaxbiochemicalEntityListDetail(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,Biochemicalentity  entityDetail) {		
	String entity_id=entityDetail.getENTITY_ID();		
	System.out.println("목장birEntityListDetail"+ entity_id);	
 Map<String, Object> map =labcheckService.ajaxbiochemicalEntityListDetail(entityDetail );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장birEntityListDetail"+ entity_id);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}	
//입력
@RequestMapping(value = "/ajax/biochemicalEntityInsertDo", method = RequestMethod.POST)		
public int ajaxbiochemicalEntityInsertDo(Model model,Farm farm,String farm_Id,Biochemicalentity  entityInsert) {		
		
		
//System.out.println("  입력하기   "+environment.getFARM_ID());		
			
//	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
	//String checkday = entityInsert.getCheck1()+"년"+entityInsert.getCheck2()+"월"+entityInsert.getCheck3()+"일"+entityInsert.getCheck4()+"시";

	//entityInsert.setENTITY_ID(entity_id);
//	entityInsert.setCHECK_DATE(checkday);
	//System.out.println(" 객체 입력하기   "+entityInsert.getCHECK_DATE());		
	//System.out.println(" 객체 입력하기   "+entityInsert.getENTITY_ID());
	
	int result = labcheckService.ajaxbiochemicalEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");					
return result;		
}		
// 수정하기			
@RequestMapping(value = "/ajax/biochemicalEntityUpdateDo", method = RequestMethod.POST)		
public int ajaxbiochemicalEntityUpdateDo(Model model,Farm farm,String farm_Id,Biochemicalentity  entityUpdate) {		
					
System.out.println("  수정하기   "+entityUpdate.getENTITY_ID());		
//String checkday = entityUpdate.getCheck1()+"년"+entityUpdate.getCheck2()+"월"+entityUpdate.getCheck3()+"일"+entityUpdate.getCheck4()+"시";

//entityUpdate.setCHECK_DATE(checkday);			
int result = labcheckService.ajaxbiochemicalEntityUpdateDo(entityUpdate);		
		
model.addAttribute("result", result);		
		
return result;		
}		
		
//삭제하기 envEntityDeleteDo		
@RequestMapping(value = "/ajax/biochemicalEntityDeleteDo", method = RequestMethod.POST)		
public int ajaxbiochemicalEntityDeleteDo(Model model,Farm farm,String farm_Id,Biochemicalentity  environment) {		
	
int result = labcheckService.ajaxbiochemicalEntityDeleteDo(environment);		
System.out.println("   삭제   ");		
		
model.addAttribute("result", result);		
		
return result;		
}		
//========================[  phos   ]==================================================================


@RequestMapping(value = "/ajax/phosEntityListDetail", method = RequestMethod.POST)			
public Map<String,Object> ajaxphosEntityListDetail(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,Phosentity  entityDetail) {		
	String entity_id=entityDetail.getENTITY_ID();		
	System.out.println("목장birEntityListDetail"+ entity_id);	
 Map<String, Object> map =labcheckService.ajaxphosEntityListDetail(entityDetail );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장birEntityListDetail"+ entity_id);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}	
//입력
@RequestMapping(value = "/ajax/phosEntityInsertDo", method = RequestMethod.POST)		
public int ajaxphosEntityInsertDo(Model model,Farm farm,String farm_Id,Phosentity  entityInsert) {		
		
		
//System.out.println("  입력하기   "+environment.getFARM_ID());		
			
//	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
	//String checkday = entityInsert.getCheck1()+"년"+entityInsert.getCheck2()+"월"+entityInsert.getCheck3()+"일"+entityInsert.getCheck4()+"시";

	//entityInsert.setENTITY_ID(entity_id);
	//entityInsert.setCHECK_DATE(checkday);
	//System.out.println(" 객체 입력하기   "+entityInsert.getCHECK_DATE());		
	//System.out.println(" 객체 입력하기   "+entityInsert.getENTITY_ID());
	
	int result = labcheckService.ajaxphosEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");					
return result;		
}		
 
 		

// 수정하기			
@RequestMapping(value = "/ajax/phosEntityUpdateDo", method = RequestMethod.POST)		
public int ajaxphosEntityUpdateDo(Model model,Farm farm,String farm_Id,Phosentity  entityUpdate) {		
					
System.out.println("  수정하기   "+entityUpdate.getENTITY_ID());		
//String checkday = entityUpdate.getCheck1()+"년"+entityUpdate.getCheck2()+"월"+entityUpdate.getCheck3()+"일"+entityUpdate.getCheck4()+"시";

//entityUpdate.setCHECK_DATE(checkday);			
int result = labcheckService.ajaxphosEntityUpdateDo(entityUpdate);		
		
model.addAttribute("result", result);		
		
return result;		
}		
		
// 삭제하기 envEntityDeleteDo		
@RequestMapping(value = "/ajax/phosEntityDeleteDo", method = RequestMethod.POST)		
public int ajaxphosEntityDeleteDo(Model model,Farm farm,String farm_Id,Phosentity  environment) {		
	
int result = labcheckService.ajaxphosEntityDeleteDo(environment);		
System.out.println("   삭제   ");		
		
model.addAttribute("result", result);		
		
return result;		
}		

//========================[  iStat   ]==================================================================


@RequestMapping(value = "/ajax/istatEntityListDetail", method = RequestMethod.POST)			
public Map<String,Object> ajaxistatEntityListDetail(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,Istatentity  entityDetail) {		
	String entity_id=entityDetail.getENTITY_ID();		
	System.out.println("목장birEntityListDetail"+ entity_id);	
 Map<String, Object> map =labcheckService.ajaxistatEntityListDetail(entityDetail );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장birEntityListDetail"+ entity_id);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}	
//입력
@RequestMapping(value = "/ajax/istatEntityInsertDo", method = RequestMethod.POST)		
public int ajaxistatEntityInsertDo(Model model,Farm farm,String farm_Id,Istatentity  entityInsert) {		
		
		
//System.out.println("  입력하기   "+environment.getFARM_ID());		
			
//	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
	//String checkday = entityInsert.getCheck1()+"년"+entityInsert.getCheck2()+"월"+entityInsert.getCheck3()+"일"+entityInsert.getCheck4()+"시";

	//entityInsert.setENTITY_ID(entity_id);
	//entityInsert.setCHECK_DATE(checkday);
	//System.out.println(" 객체 입력하기   "+entityInsert.getCHECK_DATE());		
//	System.out.println(" 객체 입력하기   "+entityInsert.getENTITY_ID());
	
	int result = labcheckService.ajaxistatEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");					
return result;		
}		
// 수정하기			
@RequestMapping(value = "/ajax/istatEntityUpdateDo", method = RequestMethod.POST)		
public int ajaxistatEntityUpdateDo(Model model,Farm farm,String farm_Id,Istatentity  entityUpdate) {		
					
System.out.println("  수정하기   "+entityUpdate.getSEQNO());		
//String checkday = entityUpdate.getCheck1()+"년"+entityUpdate.getCheck2()+"월"+entityUpdate.getCheck3()+"일"+entityUpdate.getCheck4()+"시";

//entityUpdate.setCHECK_DATE(checkday);			
int result = labcheckService.ajaxistatEntityUpdateDo(entityUpdate);		
		
model.addAttribute("result", result);		
		
return result;		
}		
		
//삭제하기 envEntityDeleteDo		
@RequestMapping(value = "/ajax/istatEntityDeleteDo", method = RequestMethod.POST)		
public int ajaxistatEntityDeleteDo(Model model,Farm farm,String farm_Id,Istatentity  environment) {		
	
int result = labcheckService.ajaxistatEntityDeleteDo(environment);		
System.out.println("   삭제   ");		
		
model.addAttribute("result", result);		
		
return result;		
}		
//========================[   면역 및 염증인자   ]==================================================================

@RequestMapping(value = "/ajax/immuneEntityListDetail", method = RequestMethod.POST)			
public Map<String,Object> ajaximmuneEntityListDetail(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,Immuneentity  entityDetail) {		
	String entity_id=entityDetail.getENTITY_ID();		
	System.out.println("목장birEntityListDetail"+ entity_id);	
 Map<String, Object> map =labcheckService.ajaximmuneEntityListDetail(entityDetail );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장birEntityListDetail"+ entity_id);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}	
//입력
@RequestMapping(value = "/ajax/immuneEntityInsertDo", method = RequestMethod.POST)		
public int ajaximmuneEntityInsertDo(Model model,Farm farm,String farm_Id,Immuneentity  entityInsert) {		
		
		
//System.out.println("  입력하기   "+environment.getFARM_ID());		
			
//	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
	//String checkday = entityInsert.getCheck1()+"년"+entityInsert.getCheck2()+"월"+entityInsert.getCheck3()+"일"+entityInsert.getCheck4()+"시";

	//entityInsert.setENTITY_ID(entity_id);
	//entityInsert.setCHECK_DATE(checkday);
	//System.out.println(" 객체 입력하기   "+entityInsert.getCHECK_DATE());		
	//System.out.println(" 객체 입력하기   "+entityInsert.getENTITY_ID());
	
	int result = labcheckService.ajaximmuneEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");					
return result;		
}		
// 수정하기			
@RequestMapping(value = "/ajax/immuneEntityUpdateDo", method = RequestMethod.POST)		
public int ajaximmuneEntityUpdateDo(Model model,Farm farm,String farm_Id,Immuneentity  entityUpdate) {		
					
System.out.println("  수정하기   "+entityUpdate.getENTITY_ID());		
//String checkday = entityUpdate.getCheck1()+"년"+entityUpdate.getCheck2()+"월"+entityUpdate.getCheck3()+"일"+entityUpdate.getCheck4()+"시";

//entityUpdate.setCHECK_DATE(checkday);			
int result = labcheckService.ajaximmuneEntityUpdateDo(entityUpdate);		
		
model.addAttribute("result", result);		
		
return result;		
}		
		
//삭제하기 envEntityDeleteDo		
@RequestMapping(value = "/ajax/immuneEntityDeleteDo", method = RequestMethod.POST)		
public int ajaximmuneEntityDeleteDo(Model model,Farm farm,String farm_Id,Immuneentity  environment) {		
	
int result = labcheckService.ajaximmuneEntityDeleteDo(environment);		
System.out.println("   삭제   ");		
		
model.addAttribute("result", result);		
		
return result;		
}		
//========================[    감염성원인체조사   ]==================================================================

@RequestMapping(value = "/ajax/infectionEntityListDetail", method = RequestMethod.POST)			
public Map<String,Object> ajaxinfectionEntityListDetail(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,Infectionentity  entityDetail) {		
	String entity_id=entityDetail.getENTITY_ID();		
	System.out.println("목장birEntityListDetail"+ entity_id);	
 Map<String, Object> map =labcheckService.ajaxinfectionEntityListDetail(entityDetail );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장birEntityListDetail"+ entity_id);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}	
//입력
@RequestMapping(value = "/ajax/infectionEntityInsertDo", method = RequestMethod.POST)		
public int ajaxinfectionEntityInsertDo(Model model,Farm farm,String farm_Id,Infectionentity  entityInsert) {		
		
		
//System.out.println("  입력하기   "+environment.getFARM_ID());		
			
//	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
	//String checkday = entityInsert.getCheck1()+"년"+entityInsert.getCheck2()+"월"+entityInsert.getCheck3()+"일"+entityInsert.getCheck4()+"시";

	//entityInsert.setENTITY_ID(entity_id);
	//entityInsert.setCHECK_DATE(checkday);
	//System.out.println(" 객체 입력하기   "+entityInsert.getCHECK_DATE());		
	System.out.println(" 객체 입력하기   "+entityInsert.getENTITY_ID());
	
	int result = labcheckService.ajaxinfectionEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");					
return result;		
}		
// 수정하기			
@RequestMapping(value = "/ajax/infectionEntityUpdateDo", method = RequestMethod.POST)		
public int ajaxinfectionEntityUpdateDo(Model model,Farm farm,String farm_Id,Infectionentity  entityUpdate) {		
					
System.out.println("  수정하기   "+entityUpdate.getENTITY_ID());		
//String checkday = entityUpdate.getCheck1()+"년"+entityUpdate.getCheck2()+"월"+entityUpdate.getCheck3()+"일"+entityUpdate.getCheck4()+"시";

//entityUpdate.setCHECK_DATE(checkday);			
int result = labcheckService.ajaxinfectionEntityUpdateDo(entityUpdate);		
		
model.addAttribute("result", result);		
		
return result;		
}		
		
//삭제하기 envEntityDeleteDo		
@RequestMapping(value = "/ajax/infectionEntityDeleteDo", method = RequestMethod.POST)		
public int ajaxinfectionEntityDeleteDo(Model model,Farm farm,String farm_Id,Infectionentity  environment) {		
	
int result = labcheckService.ajaxinfectionEntityDeleteDo(environment);		
System.out.println("   삭제   ");		
		
model.addAttribute("result", result);		
		
return result;		
}		
}				
				
				
				
