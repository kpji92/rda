package com.kis.rda.farm.controller;				
import java.util.Map;				
				
import org.springframework.beans.factory.annotation.Autowired;				
import org.springframework.http.HttpHeaders;				
import org.springframework.http.HttpStatus;				
import org.springframework.http.ResponseEntity;				
import org.springframework.stereotype.Controller;				
import org.springframework.ui.Model;				
import org.springframework.web.bind.annotation.RequestMapping;				
import org.springframework.web.bind.annotation.RequestMethod;				
import org.springframework.web.bind.annotation.RequestParam;				
				
				
import com.kis.rda.farm.service.EntityService;				
				
				
@Controller				
public class EntityController {				
				
@Autowired				
private EntityService entityService;				
				
				
				
				
// 개체자료 메인리스트				
@RequestMapping(value = "/entityList", method = RequestMethod.GET)				
public String entityList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = entityService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/entity/entity_list";				
	}	

 //개체자료 > 자료관리리스트 열기

@RequestMapping(value = "/entityEntityList", method = RequestMethod.GET)				
public String entityEntityList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {				
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);				

	System.out.println("목장"+ farmId);
 model.addAttribute("farmId", farmId);				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/entity/entityEntity_list";				
}	


  //개체자료 > 관리리스트 > 수정 열기
//환경자료 > 관리리스트 > 수정폼 열기	


@RequestMapping(value = "/entityEntityUpdate", method = RequestMethod.GET)	
public String entityEntityUpdate(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id) {	
model.addAttribute("farmId", farmId);
model.addAttribute("entity_id", entity_id);
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

String farmNm = 	entityService.entityEntityUpdateSelectOne(farmId);

model.addAttribute("farmNm", farmNm);	
return "data_management/entity/entityEntity_update";	
}	
//환경자료 > 관리리스트 > 추가 폼 열기	
	

@RequestMapping(value = "/entityEntityInsert", method = RequestMethod.GET)	
public String envEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ,String entity_id) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

String farmNm = 	entityService.entityEntityUpdateSelectOne(farmId);

model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmNm", farmNm);	
return "data_management/entity/entityEntity_insert";	
}	


}				
