<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>
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
 <c:import url="../../module/top_menu.jsp"></c:import>
<c:import url="../../module/side_data_management.jsp"></c:import>
 


<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt_2 = null;
	PreparedStatement stmt_3 = null;
	PreparedStatement stmt2 = null;
	Statement stmt3 = null;
	PreparedStatement stmt4 = null;
	
	ResultSet rs = null;
	ResultSet rs_2 = null;
	ResultSet rs_3 = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;

	
	String entity="", entity1="" ,xdate= "", xdate1= "" , avr="", avr1="", e="";
	String entity3="", entity4="" ,entity5= "", entity6= "" , entity7="", entity8="", entity9="";
	String avr2="", avr3="" ,avr4= "", avr5= "" , avr6="", avr7="", avr8="", avr9=""; 
	String en1="", en2="";

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url="jdbc:oracle:thin:@192.168.0.100:1521:kis";
	String user = "admin";
	String passwd = "sRc0488#";
	
	String sense_cuId = request.getParameter("sense_cuId");     
	String sense_nodeId = request.getParameter("sensenodeid");
	
	String sel02 = request.getParameter("sel02");      // 검색조건(년)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	String sel02_2 = request.getParameter("sel02");      // 검색조건(년)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	String sel02_3 = request.getParameter("sel02");      // 검색조건(년)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	String sel03 = request.getParameter("sel03");      // 검색조건(월)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	String sel03_2 = request.getParameter("sel03");      // 검색조건(월)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	String sel03_3 = request.getParameter("sel03");      // 검색조건(월)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	conn = DriverManager.getConnection(url,user,passwd);
	
	
	stmt3 = conn.createStatement();
	String SQL;
	String SQL_2;
	String SQL_3;
	String SQL1;
	String SQL3;
	String SQL4;
	
	
	
	//
	
	SQL3 = "select distinct substr(node_id,1,11) from TURBOSOFT.SENSE_ENV ORDER BY substr(node_id,1,11) asc";

	/////////////////////////온도/////////////////
	
	if(sel02 != "" && sel02 != null ){
		//년도쿼리뽑아내기
		SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') from TURBOSOFT.SENSE_ENV where to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
		stmt2 = conn.prepareStatement(SQL1);
		stmt2.setString(1, sel02);
			
		//년 안에서 월쿼리뽑아내기
		if(sel03 != "" && sel03 != null ){
			SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') from TURBOSOFT.SENSE_ENV where to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
			stmt2 = conn.prepareStatement(SQL1);
			
			stmt2.setString(1, sel03);
			}

	}else{
		//전체일일쿼리뽑아내기
		SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') from TURBOSOFT.SENSE_ENV  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		stmt2 = conn.prepareStatement(SQL1);
		
	}
	
	//System.out.println("sel02 go "+sel02);
	//System.out.println("sel03 go "+sel03);
	//System.out.println("stmt2 go "+SQL1);
	
	//System.out.println("sel03 come"+sel03);
	if(sel03 != "" && sel03 != null ){
		//월별뽑아내기
		SQL = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),ROUND(AVG(TEMP),3) from TURBOSOFT.SENSE_ENV where  to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
		
		stmt = conn.prepareStatement(SQL);
		
		stmt.setString(1, sel03);
		
		
	}else if(sel02 != "" && sel02 != null ){
		SQL = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(AVG(TEMP),3) from TURBOSOFT.SENSE_ENV where  and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		
		stmt = conn.prepareStatement(SQL);
		
		stmt.setString(1, sel02);
	
	}else{
		//월전체뽑아내기
		SQL = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(AVG(TEMP),3) from TURBOSOFT.SENSE_ENV  GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		stmt = conn.prepareStatement(SQL);
		
	}
	
	////////////습도//////////////////////
	
		
	
	//System.out.println("sel02 go "+sel02);
	//System.out.println("sel03 go "+sel03);
	//System.out.println("stmt2 go "+SQL1);
	
	//System.out.println("sel03 come"+sel03);
	if(sel03 != "" && sel03 != null ){
		//월별뽑아내기
		SQL_2 = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),ROUND(AVG(CO2),3) from TURBOSOFT.SENSE_ENV where  to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
		
		stmt_2 = conn.prepareStatement(SQL_2);
		
		stmt_2.setString(1, sel03);
		
		
	}else if(sel02 != "" && sel02 != null ){
		SQL_2 = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(AVG(CO2),3) from TURBOSOFT.SENSE_ENV where  and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		
		stmt_2 = conn.prepareStatement(SQL_2);
		
		stmt_2.setString(1, sel02);
	
	}else{
		//월전체뽑아내기
		SQL_2 = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(AVG(CO2),3) from TURBOSOFT.SENSE_ENV  GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		stmt_2 = conn.prepareStatement(SQL_2);
		
	}
	///////////////////////////이산화탄소/////////////////////////
	
	
	//System.out.println("sel02 go "+sel02);
	//System.out.println("sel03 go "+sel03);
	//System.out.println("stmt2 go "+SQL1);
	
	//System.out.println("sel03 come"+sel03);
		if(sel03 != "" && sel03 != null ){
		//월별뽑아내기
		SQL_3 = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),ROUND(AVG(HUM),3) from TURBOSOFT.SENSE_ENV where  to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
		
		stmt_3 = conn.prepareStatement(SQL_3);
		
		stmt_3.setString(1, sel03);
		
		
	}else if(sel02 != "" && sel02 != null ){
		SQL_3 = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(AVG(HUM),3) from TURBOSOFT.SENSE_ENV where  and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		
		stmt_3 = conn.prepareStatement(SQL_3);
		
		stmt_3.setString(1, sel02);
	
	}else{
		//월전체뽑아내기
		SQL_3 = "select node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(AVG(HUM),3) from TURBOSOFT.SENSE_ENV  GROUP BY node_id,to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		stmt_3 = conn.prepareStatement(SQL_3);
		
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
		rs_2 = stmt_2.executeQuery();
		rs_3 = stmt_3.executeQuery();
	        	
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
// 		if(rs3 != null){
// 	        while(rs3.next()){
	        	
// 	        	en1 = rs3.getString(1);
// 	        	//en2 = "["+"'" + en1 + "'"+"]";
// 	        	list1.add(en1);
	        	
	        	//System.out.println(en1);
	        	//en = "'" + xdate + "'";
	        	//list_date.add(xdate1);
// 	        }
// 		}
		//y축 개체별 평균온도
		if(rs != null){
       		while(rs.next()){
		 
       			//평균온도 값 가져와 series 형식에 맞게끔 파싱
       			avr = rs.getString(3);
       			//avr1 = "["+avr+"]";
       			//avr1 = "["+avr+"]";
       			list2.add(avr);
       			
       				
       		}
       		
       		
		}
		//습도
		if(rs != null){
       		while(rs_2.next()){
		 
       			//평균온도 값 가져와 series 형식에 맞게끔 파싱
       			avr2 = rs_2.getString(3);
       			//avr1 = "["+avr+"]";
       			//avr1 = "["+avr+"]";
       			list3.add(avr2);
       			
       				
       		}
       		
       		
		}
		
		//이산화탄소
		if(rs != null){
       		while(rs_3.next()){
		 
       			//평균온도 값 가져와 series 형식에 맞게끔 파싱
       			avr3 = rs_3.getString(3);
       			//avr1 = "["+avr+"]";
       			//avr1 = "["+avr+"]";
       			list4.add(avr3);
       			
       				
       		}
       		
       		
		}
      		
  			 
      		
      		
				//System.out.println(list4);
       			
       			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");
       			
		
    
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
 

		<style>
		
		#con_box {width:815px; font-size:12px; overflow:hidden; margin-left:5px; margin-top: 1px;}
		
		</style>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
		
		<script type="text/javascript">
		
		
		
		//x값축
		var categories= <%=list_date%>
		
		
		//개체
		var entity1 = "온도"
		var entity2 = "습도"
		var entity3 = "이산화탄소"
		
		
		//평균온도
		var avr = <%=list2%>
		var avr2 = <%=list3%>
		var avr3 = <%=list4%>
		
	
		
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.stockChart({
            chart: {
                renderTo: 'container',
//                 type: 'line',
//                 marginRight: 0,
                height: 660,
                marginTop: 70,
               zoomType : 'x'
                               
            },
            rangeSelector: {
//                 inputEnabled: $('#container').width() > 480,
                buttons: [{
                    type: 'month',
                    count: 1,
                    text: '1m'
                },{
                    type: 'all',
                    text: 'All'
                }],
                selected: 1
            },
            
            scrollbar: {
                barBackgroundColor: 'gray',
                barBorderRadius: 7,
                barBorderWidth: 0,
                buttonBackgroundColor: 'gray',
                buttonBorderWidth: 0,
                buttonArrowColor: 'yellow',
                buttonBorderRadius: 7,
                rifleColor: 'yellow',
                trackBackgroundColor: 'white',
                trackBorderWidth: 1,
                trackBorderColor: 'silver',
                trackBorderRadius: 7
            },

           
            navigator: {
                adaptToUpdatedData: false,
                series: {
                    data: categories
                }
            },
            credits: {
            	enabled: true,
                text: 'BestPoll',
                href: 'http://www.bestpoll.kr'
            },
           
            title: {
                text: '농장 일일 변화량(평균값)',
                style: {
					color: 'black',
					fontWeight: 'bold',
					fontSize: '17px',
					
				
				}
            },
            xAxis: {
                type: 'datetime',
                dateTimeLabelFormats: {
                    second: '%H:%M:%S',
                    minute: '%H:%M',
                    hour: '%H:%M',
                    day: '%e. %b',
                    week: '%e. %b',
                    month: '%b \'%y',
                    year: '%Y'
                },
                tickInterval: 24 * 3600 * 1000 // interval of 1 day
            },
            
            yAxis: [{ // Primary yAxis
             
                title: {
                    text: '습도',
                    style: {
                        color: Highcharts.getOptions().colors[2]
                    }
                },
                labels: {
                    format: '{value} %',
                    style: {
                        color: Highcharts.getOptions().colors[2]
                    }
                },
                opposite: true,

            }, 
            { // Secondary yAxis
                gridLineWidth: 0,
                title: {
                    text: '온도',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                labels: {
                    format: '{value} °C',
                    style: {
                        color: Highcharts.getOptions().colors[0]
                    }
                },
                opposite: false,

            }, 
            { // Tertiary yAxis
                gridLineWidth: 0,
                title: {
                    text: '이산화탄소',
                    style: {
                        color: Highcharts.getOptions().colors[3]
                    }
                },
                labels: {
                    format: '{value}ppm',
                    style: {
                        color: Highcharts.getOptions().colors[3]
                    }
                },
                opposite: true,
            }],
            
            
            
            tooltip: {
            	
            	shared: true
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
            	enabled:true,
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
            plotOptions: {
                column: {
                    pointPadding: 0,
                    borderWidth: 0,
                    groupPadding: 0.1,
                    pointStart: Date.UTC(2016, 11, 16) // feb 12, 2015
                }
            },
            series: 
            	[{name: entity1,
                type: 'column',
                yAxis: 1,
                data: avr,
               
                pointInterval: 24 * 3600 * 1000,
                pointStart: Date.UTC(2016, 11, 16),
                tooltip: {
                    valueSuffix: ' °C'
                }

            }, {
                name: entity3,
                type: 'spline',
                yAxis: 2,
                color : "#ED561B",
                data: avr2,
              
                pointInterval: 24 * 3600 * 1000,
                pointStart: Date.UTC(2016, 11, 16),
                marker: {
                    enabled: false
                },
                dashStyle: 'shortdot',
                tooltip: {
                    valueSuffix: ' ppm'
                },
                
                }, 
                
                
                
                { 
                	name: entity2,
                    type: 'spline',
                    color : "#89A54E",
                    data: avr3,
                   
                    pointInterval: 24 * 3600 * 1000,
                    pointStart: Date.UTC(2016, 11, 16),
                    tooltip: {
                        valueSuffix: ' %'
                    },
                   
								
                },
                

								 ]});
        
        
						});

			});

			function selected_box_1() {
				document.chart3.sel03.selectedIndex = 0;
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

<!-- <script src="https://code.highcharts.com/highcharts.js"></script> -->
<!-- <script src="https://code.highcharts.com/modules/exporting.js"></script> -->
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>


	 <form id ="chart3" name = "chart3" method ="post" action="chart_env.jsp?pageNum=1">
	
		<tr height="30" >
			<td height="33" colspan="4" >
			<div>
				
				<table width="100%" >
					<tr>
						<td align="left" style="padding-bottom: 5px; ">
							<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="resources/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 센서측정 > 농장분석</b></font><br>
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
							sql5 = "select count(count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')))) from TURBOSOFT.SENSE_ENV  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')";
							stmt4 = conn.prepareStatement(sql5);
							rs = stmt4.executeQuery();
							if(rs.next()) {
								fcount = rs.getInt(1);
								
							}
								//System.out.println(fcount);
								
							// mm의 카운터 구하기
							sql8 = "select count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'yy'))),count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'mm'))) from TURBOSOFT.SENSE_ENV where to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')";
							stmt4 = conn.prepareStatement(sql8);
							stmt4.setString(1, sel02);
							rs = stmt4.executeQuery();
							if(rs.next()) {
								fcountm = rs.getInt(2);
							}	
								//System.out.println(fcountm);
								
							
							//	yy의 실 데이터 뿌리기
							String[] selString = new String[fcount];
							sql6 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') from TURBOSOFT.SENSE_ENV  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') asc";
							
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
							sql7 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') from TURBOSOFT.SENSE_ENV where to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ?  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') asc";
							
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
<!-- 							<select id="sel02" name="sel02" onchange="selected_box_1()"> -->
<!-- 	                            <option value="" selected>Year</option> -->
<%-- 	                            <% --%>
<!-- // 	                            	for(int i = 0; i < fcount ; i++){ -->
<%-- 	                            %> --%>
<%-- 	                            		<option value="<%=selString[i]%>" <%=(selString[i].equals(sel02))? "selected":"" %> >20<%=selString[i]%>년</option> --%>
<%-- 	                            <% --%>
<!-- // 	                            	} -->
<%-- 	                            %> --%>
<!-- 							</select> -->
<!-- 						</td> -->
<!-- 							<td  width="71"  > -->
<!-- 							<select id="sel03" name="sel03" onchange="submit()"> -->
<!-- 	                            <option value="" selected>Month</option> -->
<%-- 	                            <% --%>
<!-- // 	                            	if(sel03 != null){ -->
<!-- // 	                            		for(int j = 0; j < fcountm ; j++){ -->
<%-- 	                            %> --%>
<%-- 	                            		<option value="<%=selmString[j]%>" <%=(selmString[j].equals(sel03))? "selected":"" %>><%=selmString[j]%>월</option> --%>
<%-- 	                            <%  --%>
<!-- // 	                            		} -->
<%-- 	                            %>		 --%>
	                          
<%-- 	                            <%		 --%>
<!-- // 	                            	}else if(sel03 == null){ -->
<%-- 	                            %>	 --%>
<!-- 	                            		<option value="" ></option> -->
<%-- 	                            <%		 --%>
<!-- // 	                            	} -->
<%-- 	                            %>	 --%>
	                        
<%-- 	                            	else{

<%-- 	                            %>		 --%>
<%-- 	                            		<option value="<%=selmString[j]%>" ><%=selmString[j]%>월</option> --%>
<%-- 	                            <% --%>
<%-- 	                            	} --%>
<!-- 	                            %> --%> -->
	                            		
	                       
<!-- 							</select> -->
							</td>
												<td width="48" align="right"><span class="button green"><input onclick="parent.center.location.href='../sense/chart_env2.jsp?sense_nodeId=<%=sense_nodeId%>&sense_cuId=<%=sense_cuId %>'" type="button" value="중앙값분석"></span></td>
						<td width="48" align="right"><span class="button blue"><input onclick="window.open('chart_env_excel.jsp','설문조사','fullscreen');" type="button" value="엑셀"></span></td>
						
						
						
						
						
						
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
 
<c:import url="../../module/footer.jsp"></c:import>