<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../module/top_menu.jsp"></c:import>
<c:import url="../../module/side_data_management.jsp"></c:import>
<script>
	function farmUpdate() {
		if(confirm("수정하시겠습니까?")) {
			var farm = $('#farmUpdateForm').serialize();
			$.ajax({
				url : "farmUpdate",
				type : "POST",
				data : farm,
				dataType : "json",
				success : function(data) {
					var result = data;
					if(result > 0){
						alert('성공적으로 수정하였습니다.');
						location.href="farmList";
					}else{
						alert('수정에 실패하였습니다.');
					}
				}
			})
		}
	}
	function farmDelete() {
		if(confirm("삭제하시겠습니까?")) {
			var farmId = $('#farmId').val();
			$.ajax({
				url : "farmDelete",
				type : "POST",
				data : { farmId: farmId },
				dataType : "json",
				success : function(data) {
					var result = data;
					if(result > 0){
						alert('성공적으로 삭제하였습니다.');
						location.href="farmList";
					}else{
						alert('삭제에 실패하였습니다.');
					}
				}
			})
		}
	}
</script>
<div id="amc_content_body" class="amc_content_body">
	<form id="farmUpdateForm" method="post" style="margin-left: 10px; margin-right: 10px">
		<div align="left" style="padding-bottom: 5px">
			<font style="color: #000000; font-family: gulim; font-size: 14px;">
			<b><img src="<c:url value='resources/img/board.png'/>" style="width: 20px; position: relative; top: 0.2em"> 목장정보수정(${farm.fname })</b></font>
		</div>
		<table class="table_003 w100p">
			<colgroup>
				<col width="20%">
				<col width="80%">
			</colgroup>
			<tbody>
				<tr>
					<th>목장 ID</th>
					<td style="padding-left: 5px">
						<input type="text" name="farmId" id="farmId" readonly value="${farm.farmId }" style="background-color: #e2e2e2;"><br>
					</td>
				</tr>
				<tr>
					<th>목&nbsp;&nbsp;&nbsp;장&nbsp;&nbsp;&nbsp;명</th>
					<td style="padding-left: 5px">
						<input type="text" name="fname" id="fname" value="${farm.fname }"><br>
					</td>
				</tr>
				<tr>
					<th>목&nbsp;&nbsp;&nbsp;장&nbsp;&nbsp;&nbsp;주</th>
					<td style="padding-left: 5px">
						<input type="text" name="name" id="name" value="${farm.name }"><br>
					</td>
				</tr>
				<tr>
					<th>목 장 주 소</th>
					<td style="padding-left: 5px">
						<input type="text" name="address" id="address" value="${farm.address }" style="width: 300px"><br>
					</td>
				</tr>
				<tr>
					<th>전 화 번 호</th>
					<td style="padding-left: 5px">
						<input type="text" name="phone1" id="phone1" value="${farm.phone1 }" type="number" maxlength="3" style='width: 50px; text-align: right;' />
						- 
						<input type="text" name="phone2" id="phone2" value="${farm.phone2 }" type="number" maxlength="4" style='width: 50px; text-align: right;' />
						- 
						<input type="text" name="phone3" id="phone3" value="${farm.phone3 }" type="number" maxlength="4" style='width: 50px; text-align: right;' />
					</td>
				</tr>
				<tr>
					<th>휴 대 폰</th>
					<td style="padding-left: 5px">
						<input type="text" name="hp1" id="hp1" type="number" value="${farm.hp1 }" maxlength="3" style='width: 50px; text-align: right;' />
						- 
						<input type="text" name="hp2" id="hp2" type="number" value="${farm.hp2 }" maxlength="4" style='width: 50px; text-align: right;' />
						- 
						<input type="text" name="hp3" id="hp3" type="number" value="${farm.hp3 }" maxlength="4" style='width: 50px; text-align: right;' />
					</td>
				</tr>
				<tr>
					<th>이 메 일</th>
					<td style="padding-left: 5px">
						<input type="email" name="email" id="email" value="${farm.email }" style="width: 200px"><br>
					</td>
				</tr>
				<tr>
					<th>한우 수</th>
					<td style="padding-left: 5px">
						<input name="kc" id="kc" value="${farm.kc }" type="number" maxlength="3" style='width: 50px; text-align: right;' /> 마리
					</td>
				</tr>
				<tr>
					<th>젖소 수</th>
					<td style="padding-left: 5px">
						<input name="mc" id="mc" value="${farm.mc }" type="number" maxlength="3" style='width: 50px; text-align: right;' /> 마리
					</td>
				</tr>
				<tr>
					<th>송아지 수</th>
					<td style="padding-left: 5px">
						<input name="calf" id="calf" value="${farm.calf }" type="number" maxlength="3" style='width: 50px; text-align: right;' /> 마리
					</td>
				</tr>
				<tr>
					<td colspan="2" align="center">
					<input type="button" value="수정" onclick="farmUpdate()">
					<input type="button" value="삭제" onclick="farmDelete()">
					<input type="reset" value="취소"> 
					<input type="reset" value="돌아가기" onClick="history.back()">
				</td>
				</tr>
			</tbody>
		</table>
	</form>
</div>
<c:import url="../../module/footer.jsp"></c:import>