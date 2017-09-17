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

import com.kis.rda.farm.domain.Biochemicalentity;
import com.kis.rda.farm.domain.Cbcentity;
import com.kis.rda.farm.domain.Immuneentity;
import com.kis.rda.farm.domain.Infectionentity;
import com.kis.rda.farm.domain.Istatentity;
import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.farm.domain.Phosentity;
import com.kis.rda.farm.service.LabcheckService;				
				
				
@Controller				
public class LabcheckController {				
				
@Autowired				
private LabcheckService labcheckService;				
				
				 
				
@RequestMapping(value = "/labcheckList", method = RequestMethod.GET)				
public String labcheckList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = labcheckService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/farm/farm_list";				
	}		

//=================== [  CBC  ] =======================================================================

//cbc 기본리스트(전체 목장자료)

@RequestMapping(value = "/cbcList", method = RequestMethod.GET)				
public String cbcList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = labcheckService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/labcheckcbc/cbc_list";				
	}		

// 기본리스트 > 관리리스트(개별목장 가축리스트)

@RequestMapping(value = "/cbcEntityList", method = RequestMethod.GET)		
public String cbcEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckcbc/cbcEntity_list";		
}		
		 
//기본리스트 > 관리리스트 > 자료보기( 가축 채취정보)

@RequestMapping(value = "/cbcEntityListDetail", method = RequestMethod.GET)		
public String cbcEntityListDetail(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno  ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
 model.addAttribute("entity_id", entity_id);			
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckcbc/cbcEntity_list_detail";		
}		

//기본리스트 > 관리리스트 > 자료보기(목장의 가축정보) > 수정 폼


//추가

@RequestMapping(value = "/cbcEntityInsert", method = RequestMethod.GET)	
public String cbcEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

//String newEntity_id = 	labcheckService.mhEntityInsertSelectOne(farmId);
//System.out.println(newEntity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/labcheckcbc/cbcEntity_insert";	
}	
//병력자료 >(자료) 관리 > (병력자료)보기 > 수정

@RequestMapping(value = "/cbcEntityUpdate", method = RequestMethod.GET)	
public String cbcEntityUpdate(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId,String entity_id,String seqno ) {	
model.addAttribute("farmId", farmId);
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

System.out.println("목장  cbcEntitySelectOneBeforeUpdate  cbcEntityUpdate"+seqno);		

Cbcentity ListDetail= labcheckService.cbcEntitySelectOneBeforeUpdate(seqno);		
 
		
//날짜 자르기...
//
//String cure=mhListDetail.getCURE_DATE();
//int idx = cure.indexOf("년"); 
//String cure1 = cure.substring(0, idx); //년
//String cure11 = cure.substring(idx+1);
//
//int idx1 = cure11.indexOf("월");
//String cure2 = cure11.substring(0,idx1); //월
//
//String cure12 = cure11.substring(idx1+1);
//int idx2 = cure12.indexOf("일");
//String cure3 = cure12.substring(0,idx2); //일
//
//String cure13 = cure12.substring(idx2+1);
//int idx3 = cure13.indexOf("시");
//String cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setCure1(cure1);
//mhListDetail.setCure2(cure2);
//mhListDetail.setCure3(cure3);
//mhListDetail.setCure4(cure4);
////날짜 자르기...
//
//cure=mhListDetail.getOCCUR_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setOccur1(cure1);
//mhListDetail.setOccur2(cure2);
//mhListDetail.setOccur3(cure3);
//mhListDetail.setOccur4(cure4);
//
//
//cure=mhListDetail.getRECOVERY_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setRecov1(cure1);
//mhListDetail.setRecov2(cure2);
//mhListDetail.setRecov3(cure3);
//mhListDetail.setRecov4(cure4);
//


model.addAttribute("EntityList", ListDetail);		
//mhListDetail.getENTITY_ID();

//String farmNm = 	labcheckService.birEntityUpdateSelectOne(farmId);
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmId", farmId);	
return "data_management/labcheckcbc/cbcEntity_update";	
}	


//========================[  생화학   ]==================================================================

//생화학 기본리스트(전체 목장자료)

@RequestMapping(value = "/biochemicalList", method = RequestMethod.GET)				
public String biochemicalList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = labcheckService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/labcheckbiochemical/biochemical_list";				
	}		

//기본리스트 > 관리리스트(개별목장 가축리스트)

@RequestMapping(value = "/biochemicalEntityList", method = RequestMethod.GET)		
public String biochemicalEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckbiochemical/biochemicalEntity_list";		
}		
		 
//기본리스트 > 관리리스트 > 자료보기( 가축 채취정보)

@RequestMapping(value = "/biochemicalEntityListDetail", method = RequestMethod.GET)		
public String biochemicalEntityListDetail(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno  ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
  model.addAttribute("entity_id", entity_id);				
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckbiochemical/biochemicalEntity_list_detail";		
}		

//기본리스트 > 관리리스트 > 자료보기(목장의 가축정보) > 수정 폼

//추가

@RequestMapping(value = "/biochemicalEntityInsert", method = RequestMethod.GET)	
public String biochemicalEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

//String newEntity_id = 	labcheckService.mhEntityInsertSelectOne(farmId);
//System.out.println(newEntity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/labcheckbiochemical/biochemicalEntity_insert";	
}	
//병력자료 >(자료) 관리 > (병력자료)보기 > 수정

@RequestMapping(value = "/biochemicalEntityUpdate", method = RequestMethod.GET)	
public String biochemicalEntityUpdate(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId,String entity_id,String seqno) {	
model.addAttribute("farmId", farmId);
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	



Biochemicalentity ListDetail= labcheckService.biochemicalEntitySelectOneBeforeUpdate(seqno);		
//System.out.println("목장   mhEntityUpdateSelectOne"+map.get("envList").toString());		
		
//날짜 자르기...
//
//String cure=mhListDetail.getCURE_DATE();
//int idx = cure.indexOf("년"); 
//String cure1 = cure.substring(0, idx); //년
//String cure11 = cure.substring(idx+1);
//
//int idx1 = cure11.indexOf("월");
//String cure2 = cure11.substring(0,idx1); //월
//
//String cure12 = cure11.substring(idx1+1);
//int idx2 = cure12.indexOf("일");
//String cure3 = cure12.substring(0,idx2); //일
//
//String cure13 = cure12.substring(idx2+1);
//int idx3 = cure13.indexOf("시");
//String cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setCure1(cure1);
//mhListDetail.setCure2(cure2);
//mhListDetail.setCure3(cure3);
//mhListDetail.setCure4(cure4);
////날짜 자르기...
//
//cure=mhListDetail.getOCCUR_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setOccur1(cure1);
//mhListDetail.setOccur2(cure2);
//mhListDetail.setOccur3(cure3);
//mhListDetail.setOccur4(cure4);
//
//
//cure=mhListDetail.getRECOVERY_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setRecov1(cure1);
//mhListDetail.setRecov2(cure2);
//mhListDetail.setRecov3(cure3);
//mhListDetail.setRecov4(cure4);



model.addAttribute("EntityList", ListDetail);		
	

//String farmNm = 	labcheckService.birEntityUpdateSelectOne(farmId);
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmId", farmId);	
return "data_management/labcheckbiochemical/biochemicalEntity_update";	
}	

//========================[  phos   ]==================================================================

//phos 기본리스트(전체 목장자료)


@RequestMapping(value = "/phosList", method = RequestMethod.GET)				
public String phosList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = labcheckService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/labcheckphos/phos_list";				
	}		

//기본리스트 > 관리리스트(개별목장 가축리스트)
@RequestMapping(value = "/phosEntityList", method = RequestMethod.GET)		
public String phosEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckphos/phosEntity_list";		
}		
		 

//기본리스트 > 관리리스트 > 자료보기( 가축 채취정보)


@RequestMapping(value = "/phosEntityListDetail", method = RequestMethod.GET)		
public String phosEntityListDetail(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId , String entity_id,String seqno) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
	 model.addAttribute("entity_id", entity_id);				
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckphos/phosEntity_list_detail";		
}		
//기본리스트 > 관리리스트 > 자료보기(목장의 가축정보) > 수정 폼



//추가

@RequestMapping(value = "/phosEntityInsert", method = RequestMethod.GET)	
public String phosEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

//String newEntity_id = 	labcheckService.mhEntityInsertSelectOne(farmId);
//System.out.println(newEntity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/labcheckphos/phosEntity_insert";	
}	
//병력자료 >(자료) 관리 > (병력자료)보기 > 수정

@RequestMapping(value = "/phosEntityUpdate", method = RequestMethod.GET)	
public String phosEntityUpdate(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId,String entity_id,String seqno) {	
model.addAttribute("farmId", farmId);
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

 System.out.println("목장   phosEntityUpdate"+seqno);		

Phosentity ListDetail= labcheckService.phosEntitySelectOneBeforeUpdate(seqno);		
//System.out.println("목장   mhEntityUpdateSelectOne"+map.get("envList").toString());		
		
//날짜 자르기...
//
//String cure=mhListDetail.getCURE_DATE();
//int idx = cure.indexOf("년"); 
//String cure1 = cure.substring(0, idx); //년
//String cure11 = cure.substring(idx+1);
//
//int idx1 = cure11.indexOf("월");
//String cure2 = cure11.substring(0,idx1); //월
//
//String cure12 = cure11.substring(idx1+1);
//int idx2 = cure12.indexOf("일");
//String cure3 = cure12.substring(0,idx2); //일
//
//String cure13 = cure12.substring(idx2+1);
//int idx3 = cure13.indexOf("시");
//String cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setCure1(cure1);
//mhListDetail.setCure2(cure2);
//mhListDetail.setCure3(cure3);
//mhListDetail.setCure4(cure4);
////날짜 자르기...
//
//cure=mhListDetail.getOCCUR_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setOccur1(cure1);
//mhListDetail.setOccur2(cure2);
//mhListDetail.setOccur3(cure3);
//mhListDetail.setOccur4(cure4);
//
//
//cure=mhListDetail.getRECOVERY_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setRecov1(cure1);
//mhListDetail.setRecov2(cure2);
//mhListDetail.setRecov3(cure3);
//mhListDetail.setRecov4(cure4);
//


model.addAttribute("EntityList", ListDetail);		
	

//String farmNm = 	labcheckService.birEntityUpdateSelectOne(farmId);
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmId", farmId);	
return "data_management/labcheckphos/phosEntity_update";	
}	
//========================[  iStat   ]==================================================================

//iStat 기본리스트(전체 목장자료)



@RequestMapping(value = "/istatList", method = RequestMethod.GET)				
public String istatList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = labcheckService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/labcheckistat/istat_list";				
	}		
//기본리스트 > 관리리스트(개별목장 가축리스트)
@RequestMapping(value = "/istatEntityList", method = RequestMethod.GET)		
public String istatEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckistat/istatEntity_list";		
}		
		 

//기본리스트 > 관리리스트 > 자료보기( 가축 채취정보)

@RequestMapping(value = "/istatEntityListDetail", method = RequestMethod.GET)		
public String istatEntityListDetail(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
	 model.addAttribute("entity_id", entity_id);				
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckistat/istatEntity_list_detail";		
}		

//기본리스트 > 관리리스트 > 자료보기(목장의 가축정보) > 수정 폼



//추가

@RequestMapping(value = "/istatEntityInsert", method = RequestMethod.GET)	
public String istatEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

//String newEntity_id = 	labcheckService.mhEntityInsertSelectOne(farmId);
//System.out.println(newEntity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/labcheckistat/istatEntity_insert";	
}	
//병력자료 >(자료) 관리 > (병력자료)보기 > 수정

@RequestMapping(value = "/istatEntityUpdate", method = RequestMethod.GET)	
public String istatEntityUpdate(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId,String entity_id,String seqno) {	
model.addAttribute("farmId", farmId);
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	



Istatentity ListDetail= labcheckService.istatEntitySelectOneBeforeUpdate(seqno);		
//System.out.println("목장   mhEntityUpdateSelectOne"+map.get("envList").toString());		
		
//날짜 자르기...
//
//String cure=mhListDetail.getCURE_DATE();
//int idx = cure.indexOf("년"); 
//String cure1 = cure.substring(0, idx); //년
//String cure11 = cure.substring(idx+1);
//
//int idx1 = cure11.indexOf("월");
//String cure2 = cure11.substring(0,idx1); //월
//
//String cure12 = cure11.substring(idx1+1);
//int idx2 = cure12.indexOf("일");
//String cure3 = cure12.substring(0,idx2); //일
//
//String cure13 = cure12.substring(idx2+1);
//int idx3 = cure13.indexOf("시");
//String cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setCure1(cure1);
//mhListDetail.setCure2(cure2);
//mhListDetail.setCure3(cure3);
//mhListDetail.setCure4(cure4);
////날짜 자르기...
//
//cure=mhListDetail.getOCCUR_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setOccur1(cure1);
//mhListDetail.setOccur2(cure2);
//mhListDetail.setOccur3(cure3);
//mhListDetail.setOccur4(cure4);
//
//
//cure=mhListDetail.getRECOVERY_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setRecov1(cure1);
//mhListDetail.setRecov2(cure2);
//mhListDetail.setRecov3(cure3);
//mhListDetail.setRecov4(cure4);
//


model.addAttribute("EntityList", ListDetail);		


//String farmNm = 	labcheckService.birEntityUpdateSelectOne(farmId);
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmId", farmId);	
return "data_management/labcheckistat/istatEntity_update";	
}	
//========================[   면역 및 염증인자   ]==================================================================

// 면역 및 염증인자 기본리스트(전체 목장자료)


@RequestMapping(value = "/immuneList", method = RequestMethod.GET)				
public String immuneList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = labcheckService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/labcheckimmune/immune_list";				
	}	

//기본리스트 > 관리리스트(개별목장 가축리스트)
@RequestMapping(value = "/immuneEntityList", method = RequestMethod.GET)		
public String immuneEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckimmune/immuneEntity_list";		
}		
		 

//기본리스트 > 관리리스트 > 자료보기( 가축 채취정보)


@RequestMapping(value = "/immuneEntityListDetail", method = RequestMethod.GET)		
public String immuneEntityListDetail(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId , String entity_id,String seqno) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
	 model.addAttribute("entity_id", entity_id);				
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckimmune/immuneEntity_list_detail";		
}		
//기본리스트 > 관리리스트 > 자료보기(목장의 가축정보) > 수정 폼



//추가

@RequestMapping(value = "/immuneEntityInsert", method = RequestMethod.GET)	
public String immuneEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

//String newEntity_id = 	labcheckService.mhEntityInsertSelectOne(farmId);
//System.out.println(newEntity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/labcheckimmune/immuneEntity_insert";	
}	
//병력자료 >(자료) 관리 > (병력자료)보기 > 수정

@RequestMapping(value = "/immuneEntityUpdate", method = RequestMethod.GET)	
public String immuneEntityUpdate(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId,String entity_id,String seqno) {	
model.addAttribute("farmId", farmId);
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	



Immuneentity ListDetail= labcheckService.immuneEntitySelectOneBeforeUpdate(seqno);		
//System.out.println("목장   mhEntityUpdateSelectOne"+map.get("envList").toString());		
		
//날짜 자르기...
//
//String cure=mhListDetail.getCURE_DATE();
//int idx = cure.indexOf("년"); 
//String cure1 = cure.substring(0, idx); //년
//String cure11 = cure.substring(idx+1);
//
//int idx1 = cure11.indexOf("월");
//String cure2 = cure11.substring(0,idx1); //월
//
//String cure12 = cure11.substring(idx1+1);
//int idx2 = cure12.indexOf("일");
//String cure3 = cure12.substring(0,idx2); //일
//
//String cure13 = cure12.substring(idx2+1);
//int idx3 = cure13.indexOf("시");
//String cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setCure1(cure1);
//mhListDetail.setCure2(cure2);
//mhListDetail.setCure3(cure3);
//mhListDetail.setCure4(cure4);
////날짜 자르기...
//
//cure=mhListDetail.getOCCUR_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setOccur1(cure1);
//mhListDetail.setOccur2(cure2);
//mhListDetail.setOccur3(cure3);
//mhListDetail.setOccur4(cure4);
//
//
//cure=mhListDetail.getRECOVERY_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setRecov1(cure1);
//mhListDetail.setRecov2(cure2);
//mhListDetail.setRecov3(cure3);
//mhListDetail.setRecov4(cure4);
//


model.addAttribute("EntityList", ListDetail);		
	

//String farmNm = 	labcheckService.birEntityUpdateSelectOne(farmId);
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmId", farmId);	
return "data_management/labcheckimmune/immuneEntity_update";	
}	
//========================[    감염성원인체조사   ]==================================================================

//면역 및 염증인자 기본리스트(전체 목장자료)


@RequestMapping(value = "/infectionList", method = RequestMethod.GET)				
public String infectionList(Model model,				
@RequestParam(value="pageNum", defaultValue="1") int pageNum,				
@RequestParam(value="searchOption", defaultValue="none") String searchOption,				
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {				
Map<String, Object> map = labcheckService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
return "data_management/labcheckinfection/infection_list";				
	}	

//기본리스트 > 관리리스트(개별목장 가축리스트)

@RequestMapping(value = "/infectionEntityList", method = RequestMethod.GET)		
public String infectionEntityList(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId ) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
		
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckinfection/infectionEntity_list";		
}		
		 
//기본리스트 > 관리리스트 > 자료보기( 가축 채취정보)

@RequestMapping(value = "/infectionEntityListDetail", method = RequestMethod.GET)		
public String infectionEntityListDetail(Model model,		
@RequestParam(value="pageNum", defaultValue="1") int pageNum,		
@RequestParam(value="searchOption", defaultValue="none") String searchOption,		
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId , String entity_id,String seqno) {		
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);		
		
	 model.addAttribute("entity_id", entity_id);				
 model.addAttribute("farmId", farmId);		
//model.addAttribute("paging", map.get("paging"));		
//model.addAttribute("searchOption", searchOption);		
//model.addAttribute("searchValue", searchValue);		
return "data_management/labcheckinfection/infectionEntity_list_detail";		
}		

//기본리스트 > 관리리스트 > 자료보기(목장의 가축정보) > 수정 폼


//추가

@RequestMapping(value = "/infectionEntityInsert", method = RequestMethod.GET)	
public String infectionEntityInsert(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId, String entity_id,String seqno) {	

//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	

//String newEntity_id = 	labcheckService.mhEntityInsertSelectOne(farmId);
//System.out.println(newEntity_id);
model.addAttribute("farmId", farmId);	
model.addAttribute("entity_id", entity_id);	
return "data_management/labcheckinfection/infectionEntity_insert";	
}	
//병력자료 >(자료) 관리 > (병력자료)보기 > 수정

@RequestMapping(value = "/infectionEntityUpdate", method = RequestMethod.GET)	
public String infectionEntityUpdate(Model model,	
@RequestParam(value="pageNum", defaultValue="1") int pageNum,	
@RequestParam(value="searchOption", defaultValue="none") String searchOption,	
@RequestParam(value="searchValue", defaultValue="none") String searchValue, String farmId,String entity_id,String seqno) {	
model.addAttribute("farmId", farmId);
//Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	
//model.addAttribute("farmList", map.get("farmList"));	
//model.addAttribute("totalCount", map.get("totalCount"));	
//model.addAttribute("paging", map.get("paging"));	
//model.addAttribute("searchOption", searchOption);	
//model.addAttribute("searchValue", searchValue);	



Infectionentity ListDetail= labcheckService.infectionEntitySelectOneBeforeUpdate(seqno);		
//System.out.println("목장   mhEntityUpdateSelectOne"+map.get("envList").toString());		
		
//날짜 자르기...
//
//String cure=mhListDetail.getCURE_DATE();
//int idx = cure.indexOf("년"); 
//String cure1 = cure.substring(0, idx); //년
//String cure11 = cure.substring(idx+1);
//
//int idx1 = cure11.indexOf("월");
//String cure2 = cure11.substring(0,idx1); //월
//
//String cure12 = cure11.substring(idx1+1);
//int idx2 = cure12.indexOf("일");
//String cure3 = cure12.substring(0,idx2); //일
//
//String cure13 = cure12.substring(idx2+1);
//int idx3 = cure13.indexOf("시");
//String cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setCure1(cure1);
//mhListDetail.setCure2(cure2);
//mhListDetail.setCure3(cure3);
//mhListDetail.setCure4(cure4);
////날짜 자르기...
//
//cure=mhListDetail.getOCCUR_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setOccur1(cure1);
//mhListDetail.setOccur2(cure2);
//mhListDetail.setOccur3(cure3);
//mhListDetail.setOccur4(cure4);
//
//
//cure=mhListDetail.getRECOVERY_DATE();
//idx = cure.indexOf("년"); 
//cure1 = cure.substring(0, idx); //년
//cure11 = cure.substring(idx+1);
//
//idx1 = cure11.indexOf("월");
//cure2 = cure11.substring(0,idx1); //월
//
//cure12 = cure11.substring(idx1+1);
//idx2 = cure12.indexOf("일");
//cure3 = cure12.substring(0,idx2); //일
//
//cure13 = cure12.substring(idx2+1);
//idx3 = cure13.indexOf("시");
//cure4 = cure13.substring(0,idx3); //시
//
//mhListDetail.setRecov1(cure1);
//mhListDetail.setRecov2(cure2);
//mhListDetail.setRecov3(cure3);
//mhListDetail.setRecov4(cure4);
//


model.addAttribute("EntityList", ListDetail);		
	

//String farmNm = 	labcheckService.birEntityUpdateSelectOne(farmId);
model.addAttribute("entity_id", entity_id);	
model.addAttribute("farmId", farmId);	
return "data_management/labcheckinfection/infectionEntity_update";	
}	


}				
