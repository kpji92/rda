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
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.farm.service.MhService;				
				
@RestController				
public class MhRestController {				
				
@Autowired				
private MhService mhService;				
@RequestMapping(value = "/ajax/mhList", method = RequestMethod.POST)				
public Map<String,Object> ajaxmhList(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {			
Map<String, Object> map = mhService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
				
				
return map;				
}		


@RequestMapping(value = "/ajax/mhEntityListDetail", method = RequestMethod.POST)			
public Map<String,Object> ajaxbirEntityListDetail(Model model,			
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
	@RequestParam(value="searchValue", defaultValue="none") String searchValue,MhListDetail  entityDetail) {		
	String entity_id=entityDetail.getENTITY_ID();		
	System.out.println("목장birEntityListDetail"+ entity_id);	
 Map<String, Object> map =mhService.ajaxmhEntityListDetail(entityDetail );			
  //entityEntityList =entityService.ajaxentityEntityList(farmId);			
  			
model.addAttribute("entityEntityList", map.get("entityList"));			
  System.out.println("목장birEntityListDetail"+ entity_id);			
 //model.addAttribute("entityEntityList",entityEntityList  );			
//model.addAttribute("paging", map.get("paging"));			
//model.addAttribute("searchOption", searchOption);			
//model.addAttribute("searchValue", searchValue);			
			
			
return map;			
}	


@RequestMapping(value = "/ajax/mhEntityInsertDo", method = RequestMethod.POST)		
public int ajaxmhEntityInsertDo(Model model,Farm farm,String farm_Id,MhListDetail  entityInsert) {		
		
 		
//System.out.println(" 환경 입력하기   "+environment.getFARM_ID());		
			
//	String entity_id = entityInsert.getFarm_id()+entityInsert.getENTITY_ID();	
	String cure = entityInsert.getCure1()+"년"+entityInsert.getCure2()+"월"+entityInsert.getCure3()+"일"+entityInsert.getCure4()+"시";
	String occur = entityInsert.getOccur1()+"년"+entityInsert.getOccur2()+"월"+entityInsert.getOccur3()+"일"+entityInsert.getOccur4()+"시";
	String recov = entityInsert.getRecov1()+"년"+entityInsert.getRecov2()+"월"+entityInsert.getRecov3()+"일"+entityInsert.getRecov4()+"시";
  
	//entityInsert.setENTITY_ID(entity_id);
	entityInsert.setCURE_DATE(cure);
	entityInsert.setOCCUR_DATE(occur);
	entityInsert.setRECOVERY_DATE(recov);
 	
	System.out.println(" 객체 입력하기   "+entityInsert.getENTITY_ID());
	
	int result = mhService.ajaxmhEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");					
return result;		
}		
		

@RequestMapping(value = "/ajax/mhEntityUpdateSelectOne", method = RequestMethod.POST)		
public MhListDetail  mhEntityUpdateSelectOne(Model model,Farm farm,String farm_id,String entity_id,Environment environment) {		
		
String farmId= environment.getFARM_ID();		
System.out.println("목장  mhEntityUpdateSelectOne "+entity_id);	
//Map<String, Object> map= mhService.mhEntitySelectOneBeforeUpdate(entity_id);	

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
		
return mhListDetail;		
}	


}				
				
				
				
