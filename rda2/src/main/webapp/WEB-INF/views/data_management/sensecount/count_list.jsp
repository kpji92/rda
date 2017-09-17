<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
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
		request.setCharacterEncoding("UTF-8");
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;

		String farm_num, farm_fname, farm_name, farm_addr, farm_phone1, farm_phone2, farm_phone3, farm_hp1, farm_hp2, farm_hp3;
		int farm_kc, farm_mc, farm_calf;
		Class.forName("oracle.jdbc.driver.OracleDriver");

        	String url="jdbc:oracle:thin:@192.168.0.100:1521:kis";
        	String user = "admin";
        	String passwd = "sRc0488#";
		
		
		
		/* 페이지네이션을 위한 기초 변수 선언 */        
        int start = 1;    // 최초 접속시 가장 첫번째 출력될 DB에서 불러오는 값의 인덱스나 ROWNUM
		int end =  20;    // 최초 접속시 가장 마지막에 출력될 DB에서 불러오는 값의 인덱스나 ROWNUM
		int rowCount = 0; // 인덱스나 ROWNUM 제한없이 모든데이터나 검색한 결과 데이터의 총갯수를 담을 변수
		int pageCount = 0;// rowCount를 사용하여 계산한 총 페이지 갯수를 담을 변수
		/* 페이지네이션을 위한 기초 변수 선언 */        
		
		
		
		String pageNum = request.getParameter("pageNum");  // 페이지네이션의 페이지를 클릭했을때 선택된 숫자를 get방식으로 받는 부분
		String sel02 = request.getParameter("sel02");      // 검색조건이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
		String value = request.getParameter("search");     // 검색조건이 있을경우 텍스트 박스에 입력된 값을 get방식으로 받는 부분
		
		conn = DriverManager.getConnection(url,user,passwd);
		stmt = conn.createStatement();
		String SQL;
	    
		
		/* 전체데이터나 검색된 결과데이터의 갯수를 가져오는 쿼리 */		
		
		SQL = "SELECT count(*)FROM (SELECT ROWNUM NO, A.*FROM (SELECT SUM( DECODE(NODE_ID,'201610260001' ,1,0)) AS 소1 ,SUM( DECODE(NODE_ID,'201610260002' ,1,0)) AS 소2 ,SUM( DECODE(NODE_ID,'201610260003' ,1,0)) AS 소3 ,SUM( DECODE(NODE_ID,'201610260004' ,1,0)) AS 소4 ,SUM( DECODE(NODE_ID,'201610260005' ,1,0)) AS 소5 ,SUM( DECODE(NODE_ID,'201610260006' ,1,0)) AS 소6 ,SUM( DECODE(NODE_ID,'201610260007' ,1,0)) AS 소7 ,SUM( DECODE(NODE_ID,'201610260008' ,1,0)) AS 소8 ,SUM( DECODE(NODE_ID,'201610260009' ,1,0)) AS 소9 ,SUM( DECODE(NODE_ID,'201610260010' ,1,0)) AS 소10 ,TO_CHAR(DTIME, 'YYYY-MM-DD') as 입력날짜 FROM TURBOSOFT.SENSE GROUP BY TO_CHAR(DTIME, 'YYYY-MM-DD') order by TO_CHAR(DTIME, 'YYYY-MM-DD') )a)";
		
		/* 전체데이터나 검색된 결과데이터의 갯수를 가져오는 쿼리 */		
		
		int total = 0;
		int count = 0;
	    int current_page = 1;  // 현재 출력중인 페이지 번호 ( 최초는 1 )
		int idx =1;

		rs = stmt.executeQuery(SQL);

		if(rs.next()) {
			rowCount = rs.getInt(1);
			total = rs.getInt(1);
		}   // rowCount변수에 전체 데이터 갯수를 저장함
		rowCount = 56;
		total = 56;
		pageCount=((rowCount-1)/20)+1;          // 저장된 rowCount변수의 값을 사용하여 전체 페이지의 갯수를 구함

		if(pageNum != null) {
			current_page = Integer.parseInt(pageNum);
		}
		if(current_page==1) { count = total; }
		else { count = total - (current_page-1)*20; }
		
		// 페이지이동시 get방식으로 받은 pageNum의 값을 인트형으로 변환하여 현재 페이지값을 담는 변수에 저장

		start = current_page*20-19; // 페이지 이동시 뿌려지는 데이터의 최소 인덱스나 rownum
		end = current_page*20;		// 페이지 이동시 뿌려지는 데이터의 최대 인덱스나 rownum
		/* start변수와 end변수로 데이터를 가져올경우 쿼리에서는 'start 이상 end 이하'라는 조건으로 검색하기때문에 
			인덱스나 rownum이 존재하지 않아도됨 */
		
		
%>
		
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<title>Ritis appr_an</title>
        <link rel="stylesheet" href="../../../css/common.css" type="text/css" />
        <link rel="stylesheet" href="../../../css/layout.css" type="text/css" />
        <link rel="stylesheet" href="../../../css/button.css" type="text/css" />
        <link rel="stylesheet" href="../../../css/table.css" type="text/css" />
        <link rel="stylesheet" href="../../../css/box.css" type="text/css" />
        <link rel="stylesheet" href="../../../css/searchbox.css" type="text/css" />
        <link rel="stylesheet" href="../../../css/jquery-ui.css" type="text/css" />
        <link rel="stylesheet" href="../../../css/navigation.css" type="text/css" />
        <link rel="stylesheet" href="../../../css/location.css" type="text/css" />
		<link rel="stylesheet" type="text/css" href="../../../css/style.css" media="screen"/>

		<script type="text/javascript" src="../../../js/common.js"></script>
        <script type="text/javascript" src="../../../js/jquery-1.4.1.js"></script>
        <script type="text/javascript" src="../../../js/jquery-ui.js"></script>

		<script language="javascript">
		
			function moneyView(){
				alert("준비중입니다");
				return; 
			}
			
			
			
/* ------------------------------------ 데이터 추가하는 팝업창을 띄우는 스크립트 -----------------------------------*/
			function inputAppr(){
				var width = "800";
				var height = "490";
				
				LeftPosition=(screen.width)?(screen.width-width)/2:100;
				TopPosition=(screen.height)?(screen.height-height)/2:100;

				url = "./personinsert.jsp";
			
				winOpts="scrollbars=no,toolbar=no,location=no,directories=no,width="+width+",height="+height+",resizable=no,mebar=no,left="+LeftPosition+",top="+TopPosition;
				
				document.title = "개인자료 추가";
				
				var obj = window.open(url,'input_company', winOpts);
			}
/* ------------------------------------ 데이터 추가하는 팝업창을 띄우는 스크립트 -----------------------------------*/			
			
			
				
				
				
/* ------------------------------------ 데이터 수정하는 팝업창을 띄우는 스크립트 -----------------------------------*/
			function editData(z){
				var width = "800";
				var height = "490";
				
				LeftPosition=(screen.width)?(screen.width-width)/2:100;
				TopPosition=(screen.height)?(screen.height-height)/2:100;

				url = "./personUpdate.jsp?po_num="+z;  // 인덱스값을 get방식으로 넘겨주어 수정해야할 데이터의 정보들을 불러옴
			
				winOpts="scrollbars=no,toolbar=no,location=no,directories=no,width="+width+",height="+height+",resizable=no,mebar=no,left="+LeftPosition+",top="+TopPosition;
				
				document.title = "정보 수정";
				
				var obj = window.open(url,'edit_Ritis', winOpts);
			}
/* ------------------------------------ 데이터 수정하는 팝업창을 띄우는 스크립트 -----------------------------------*/			
			
			
			
			
			
			
			
/* ------------------------------------ 데이터를 엑셀로 저장하는 페이지를 띄워주는 스크립트 -----------------------------------*/
/*------------------------------------- 페이지가 열림과 동시에 다운로드를 실행하고 팝업창은 자동종료 --------------------------*/
			function excel(){
				var width = "0";
				var height = "0";
				
				LeftPosition=(screen.width)?(screen.width-width)/2:100;
				TopPosition=(screen.height)?(screen.height-height)/2:100;

				url = "./count_excel.jsp";
			
				winOpts="scrollbars=no,toolbar=no,location=no,directories=no,width="+width+",height="+height+",resizable=no,mebar=no,left="+LeftPosition+",top="+TopPosition;
				
				window.open(url,'excel', winOpts);
			}
/* ------------------------------------ 데이터를 엑셀로 저장하는 페이지를 띄워주는 스크립트 -----------------------------------*/			
/* ------------------------------------ 개체 리스트창을 띄우는 스크립트 -----------------------------------*/
			function submitData(farm_id){
				alert(farm_id);
				document.getElementById("getlist").setAttribute("action", "/rda/list/entity/entity_list.jsp?farm_id="+farm_id);
				alert(document.getElementById("farm_id").value);
			}
/* ------------------------------------ 개체 리스트창을 띄우는 스크립트 -----------------------------------*/	
			
			
		
        </script>
     
</head>
<body>
<br>
<table width="100%" height="415" >
<form id ="pform" method ="post" action="count_list.jsp?pageNum=1">

	<tr height="30" >
		<td height="33" colspan="4" >
		<div >
			
			<table width="100%">
				<tr>
					<td align="left" style="padding-bottom: 5px">
						<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="<%= request.getContextPath() %>/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 개채별,일별 활동량 수집건수</b></font><br>
					</td>
					<td width="71"> <!-- 검색조건 셀렉트 박스(검색 결과를 뿌려준후 선택했던값 유지되도록 코딩) -->
					<%
						String sql3, sql4;
						int fcount = 0;
						sql4 = "SELECT count(*) FROM TURBOSOFT.SENSETIME";
						rs = stmt.executeQuery(sql4);
						if(rs.next()) {
							fcount = rs.getInt(1);
						}
						
						
						
						
						
						
					%>
					
<!------------------------------------ 여러가지 기능의 스크립트를 실행할 버튼들(추가,엑셀,출력) --------------------------------->
<td width="48" align="right"><span class="button blue"><input type="button" value="엑셀" onClick="excel()"></span></td>



                    
				</tr>
			</table>	
		</div>
		</td>
  </tr>
	
   
    
    
	<tr height="400">
		<td colspan="4" valign="top">
		
		<div id = "Contents">
			<table class="table_003 w100p" >
	
				
				 <tr>
    <th style="font-size: 14px;" width="10%" >날짜</th>
    <th style="font-size: 14px;" width="5%" >1번 소</th>
    <th style="font-size: 14px;" width="5%" >2번 소</th>
    <th style="font-size: 14px;" width="5%" >3번 소</th>
    <th style="font-size: 14px;" width="5%" >4번 소</th>
    <th style="font-size: 14px;" width="5%" >5번 소</th>
    <th style="font-size: 14px;" width="5%" >6번 소</th>
    <th style="font-size: 14px;" width="5%" >7번 소</th>
    <th style="font-size: 14px;" width="5%" >8번 소</th>
    <th style="font-size: 14px;" width="5%" >9번 소</th>
    <th style="font-size: 14px;" width="5%" >10번 소</th>
    
  </tr>

				
				
				
				
				
				<%
				
				
				try{
					
					conn = DriverManager.getConnection(url,user,passwd);		        
			        stmt = conn.createStatement();
				
			        String SQL2;
			        
			        
/*--------------------------------------------------- 조건에 맞는 데이터를 출력하는 쿼리  -------------------------------------------------*/
			        
			     

// 		        		SQL2 = "select * from(select TURBOSOFT.SENSETIME.*, rownum as rnum FROM TURBOSOFT.SENSETIME order by 1 desc)WHERE rnum between "+start+" and "+end+" order by DTIME asc " ;
			        
			        SQL2="SELECT * FROM (SELECT ROWNUM NO, A.* FROM (SELECT SUM( DECODE(NODE_ID,'201610260001' ,1,0)) AS 소1 ,SUM( DECODE(NODE_ID,'201610260002' ,1,0)) AS 소2 ,SUM( DECODE(NODE_ID,'201610260003' ,1,0)) AS 소3 ,SUM( DECODE(NODE_ID,'201610260004' ,1,0)) AS 소4 ,SUM( DECODE(NODE_ID,'201610260005' ,1,0)) AS 소5 ,SUM( DECODE(NODE_ID,'201610260006' ,1,0)) AS 소6 ,SUM( DECODE(NODE_ID,'201610260007' ,1,0)) AS 소7 ,SUM( DECODE(NODE_ID,'201610260008' ,1,0)) AS 소8 ,SUM( DECODE(NODE_ID,'201610260009' ,1,0)) AS 소9 ,SUM( DECODE(NODE_ID,'201610260010' ,1,0)) AS 소10 ,TO_CHAR(DTIME, 'YYYY-MM-DD') as 입력날짜,DEV_TYPE FROM TURBOSOFT.SENSE  where DEV_TYPE='1' and ACTION_VALUE >= 1  GROUP BY TO_CHAR(DTIME, 'YYYY-MM-DD'),DEV_TYPE order by TO_CHAR(DTIME, 'YYYY-MM-DD') desc)a) where NO between "+start+" and "+end+"";
			    
			   
					
					
					
/*--------------------------------------------------- 조건에 맞는 데이터를 출력하는 쿼리  -------------------------------------------------*/


					
					rs = stmt.executeQuery(SQL2);
					if(rs != null){
				        while(rs.next()){
				        String	cow1 = rs.getString(2);
				        String	cow2 = rs.getString(3);
				        String	cow3 = rs.getString(4);
				        String	cow4 = rs.getString(5);
				        String	cow5 = rs.getString(6);
				        String	cow6 = rs.getString(7);
				        String	cow7 = rs.getString(8);
				        String	cow8 = rs.getString(9);
				        String	cow9 = rs.getString(10);
				        String	cow10 = rs.getString(11);
				        String	time = rs.getString(12);

			       %>
             
			     <tr onMouseOver="this.style.backgroundColor='#CCFFFF'" onMouseOut="this.style.backgroundColor=''">
                       <td style="font-size: 13px;"><div align="center"><%=time %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow1 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow2 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow3 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow4 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow5 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow6 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow7 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow8 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow9 %></div></td>
                       <td style="font-size: 13px;"><div align="center"><%=cow10 %></div></td>
                 
                      
              </tr>	
              
              
              
              
              
              
              
              
              
			        	
			        <%		count--;
			        		}
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
			</table>
            
		</div>
        
		<div id="searchFrom"></div>
		</td>




<!--------------------------------------------------------- 페이지네이션 부분 ------------------------------------------------------------>
<!--------------------------------------------------------- 테이블로 위치 잡은후 자바를 사용하여 코딩(get방식) --------------------------->


<table width="100%">	
	<tr height="30">
	<td width="10%"></td>
		<td width="80%" align="center">
			
		<%
			if(sel02 != null){
				%>
                <a href="count_list.jsp?pageNum=1&sel02=<%=sel02%>&search=<%=value%>" style="text-decoration:none; color:#494949; font-family:gulim;">◀처음&nbsp;</a>

                <%}else{%>
                <a href="count_list.jsp?pageNum=1" style="text-decoration:none; color:#494949; font-family:gulim;">◀처음&nbsp;</a>
		<%}%>
        
        
        
        <%
			if(sel02 != null){
				if(current_page > 10){%>
                	<a href="count_list.jsp?pageNum=<%=current_page-10%>&sel02=<%=sel02%>&search=<%=value%>" style="text-decoration:none; color:#494949; font-family:gulim;">[이전]&nbsp;</a>
                    <%}else{%>
							<a href="#" style="text-decoration: none;">[이전]&nbsp;</a>
					<%}

                	} else {
					if(current_page > 10){%>
                	<a href="count_list.jsp?pageNum=<%=current_page-10%>" style="text-decoration:none; color:#494949; font-family:gulim;">[이전]&nbsp;</a>
                    <%}else{%>
							<a href="#" style="text-decoration:none; color:#494949; font-family:gulim;">[이전]&nbsp;</a>
					<%}
			}
            
			%>
            
            
            
            
            <%
				if(pageCount <= 10){
					if(sel02 != null){
						for(int i = 1; i < pageCount+1; i++){
							if( i == current_page ){
							%><a href="count_list.jsp?pageNum=<%=i%>&sel02=<%=sel02%>&search=<%=value%>" style="text-decoration: none;"><b>[<%=i%>]</b>&nbsp;</a><%
							}else{
								%><a href="count_list.jsp?pageNum=<%=i%>&sel02=<%=sel02%>&search=<%=value%>" style="text-decoration: none;">[<%=i%>]&nbsp;</a><%
								}
						}
				
					}else{
						for(int i = 1; i < pageCount+1; i++){
							if( i == current_page ){
							%><a href="count_list.jsp?pageNum=<%=i%>" style="text-decoration: none;"><b>[<%=i%>]</b>&nbsp;</a><%
							}else{
								%><a href="count_list.jsp?pageNum=<%=i%>" style="text-decoration: none;">[<%=i%>]&nbsp;</a><%
								}
						}
					}
				}
			%>
            
            <%
				if(pageCount > 10){
					int sub_cp = ((current_page-1)/10+1)*10;
					if(sel02 != null){
						
						for(int i = sub_cp-9; i < sub_cp+1; i++){
							if(i < pageCount+1){
								if( i == current_page ){
									%><a href="count_list.jsp?pageNum=<%=i%>&sel02=<%=sel02%>&search=<%=value%>" style="text-decoration: none;"><b>[<%=i%>]</b>&nbsp;</a><%	
								}else{
									%><a href="count_list.jsp?pageNum=<%=i%>&sel02=<%=sel02%>&search=<%=value%>" style="text-decoration: none;">[<%=i%>]&nbsp;</a><%	
									}
								
							}
						}
					}else{
						for(int i = sub_cp-9; i < sub_cp+1; i++){
							if(i < pageCount+1){
								if( i == current_page ){
									%><a href="count_list.jsp?pageNum=<%=i%>" style="text-decoration: none;"><b>[<%=i%>]</b>&nbsp;</a><%						
								}else{
									%><a href="count_list.jsp?pageNum=<%=i%>" style="text-decoration: none;">[<%=i%>]&nbsp;</a><%					
								}
							}
						}	
					}
				}
			%>
            
            
            
            
            
            <%
			
			if(sel02 != null){
				if(current_page < pageCount/10*10){%>
                	<a href="count_list.jsp?pageNum=<%=current_page+10%>&sel02=<%=sel02%>&search=<%=value%>" style="text-decoration:none; color:#494949; font-family:gulim;">[다음]&nbsp;</a>
                    <%}else{%>
							<a href="#"  style="text-decoration:none; color:#494949; font-family:gulim;">[다음]&nbsp;</a>
					<%}

                	} else {
					if(current_page < pageCount/10*10){%>
                	<a href="count_list.jsp?pageNum=<%=current_page+10%>" style="text-decoration:none; color:#494949; font-family:gulim;">[다음]&nbsp;</a>
                    <%}else{%>
							<a href="#"  style="text-decoration:none; color:#494949; font-family:gulim;">[다음]&nbsp;</a>
					<%}
			}
             
		%> 
                          
		<%
			if(sel02 != null){
				%>
                <a href="count_list.jsp?pageNum=<%=pageCount%>&sel02=<%=sel02%>&search=<%=value%>" style="text-decoration: none;">마지막▶</a>

                <%}else{%>
                <a href="count_list.jsp?pageNum=<%=pageCount %>" style="text-decoration: none;">마지막▶</a>
		<%}%>
               
        </td>
      
     <!-- 검색된 총 데이터 갯수 출력해주는부분 --> 
	<td width="10%" align="right"><font style="font-weight:bold">검색수</font> : <%=rowCount%>&nbsp;&nbsp;&nbsp;</td>
	</tr>
</table>
</form>
</body>
</html>

