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

import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.farm.service.MhService;				
				
				
@Controller				
public class MhController {				
				
@Autowired				
private MhService mhService;				
				
				
				
				
//병력자료 리스트				
@RequestMapping(value = "/mhList", method = RequestMethod.GET)				
public String mhList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = mhService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/mh/mh_list";				
	}		


		 

//병력자료 >(자료) 관리 > (병력자료)보기 
@RequestMapping(value = "/mhEntityListDetail", method = RequestMethod.GET)	
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
return "data_management/mh/mhEntity_list_detail";	
}	

//  추가

@RequestMapping(value = "/mhEntityInsert", method = RequestMethod.GET)	
public String envEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

//String newEntity_id = 	mhService.mhEntityInsertSelectOne(farmId);
//System.out.println(newEntity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/mh/mhEntity_insert";	
}	
//병력자료 >(자료) 관리 > (병력자료)보기 > 수정

//분변자료리스트 > (자료)관리
@RequestMapping(value = "/mhEntityList", method = RequestMethod.GET)		
public String mhEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/mh/mhEntity_list";		
}		
@RequestMapping(value = "/mhEntityUpdate", method = RequestMethod.GET)	
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
	
	

MhListDetail mhListDetail= mhService.mhEntitySelectOneBeforeUpdate(entity_id);		
//System.out.println("목장   mhEntityUpdateSelectOne"+map.get("envList").toString());		
 		
//날짜 자르기...

String cure=mhListDetail.getCURE_DATE();
int idx = cure.indexOf("년"); 
String cure1 = cure.substring(0, idx); //년
String cure11 = cure.substring(idx+1);

int idx1 = cure11.indexOf("월");
String cure2 = cure11.substring(0,idx1); //월

String cure12 = cure11.substring(idx1+1);
int idx2 = cure12.indexOf("일");
String cure3 = cure12.substring(0,idx2); //일

String cure13 = cure12.substring(idx2+1);
int idx3 = cure13.indexOf("시");
String cure4 = cure13.substring(0,idx3); //시

mhListDetail.setCure1(cure1);
mhListDetail.setCure2(cure2);
mhListDetail.setCure3(cure3);
mhListDetail.setCure4(cure4);
//날짜 자르기...

 cure=mhListDetail.getOCCUR_DATE();
 idx = cure.indexOf("년"); 
 cure1 = cure.substring(0, idx); //년
 cure11 = cure.substring(idx+1);

 idx1 = cure11.indexOf("월");
 cure2 = cure11.substring(0,idx1); //월

 cure12 = cure11.substring(idx1+1);
 idx2 = cure12.indexOf("일");
 cure3 = cure12.substring(0,idx2); //일

 cure13 = cure12.substring(idx2+1);
 idx3 = cure13.indexOf("시");
 cure4 = cure13.substring(0,idx3); //시

mhListDetail.setOccur1(cure1);
mhListDetail.setOccur2(cure2);
mhListDetail.setOccur3(cure3);
mhListDetail.setOccur4(cure4);


cure=mhListDetail.getRECOVERY_DATE();
 idx = cure.indexOf("년"); 
 cure1 = cure.substring(0, idx); //년
 cure11 = cure.substring(idx+1);

 idx1 = cure11.indexOf("월");
 cure2 = cure11.substring(0,idx1); //월

 cure12 = cure11.substring(idx1+1);
 idx2 = cure12.indexOf("일");
 cure3 = cure12.substring(0,idx2); //일

 cure13 = cure12.substring(idx2+1);
 idx3 = cure13.indexOf("시");
 cure4 = cure13.substring(0,idx3); //시

mhListDetail.setRecov1(cure1);
mhListDetail.setRecov2(cure2);
mhListDetail.setRecov3(cure3);
mhListDetail.setRecov4(cure4);



model.addAttribute("envEntityList", mhListDetail);		
		
	
//String farmNm = 	mhService.birEntityUpdateSelectOne(farmId);
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmId", farmId);	
return "data_management/mh/mhEntity_update";	
}	
//병력자료 >(자료) 관리 > (병력자료)보기 > 수정 > 수정

//병력자료 >(자료) 관리 > (병력자료)보기 > 수정 > 삭제



}				
