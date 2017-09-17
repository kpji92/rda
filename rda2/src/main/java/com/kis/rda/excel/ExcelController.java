package com.kis.rda.excel;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.NewFarm;
import com.kis.rda.farm.service.FarmService;

@Controller
public class ExcelController {

	@Autowired
	private FarmService farmService;
	
	//목장자료 - 기존목장
	@RequestMapping(value = "/farmListExcel", method = RequestMethod.GET)
	public String farmListExcel(Map<String, Object> map) {
		String excelType = "farmList";
		List<Farm> excelList = farmService.selectFarmExcelServ();
		map.put("excelList", excelList);
		map.put("excelType", excelType);
		return "excelListDown";
	}
	
	//목장자료 - 신규목장
	@RequestMapping(value = "/newFarmListExcel", method = RequestMethod.GET)
	public String newFarmListExcel(Map<String, Object> map) {
		String excelType = "newFarmList";
		List<NewFarm> excelList = farmService.selectNewFarmExcelServ();
		map.put("excelList", excelList);
		map.put("excelType", excelType);
		return "excelListDown";
	}
}
