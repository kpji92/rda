<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../module/top_menu.jsp"></c:import>
<c:import url="../../module/side_data_management.jsp"></c:import>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/css/bootstrap.css"/>
        <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.15/css/dataTables.bootstrap.css"/>

        <script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.7/js/bootstrap.js"></script>

        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/dataTables.buttons.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.bootstrap.min.js"></script>

        <script type="text/javascript" src="https://cdn.datatables.net/1.10.15/js/dataTables.bootstrap.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.html5.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.print.min.js"></script>
        <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.3.1/js/buttons.colVis.min.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/vfs_fonts.js"></script>
        <script type="text/javascript" src="https://cdn.rawgit.com/bpampuch/pdfmake/0.1.27/build/pdfmake.min.js"></script>
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jszip/3.1.3/jszip.min.js"></script>
		        
				         
				<!--         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.css" > -->
				<link rel="StyleSheet" href="<c:url value='resources/css/datatable.css'/>" type="text/css">
				 <link rel="StyleSheet" href="<c:url value='resources/css/datatableUse.css'/>" type="text/css">

<style>
 div div div#content {
	
    padding-top: 10px;
    padding-left: 10px;
    padding-right: 10px;
	 
}
table tbody tr th{
	text-align:center;
}
table tbody tr td{
	text-align:left;
}

tr.bottom_button td{
	text-align:center;
}
</style>
<script type="text/javascript">
function insert(){
	if(confirm("입력하시겠습니까?")) {
		var quresearch = $('#regForm').serialize();
		 console.log(quresearch);
				$.ajax({
					url : "${pageContext.request.contextPath }/ajax/birEntityInsertDo",
					type : "POST",
					data : quresearch,
					dataType : "json",
					success : function(data) {
						var result = data;
						if(result > 0){
							alert('성공적으로 입력하였습니다.');
//		 					location.href="farmList";
							 window.close();
						}else{
							alert('입력에 실패하였습니다.');
						}
					}
				})
	}
}


function modify(){
	   
	
	if(confirm("수정하시겠습니까?")) {
		  
		var quresearch = $('#regForm').serialize();
 console.log(quresearch);
		$.ajax({
			url : "${pageContext.request.contextPath }/ajax/birEntityInsertDo",
			type : "POST",
			data : quresearch,
			dataType : "json",
			success : function(data) {
				var result = data;
				if(result > 0){
					alert('성공적으로 입력하였습니다.');
// 					location.href="farmList";
					 window.close();
				}else{
					alert('입력에 실패하였습니다.');
				}
			}
		})
	}
}
function del() {
	if(confirm("삭제하시겠습니까?")) {
		var quresearch = $('#regForm').serialize();
		 console.log(quresearch);
				$.ajax({
					url : "${pageContext.request.contextPath }/ajax/envEntityInsertDo",
					type : "POST",
					data : quresearch,
					dataType : "json",
					success : function(data) {
						var result = data;
						if(result > 0){
							alert('성공적으로 삭제하셨습니다.');
//		 					location.href="farmList";
							 window.close();
						}else{
							alert('삭제에 실패하였습니다.');
						}
					}
				})
	}
}
$(document).ready(function(){
 

});


</script>

<form name="regForm" id="regForm"  method="post" style="margin-left: 10px; margin-right: 10px" action="/dbconn/farm/input_env.jsp?farm_id=005">
<input type="hidden" id="farm_id" name="farm_id" value="${farmId}">
 
<div align="left" style="padding-bottom: 5px">
	<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 개 체 생 체 정 보 입 력</b></font>
</div>	
<table class="table_003 w100p">
	<tbody>
		</tbody><colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<tbody><tr>
			<th>관리번호</th>
			<td style="padding-left: 5px">
            	<input type="hidden" name="ENTITY_ID" id="ENTITY_ID" value="${entity_id}">
            	<input type="text" name="casenum" id="casenum" disabled="disabled" value="${entity_id}" style="background-color: #e2e2e2;"><br>
            </td>
        </tr>
		<tr>
			<th>측정일</th>
			<td style="padding-left: 5px">
				<input name="check1" id="check1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }" type="text" maxlength="4" style="width:50px; ">년
            	<input name="check2" id="check2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">월
            	<input name="check3" id="check3" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">일
            	<input name="check4" id="check4" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 24) { alert('1~24 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">시
			</td>
		</tr>
		<tr>
			<th>체온(직장 내 온도)</th>
			<td style="padding-left: 5px">
				<input type="text" name="TEMPER" id="TEMPER">℃&nbsp;&nbsp;(38.5℃ ~ 40.0℃)<br>
			</td>
		</tr>
		<tr>
			<th>심박 수 </th>
			<td style="padding-left: 5px">
				<input type="text" name="HEARTRATE" id="HEARTRATE">회&nbsp;&nbsp;(55 ~ 70회)<br>
			</td>
		</tr>
		<tr>
			<th>호흡 수</th>
			<td style="padding-left: 5px">
				<input type="text" name="BREATHRATE" id="BREATHRATE">회&nbsp;&nbsp;(8 ~ 25회)<br>
			</td>
		</tr>
		<tr>
			<th>투약 및 사료첨가제 처치</th>
			<td style="padding-left: 5px">
				<input type="radio" name="MEDICINE" value="1" style="position:relative; top:0.1em">Yes&nbsp;&nbsp;
				<input type="radio" name="MEDICINE" value="2" style="position:relative; top:0.1em">No<br>
			</td>
		</tr>
		<tr>
			<th>설사 유무</th>
			<td style="padding-left: 5px">
				<input type="radio" name="DIARRHEA" value="1" style="position:relative; top:0.1em">Yes&nbsp;&nbsp;
				<input type="radio" name="DIARRHEA" value="2" style="position:relative; top:0.1em">No<br>
			</td>
		</tr>
        <tr>
			<th>분변 상태 </th>
			<td style="padding-left: 5px">
				<input type="radio" name="FECES_STATE" value="normal" style="position:relative; top:0.1em">Normal&nbsp;&nbsp;
				<input type="radio" name="FECES_STATE" value="semi-formed" style="position:relative; top:0.1em">Semi-formed&nbsp;&nbsp;
				<input type="radio" name="FECES_STATE" value="loose" style="position:relative; top:0.1em">Loose&nbsp;&nbsp;
				<input type="radio" name="FECES_STATE" value="watery" style="position:relative; top:0.1em">Watery<br>
			</td>
		</tr>
        <tr>
			<th>분변 상태 </th>
			<td style="padding-left: 5px">
				<input type="radio" name="FECES_COLOR" value="백색" style="position:relative; top:0.1em">백색&nbsp;&nbsp;
				<input type="radio" name="FECES_COLOR" value="황색" style="position:relative; top:0.1em">황색&nbsp;&nbsp;
				<input type="radio" name="FECES_COLOR" value="갈색" style="position:relative; top:0.1em">갈색&nbsp;&nbsp;
				<input type="radio" name="FECES_COLOR" value="적갈색" style="position:relative; top:0.1em">적갈색&nbsp;&nbsp;
				<input type="radio" name="FECES_COLOR" value="녹색" style="position:relative; top:0.1em">녹색<br>
			</td>
		</tr>
		<tr>
			<th>변내 혈액유무</th>
			<td style="padding-left: 5px">
				<input type="radio" name="FECES_BLOOD" value="1" style="position:relative; top:0.1em">Yes&nbsp;&nbsp;
				<input type="radio" name="FECES_BLOOD" value="2" style="position:relative; top:0.1em">No<br>
			</td>
		</tr>
		<tr>
			<th>탈수 정도</th>
			<td style="padding-left: 5px">
				<input type="radio" name="DEHYDRATION" value="1" style="position:relative; top:0.1em">매우 불량&nbsp;&nbsp;
				<input type="radio" name="DEHYDRATION" value="2" style="position:relative; top:0.1em">불량&nbsp;&nbsp;
				<input type="radio" name="DEHYDRATION" value="3" style="position:relative; top:0.1em">보통&nbsp;&nbsp;
				<input type="radio" name="DEHYDRATION" value="4" style="position:relative; top:0.1em">양호&nbsp;&nbsp;
				<input type="radio" name="DEHYDRATION" value="5" style="position:relative; top:0.1em">매우 양호<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" id="mod" name="mod" value="add">
				<input type="button" value="저장" onclick="insert()">
				<input type="reset" value="취소">
					<input type="reset" value="돌아가기" onclick="history.back()">
			</td>
		</tr>
	</tbody>
</table>
</form>
<c:import url="../../module/footer.jsp"></c:import>