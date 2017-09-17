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
			
			
import com.kis.rda.farm.service.QuService;			
			
			
@Controller			
public class QuController {			
			
@Autowired			
private QuService quService;			
			
			
			
			
			
@RequestMapping(value = "/quList", method = RequestMethod.GET)			
public String quList(Model model,			
@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
@RequestParam(value="searchValue", defaultValue="none") String searchValue) {		
	System.out.println("확인");
 
return "data_management/qu/qu_list";			
	}		


// 설문조사 시작 폼 열기

@RequestMapping(value = "/qu2", method = RequestMethod.GET)			
public String qu2(Model model,			
@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
@RequestParam(value="searchValue", defaultValue="none") String searchValue,
String farm_fname) {		
	System.out.println("확인"+farm_fname);
 
return "data_management/qu/qu2";			
	}		


}			
