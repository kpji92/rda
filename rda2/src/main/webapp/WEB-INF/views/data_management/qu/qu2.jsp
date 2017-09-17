<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8" --%>
<%-- 	pageEncoding="UTF-8"%> --%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>

<%
	request.setCharacterEncoding("UTF-8");
	String fname = request.getParameter("farm_fname");
	fname=  new String(fname.getBytes("8859_1"), "utf-8");
%>


<html>


<head>
<meta http-equiv="X-UA-Compatible" content="IE=10">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
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
function input_qu() {
	var f = document.regForm;
	if (f.Q1.value >= 1 && f.Q2.value >= 1 && f.Q3.value >= 1
			&& f.Q4.value >= 1 && f.Q5.value >= 1 && f.Q6.value >= 1
			&& f.Q7.value >= 1 && f.Q8.value >= 1 && f.Q9.value >= 1
			&& f.Q10.value >= 1 && f.Q11.value >= 1 && f.Q12.value >= 1
			&& f.Q13.value >= 1 && f.Q14.value >= 1 && f.Q15.value >= 1
			&& f.Q16.value >= 1 && f.Q17.value >= 1 && f.Q18.value >= 1
			&& f.Q19.value >= 1 && f.Q20.value >= 1 && f.Q21.value >= 1
			&& f.Q22.value >= 1 && f.Q23.value >= 1 && f.Q24.value >= 1
			&& f.Q25.value >= 1 && f.Q26.value >= 1 && f.Q27.value >= 1 
			&& f.Q_DATE1.value >= 1 && f.Q_DATE2.value >= 1 && f.Q_DATE3.value >= 1
			&& f.NAME.value != "") {}else {
				alert("설문표를 다 작성해주시기 바랍니다");
 				return false;
			}//end of else

	if(confirm("등록하시겠습니까?")) {
 
		var quresearch = $('#regForm').serialize();
 console.log(quresearch);
		$.ajax({
			url : "${pageContext.request.contextPath }/ajax/input_qu",
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


	function add() {

		var f = document.regForm;
	 
		if (f.Q1.value >= 1 && f.Q2.value >= 1 && f.Q3.value >= 1
				&& f.Q4.value >= 1 && f.Q5.value >= 1 && f.Q6.value >= 1
				&& f.Q7.value >= 1 && f.Q8.value >= 1 && f.Q9.value >= 1
				&& f.Q10.value >= 1 && f.Q11.value >= 1 && f.Q12.value >= 1
				&& f.Q13.value >= 1 && f.Q14.value >= 1 && f.Q15.value >= 1
				&& f.Q16.value >= 1 && f.Q17.value >= 1 && f.Q18.value >= 1
				&& f.Q19.value >= 1 && f.Q20.value >= 1 && f.Q21.value >= 1
				&& f.Q22.value >= 1 && f.Q23.value >= 1 && f.Q24.value >= 1
				&& f.Q25.value >= 1 && f.Q26.value >= 1 && f.Q27.value >= 1 
				&& f.Q_DATE1.value >= 1 && f.Q_DATE2.value >= 1 && f.Q_DATE3.value >= 1
				&& f.NAME.value != "") {
			if (confirm("등록하시겠습니까?")) {
				$('#regForm').submit();
			}//end of if
		} else {
			alert("설문표를 다 작성해주시기 바랍니다");

		}//end of else

	}//end of add
</script>


<title>설문조사</title>
</head>
<body  scroll=auto style="overflow-x:hidden">


	<style type="text/css">
.tg {
	border-collapse: collapse;
	border-spacing: 0;
}

.tg td {
	font-family: Arial, sans-serif;
	font-size: 14px;
	padding: 0px 10px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
	border-right: none;
}

.tg th {
	font-family: Arial, sans-serif;
	font-size: 14px;
	font-weight: normal;
	padding: 0px 10px;
	border-style: solid;
	border-width: 1px;
	overflow: hidden;
	word-break: normal;
}

.tg .tg-s6z2 {
	text-align: center
}

.tg .tg-hgcj {
	font-weight: bold;
	text-align: center
}

.tg .tg-amwm {
	font-weight: bold;
	text-align: center;
	vertical-align: top
}
</style>


<!-- 	<form id="regForm" name="regForm" method="post" -->
<%-- 		style="margin-left: 5px; margin-right: 5px;" action="/dbconn/farm/input_qu.jsp?FNAME=<%=fname%>"> --%>
<form id="regForm" name="regForm" method="post"
		style="margin-left: 5px; margin-right: 5px;" action="/ajax/input_qu">
		<!-- 		style="margin-left: 5px; margin-right: 200px; width:1500px" style="TABLE-LAYOUT: fixed; -->
		<div align="left" style="padding-bottom: 5px">
			&nbsp;<br> <br> <font
				style="color: #000000; font-family: gulim; font-size: 14px;"><b><img
					src="resources/images/icon/board.png"
					style="width: 20px; position: relative; top: 0.2em">목장설문조사(<%=fname%>)</b></font>
<input type="hidden" name="FNAME"
						id="FNAME" value="<%=fname%>">
		</div>
		<table class="table_003 w100p">
			<!-- 	<colgroup> -->
			<!-- 		<col width="20%"> -->
			<!-- 		<col width="80%"> -->
			<!-- 	</colgroup> -->
			<table  border="0" align="right">
				<tr align="right">
                     <br>
                     <div align="right">
					<td class="tg-hgcj" align="right">점검일</td>
					<td style="padding-left: 5px" align="right">
					<input name="Q_DATE1"
						id="Q_DATE1"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }"
						type="text" maxlength="4" style='width: 50px;' />년 <input
						name="Q_DATE2" id="Q_DATE2"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }"
						type="text" maxlength="2" style='width: 50px;' />월 <input
						name="Q_DATE3" id="Q_DATE3"
						onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }"
						type="text" maxlength="2" style='width: 50px;' />일</td>
					<td class="tg-hgcj" align="right">점검자</td>
					<td style="padding-left: 5px" align="right"><input type="text" name="NAME"
						id="NAME"></td>
						</div>
				</tr>
			</table>
			<br><br>
			<table class="table_003 w100p">

<!-- 				<b style="font-size: 15px">●환경요인(위생상태,사양형태)</b> -->
				
				<tr width="50px">
					<th width="50%" height="1" rowspan="2">점검항목</th>
					<th height="1" colspan="5" align="c">평가점수</th>
				</tr>
				<tr>
					<th width="100">불량</th>
					<th width="100">미흡</th>
					<th width="100">보통</th>
					<th width="100">잘함</th>
					<th width="100">우수</th>
				</tr>
				<tr><th colspan="6" align="left"> ●환경요인(위생상태,사양형태)</th></tr>
				<tr width="50px">
					<td width="50%">축사바닥 위생이 양호한가?</td>
					<td align="center"><input type="radio" name="Q1" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%" align="center"></input></td>

					<td align="center"><input type="radio" name="Q1" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%" align="center"></input></td>

					<td align="center"><input type="radio" name="Q1" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%" align="center"></input></td>
					<td align="center"><input type="radio" name="Q1" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%" align="center"></input></td>
					<td align="center"><input type="radio" name="Q1" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%" align="center"></input></td>
				</tr>
				<tr>
					<td >급이조, 급수조 청결도가 양호한가?</td>
					<td align="center"><input type="radio" name="Q2" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q2" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q2" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q2" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q2" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >축사 내 정기적(월 1-2회)으로 소독을 실시하는가?</td>
					<td align="center"><input type="radio" name="Q3" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q3" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q3" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q3" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q3" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >축사 내부용 작업복 및 작업화를사용하며 위생상태가 양호한가?</td>
					<td align="center"><input type="radio" name="Q4" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q4" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q4" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q4" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q4" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >설사 분변을 바로 제거해주는가?</td>
					<td align="center"><input type="radio" name="Q5" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q5" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q5" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q5" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q5" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >농장 내 소들의 털에 윤기가 있고 깨끗한가?</td>
					<td align="center"><input type="radio" name="Q6" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q6" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q6" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q6" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q6" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >외부기생충 및 내부기생충 구제를 주기적으로 실시하는가?</td>
					<td align="center"><input type="radio" name="Q7" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q7" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q7" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q7" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q7" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >농장 내 파리, 모기 등의 유해곤충을 막기 위해 조치하는가?</td>
					<td align="center"><input type="radio" name="Q8" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q8" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q8" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q8" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q8" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >야생동물(조류 포함)의 접근을 차단하기 위해 조치하는가?</td>
					<td align="center"><input type="radio" name="Q9" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q9" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q9" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q9" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q9" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >축사 내 타 축종(개 포함)을 사육하지 않으며 접촉을 차단하고 있는가?</td>
					<td align="center"><input type="radio" name="Q10" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q10" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q10" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q10" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q10" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >사료의 질 및 위생 관리에 힘쓰며 불량사료는 사용하지 않고 폐기하는가?</td>
					<td align="center"><input type="radio" name="Q11" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q11" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q11" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q11" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q11" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
			

			
				<tr><th colspan="6" align="left"> ●어미소</th></tr>
			
				<!-- 				<tr> -->
				<!-- 					<th rowspan="2">점검항목</th> -->
				<!-- 					<th colspan="6">평가점수</th> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<th>불량</th> -->
				<!-- 					<th>미흡</th> -->
				<!-- 					<th>보통</th> -->
				<!-- 					<th>잘함</th> -->
				<!-- 					<th>우수</th> -->
				<!-- 				</tr> -->
				<tr>
					<td>미경산우 번식적기에 번식을 시작하며 번식상황을 계속적으로 체크하는가?(송아지
						분만시기 예측)</td>
					<td align="center"><input type="radio" name="Q12" value="1" id="Q1"
						style="position: relative; top: 0.1em" ></input></td>

					<td align="center"><input type="radio" name="Q12" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q12" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q12" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q12" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td width="190px">분만이 주로 봄, 가을에 이루어지는가?</td>
					<td align="center"><input type="radio" name="Q13" value="1" id="Q1"
						style="position: relative; top: 0.1em" ></input></td>

					<td align="center"><input type="radio" name="Q13" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q13" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q13" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q13" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td width="190px">분만 전 설사병 예방백신을 접종하는가? (적기접종, 설사 원인체별 백신
						접종여부)</td>
					<td align="center"><input type="radio" name="Q14" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q14" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q14" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q14" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q14" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td width="190px">분만 전 분만칸 소독과 분만 후 유방 소독을 실시하는가?</td>
					<td align="center"><input type="radio" name="Q15" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q15" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q15" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q15" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q15" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td width="190px">분만 후 농후사료를 과다급여하거나 저급의 조사료를 사용하는가?</td>
					<td align="center"><input type="radio" name="Q16" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q16" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q16" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q16" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q16" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td width="190px">우수한 어미소를 사용하여 번식하며 번식군을 주기적으로
						교체하는가?(미경산우/경산우 비율 체크)</td>
					<td align="center"><input type="radio" name="Q17" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q17" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q17" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q17" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q17" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>

		
			
				<tr><th colspan="6" align="left"> ●송아지</th></tr>
				
				<!-- 				<tr> -->
				<!-- 					<th rowspan="2">점검항목</th> -->
				<!-- 					<th colspan="6">평가점수</th> -->
				<!-- 				</tr> -->
				<!-- 				<tr> -->
				<!-- 					<th>불량</th> -->
				<!-- 					<th>미흡</th> -->
				<!-- 					<th>보통</th> -->
				<!-- 					<th>잘함</th> -->
				<!-- 					<th>우수</th> -->
				<!-- 				</tr> -->
				<tr>
					<td width="78%">설사병 백신을 올바르게 사용하는가?(어미소 분만 전 접종 또는 초유섭취 전
						경구투여)</td>
					<td align="center"><input type="radio" name="Q18" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q18" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q18" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q18" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q18" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >송아지 분만 후 2시간 이내 초유섭취유무를 확인하며 필요시 추가급여를 하는가?</td>
					<td align="center"><input type="radio" name="Q19" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q19" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q19" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q19" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q19" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >설사 증상이 있는 경우 원인별 치료를 시행하는가?(농가 임의 치료시 보통, 치료하지
						않으면 미흡)</td>
					<td align="center"><input type="radio" name="Q20" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q20" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q20" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q20" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q20" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >면역증강제, 미네랄, 비타민 등을 급여하는가?</td>
					<td align="center"><input type="radio" name="Q21" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q21" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q21" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q21" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q21" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >설사가 있는 경우 제한급여를 시행하는가?</td>
					<td align="center"><input type="radio" name="Q22" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q22" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q22" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q22" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q22" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >송아지 전용구역이 있고 위생상태가 좋은가?</td>
					<td align="center"><input type="radio" name="Q23" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q23" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q23" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q23" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q23" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >송아지 보온을 위한 장비(보온등, 옷 등)를 사용하는가?</td>
					<td align="center"><input type="radio" name="Q24" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q24" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q24" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q24" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q24" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >송아지가 제한된 구역(전용공간, 어미소 사육공간)만을 출입하는가?</td>
					<td align="center"><input type="radio" name="Q25" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q25" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q25" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q25" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q25" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >송아지 전용 사료가 급여되는가?</td>
					<td align="center"><input type="radio" name="Q26" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q26" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q26" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q26" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q26" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
					<td >분만 직후 제때 소독을 시행하는가?</td>
					<td align="center"><input type="radio" name="Q27" value="1" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q27" value="2" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>

					<td align="center"><input type="radio" name="Q27" value="3" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q27" value="4" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
					<td align="center"><input type="radio" name="Q27" value="5" id="Q1"
						style="position: relative; top: 0.1em" width="5%"></input></td>
				</tr>
				<tr>
<!-- 				<input type="reset" value="돌아가기" onClick="history.back()">  -->
					<th colspan="6" align="center"><input type="hidden" id="mod" name="mod" value="add">
						<input type="button" value="저장" onclick="input_qu()"> <input
						type="reset" value="취소"></th>
				</tr>


			</table>
</table>
	</form>

</body>
</html>