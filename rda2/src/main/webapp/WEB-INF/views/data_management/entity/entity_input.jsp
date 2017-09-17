<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>

<% request.setCharacterEncoding("UTF-8"); %>


<html>
	

	<head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <link rel="stylesheet" href="../../../css/common.css" type="text/css" />
                <link rel="stylesheet" href="../../../css/layout.css" type="text/css" />
                <link rel="stylesheet" href="../../../css/button.css" type="text/css" />
                <link rel="stylesheet" href="../../../css/table.css" type="text/css" />
                <link rel="stylesheet" href="../../../css/box.css" type="text/css" />
                <link rel="stylesheet" href="../../../css/searchbox.css" type="text/css" />
                <link rel="stylesheet" href="../../../css/jquery-ui.css" type="text/css" />
                <link rel="stylesheet" href="../../../css/navigation.css" type="text/css" />
                <link rel="stylesheet" href="../../../css/location.css" type="text/css" />
        
        
                <script type="text/javascript" src="../../js/common.js"></script>
                <script type="text/javascript" src="../../js/jquery-1.4.1.js"></script>
                <script type="text/javascript" src="../../js/jquery-ui.js"></script>
                
     <script type="text/JavaScript">
     	function add() {
/*      		
     		var f = document.regForm;
     		if(f.bw.value < 18.0 || f.bw.value > 25.0){
     			alert("범위 내체중을 입력하세요(18.0 ~ 25.0)");
     			f.bw.focus();
     			return;
     		}
 */
     		
			if(confirm("등록하시겠습니까?")) {
				$('#regForm').submit();
			}
		}
	</script> 
		<%
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		String farm_id = request.getParameter("farm_id");
		System.out.println(farm_id);
		int rsnewid = 0;
		String newid = null;
		Class.forName("oracle.jdbc.driver.OracleDriver");
	
	    	String url="jdbc:oracle:thin:@192.168.0.100:1521:kis";
	    	String user = "admin";
	    	String passwd = "sRc0488#";
		
		try{
		
			conn = DriverManager.getConnection(url,user,passwd);
			stmt = conn.createStatement();
			String SQL;
			
			SQL = "SELECT nvl(max(substr(entity_id,4,6)),0)+1 FROM rda_test.entity"; 
			
			rs = stmt.executeQuery(SQL);
			
			if(rs != null){
		        while(rs.next()){
					rsnewid = Integer.parseInt(rs.getString(1));
		        }
	        }
			
			if(rsnewid < 10){
				newid = farm_id+"00" + rsnewid;
			}else if(rsnewid >= 10 && rsnewid <100){
				newid = farm_id+"0" + rsnewid;
			}else{
				newid = farm_id + String.valueOf(rsnewid);
			}
			
			System.out.println(newid);
		}catch(SQLException sqlException){
			System.out.println("sql exception");
		}catch(Exception exception){
				System.out.println("exception");
		}finally{
				if(rs !=null)try{rs.close();}catch(SQLException ex){}
			if(stmt !=null)try{stmt.close();}catch(SQLException ex){}
			if(conn !=null)try{conn.close();}catch(Exception ex){}
		}
		%>
	<title>정보입력</title>
	</head>
    
    
		
		
<body>
<br>

<form id="regForm" name="regForm" method="post" style="margin-left: 10px; margin-right: 10px" action="/dbconn/entity/input_entity.jsp?entity_id=<%=newid%>">

<div align="left" style="padding-bottom: 5px">
	<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="<%= request.getContextPath() %>/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 개체정보입력</b></font>
</div>
<table class="table_003 w100p">
	<tbody>
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<tr>
			<th>관리번호</th>
			<td style="padding-left: 5px">
            	<input type="hidden" name="entity_id" id="entity_id" value="<%=newid %>">
            	<input type="text" name="casenum" id="casenum"><br>
            </td>
        </tr>
		<tr>
			<th>사육 형태</th>
			<td style="padding-left: 5px">
            	<input type="radio" name="breed" value="사사" style="position:relative; top:0.1em"></input>사사&nbsp;&nbsp;
				<input type="radio" name="breed" value="방목" style="position:relative; top:0.1em"></input>방목<br>
            </td>
        </tr>
        <tr>
			<th>품종</th>
	        <td style="padding-left: 5px">
	        	<input type="radio" name="variety" value="한우" style="position:relative; top:0.1em"></input>한우&nbsp;&nbsp;
				<input type="radio" name="variety" value="젖소" style="position:relative; top:0.1em"></input>젖소&nbsp;&nbsp;
				<input type="radio" name="variety" value="말" style="position:relative; top:0.1em"></input>말<br>
			</td>
		</tr>
        <tr>
			<th>성별</th>
	        <td style="padding-left: 5px">
	        	<input type="radio" name="gender" value="male" style="position:relative; top:0.1em"></input>Male&nbsp;&nbsp;
				<input type="radio" name="gender" value="femala" style="position:relative; top:0.1em"></input>Female<br>
			</td>
		</tr>
		<tr>
			<th>출생일</th>
			<td style="padding-left: 5px">
				<input name="birth1" id="birth1"
					onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }"
					type="text" maxlength="4" style='width:50px; text-align: right; ' />년
            	<input name="birth2" id="birth2"
            		onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }"
            		type="text" maxlength="2" style='width:50px; text-align: right;' />월
            	<input name="birth3" id="birth3"
            		onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }"
            		type="text" maxlength="2" style='width:50px; text-align: right;' />일
            	<input name="birth4" id="birth4"
            		onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 24) { alert('1~24 사이의 숫자로 입력바랍니다.'); } }"
            		type="text" maxlength="2" style='width:50px; text-align: right;' />시
			</td>
		</tr>
		<tr>
			<th>생시 체중</th>
			<td style="padding-left: 5px">
				<input style='width:50px; text-align: right;' type="text" name="bw" id="bw" >18 ~ 25(kg)<br>
			</td>
		</tr>
		<tr>
			<th>초유 섭취 유무</th>
			<td style="padding-left: 5px">
				<input type="radio" name="colo" value="1" style="position:relative; top:0.1em"></input>Yes&nbsp;&nbsp;
				<input type="radio" name="colo" value="2" style="position:relative; top:0.1em"></input>No<br>
			</td>
		</tr>
		<tr>
			<th>백신 접종 유무</th>
			<td style="padding-left: 5px">
				<input type="radio" name="vac" value="1" style="position:relative; top:0.1em"></input>Yes&nbsp;&nbsp;
				<input type="radio" name="vac" value="2" style="position:relative; top:0.1em"></input>No<br>
			</td>
		</tr>
		<tr>
			<th>모우의 산차</th>
			<td style="padding-left: 5px">
				<input type="radio" name="bn" value="초산" style="position:relative; top:0.1em"></input>초산&nbsp;&nbsp;
				<input type="radio" name="bn" value="2산" style="position:relative; top:0.1em"></input>2산&nbsp;&nbsp;
				<input type="radio" name="bn" value="3산이상" style="position:relative; top:0.1em"></input>3산 이상<br>
			</td>
		</tr>
		<tr>
			<th>수정 방법</th>
			<td style="padding-left: 5px">
				<input type="radio" name="bc" value="인공수정" style="position:relative; top:0.1em"></input>인공 수정&nbsp;&nbsp;
				<input type="radio" name="bc" value="자연교배" style="position:relative; top:0.1em"></input>자연 교배<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" id="mod" name="mod" value="add">
				<input type="button" value="저장" onclick="add()">
				<input type="reset" value="취소">
				<input type="reset" value="돌아가기" onClick="history.back()">
			</td>
		</tr>
	</tbody>
</table>

</body> 
</html>