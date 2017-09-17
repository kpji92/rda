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
				
				
import com.kis.rda.farm.service.BirService;				
				
				
@Controller				
public class BirController {				
				
@Autowired				
private BirService birService;				
				
				
				
				
//생체자료리스트				
@RequestMapping(value = "/birList", method = RequestMethod.GET)				
public String birList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
//Map<String, Object> map = birService.selectFarmListServ(pageNum, searchOption, searchValue);				
//model.addAttribute("farmList", map.get("farmList"));				
//model.addAttribute("totalCount", map.get("totalCount"));				
//model.addAttribute("paging", map.get("paging"));				
//model.addAttribute("searchOption", searchOption);				
//model.addAttribute("searchValue", searchValue);				
return "data_management/bir/bir_list";				
	}		

//생체자료 > 자료관리리스트 열기
//환경자료 > 관리리스트 열기	
@RequestMapping(value = "/birEntityList", method = RequestMethod.GET)	
public String birEntityList(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id ) {	
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
	
	 model.addAttribute("entity_id", entity_id);	
 model.addAttribute("farmId", farmId);	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	
return "data_management/bir/birEntity_list";	
}	
@RequestMapping(value = "/birEntityListDetail", method = RequestMethod.GET)	
public String birEntityListDetail(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id ) {	
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
	
	 model.addAttribute("entity_id", entity_id);	
 model.addAttribute("farmId", farmId);	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	
return "data_management/bir/birEntity_list_detail";	
}	
    //환경자료 > 관리리스트 > 수정폼 열기	
	
//@RequestMapping(value = "/Entity", method = RequestMethod.GET)	
//public String birEntityList(Model model,	
//@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
//@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
//@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {	
////Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//	
//	
// model.addAttribute("farmId", farmId);	
////model.addAttribute("paging", map.get("paging"));	
////model.addAttribute("searchOption", searchOption);	
////model.addAttribute("searchValue", searchValue);	
//return "data_management/bir/birEntityList";	
//}	
	
    //환경자료 > 관리리스트 > 수정폼 열기	
	
	
@RequestMapping(value = "/birEntityUpdate", method = RequestMethod.GET)	
public String birEntityUpdate(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId,String entity_id) {	
	model.addAttribute("farmId", farmId);
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	
	
String farmNm = 	birService.birEntityUpdateSelectOne(farmId);
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmNm", farmNm);	
return "data_management/bir/birEntity_update";	
}	
//환경자료 > 관리리스트 > 추가 폼 열기	
 	
	
@RequestMapping(value = "/birEntityInsert", method = RequestMethod.GET)	
public String envEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId) {	
	
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	
	
String entity_id = 	birService.birEntityInsertSelectOne(farmId);
	System.out.println(entity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/bir/birEntity_insert";	
}	
	


//생체자료 > 관리리스트 > (생체정보)보기 열기
//parent.center.location.href='/list/entity/entity_list_bir.jsp?entity_id=005107&farm_fname=산청)남산목장'



	//생체자료 > 관리리스트 >  (생체정보)보기  > 수정 열기

//생체자료 > 관리리스트 >  (생체정보)보기  > 수정 열기 > 수정

//생체자료 > 관리리스트 >  (생체정보)보기  > 수정 열기 > 삭제
 

}				
