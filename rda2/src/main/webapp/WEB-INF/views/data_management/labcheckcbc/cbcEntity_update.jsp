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
	 
// 			$.ajax({
// 				url : "${pageContext.request.contextPath }/ajax/mhEntityUpdateSelectOne?entity_id=${entity_id}",
// 				type : "POST",
// 				success : function(data) {
//  		 console.log(data);

//  		 console.log(data.birth);
 		 
//  		 $("#cure1").val(data.cure1);				
//  		 $("#cure2").val(data.cure2);				
//  		 $("#cure3").val(data.cure3);				
//  		 $("#cure4").val(data.cure4);		
//  		 $("#occur1").val(data.occur1);				
//  		 $("#occur2").val(data.occur2);		 
//  		 $("#occur3").val(data.occur3);				
//  		 $("#occur4").val(data.occur4);		
//  		 $("#DISEASE").val(data.disease);	 
//  		 $("#PRESCRIBE").val(data.prescribe);				
//  		 $("#recov1").val(data.recov1);				
//  		 $("#recov2").val(data.recov2);		 
//  		 $("#recov3").val(data.recov3);				
//  		 $("#recov4").val(data.recov4);				
 
 		      
// 				}
// 			})
	
	
	
});



function modify(){
	   
	
	if(confirm("수정하시겠습니까?")) {
		  
		var quresearch = $('#regForm').serialize();
 console.log(quresearch);
		$.ajax({
			url : "${pageContext.request.contextPath }/ajax/cbcEntityUpdateDo",
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
					url : "${pageContext.request.contextPath }/ajax/cbcEntityDeleteDo",
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
<input type="hidden" id="SEQNO" name="SEQNO" value="${EntityList.getSEQNO()}">
<input type="hidden" id="ENTITY_ID" name="ENTITY_ID" value="${entity_id}">
 
<div align="left" style="padding-bottom: 5px">
	<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> C B C 검 사 정 보 입 력</b></font>
</div>
<table class="table_003 w100p">
	<colgroup>
		<col width="10%">
		<col width="40%">
		<col width="10%">
		<col width="40%">
	</colgroup>
	
	
		<tbody><tr>
			<th>개체 ID</th>
			<td style="padding-left: 5px">
            	<input type="text" name="entity_id" id="entity_id" disabled="disabled" value="${entity_id}" style="background-color: #e2e2e2;"><br>
            </td>
            <th>혈액검사 CBC 채취일</th>
			<td style="padding-left: 5px">
				<input name="cbc_gat1" id="cbc_gat1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }" value="null" type="text" maxlength="4" style="width:50px; text-align: right;">년
            	<input name="cbc_gat2" id="cbc_gat2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }" value="null" type="text" maxlength="2" style="width:50px; text-align: right;">월
            	<input name="cbc_gat3" id="cbc_gat3" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }" value="null" type="text" maxlength="2" style="width:50px; text-align: right;">일
            	<input name="cbc_gat4" id="cbc_gat4" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 24) { alert('1~24 사이의 숫자로 입력바랍니다.'); } }" value="null" type="text" maxlength="2" style="width:50px; text-align: right;">시
			</td>
        </tr>
        
        <tr>
			<th>RBC(M/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="RBC" id="RBC" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getRBC()}">M/µL(4.47~9.35)<br>
			</td>
			<th>HCT(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="HCT" id="HCT" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getHCT()}">%"\t"(22.5~39.9)<br>
			</td>
		</tr>
		<tr>
			<th>Hb(g/dL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="HB" id="HB" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getHB()}">g/dL&nbsp;&nbsp;&nbsp;(7.4~12.8)<br>
			</td>
			<th>MCV(fL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="MCV" id="MCV" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getMCV()}">fL&nbsp;&nbsp;(40.4~56.4)<br>
			</td>
		</tr>
		<tr>
			<th>MCH(pg)</th>
			<td style="padding-left: 5px">
				<input type="text" name="MCH" id="MCH" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getMCH()}">pg&nbsp;&nbsp;&nbsp;&nbsp;(11.5~18.5)<br>
			</td>
			<th>MCHC(g/dL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="MCHC" id="MCHC" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getMCHC()}">g/dL&nbsp;&nbsp;(30.2~33.5)<br>
			</td>
		</tr>
		<tr>
			<th>RDW(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="RDW" id="RDW" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getRDW()}">%&nbsp;&nbsp;&nbsp;&nbsp;(20.0~35.9)<br>
			</td>
			<th>RETIC(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="RETIC1" id="RETIC1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getRETIC1()}">%&nbsp;&nbsp;(미정)<br>
			</td>
		</tr>
		<tr>
			<th>RETIC(k/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="RETIC2" id="RETIC2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getRETIC2()}">k/µL&nbsp;&nbsp;(0~3.9)<br>
			</td>
			<th>WBC(K/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="WBC" id="WBC" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getWBC()}">K/µL&nbsp;&nbsp;(2.71~17.76)<br>
			</td>
		</tr>
		<tr>
			<th>NE(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="NE1" id="NE1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getNE1()}">%&nbsp;&nbsp;&nbsp;&nbsp;(15.0~47.0)<br>
			</td>
			<th>LY(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="LY1" id="LY1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getLY1()}">%&nbsp;&nbsp;(45.0~75.0)<br>
			</td>
		</tr>
		<tr>
			<th>MO(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="MO1" id="MO1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getMO1()}">%&nbsp;&nbsp;&nbsp;&nbsp;(0.0~11.0)<br>
			</td>
			<th>EO(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="EO1" id="EO1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getEO1()}">%&nbsp;&nbsp;(0.0~20.0)<br>
			</td>
		</tr>
		<tr>
			<th>BA(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="BA1" id="BA1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getBA1()}">%&nbsp;&nbsp;&nbsp;&nbsp;(0.0~3.5)<br>
			</td>
			<th>NE(k/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="NE2" id="NE2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getNE2()}">k/µL&nbsp;&nbsp;(0.68~6.94)<br>
			</td>
		</tr>
		<tr>
			<th>LY(K/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="LY2" id="LY2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getLY2()}">K/µL&nbsp;&nbsp;(1.20~10.62)<br>
			</td>
			<th>MO(K/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="MO2" id="MO2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getMO2()}">K/µL&nbsp;&nbsp;(0.02~2.17)<br>
			</td>
		</tr>
		<tr>
			<th>EO(K/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="EO2" id="EO2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getEO2()}">K/µL&nbsp;&nbsp;(0.01~1.23)<br>
			</td>
			<th>BA(K/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="BA2" id="BA2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getBA2()}">K/µL&nbsp;&nbsp;(0.00~0.04)<br>
			</td>
		</tr>
		<tr>
			<th>PLT(k/µL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="PLT" id="PLT" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getPLT()}">k/µL&nbsp;&nbsp;(147~663)<br>
			</td>
			<th>MPV(fL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="MPV" id="MPV" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getMPV()}">fL&nbsp;&nbsp;(5.9~8.2)<br>
			</td>
		</tr>
		<tr>
			<th>PDW(fL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="PDW" id="PDW" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getPDW()}">fL&nbsp;&nbsp;&nbsp;&nbsp;(6.0~10.1)<br>
			</td>
			<th>PCT(%)</th>
			<td style="padding-left: 5px">
				<input type="text" name="PCT" id="PCT" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getPCT()}">%&nbsp;&nbsp;(0.12~0.42)<br>
			</td>
		</tr>
		<tr>
			<th>Fibronogen(mg/dL)</th>
			<td style="padding-left: 5px">
				<input type="text" name="FMM" id="FMM" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 999) { this.value = this.value.substring(0,4); } }" value="${EntityList.getFMM()}">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;(200~700)<br>
			</td>
			<th></th>
			<td></td>
		</tr>
		<tr>
			<td colspan="4" align="center">
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