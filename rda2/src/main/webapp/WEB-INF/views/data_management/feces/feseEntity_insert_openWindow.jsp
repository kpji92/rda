<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html><head>
 
  <link rel="stylesheet" href="resources/css_rda/common.css" type="text/css" />
<link rel="stylesheet" href="resources/css_rda/layout.css" type="text/css" />
<link rel="stylesheet" href="resources/css_rda/button.css" type="text/css" />
<link rel="stylesheet" href="resources/css_rda/table.css" type="text/css" />
<link rel="stylesheet" href="resources/css_rda/box.css" type="text/css" />
<link rel="stylesheet" href="resources/css_rda/searchbox.css" type="text/css" />
<link rel="stylesheet" href="resources/css_rda/jquery-ui.css" type="text/css" />
<link rel="stylesheet" href="resources/css_rda/navigation.css"
	type="text/css" />
<link rel="stylesheet" href="resources/css_rda/location.css" type="text/css" />


<script type="text/javascript" src="resources/js_rda/common.js"></script>
<script type="text/javascript" src="resources/js_rda/jquery-1.4.1.js"></script>
<script type="text/javascript" src="resources/js_rda/jquery-ui.js"></script>
                
	<script type="text/JavaScript">
     	function add() {
     		var f = document.regForm;
     		var chk = document.getElementById('FECES_IMAGE'); 
     		if(!chk.value){
			alert("이미지를 넣어주시기 바랍니다")
			}else {
     			if(confirm("등록하시겠습니까?")) {
				$('#regForm').submit();
     			}
			}
		}
     	
     	function insert(){

    
         		var f = document.regForm;
         		var chk = document.getElementById('FECES_IMAGE'); 
         		if(!chk.value){
    			alert("이미지를 넣어주시기 바랍니다")
    			}else {
         			if(confirm("등록하시겠습니까?")) {
    				$('#regForm').submit();
         			}
    			 
    		}
         	
         	
    	
     		if(confirm("입력하시겠습니까?")) {
     			var errormsg = 0;
     			 var form = $('#regForm')[0];
     			 var quresearch = new FormData(form);
 
     			 console.log(quresearch);
     					$.ajax({
     						url : "${pageContext.request.contextPath }/ajax/feseEntityInsertDo",
     						type : "POST",
     						//data : quresearch,
     						dataType : "POST",
     						success : function(data) {
     							alert('성공적으로 입력하였습니다.');
     							
     							//var result = data;
//      							if(result > 0){
//      								alert('성공적으로 입력하였습니다.');
// //     			 					location.href="farmList";
//      								 window.close();
//      							}else{
//      								alert('입력에 실패하였습니다.');
//      							}
     						},
     				complete : function() {
     					    	if (error == 0){
     					       alert("성공했습니다!");}
      					       window.close();
      					    }
 
     				 
     					});
     		}
     	}
	</script> 
   
    		       
                
	<title>과거 병력 정보 입력</title>
	<style id="style-1-cropbar-clipper">/* Copyright 2014 Evernote Corporation. All rights reserved. */
.en-markup-crop-options {
    top: 18px !important;
    left: 50% !important;
    margin-left: -100px !important;
    width: 200px !important;
    border: 2px rgba(255,255,255,.38) solid !important;
    border-radius: 4px !important;
}

.en-markup-crop-options div div:first-of-type {
    margin-left: 0px !important;
}
</style></head>
    
    
		
		
<body>
<br>




<div align="left" style="padding-bottom: 5px">
	<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="resources/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 분변자료입력</b></font>
</div>	
<table class="table_003 w100p">
<!-- <form id="regForm" name="regForm" method="post" style="margin-left: 10px; margin-right: 10px" action="/ajax/feseEntityInsertDo?entity_id=005107&amp;keyvalue=multipart" enctype="multipart/form-data"> -->
<form id="regForm" name="regForm" method="post" style="margin-left: 10px; margin-right: 10px" action="${pageContext.request.contextPath }/ajax/feseEntityInsertDo" enctype="multipart/form-data">

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
			<th>설사 발병 일시</th>
			<td style="padding-left: 5px">
				<input name="FECES_OCCURDATE1" id="FECES_OCCURDATE1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }" type="text" maxlength="4" style="width:50px; ">년
            	<input name="FECES_OCCURDATE2" id="FECES_OCCURDATE2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">월
            	<input name="FECES_OCCURDATE3" id="FECES_OCCURDATE3" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">일
            	<input name="FECES_OCCURDATE4" id="FECES_OCCURDATE4" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 24) { alert('1~24 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">시
			</td>
		</tr>
		<tr>
			<th>채취 일시</th>
			<td style="padding-left: 5px">
				<input name="FECES_GATHERDATE1" id="FECES_GATHERDATE1" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }" type="text" maxlength="4" style="width:50px; ">년
            	<input name="FECES_GATHERDATE2" id="FECES_GATHERDATE2" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">월
            	<input name="FECES_GATHERDATE3" id="FECES_GATHERDATE3" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">일
            	<input name="FECES_GATHERDATE4" id="FECES_GATHERDATE4" onkeyup="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 24) { alert('1~24 사이의 숫자로 입력바랍니다.'); } }" type="text" maxlength="2" style="width:50px;">시
			</td>
		</tr>
		<tr>
			<th>항생제 종류</th>
			<td style="padding-left: 5px">
				<input type="radio" name="ANTIBIOTICS" value="사료첨가용" style="position:relative; top:0.1em">사료첨가용&nbsp;&nbsp;
				<input type="radio" name="ANTIBIOTICS" value="치료용" style="position:relative; top:0.1em">치료용<br>
			</td>
		</tr>
		<tr>
			<th>사료 및 조사료</th>
			<td style="padding-left: 5px">
				<input type="text" name="FEED" id="FEED"><br>
			</td>
		</tr>
		<tr>
			<th>분변 이미지</th>
			<td style="padding-left: 5px">
				<input type="file" name="uploadfile" id="FECES_IMAGE"><br>
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
<!-- 	</tbody> -->
</tbody>

 </form>
</table>

 
</body></html>