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
					url : "${pageContext.request.contextPath }/ajax/envEntityInsertDo",
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
			url : "${pageContext.request.contextPath }/ajax/envEntityUpdateDo",
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
<input type="hidden" id="FARM_ID" name="FARM_ID" value="${farmId}">
<div align="left" style="padding-bottom: 5px">
	<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 환 경 자 료 입 력 ${farmNm}</b></font>
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
            	<input type="text" name="farm_id_disable" id="farm_id" disabled="disabled" value="${farmId}" style="background-color: #e2e2e2;"><br>
            </td>
        </tr>
        <tr>
			<th>조사일</th>
			<td style="padding-left: 5px">
				<input name="env_date1" id="env_res1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }" value="0" type="text" maxlength="4" style="width:50px; ">년
            	<input name="env_res2" id="env_res2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }" value="0" type="text" maxlength="2" style="width:50px;">월
            	<input name="env_res3" id="env_res3" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }" value="0" type="text" maxlength="2" style="width:50px;">일
            	<input name="env_res4" id="env_res4" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 24) { alert('1~24 사이의 숫자로 입력바랍니다.'); } }" value="0" type="text" maxlength="2" style="width:50px;">시
			</td>
		</tr>
		<tr>
			<th>축사 청결 상태</th>
			<td style="padding-left: 5px">
				<input type="radio" name="CLEAN" value="1" style="position:relative; top:0.1em">매우 불량&nbsp;&nbsp;
				<input type="radio" name="CLEAN" value="2" style="position:relative; top:0.1em">불량&nbsp;&nbsp;
				<input type="radio" name="CLEAN" value="3" style="position:relative; top:0.1em">보통&nbsp;&nbsp;
				<input type="radio" name="CLEAN" value="4" style="position:relative; top:0.1em">양호&nbsp;&nbsp;
				<input type="radio" name="CLEAN" value="5" style="position:relative; top:0.1em">매우 양호<br>
			</td>
		</tr>
		<tr>
			<th>급수조 청결 상태</th>
			<td style="padding-left: 5px">
				<input type="radio" name="WTC" value="1" style="position:relative; top:0.1em">매우 불량&nbsp;&nbsp;
				<input type="radio" name="WTC" value="2" style="position:relative; top:0.1em">불량&nbsp;&nbsp;
				<input type="radio" name="WTC" value="3" style="position:relative; top:0.1em">보통&nbsp;&nbsp;
				<input type="radio" name="WTC" value="4" style="position:relative; top:0.1em">양호&nbsp;&nbsp;
				<input type="radio" name="WTC" value="5" style="position:relative; top:0.1em">매우 양호<br>
			</td>
		</tr>
		<tr>
			<th>급수 수질</th>
			<td style="padding-left: 5px">
				<input type="radio" name="WSQ" value="지하수" style="position:relative; top:0.1em">지하수&nbsp;&nbsp;
				<input type="radio" name="WSQ" value="수돗물" style="position:relative; top:0.1em">수돗물<br>
			</td>
		</tr>
		<tr>
			<th>조사료 및 사료종류</th>
			<td style="padding-left: 5px">
				<input type="radio" name="FQ" value="저급" style="position:relative; top:0.1em">저급&nbsp;&nbsp;
				<input type="radio" name="FQ" value="중급" style="position:relative; top:0.1em">중급&nbsp;&nbsp;
				<input type="radio" name="FQ" value="고급" style="position:relative; top:0.1em">고급<br>
			</td>
		</tr>
		<tr class=bottom_button>
			<td colspan="2" align="center">
				<input type="hidden" id="mod" name="mod" value="">
							<input type="button" value="입력" onclick="insert()">
<!-- 				<input type="button" value="수정" onclick="modify()"> -->
<!-- 				<input type="button" value="삭제" onclick="del()"> -->
				<input type="reset" value="취소">
					<input type="reset" value="돌아가기" onclick="history.back()">
			</td>
		</tr>
	</tbody>
</table>
</form>
<c:import url="../../module/footer.jsp"></c:import>