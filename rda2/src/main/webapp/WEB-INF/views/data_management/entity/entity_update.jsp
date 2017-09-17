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
                
	<%!
	String setNull(String value){
		if(value == null){
			return "";
		}else if(value.equals("null")){
			return "";
		}else{
			return value;	
		}
	}
%>
<%
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String entity_num = null, entity_breed = null, entity_variety = null, entity_gender = null,  entity_bn = null, entity_bc = null;
		String entity_birth = null, entity_birth1 = null, entity_birth2 = null, entity_birth3 = null, entity_birth4 = null;
		int entity_colo = 0, entity_vac = 0;
		float  entity_bw = 0;
		Class.forName("oracle.jdbc.driver.OracleDriver");

        	String url="jdbc:oracle:thin:@192.168.0.100:1521:kis";
        	String user = "admin";
        	String passwd = "sRc0488#";

        	String entity_id = request.getParameter("entity_id");		// entity_list_entity에서 전송받은 entity_id
    		System.out.println(entity_id);
    		
    		conn = DriverManager.getConnection(url,user,passwd);
    		stmt = conn.createStatement();
    		String SQL;
%>
	
		<script type="text/JavaScript">
     	function modify() {
     		var f = document.regForm;
     		f.mod.value = "modify";
			if(confirm("수정하시겠습니까?")) {
				
// 				$('#regForm').submit();
f.submit();
			}
		}

     	function del() {
     		var f = document.regForm;
     		f.mod.value = "del";
    		if(confirm("삭제하시겠습니까?")) {
//     			$('#regForm').submit();
    			f.submit();
    		}
    	}
     	


	</script>
	<title>정보입력</title>
	</head>
    
    
		
		
<body>
<br>

<form name="regForm" method="post" style="margin-left: 10px; margin-right: 10px" action="/dbconn/entity/input_entity.jsp?entity_id=<%=entity_id%>">

<div align="left" style="padding-bottom: 5px">
	<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="<%= request.getContextPath() %>/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 개체자료수정</b></font>
</div>
<table class="table_003 w100p">
	<tbody>
		<colgroup>
			<col width="20%">
			<col width="80%">
		</colgroup>
		<%
				
				try{
					
			        String SQL2;
			        
			        
/*--------------------------------------------------- 조건에 맞는 데이터를 출력하는 쿼리  -------------------------------------------------*/
			        
			     
			        
					SQL2 = "select * from rda_test.entity where entity_id = " + entity_id;
				    
					
					
					
/*--------------------------------------------------- 조건에 맞는 데이터를 출력하는 쿼리  -------------------------------------------------*/


					
					rs = stmt.executeQuery(SQL2);
					if(rs != null){
				        while(rs.next()){
							entity_num = rs.getString(1);
							entity_breed = rs.getString(2);
							entity_variety = rs.getString(3);
							entity_gender = rs.getString(4);
							entity_birth = rs.getString(5);
							entity_bw = rs.getFloat(6);
							entity_colo = rs.getInt(7);
							entity_vac = rs.getInt(8);
							entity_bn = rs.getString(9);
							entity_bc = rs.getString(10);
		        		}
				        entity_birth1 = entity_birth.substring(0, entity_birth.indexOf("년"));
				        entity_birth2 = entity_birth.substring(entity_birth.indexOf("년")+1, entity_birth.indexOf("월"));
				        entity_birth3 = entity_birth.substring(entity_birth.indexOf("월")+1, entity_birth.indexOf("일"));
				        entity_birth4 = entity_birth.substring(entity_birth.indexOf("일")+1, entity_birth.indexOf("시"));
					}
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
		<tr>
			<th>개체 ID</th>
			<td style="padding-left: 5px">
            	<input type="text" name="entity_id" id="entity_id" disabled="disabled" value="<%=entity_num %>" style="background-color: #e2e2e2;" ><br>
            </td>
        </tr>
		<tr>
			<th>사육 형태</th>
			<td style="padding-left: 5px">
            	<input type="radio" name="breeding" value="사사" <%=("사사".equals(entity_breed))?"checked":""%> style="position:relative; top:0.1em"></input>사사&nbsp;&nbsp;
				<input type="radio" name="breeding" value="방목" <%=("방목".equals(entity_breed))?"checked":""%> style="position:relative; top:0.1em"></input>방목<br>
            </td>
        </tr>
        <tr>
			<th>품종</th>
	        <td style="padding-left: 5px">
	        	<input type="radio" name="variety" value="한우" <%=("한우".equals(entity_variety))?"checked":""%> style="position:relative; top:0.1em"></input>한우&nbsp;&nbsp;
				<input type="radio" name="variety" value="젖소" <%=("젖소".equals(entity_variety))?"checked":""%> style="position:relative; top:0.1em"></input>젖소<br>
			</td>
		</tr>
        <tr>
			<th>성별</th>
	        <td style="padding-left: 5px">
	        	<input type="radio" name="gender" value="male" <%=("male".equals(entity_gender))?"checked":""%> style="position:relative; top:0.1em"></input>Male&nbsp;&nbsp;
				<input type="radio" name="gender" value="female" <%=("female".equals(entity_gender))?"checked":""%> style="position:relative; top:0.1em"></input>Female<br>
			</td>
		</tr>
		<tr>
			<th>출생일</th>
			<td style="padding-left: 5px">
				<input name="birth1" id="birth1"
					onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 9999) { this.value = this.value.substring(0,4); } }"
					value="<%=entity_birth1 %>" type="text" maxlength="4" style='width:50px; text-align: right; ' />년
            	<input name="birth2" id="birth2"
            		onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 12) { alert('1~12 사이의 숫자로 입력바랍니다.'); } }"
            		value="<%=entity_birth2 %>" type="text" maxlength="2" style='width:50px; text-align: right;' />월
            	<input name="birth3" id="birth3"
            		onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 31) { alert('1~32 사이의 숫자로 입력바랍니다.'); } }"
            		value="<%=entity_birth3 %>" type="text" maxlength="2" style='width:50px; text-align: right;' />일
            	<input name="birth4" id="birth4"
            		onKeyUp="if ( isNaN(this.value) ) { alert('숫자만 입력가능합니다.'); this.value=''; } else { if(this.value > 24) { alert('1~24 사이의 숫자로 입력바랍니다.'); } }"
            		value="<%=entity_birth4 %>" type="text" maxlength="2" style='width:50px; text-align: right;' />시
			</td>
		</tr>
		<tr>
			<th>생시 체중</th>
			<td style="padding-left: 5px">
				<input style='width:50px; text-align: right;' value="<%=entity_bw %>" type="text" name="bw" id="bw" >&nbsp;&nbsp;(18 ~ 25(kg))<br>
			</td>
		</tr>
		<tr>
			<th>초유 섭취 유무</th>
			<td style="padding-left: 5px">
				<input type="radio" name="colo" value="1" <%=(1 == entity_colo)?"checked":""%> style="position:relative; top:0.1em"></input>Yes&nbsp;&nbsp;
				<input type="radio" name="colo" value="2" <%=(2 == entity_colo)?"checked":""%> style="position:relative; top:0.1em"></input>No<br>
			</td>
		</tr>
		<tr>
			<th>백신 접종 유무</th>
			<td style="padding-left: 5px">
				<input type="radio" name="vac" value="1" <%=(1 == entity_vac)?"checked":""%> style="position:relative; top:0.1em"></input>Yes&nbsp;&nbsp;
				<input type="radio" name="vac" value="2" <%=(2 == entity_vac)?"checked":""%> style="position:relative; top:0.1em"></input>No<br>
			</td>
		</tr>
		<tr>
			<th>모우의 산차</th>
			<td style="padding-left: 5px">
				<input type="radio" name="bn" value="초산" <%=("초산".equals(entity_bn))?"checked":""%> style="position:relative; top:0.1em"></input>초산&nbsp;&nbsp;
				<input type="radio" name="bn" value="2산" <%=("2산".equals(entity_bn))?"checked":""%> style="position:relative; top:0.1em"></input>2산&nbsp;&nbsp;
				<input type="radio" name="bn" value="3산이상" <%=("3산이상".equals(entity_bn))?"checked":""%> style="position:relative; top:0.1em"></input>3산 이상<br>
			</td>
		</tr>
		<tr>
			<th>수정 방법</th>
			<td style="padding-left: 5px">
				<input type="radio" name="bc" value="인공수정" <%=("인공수정".equals(entity_bc))?"checked":""%> style="position:relative; top:0.1em"></input>인공 수정&nbsp;&nbsp;
				<input type="radio" name="bc" value="자연교배" <%=("자연교배".equals(entity_bc))?"checked":""%> style="position:relative; top:0.1em"></input>자연 교배<br>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="hidden" id="mod" name="mod" value="modify">
				<input type="button" value="수정" onclick="modify()">
				<input type="button" value="삭제" onclick="del()">
				<input type="reset" value="취소">
			    <input type="reset" value="돌아가기" onClick="history.back()">
			</td>
		</tr>
	</tbody>
</table>

</body> 
</html>