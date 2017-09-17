<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../module/top_menu.jsp"></c:import>
<c:import url="../../module/side_data_management.jsp"></c:import>
<script>
	function newFarmAdd() {
		if(confirm("등록하시겠습니까?")) {
			var farm = $('#newFarmAddForm').serialize();
			$.ajax({
				url : "newFarmAdd",
				type : "POST",
				data : farm,
				dataType : "json",
				success : function(data) {
					var result = data;
					if(result > 0){
						alert('성공적으로 등록하였습니다.');
						location.href="newFarmList";
					}else{
						alert('등록에 실패하였습니다.');
					}
				}
			})
		}
	}
</script>
<div id="amc_content_body" class="amc_content_body">
	<form id="farmAddForm" method="post" style="margin-left: 10px; margin-right: 10px">
		<div align="left" style="padding-bottom: 5px">
			<font style="color: #000000; font-family: gulim; font-size: 14px;">
			<b><img src="<c:url value='resources/img/board.png'/>" style="width: 20px; position: relative; top: 0.2em"> 목장정보입력</b></font>
		</div>
		<table class="table_003 w100p" style="TABLE-LAYOUT: fixed;">
			<colgroup>
				<col width="10%">
				<col width="10%">
			</colgroup>
			<tbody>
				<tr>
					<th rowspan="9" width="100px">기<br>본<br>정<br>보<br></th>
					<td>농장명</td>
					<td width="500px" style="padding-left: 5px">
						<input name="farmName" id="farmName" type="text" maxlength="100" style='width: 120px; text-align: right;' />
					</td>
					<th rowspan="4" width="100px">2KM안 <br>우제류<br> 농가수</th>
					<td>한우</td>
					<td style="padding-left: 5px">
						<input name="kmkc" id="kmkc" type="number" maxlength="3" style='width: 50px; text-align: right;' /> 두
					</td>
				</tr>
				<tr>
					<td>농장주</td>
					<td style="padding-left: 5px">
						<input name="name" id="name" type="text" maxlength="50" style='width: 70px; text-align: right;' />
					</td>
					<td>젖소</td>
					<td style="padding-left: 5px">
						<input name="kmmc" id="kmmc" type="number" maxlength="3" style='width: 50px; text-align: right;' /> 두
					</td>
				</tr>
				<tr>
					<td width="10px">농장주소</td>
					<td width="500px" style="padding-left: 5px">
						<select name="address1">
							<option value="" selected="selected">지역선택</option>
							<option value="경기">경기</option>
							<option value="강원">강원</option>
							<option value="충북">충북</option>
							<option value="충남">충남</option>
							<option value="전북">전북</option>
							<option value="전남">전남</option>
							<option value="경북">경북</option>
							<option value="경남">경남</option>
						</select> 
						<input name="address2" id="address2" type="text" maxlength="90" style='width: 70px; text-align: right;' />(시군구) 
						<input name="address3" id="address3" type="text" maxlength="90" style='width: 70px; text-align: right;' />(읍면동) <br> 
						<input name="address4" id="address4" type="text" maxlength="90" style='width: 400px; text-align: right;' />(나머지)
					</td>
					<td>돼지</td>
					<td style="padding-left: 5px">
						<input name="kmpi" id="kmpi" type="number" maxlength="3" style='width: 50px; text-align: right;' /> 두
					</td>
				</tr>
				<tr>
					<td>핸드폰</td>
					<td style="padding-left: 5px">
						<input name="phone1" id="phone1" type="number" maxlength="3" style='width: 50px; text-align: right;' />
						- <input name="phone2" id="phone2" type="number" maxlength="4" style='width: 50px; text-align: right;' />
						- <input name="phone3" id="phone3" type="number" maxlength="4" style='width: 50px; text-align: right;' />
					</td>
					<td>기타</td>
					<td style="padding-left: 5px">
						<input name="kmetc" id="kmetc" type="number" maxlength="3" style='width: 50px; text-align: right;' /> 두
					</td>
				</tr>
				<tr>
					<td>농장전화번호</td>
					<td style="padding-left: 5px">
						<input name="hp1" id="hp1" type="number" maxlength="3" style='width: 50px; text-align: right;' />
						- <input name="hp2" id="hp2" type="number" maxlength="4" style='width: 50px; text-align: right;' />
						- <input name="hp3" id="hp3" type="number" maxlength="4" style='width: 50px; text-align: right;' />
					</td>
					<th rowspan="5">최근<br>2년안<br>전염병 현황</th>
					<td>설사 발생두수</td>
					<td style="padding-left: 5px"><input name="DIARRHEADO"
						id="DIARRHEADO"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />두</td>
				</tr>
				<tr>
					<td>이메일</td>
					<td style="padding-left: 5px"><input name="EMAIL" id="EMAIL"
						type="text" maxlength="20"
						style='width: 200px; text-align: right;' /></td>
					<td>설사발생축</td>
					<td style="padding-left: 5px"><input name="DIARRHEA"
						id="DIARRHEA" type="text" maxlength="20"
						style='width: 50px; text-align: right;' /></td>
				</tr>
				<tr>
					<td>경력</td>
					<td style="padding-left: 5px"><input name="CAREER" id="CAREER"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />년</td>
					<td>송아지 폐사수</td>
					<td style="padding-left: 5px"><input name="CHCDIE" id="CHCDIE"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />두</td>
				</tr>
				<tr>
					<td>관리인수</td>
					<td style="padding-left: 5px"><input name="JANITOR"
						id="JANITOR"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />명</td>
					<td>2년 내 법정가축<br>전염병 발생현황
					</td>
					<td style="padding-left: 5px"><input type="radio" name="YEAR"
						value="발생" style="position: relative; top: 0.1em"></input>발생&nbsp;&nbsp;
						<input type="radio" name="YEAR" value="미발생"
						style="position: relative; top: 0.1em"></input>미발생<br></td>
				</tr>
				<tr>
					<td>수의사 관리 여부</td>
					<td style="padding-left: 5px"><input type="radio"
						name="VETERINARIAN" value="관리"
						style="position: relative; top: 0.1em"></input>관리&nbsp;&nbsp; <input
						type="radio" name="VETERINARIAN" value="미관리"
						style="position: relative; top: 0.1em"></input>미관리<br></td>
					<td>사용 소독제 종류</td>
					<td style="padding-left: 5px"><input name="DISINFECTANT"
						id="DISINFECTANT" type="text" maxlength="20"
						style='width: 50px; text-align: right;' /></td>
				</tr>
				<tr>
					<th rowspan="4">사<br>육<br>현<br>황
					</th>
					<td>어미소</td>
					<td style="padding-left: 5px"><input name="MC" id="MC"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />두</td>
					<th rowspan="4">환<br>경
					</th>
					<td>온도</td>
					<td style="padding-left: 5px"><input name="TEMP" id="TEMP"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />℃</td>
				</tr>
				<tr>
					<td>송아지</td>
					<td style="padding-left: 5px"><input name="CHC" id="CHC"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />두</td>
					<td>습도</td>
					<td style="padding-left: 5px"><input name="HUMIDITY"
						id="HUMIDITY"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />도</td>
				</tr>
				<tr>
					<td>육성비육</td>
					<td style="padding-left: 5px"><input name="CMONEY" id="CMONEY"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />두</td>
					<td>조도</td>
					<td style="padding-left: 5px"><input name="ILLUMINANCE"
						id="ILLUMINANCE"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />Lx</td>
				</tr>
				<tr>
					<td>송아지 외부입식 여부</td>
					<td style="padding-left: 5px"><input type="radio" name="CHCYN"
						style="position: relative; top: 0.1em"></input>YES&nbsp;&nbsp; <input
						type="radio" name="CHCYN" value="NO"
						style="position: relative; top: 0.1em"></input>NO<br></td>
					<td>풍속</td>
					<td style="padding-left: 5px"><input name="WIND" id="WIND"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }"
						type="number" maxlength="3"
						style='width: 50px; text-align: right;' />m/s</td>
				</tr>
				<tr>
					<td colspan="6" align="center"><input type="hidden" id="mod"
						name="mod" value=""> <input type="button" value="저장"
						onclick="add()"> <input type="reset" value="취소"> <input
						type="reset" value="돌아가기" onClick="history.back()"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<c:import url="../../module/footer.jsp"></c:import>