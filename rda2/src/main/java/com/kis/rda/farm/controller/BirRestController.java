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
import com.kis.rda.farm.domain.BirUpdate;
import com.kis.rda.farm.domain.EntityList;
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.service.BirService;				
				
@RestController				
public class BirRestController {				
				
@Autowired				
private BirService birService;				
@RequestMapping(value = "/ajax/birList", method = RequestMethod.POST)				
public Map<String,Object> ajaxbirListl(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {			
Map<String, Object> map = birService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
				
				
return map;				
}			

@RequestMapping(value = "/ajax/birEntityList", method = RequestMethod.POST)			
public Map<String,Object> ajaxbirEntityList(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,EntityList entityEntityList) {		
	String farmId=entityEntityList.getFarm_id();		
 Map<String, Object> map =birService.ajaxbirEntityList(entityEntityList );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장"+ farmId);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}			

@RequestMapping(value = "/ajax/birEntityListDetail", method = RequestMethod.POST)			
public Map<String,Object> ajaxbirEntityListDetail(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,BirUpdate entityDetail) {		
	String entity_id=entityDetail.getENTITY_ID();		
	System.out.println("목장birEntityListDetail"+ entity_id);	
 Map<String, Object> map =birService.ajaxbirEntityListDetail(entityDetail );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장birEntityListDetail"+ entity_id);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}			

 		
	//parent.center.location.href='/list/entity/entity_list_env.jsp?farm_id=005&farm_fname=산청)남산목장'		
	// 		
//	@RequestMapping(value = "/ajax/envEntitySelectOneDo", method = RequestMethod.POST)		
//	public Map<String,Object> ajaxenvEntitySelectOneDo(Model model,Farm farm,String farm_id,Environment environment) {		
//			
//	String farmId= environment.getFARM_ID();		
//			
//	Map<String, Object> map = birService.ajaxenvEntityList(farmId);		
//	System.out.println("목장   "+map.get("envList").toString());		
//	 		
//	model.addAttribute("envEntityList", map.get("envList").toString());		
//			
//	return map;		
//	}		

	
	@RequestMapping(value = "/ajax/birEntityUpdateSelectOne", method = RequestMethod.POST)		
	public Map<String,Object> birEntityUpdateSelectOne(Model model,Farm farm,String farm_id,String entity_id,Environment environment) {		
			
	String farmId= environment.getFARM_ID();		
	System.out.println("목장   "+entity_id);	
	Map<String, Object> map = birService.birEntitySelectOneBeforeUpdate(entity_id);		
	System.out.println("목장   "+map.get("envList").toString());		
	 		
	model.addAttribute("envEntityList", map.get("envList").toString());		
			
	return map;		
	}	
	
	@RequestMapping(value = "/ajax/birEntityInsertDo", method = RequestMethod.POST)		
	public int ajaxbirEntityInsertDo(Model model,Farm farm,String farm_Id,BirUpdate  entityInsert) {		
			
	 		
//	System.out.println(" 환경 입력하기   "+environment.getFARM_ID());		
 			
	//	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
		String checkday = entityInsert.getCheck1()+"년"+entityInsert.getCheck2()+"월"+entityInsert.getCheck3()+"일"+entityInsert.getCheck4()+"시";

		//entityInsert.setENTITY_ID(entity_id);
		entityInsert.setCHECK_DATE(checkday);
		System.out.println(" 객체 입력하기   "+entityInsert.getCHECK_DATE());		
		System.out.println(" 객체 입력하기   "+entityInsert.getENTITY_ID());
		
		int result = birService.ajaxbirEntityInsertDo(entityInsert);		
	System.out.println(" 객체 입력하기   ");					
	return result;		
	}		
			
	 		
	
//  환경 수정하기			
	@RequestMapping(value = "/ajax/birEntityUpdatetDo", method = RequestMethod.POST)		
	public int ajaxbirEntityUpdatetDo(Model model,Farm farm,String farm_Id,BirUpdate  entityUpdate) {		
						
	System.out.println(" 환경 수정하기   "+entityUpdate.getENTITY_ID());		
	String checkday = entityUpdate.getCheck1()+"년"+entityUpdate.getCheck2()+"월"+entityUpdate.getCheck3()+"일"+entityUpdate.getCheck4()+"시";
	
	entityUpdate.setCHECK_DATE(checkday);			
	int result = birService.ajaxbirEntityUpdatetDo(entityUpdate);		
			
	model.addAttribute("result", result);		
			
	return result;		
	}		
			
	// 환경삭제하기 envEntityDeleteDo		
	@RequestMapping(value = "/ajax/birEntityDeleteDo", method = RequestMethod.POST)		
	public int ajaxbirEntityDeleteDo(Model model,Farm farm,String farm_Id,BirUpdate  environment) {		
		
	int result = birService.ajaxbirEntityDeleteDo(environment);		
	System.out.println(" 환경  삭제   ");		
			
	model.addAttribute("result", result);		
			
	return result;		
	}		
			
			
			
			

}				
				
				
