package com.kis.rda.excel;

import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.web.servlet.view.document.AbstractXlsView;

import com.kis.rda.farm.domain.Farm;
import com.kis.rda.farm.domain.NewFarm;

public class ExcelDownload extends AbstractXlsView{

	@Override
	protected void buildExcelDocument(Map<String, Object> map, Workbook workbook, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String excelName = null;
		HSSFSheet worksheet = null;

		String excelType = (String) map.get("excelType");
		excelName = new String(getExcelName(excelType).getBytes("euc-kr"),"8859_1");
		worksheet = (HSSFSheet) workbook.createSheet("list");
		
		if (excelType.equals("farmList")) {
			List<Farm> list = (List<Farm>) map.get("excelList");
			worksheet = createFarmListRow(list, worksheet);
		}else if (excelType.equals("newFarmList")) {
			List<NewFarm> list = (List<NewFarm>) map.get("excelList");
			worksheet = createNewFarmListRow(list, worksheet);
		}

		SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy.MM.dd");
		String today = formatter.format(new java.util.Date());
		response.setContentType("application/vnd.ms-excel; charset=euc-kr");
		response.setHeader("Content-Disposition", "attachment; filename=" + "(" + today + ")" + excelName);
	}

	private String getExcelName(String excelType) {
		String excelName = "";
		if (excelType.equals("farmList")) {
			excelName = "목장관리.xls";
		}else if (excelType.equals("newFarmList")) {
			excelName = "신규목장관리.xls";
		}
		return excelName;
	}

	private HSSFSheet createFarmListRow(List<Farm> list, HSSFSheet worksheet) {
		HSSFRow row = null;
		row = worksheet.createRow(0);
		row.createCell(0).setCellValue("목장ID");
		row.createCell(1).setCellValue("지역");
		row.createCell(2).setCellValue("목장명");
		row.createCell(3).setCellValue("목장주");
		row.createCell(4).setCellValue("목장전화");
		row.createCell(5).setCellValue("목장주 휴대폰");
		row.createCell(6).setCellValue("한우 수");
		row.createCell(7).setCellValue("젖소 수");
		row.createCell(8).setCellValue("송아지 수");

		// 리스트 만큼 값을 열을증가시켜 값을 채운다.
		for (int i = 0; i < list.size(); i++) {
			row = worksheet.createRow(i + 1);
			row.createCell(0).setCellValue(list.get(i).getFarmId());
			row.createCell(1).setCellValue(list.get(i).getAddress());
			row.createCell(2).setCellValue(list.get(i).getFname());
			row.createCell(3).setCellValue(list.get(i).getName());
			row.createCell(4).setCellValue(list.get(i).getPhone1()+"-"+list.get(i).getPhone2()+"-"+list.get(i).getPhone3());
			row.createCell(5).setCellValue(list.get(i).getHp1()+"-"+list.get(i).getHp2()+"-"+list.get(i).getHp3());
			row.createCell(6).setCellValue(list.get(i).getKc());
			row.createCell(7).setCellValue(list.get(i).getMc());
			row.createCell(8).setCellValue(list.get(i).getCalf());
		}
		return worksheet;
	}
	
	private HSSFSheet createNewFarmListRow(List<NewFarm> list, HSSFSheet worksheet) {
		HSSFRow row = null;
		row = worksheet.createRow(0);
		row.createCell(0).setCellValue("목장ID");
		row.createCell(1).setCellValue("지역");
		row.createCell(2).setCellValue("목장명");
		row.createCell(3).setCellValue("목장주");
		row.createCell(4).setCellValue("목장전화");
		row.createCell(5).setCellValue("이메일");
		row.createCell(6).setCellValue("목장주 휴대폰");
		row.createCell(7).setCellValue("어미소 수");
		row.createCell(8).setCellValue("송아지 수");
		row.createCell(9).setCellValue("육성비육 수");
		row.createCell(10).setCellValue("농장주 경력");
		row.createCell(11).setCellValue("설사발생 두수");
		row.createCell(12).setCellValue("설사발생축");
		row.createCell(13).setCellValue("송아지 폐사수");
		row.createCell(14).setCellValue("송아지 외부입식 여부");
		row.createCell(15).setCellValue("반경 2KM안 한우 농가수");
		row.createCell(16).setCellValue("반경 2KM안 젖소 농가수");
		row.createCell(17).setCellValue("반경 2KM안 돼지 농가수");
		row.createCell(18).setCellValue("반경 2KM안 기타 농가수");
		row.createCell(19).setCellValue("최근 2년 내 법정 가축전염병 발생현황");
		row.createCell(20).setCellValue("사용 소독제의 종류");
		row.createCell(21).setCellValue("온도");
		row.createCell(22).setCellValue("습도");
		row.createCell(23).setCellValue("조도");
		row.createCell(24).setCellValue("풍속");
		row.createCell(25).setCellValue("관리인 수");
		row.createCell(26).setCellValue("수의사 관리 여부");

		// 리스트 만큼 값을 열을증가시켜 값을 채운다.
		for (int i = 0; i < list.size(); i++) {
			row = worksheet.createRow(i + 1);
			row.createCell(0).setCellValue(list.get(i).getFarmId());
			row.createCell(1).setCellValue(list.get(i).getAddress());
			row.createCell(2).setCellValue(list.get(i).getFarmName());
			row.createCell(3).setCellValue(list.get(i).getName());
			row.createCell(4).setCellValue(list.get(i).getPhone1()+"-"+list.get(i).getPhone2()+"-"+list.get(i).getPhone3());
			row.createCell(5).setCellValue(list.get(i).getEmail());
			row.createCell(6).setCellValue(list.get(i).getHp1()+"-"+list.get(i).getHp2()+"-"+list.get(i).getHp3());
			row.createCell(7).setCellValue(list.get(i).getMc());
			row.createCell(8).setCellValue(list.get(i).getChc());
			row.createCell(9).setCellValue(list.get(i).getCmoney());
			row.createCell(10).setCellValue(list.get(i).getCareer());
			row.createCell(11).setCellValue(list.get(i).getDiarrheado());
			row.createCell(12).setCellValue(list.get(i).getDiarrhea());
			row.createCell(13).setCellValue(list.get(i).getChcdie());
			row.createCell(14).setCellValue(list.get(i).getChcyn());
			row.createCell(15).setCellValue(list.get(i).getKmkc());
			row.createCell(16).setCellValue(list.get(i).getKmmc());
			row.createCell(17).setCellValue(list.get(i).getKmpi());
			row.createCell(18).setCellValue(list.get(i).getKmetc());
			row.createCell(19).setCellValue(list.get(i).getYear());
			row.createCell(20).setCellValue(list.get(i).getDisinfectant());
			row.createCell(21).setCellValue(list.get(i).getTemp());
			row.createCell(22).setCellValue(list.get(i).getHumidity());
			row.createCell(23).setCellValue(list.get(i).getIlluminance());
			row.createCell(24).setCellValue(list.get(i).getWind());
			row.createCell(25).setCellValue(list.get(i).getJanitor());
			row.createCell(26).setCellValue(list.get(i).getVeterinarian());
		}
		return worksheet;
	}
}
