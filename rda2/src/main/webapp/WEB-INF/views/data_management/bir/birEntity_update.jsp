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
//리스트 가져와 뿌리기
$(document).ready(function(){
	
			$.ajax({
				url : "${pageContext.request.contextPath }/ajax/birEntityUpdateSelectOne?entity_id=${entity_id}",
				type : "POST",
				success : function(data) {
 		 console.log(data);

 		 console.log(data.birth);
 		 
 		 $("#BIRTH1").val(data.birth1);				
 		 $("#BIRTH2").val(data.birth2);				
 		 $("#BIRTH3").val(data.birth3);				
 		 $("#BIRTH4").val(data.birth4);		
 		 $("#BIRTH_WEIGHT").val(data.birth_WEIGHT);	
 		 
 		 $("#BREEDING").val(data.breeding);				
 		 $("#VARIETY").val(data.variety);				
 		 $("#GENDER").val(data.gender);				
 						
 					
 		 $("#COLOSTRUM").val(data.colostrum);				
 		 $("#VACCINE").val(data.vaccine);				
 		 $("#BIRTH_NUMBER").val(data.birth_NUMBER);				
 		 $("#BIRTH_CASE").val(data.birth_CASE);				

 		      
				}
			})
	
	
	
});



function modify(){
	   
	
	if(confirm("수정하시겠습니까?")) {
		  
		var quresearch = $('#regForm').serialize();
 console.log(quresearch);
		$.ajax({
			url : "${pageContext.request.contextPath }/ajax/birEntityUpdatetDo",
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
					url : "${pageContext.request.contextPath }/ajax/entityEntityDeleteDo",
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

<form name="regForm" id="regForm" method="post" style="margin-left: 10px; margin-right: 10px" action="/dbconn/entity/input_entity.jsp?entity_id=009157">
<input type="hidden" id="FARM_ID" name="FARM_ID" value="${farmId}">
<input type="hidden" id="ENTITY_ID" name="ENTITY_ID" value="${entity_id}">
<div align="left" style="padding-bottom: 5px">
	<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 개체자료수정</b></font>
</div>
<table class="table_003 w100p">
	<tbody>
		</tbody><colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		
		<tbody><tr>
			<th>개체 ID</th>
			<td style="padding-left: 5px">
            	<input type="text" name="ENTITY_ID" id="entity_id" disabled="disabled" value="${entity_id}" style="background-color: #e2e2e2;"><br>
            </td>
        </tr>
		<tr>
			<th>사육 형태</th>
			<td style="padding-left: 5px">
            	<input type="radio" name="BREEDING" value="사사"  style="position:relative; top:0.1em">사사&nbsp;&nbsp;
				<input type="radio" name="BREEDING" value="방목" style="position:relative; top:0.1em">방목<br>
            </td>
        </tr>
        <tr>
			<th>품종</th>
	        <td style="padding-left: 5px">
	        	<input type="radio" name="VARIETY" value="한우" style="position:relative; top:0.1em">한우&nbsp;&nbsp;
				<input type="radio" name="VARIETY" value="젖소" style="position:relative; top:0.1em">젖소<br>
			</td>
		</tr>
        <tr>
			<th>성별</th>
	        <td style="padding-left: 5px">
	        	<input type="radio" name="GENDER" value="male" style="position:relative; top:0.1em">Male&nbsp;&nbsp;
				<input type="radio" name="GENDER" value="female" style="position:relative; top:0.1em">Female<br>
			</td>
		</tr>
		<tr>
			<th>출생일</th>
			<td style="padding-left: 5px">
				<input name="BIRTH1" id="BIRTH1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }" value="" type="text" maxlength="4" style="width:50px; text-align: right; ">년
            	<input name="BIRTH2" id="BIRTH2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }" value="" type="text" maxlength="2" style="width:50px; text-align: right;">월
            	<input name="BIRTH3" id="BIRTH3" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }" value="" type="text" maxlength="2" style="width:50px; text-align: right;">일
            	<input name="BIRTH4" id="BIRTH4" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 24) { alert('1~24 사이의 숫자로 입력바랍니다.'); } }" value="" type="text" maxlength="2" style="width:50px; text-align: right;">시
			</td>
		</tr>
		<tr>
			<th>생시 체중</th>
			<td style="padding-left: 5px">
				<input style="width:50px; text-align: right;" type="text" name="BIRTH_WEIGHT" id="BIRTH_WEIGHT">&nbsp;&nbsp;(18 ~ 25(kg))<br>
			</td>
		</tr>
		<tr>
			<th>초유 섭취 유무</th>
			<td style="padding-left: 5px">
				<input type="radio" name="COLOSTRUM" value="1" style="position:relative; top:0.1em">Yes&nbsp;&nbsp;
				<input type="radio" name="COLOSTRUM" value="2" style="position:relative; top:0.1em">No<br>
			</td>
		</tr>
		<tr>
			<th>백신 접종 유무</th>
			<td style="padding-left: 5px">
				<input type="radio" name="VACCINE" value="1" style="position:relative; top:0.1em">Yes&nbsp;&nbsp;
				<input type="radio" name="VACCINE" value="2" style="position:relative; top:0.1em">No<br>
			</td>
		</tr>
		<tr>
			<th>모우의 산차</th>
			<td style="padding-left: 5px">
				<input type="radio" name="BIRTH_NUMBER" value="초산" style="position:relative; top:0.1em">초산&nbsp;&nbsp;
				<input type="radio" name="BIRTH_NUMBER" value="2산" style="position:relative; top:0.1em">2산&nbsp;&nbsp;
				<input type="radio" name="BIRTH_NUMBER" value="3산이상" style="position:relative; top:0.1em">3산 이상<br>
			</td>
		</tr>
		<tr>
			<th>수정 방법</th>
			<td style="padding-left: 5px">
				<input type="radio" name="BIRTH_CASE" value="인공수정" style="position:relative; top:0.1em">인공 수정&nbsp;&nbsp;
				<input type="radio" name="BIRTH_CASE" value="자연교배" style="position:relative; top:0.1em">자연 교배<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" id="mod" name="mod" value="modify">
				<input type="button" value="수정" onclick="modify()">
				<input type="button" value="삭제" onclick="del()">
				<input type="reset" value="취소">
			    <input type="reset" value="돌아가기" onclick="history.back()">
			</td>
		</tr>
	</tbody>
</table>

 
</form>
<c:import url="../../module/footer.jsp"></c:import>