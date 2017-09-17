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
import com.kis.rda.farm.domain.EnvUpdate;
import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.QuResearch;
import com.kis.rda.farm.service.EnvService;				
				
@RestController				
public class EnvRestController {				
				
@Autowired				
private EnvService envService;				
@RequestMapping(value = "/ajax/envList", method = RequestMethod.POST)				
public Map<String,Object> ajaxenvList(Model model,				
	@RequestParam(value="pageNum", defaultValue="1") int pageNum,			
	@RequestParam(value="searchOption", defaultValue="none") String searchOption,			
	@RequestParam(value="searchValue", defaultValue="none") String searchValue) {			
Map<String, Object> map = envService.selectFarmListServ(pageNum, searchOption, searchValue);	

System.out.println("목장   "+map);
System.out.println("목장   "+ map.get("envList"));
System.out.println("목장   "+ map.get("farmList"));
model.addAttribute("envList", map.get("envList"));				
model.addAttribute("totalCount", map.get("totalCount"));				
model.addAttribute("paging", map.get("paging"));				
model.addAttribute("searchOption", searchOption);				
model.addAttribute("searchValue", searchValue);				
				
				
return map;				
}		
//환경자료 관리리스트 
//parent.center.location.href='/list/entity/entity_list_env.jsp?farm_id=005&farm_fname=산청)남산목장'
// 
	@RequestMapping(value = "/ajax/envEntityList", method = RequestMethod.POST)
	public Map<String,Object> ajaxenvEntityList(Model model,Farm farm,String farm_Id,Environment environment) {

		String farmId= environment.getFARM_ID();
		
		Map<String, Object> map = envService.ajaxenvEntityList(farmId);
		System.out.println("목장   "+map.get("envList").toString());
		//environment=(Environment)map.get("envList");
	 
		
		model.addAttribute("envEntityList", map.get("envList").toString());
		
		return map;
	}
//  환경 입력하기
	@RequestMapping(value = "/ajax/envEntityInsertDo", method = RequestMethod.POST)
	public int ajaxenvEntityInsertDo(Model model,Farm farm,String farm_Id,EnvUpdate  environment) {
	 ;
	 
//		System.out.println(" 환경 입력하기   "+environment.getFARM_ID());
 		
		String eNV_GATHERDATE= environment.getEnv_date1()+"년"+environment.getEnv_res2()+"월"+environment.getEnv_res3()+"일"+environment.getEnv_res4()+"시";
		environment.setENV_GATHERDATE(eNV_GATHERDATE);	
	 
		int result = envService.ajaxenvEntityInsertDo(environment);
		System.out.println(" 환경 입력하기   ");
	 
		model.addAttribute("result", result);
		
		return result;
	}
	
	 
	//!!! DB 설계에 문제가 있음...환경자료 한개 항목만 쿼리해오기. 
	//parent.center.location.href='/list/entity/entity_list_env.jsp?farm_id=005&farm_fname=산청)남산목장'
	// 
		@RequestMapping(value = "/ajax/envEntitySelectOneDo", method = RequestMethod.POST)
		public Map<String,Object> ajaxenvEntitySelectOneDo(Model model,Farm farm,String farm_id,Environment environment) {

			String farmId= environment.getFARM_ID();
			
			Map<String, Object> map = envService.ajaxenvEntityList(farmId);
			System.out.println("목장   "+map.get("envList").toString());
			 
			model.addAttribute("envEntityList", map.get("envList").toString());
			
			return map;
		}
	
//  환경 수정하기
	@RequestMapping(value = "/ajax/envEntityUpdateDo", method = RequestMethod.POST)
	public int ajaxenvEntityUpdateDo(Model model,Farm farm,String farm_Id,EnvUpdate  environment) {

	
		System.out.println(" 환경 수정하기   "+environment.getFARM_ID());
	 
		
		String eNV_GATHERDATE= environment.getEnv_date1()+"년"+environment.getEnv_res2()+"월"+environment.getEnv_res3()+"일"+environment.getEnv_res4()+"시";
		environment.setENV_GATHERDATE(eNV_GATHERDATE);	
	 
		int result = envService.ajaxenvEntityUpdateDo(environment);
	  	
		model.addAttribute("result", result);
		
		return result;
	}
	
	// 환경삭제하기 envEntityDeleteDo
	@RequestMapping(value = "/ajax/envEntityDeleteDo", method = RequestMethod.POST)
	public int ajaxenvEntityDeleteDo(Model model,Farm farm,String farm_Id,EnvUpdate  environment) {
	 
	 	 
		int result = envService.ajaxenvEntityDeleteDo(environment);
		System.out.println(" 환경  삭제   ");
	 		
		model.addAttribute("result", result);
		
		return result;
	}
	

}				
				
				
				
