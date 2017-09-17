package com.kis.rda.farm.controller;				
				
import java.io.File;
import java.io.IOException;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;				
import org.springframework.http.HttpHeaders;				
import org.springframework.http.HttpStatus;				
import org.springframework.http.ResponseEntity;				
import org.springframework.ui.Model;				
import org.springframework.web.bind.annotation.RequestMapping;				
import org.springframework.web.bind.annotation.RequestMethod;				
import org.springframework.web.bind.annotation.RequestParam;				
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.FecesInput;
import com.kis.rda.farm.domain.MhListDetail;
import com.kis.rda.farm.service.FeseService;				
				
@RestController				
public class FeseRestController {				
				
@Autowired				
private FeseService feseService;				
@RequestMapping(value = "/ajax/feseList", method = RequestMethod.POST)				
public Map<String,Object> ajaxfeseList(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {			
Map<String, Object> map = feseService.selectFarmListServ(pageNum, searchOption, searchValue);				
model.addAttribute("farmList", map.get("farmList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
				
				
return map;				
}		


@RequestMapping(value = "/ajax/feseEntityInsertDo", method = RequestMethod.POST)		
public void ajaxfeseEntityInsertDo(Model model,Farm farm,String farm_Id,FecesInput  entityInsert,MultipartHttpServletRequest request) throws IllegalStateException, IOException {		
		
	MultipartFile file = request.getFile("uploadfile");
    System.out.println("-------------- file end --------------\n" );
		     String fileName = file.getOriginalFilename();
	         String path = "C:\\Users\\Administrator\\git\\RDA\\rda\\src\\main\\webapp\\resources\\upload\\"+fileName;
		     File destFile = new File(path); 
		     file .transferTo(destFile);
 
		     System.out.println("-------------- file end --------------\n" + fileName);
 
	String gather = entityInsert.getFECES_GATHERDATE1()+"년"+entityInsert.getFECES_GATHERDATE2()+"월"+entityInsert.getFECES_GATHERDATE3()+"일"+entityInsert.getFECES_GATHERDATE4()+"시";
	String occur = entityInsert.getFECES_OCCURDATE1()+"년"+entityInsert.getFECES_OCCURDATE2()+"월"+entityInsert.getFECES_OCCURDATE3()+"일"+entityInsert.getFECES_OCCURDATE4()+"시";
	 
	//entityInsert.setENTITY_ID(entity_id);
	entityInsert.setFECES_GATHERDATE(gather);
	entityInsert.setFECES_OCCURDATE(occur);
	System.out.println(" 객체 입11력하기   "+entityInsert.getENTITY_ID());
	
	int result = feseService.ajaxfeseEntityInsertDo(entityInsert);		
System.out.println(" 객체 입력하기   ");					
//return result;		
}		
  
 
}				
				
				
