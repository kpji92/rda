<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt2 = null;
	Statement stmt3 = null;
	PreparedStatement stmt4 = null;
	
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;

	
	String entity="", entity1="" ,xdate= "", xdate1= "" , avr="", avr1="", e="";
	String en1="", en2="";

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url="jdbc:oracle:thin:@192.168.0.100:1521:kis";
	String user = "admin";
	String passwd = "sRc0488#";
	
	String sense_cuId = request.getParameter("sense_cuId");     
	String sense_nodeId = request.getParameter("sense_nodeId");
	
	String sel02 = request.getParameter("sel02");      // 검색조건(년)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	String sel03 = request.getParameter("sel03");      // 검색조건(월)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	conn = DriverManager.getConnection(url,user,passwd);
	
	
	stmt3 = conn.createStatement();
	String SQL;
	String SQL1;
	String SQL3;
	String SQL4;
	
	
	
	//
	
	
	SQL3 = "select distinct substr(node_id,11,2) from TURBOSOFT.SENSE where DEV_TYPE = '2' ORDER BY substr(node_id,11,2) asc";

	
	
	if(sel02 != "" && sel02 != null ){
		//년도쿼리뽑아내기
		SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') from TURBOSOFT.SENSE where DEV_TYPE = '2' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
		stmt2 = conn.prepareStatement(SQL1);
		stmt2.setString(1, sel02);
			
		//년 안에서 월쿼리뽑아내기
		if(sel03 != "" && sel03 != null ){
			SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') from TURBOSOFT.SENSE where DEV_TYPE = '2' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
			stmt2 = conn.prepareStatement(SQL1);
			
			stmt2.setString(1, sel03);
			}

	}else{
		//전체일일쿼리뽑아내기
		SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') from TURBOSOFT.SENSE where DEV_TYPE = '2' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		stmt2 = conn.prepareStatement(SQL1);
		
	}
	//System.out.println("sel02 go "+sel02);
	//System.out.println("sel03 go "+sel03);
	//System.out.println("stmt2 go "+SQL1);
	
	//System.out.println("sel03 come"+sel03);
	if(sel03 != "" && sel03 != null ){
		//월별뽑아내기
		SQL = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),ROUND(MEDIAN(ACTION_VALUE),3) from TURBOSOFT.SENSE where DEV_TYPE = '2' and ACTION_VALUE between '25'and '45'  and to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
		
		stmt = conn.prepareStatement(SQL);
		
		stmt.setString(1, sel03);
		
		
	}else if(sel02 != "" && sel02 != null ){
		SQL = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(MEDIAN(ACTION_VALUE),3) from TURBOSOFT.SENSE where DEV_TYPE = '2' and ACTION_VALUE between '25'and '45'  and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		
		stmt = conn.prepareStatement(SQL);
		
		stmt.setString(1, sel02);
	
	}else{
		//월전체뽑아내기
		SQL = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(MEDIAN(ACTION_VALUE),3) from TURBOSOFT.SENSE where DEV_TYPE = '2' and ACTION_VALUE between '25'and '45'  GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		stmt = conn.prepareStatement(SQL);
		
	}
	
	//System.out.println(SQL);
	
	
	rs3 = stmt3.executeQuery(SQL3);
	
	List<String> list_date = new ArrayList<String>();
	List<String> list1 = new ArrayList<String>();
	List<String> list2 = new ArrayList<String>();
	List<String> list3 = new ArrayList<String>();
	List<String> list4 = new ArrayList<String>();
	try{
		rs2 = stmt2.executeQuery();
		rs = stmt.executeQuery();
	        	
		//x축 일일 증가
		if(rs2 != null){
	        while(rs2.next()){
	        	
	        	xdate = rs2.getString(1);
	        	xdate1 = "'" + xdate + "'";
	        	//xdate1.replaceAll("-", ".");
	        	list_date.add(xdate1);
	
	        	
	        }		
	        	//System.out.println(list_date);
	        
	         	
		}
		//개체 따로 뽑아오기
		if(rs3 != null){
	        while(rs3.next()){
	        	
	        	en1 = rs3.getString(1);
	        	//en2 = "["+"'" + en1 + "'"+"]";
	        	list1.add(en1);
	        	
	        	//System.out.println(en1);
	        	//en = "'" + xdate + "'";
	        	//list_date.add(xdate1);
	        }
		}
		//y축 개체별 평균온도
		if(rs != null){
       		while(rs.next()){
		 
       			//평균온도 값 가져와 series 형식에 맞게끔 파싱
       			avr = rs.getString(3);
       			//avr1 = "["+avr+"]";
       			//avr1 = "["+avr+"]";
       			list2.add(avr);
       			
       				
       		}
       		
       		//인덱스0번째부터 짝수번째 개체 뽑아오기
  	     	 for(int i=0; i<list2.size(); i=i+2) {
      	         list3.add(list2.get(i));
  	     	 }
      			 //System.out.println(list3);
      			 
      			 
      		//인덱스1번째부터 홀수번째 개체 뽑아오기
  			 for(int j=1; j<list2.size(); j=j+2){
  				 list4.add(list2.get(j));
  				 
  			 }
				//System.out.println(list4);
       			
       			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");
       			
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
<!DOCTYPE HTML>
<html>
	<head>
	<meta http-equiv="X-UA-Compatible" content="IE=10">
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
	
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>Highcharts Example</title>
		<style>
		
		#con_box {width:815px; font-size:12px; overflow:hidden; margin-left:5px; margin-top: 1px;}
		
		</style>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		<script type="text/javascript">
		
		//x값축
		var categories= <%=list_date%>
		
		
		//개체
		var entity1 = <%=list1.get(0)%>+"번 개체"
		var entity2 = <%=list1.get(1)%>+"번 개체"
		
		//평균온도
		var avr = <%=list3%>
		var avr1 = <%=list4%>
	
		
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line',
                marginRight: 0,
                height: 660,
               // zoomType : 'x',
                marginTop: 70
                               
            },
            credits: {
            	enabled: true,
                text: 'BestPoll',
                href: 'http://www.bestpoll.kr'
            },
            title: {
                text: '개체별 일일 체온 중앙값 비교',
                style: {
					color: 'black',
					fontWeight: 'bold',
					fontSize: '17px',
					
				
				}
            },
            xAxis: {
               categories: categories,
               
                title: {
                    text: '날짜(일별)',
                 	align : 'high', // low,middle, high
                    style: {
                		color: 'black',
                		fontWeight: 'bold',
                		fontSize: '12px'
                		
                	}
                },
               labels: {
            	   //maxStaggerLines: 5,
            	  // reserveSpace: true,
            	  //staggerLines: 5,
            	  step: 2,
                	style: {
                		color: 'black',
                		fontWeight: 'bold',
                		fontSize: '9px'
                		
                	},
                /* 	rotation:45,
                	x: -4,
                	y: 20 */

                	//format: '{value:,.0f}'
                },
            },
            yAxis: {
            	allowDecimals: false,
//             	min:-5,
                title: {
                    text: '평균온도 (°C)',
                    align : 'high', // low,middle, high
					style: {
						color: 'black',
						fontWeight: 'bold',
						fontSize: '12px'
					}
                },
                plotLines: [{
                    value: 0,
                    color: '#808080'
                }],
                labels: {
                	style: {
                		color: 'black',
                		fontWeight: 'bold',
                		fontSize: '10px'
                	},
                	format: '{value:,.0f}'
                }
            },
            tooltip: {
                //enabled: false,
                crosshairs: true,
                formatter: function() {
                    return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +' : '+ this.y +'°C';
                }
            },
          /*   plotOptions: {
                line: {
                    dataLabels: {
                    	enabled: true, 
                    },
                    enableMouseTracking: false
                }
            }, */
        	legend: {
            	backgroundColor: '#FFFFFF',
            	//width: 370,
            	maxHeight: 150,
                itemMarginBottom: 1,
                //itemWidth: 175,
                shadow: true,
                align: 'right',
                verticalAlign: 'top',
                y : 24,
                itemStyle: {
                	fontWeight: ''
                }
            }, 
            series: [{
                name: entity1,
                data: avr,
            	}, {
                name: entity2,
                data: avr1
            }]
        });
    });
    
});


function selected_box_1() {
	document.chart3.sel03.selectedIndex=0;
	/* document.chart_3.search2.selectedIndex=0;
	document.chart_3.search4.selectedIndex=0; */
	document.chart3.submit();
}

		</script>
	</head>
	<body>
	<br>
<!-- <script src="http://www.k-call.com/js/highcharts.js"></script> -->
<!-- <script src="http://www.k-call.com/js/modules/exporting.js"></script> -->

<script src="https://code.highcharts.com/highcharts.js"></script>
<script src="https://code.highcharts.com/modules/exporting.js"></script>


	 <form id ="chart3" name = "chart3" method ="post" action="chart_32.jsp?pageNum=1">
	
		<tr height="30" >
			<td height="33" colspan="4" >
			<div>
				
				<table width="100%" >
					<tr>
						<td align="left" style="padding-bottom: 5px; ">
							<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="<%= request.getContextPath() %>/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 센서측정 > 체온분석</b></font><br>
						</td>
						<td align="right" width="71" > <!-- 검색조건 셀렉트 박스(검색 결과를 뿌려준후 선택했던값 유지되도록 코딩) -->
						
						<%
						
						
						
						conn = DriverManager.getConnection(url,user,passwd);
						
						
						
						//System.out.println(sel02);
						//System.out.println(sel03);
						
						try{
						
							//	yy의 카운터 구하기
							String sql5, sql6, sql7, sql8;
							int fcount = 0;
							int fcountm = 0;
							sql5 = "select count(count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')))) from TURBOSOFT.SENSE where DEV_TYPE = '2' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')";
							stmt4 = conn.prepareStatement(sql5);
							rs = stmt4.executeQuery();
							if(rs.next()) {
								fcount = rs.getInt(1);
								
							}
								//System.out.println(fcount);
								
							// mm의 카운터 구하기
							sql8 = "select count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'yy'))),count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'mm'))) from TURBOSOFT.SENSE where DEV_TYPE = '2' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')";
							stmt4 = conn.prepareStatement(sql8);
							stmt4.setString(1, sel02);
							rs = stmt4.executeQuery();
							if(rs.next()) {
								fcountm = rs.getInt(2);
							}	
								//System.out.println(fcountm);
								
							
							//	yy의 실 데이터 뿌리기
							String[] selString = new String[fcount];
							sql6 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') from TURBOSOFT.SENSE where DEV_TYPE = '2' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') asc";
							
							stmt4 = conn.prepareStatement(sql6);
							rs = stmt4.executeQuery();
							
							for(int i = 0; i < fcount ; i++){
								if(rs.next()) {
									selString[i] = rs.getString(1);
									//System.out.println(selString[i]);
								}
							}
							
							// mm의 실 데이터 뿌리기
							String[] selmString = new String[fcountm];
							sql7 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') from TURBOSOFT.SENSE where DEV_TYPE = '2' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ?  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') asc";
							
							stmt4 = conn.prepareStatement(sql7);
							stmt4.setString(1, sel02);
							//stmt4.setString(2, sel03);
							rs = stmt4.executeQuery();
							
							for(int j = 0; j< fcountm ; j++){
								if(rs.next()) {
									selmString[j] = rs.getString(1);
									//selmString[j] = rs.getString(2);
									//System.out.println(selmString[j]);
								}
							}
							
							
							
						%>
							<select id="sel02" name="sel02" onchange="selected_box_1()">
	                            <option value="" selected>Year</option>
	                            <%
	                            	for(int i = 0; i < fcount ; i++){
	                            %>
	                            		<option value="<%=selString[i]%>" <%=(selString[i].equals(sel02))? "selected":"" %> >20<%=selString[i]%>년</option>
	                            <%
	                            	}
	                            %>
							</select>
						</td>
							<td  width="71"  >
							<select id="sel03" name="sel03" onchange="submit()">
	                            <option value="" selected>Month</option>
	                            <%
	                            	if(sel03 != null){
	                            		for(int j = 0; j < fcountm ; j++){
	                            %>
	                            		<option value="<%=selmString[j]%>" <%=(selmString[j].equals(sel03))? "selected":"" %>><%=selmString[j]%>월</option>
	                            <% 
	                            		}
	                            %>		
	                          
	                            <%		
	                            	}else if(sel03 == null){
	                            %>	
	                            		<!-- <option value="" ></option> -->
	                            <%		
	                            	}
	                            %>	
	                        
	                          <%--   	else{

	                            %>		
	                            		<option value="<%=selmString[j]%>" ><%=selmString[j]%>월</option>
	                            <%
	                            	}
	                            %> --%>
	                            		
	                       
							</select>
							</td>
							<td width="48" align="right"><span class="button green"><input onclick="parent.center.location.href='../sense/chart_3.jsp?sense_nodeId=<%=sense_nodeId%>&sense_cuId=<%=sense_cuId %>'" type="button" value="평균값분석" onClick="activ()"></span></td>
						<td width="48" align="right"><span class="button blue"><input onclick="window.open('chart32_excel.jsp','엑셀','fullscreen');" type="button" value="엑셀"></span></td>
						<%-- <td width="149">
							<% // if 문을 사용하여 검색조건의 텍스트박스 표시(검색결과를 뿌려준후 검색했던값 유지되도록 코딩)
								if(value != null){
									%>
									<input type="text" id="search" name="search" size="25" value="<%=value%>">
												
									<%
								}else{
							%>
									<input type="text" id="search" name="search" size="25">					
							<%} %>
						</td> --%>
						
						<!-- <td width="40" > ------------------ 검색기능은 post방식을 사용하여 코딩 --------------------------
							<span class="button white"><input class="button blue" type="submit" value="검색" ></span>
							
						</td> -->
						
						<% 
					}catch(SQLException sqlException){
							System.out.println("sql exception");
					}catch(Exception exception){
							System.out.println("exception");
							exception.printStackTrace();
					}finally{
						if(rs !=null)try{rs.close();}catch(SQLException ex){}
					if(stmt !=null)try{stmt.close();}catch(SQLException ex){}
					if(conn !=null)try{conn.close();}catch(Exception ex){}
					}
				%>
					</tr>
				</table>	
			</div>
			</td>
		</tr>
	</form> 
<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>
	</body>
</html>

