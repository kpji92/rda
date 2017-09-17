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
	PreparedStatement stmt2 = null;
	PreparedStatement stmt4 = null;
	PreparedStatement stmt3 = null;
	
	ResultSet rs = null;
	ResultSet rs2 = null;
	ResultSet rs3 = null;
	ResultSet rs4 = null;
	
	
	
	String xdate= "" ,day_min = "" ,day_max = "", xdate1 = "",day_min1 = "" ,day_max1 = "";
	String avr= "" ,avr2 = "" ;
	

	Class.forName("oracle.jdbc.driver.OracleDriver");

	String url="jdbc:oracle:thin:@192.168.0.100:1521:kis";
	String user = "admin";
	String passwd = "sRc0488#";
	
	String sense_cuId = request.getParameter("sensecuid");     
	String sense_nodeId = request.getParameter("sensenodeid");
// 	String sense_nodeId = "201610260002";
	
	String sel02 = request.getParameter("sel02");      // 검색조건(년)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	String sel03 = request.getParameter("sel03");      // 검색조건(월)이 있을경우 셀렉트 박스의 선택된 값을 get방식으로 받는 부분
	
	conn = DriverManager.getConnection(url,user,passwd);
	
	String SQL;
	String SQL1;
	String SQL3;
	String SQL4;
	
	//SQL = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"'  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
	System.out.println("sel02 come  "+sel02);
	System.out.println("sel03 come  "+sel03);
	System.out.println("sense_nodeId  "+sense_nodeId);
	
// 	///////////////최대최소값///////////////
// 	if(sel02 != "" && sel02 != null && sense_nodeId!=null ){
// 		//년도쿼리뽑아내기
// 		SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = ? and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
// 		stmt2 = conn.prepareStatement(SQL1);
// 		stmt2.setString(1, sense_nodeId);
// 		stmt2.setString(2, sel02);
			
// 		//년 안에서 월쿼리뽑아내기
// 		if(sel03 != "" && sel03 != null && sense_nodeId!=null ){
// 			SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = ? and to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
// 			stmt2 = conn.prepareStatement(SQL1);
			
// 			stmt2.setString(1, sense_nodeId);
// 			stmt2.setString(2, sel03);
// 			}

// 	}else{
// 		//전체일일쿼리뽑아내기
// 		SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') HAVING max(ACTION_VALUE) > 0 ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
// 		stmt2 = conn.prepareStatement(SQL1);
		
// 	}
	
///////////////최대최소값///////////////
if(sel02 != "" && sel02 != null && sense_nodeId!=null ){
//년도쿼리뽑아내기
SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = ? and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
stmt2 = conn.prepareStatement(SQL1);
stmt2.setString(1, sense_nodeId);
stmt2.setString(2, sel02);
	
//년 안에서 월쿼리뽑아내기
if(sel03 != "" && sel03 != null && sense_nodeId!=null ){
	SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = ? and to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
	stmt2 = conn.prepareStatement(SQL1);
	
	stmt2.setString(1, sense_nodeId);
	stmt2.setString(2, sel03);
	}

}else{
//전체일일쿼리뽑아내기
SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') HAVING min(ACTION_VALUE) >= 0 and max(ACTION_VALUE) > 0ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
stmt2 = conn.prepareStatement(SQL1);

}
	

///////////////평균값///////////////

SQL3 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(AVG(ACTION_VALUE),3) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"' and ACTION_VALUE >=1 GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
stmt3 = conn.prepareStatement(SQL3);






///////////////중앙값///////////////

SQL4 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),ROUND(MEDIAN(ACTION_VALUE),3) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"' and ACTION_VALUE >=1 GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
stmt4 = conn.prepareStatement(SQL4);

	
	
	
	/* if(sel03 != "" && sel03 != null ){
		//월별뽑아내기
		SQL = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
		
		stmt = conn.prepareStatement(SQL);
		
		stmt.setString(1, sel03);
		
		
	}else if(sel02 != "" && sel02 != null ){
		SQL = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		
		stmt = conn.prepareStatement(SQL);
		
		stmt.setString(1, sel02);
	
	}else{
		//월전체뽑아내기
		SQL = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd'),min(ACTION_VALUE),max(ACTION_VALUE) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"'  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		stmt = conn.prepareStatement(SQL);
		
	} 
	System.out.println(SQL);*/
	
	
	
	
	
	
	List<String> list_date = new ArrayList<String>();
	List<String> list1 = new ArrayList<String>();
	List<String> list2 = new ArrayList<String>();
	List<String> list3 = new ArrayList<String>();
	List<String> list4 = new ArrayList<String>();
 
	try{
		 rs2 = stmt2.executeQuery();
		 rs3 = stmt3.executeQuery();
		 rs4 = stmt4.executeQuery();
	 
	
		if(rs2 != null){
	        while(rs2.next()){
	        	
	        	xdate = rs2.getString(1);
	        	xdate1 = "'" + xdate + "'";
	        	list_date.add(xdate1);
	        	//일별x축
	        	
	        	//list.add(xdate);
	        	day_min = rs2.getString(2);
	        	day_min1 = "[" +day_min ;
	        		
	        	day_max = rs2.getString(3);
	        	day_max1 = day_max + "]";
	        	
	        	list1.add(day_min1);
	        	list1.add(day_max1);
	        	//System.out.println(list_date);
	        	//System.out.println(xdate);
	      	  }		
		} 
		
		if(rs3 != null){
       		while(rs3.next()){
		 
       			//평균온도 값 가져와 series 형식에 맞게끔 파싱
       			avr = rs3.getString(2);
       			//avr1 = "["+avr+"]";
       			//avr1 = "["+avr+"]";
       			list3.add(avr);
       			
       				
       		}
       		
       		
		}
		if(rs4 != null){
       		while(rs4.next()){
		 
       			//평균온도 값 가져와 series 형식에 맞게끔 파싱
       			avr2 = rs4.getString(2);
       			//avr1 = "["+avr+"]";
       			//avr1 = "["+avr+"]";
       			list4.add(avr2);
       			
       				
       		}
       		
       		
		}
      		
			
/* 		if(rs != null){
	        while(rs.next()){
	        	
	        	//series 배열을 위한 파싱
	        	
	      	  }		
		} */
				
        	
        
        	
        	//System.out.println("list = " +list1);

   
	

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
  

	 
		<script type="text/javascript">
		   
		//x값축
		var categories=<%=list_date%>
		
		//y값축
		var data=<%=list1%>
		var data2=<%=list3%>
		var data3=<%=list4%>
		<%-- var data1=<%=list2%> --%>
$(function () {
   
    	window.chart = new Highcharts.stockChart({
    	
		    chart: {
		        renderTo: 'container',
		       
		        marginRight: 0,
                height: 660,
                marginTop: 70,
                zoomType : 'x'
		    },
		    credits: {
            	enabled: true,
                text: 'BestPoll',
                href: 'http://www.bestpoll.kr'
            },
            navigator: {
                adaptToUpdatedData: false,
                series: {
                    data: categories
                }
            },
		    
		    title: {
		        text: '개체 일일 변화',
		        style: {
					color: 'black',
					fontWeight: 'bold',
					fontSize: '17px',
					
				
				}
		    },
		    rangeSelector: {
//                inputEnabled: $('#container').width() > 480,
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
		
		    xAxis: {
            	type: 'datetime',
                  	min: new Date('2016/10/26').getTime(),
//                     max: new Date('2016/12/20').getTime(),
                dateTimeLabelFormats: {
                    second: '<br/>%H:%M:%S',
                    minute: '<br/>%H:%M:%S',
                    hour: '<br/>%H:%M:%S',
                    day: '%Y<br/>%b-%d',
                    week: '%Y<br/>%b-%d',
                    month: '%Y-%b',
                    year: '%Y'
//	                    	min: new Date('2016/10/26').getTime(),
//	                        max: new Date('2016/12/20').getTime(),
                },
                tickInterval: 24 * 3600 * 1000 // interval of 1 day
              
            },
            
            plotOptions: {
                column: {
                    pointPadding: 0,
                    borderWidth: 0,
                    groupPadding: 0.1,
                    pointStart: Date.UTC(2016, 10, 26) // feb 12, 2015
                }
            },
            
            
            
		    
		    yAxis: [{ // Primary yAxis
	             
                title: {
                    text: '활동량',
                    style: {
                    	 color : "##000000",
                    }
                },
                labels: {
                    format: '{value} ',
                    style: {
                    	 color : "##000000",
                    }
                },
                opposite: false,
                
            }], 
		
		    tooltip: {
		      	crosshairs: true,
		        shared: true,
		        valueSuffix: ''
		     
		    },
		    
		    
		
		    series: [{
		        name: '최대최소값',
		        data: data,
		        type: 'arearange',

		        pointInterval: 24 * 3600 * 1000,
                pointStart: Date.UTC(2016, 9, 26),
//                 pointEnd: Date.UTC(2016, 11, 20),
                tooltip: {
                    valueSuffix: ''
                },
    
		    },
		    {
		        name: '평균값',
		        data: data2,
		        type: 'line',

		        pointInterval: 24 * 3600 * 1000,
                pointStart: Date.UTC(2016, 9, 26),
//                 pointEnd: Date.UTC(2016, 11, 20),
                tooltip: {
                    valueSuffix: ''
                },
    
		    },
		    {
		        name: '중앙값',
		        data: data3,
		        type: 'spline',

		        pointInterval: 24 * 3600 * 1000,
                pointStart: Date.UTC(2016, 9, 26),
//                 pointEnd: Date.UTC(2016, 11, 20),
                tooltip: {
                    valueSuffix: ''
                },
    
		    }]
		    
		    
		    
		
	});
});
    
function selected_box_1() {
	document.chart22.sel03.selectedIndex=0;
	
	/* document.chart_3.search2.selectedIndex=0;
	document.chart_3.search4.selectedIndex=0; */
	document.chart22.submit();
}
		</script>
	
	<br>
<!-- <script src="http://www.k-call.com/js/highcharts.js"></script> -->
<!-- <script src="http://www.k-call.com/js/highcharts-more.js"></script> -->
<!-- <script src="http://www.k-call.com/js/modules/exporting.js"></script> -->

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.highcharts.com/stock/highcharts-more.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>

	 
	 <form id ="chart22" name = "chart22" method ="post" action="chart_22.jsp?sense_nodeId=<%=sense_nodeId%>&pageNum=1">
		<tr height="30" >
			<td height="33" colspan="4" >
			<div>
				
				<table width="100%" >
					<tr>
						<td align="left" style="padding-bottom: 5px; ">
							<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="resources/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 센서측정 > 분석</b></font><br>
						</td>
						<td align="right" width="71" > <!-- 검색조건 셀렉트 박스(검색 결과를 뿌려준후 선택했던값 유지되도록 코딩) -->
						
						<%
						
						
						
						conn = DriverManager.getConnection(url,user,passwd);
						
						
						
						 System.out.println(sel02);
					 System.out.println(sel03);
						
						try{
						
							//	yy의 카운터 구하기
							String sql5, sql6, sql7, sql8;
							int fcount = 0;
							int fcountm = 0;
							sql5 = "select count(count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')))) from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')";
							stmt4 = conn.prepareStatement(sql5);
							rs = stmt4.executeQuery();
							if(rs.next()) {
								fcount = rs.getInt(1);
								
							}
							System.out.println(fcount);
								
							// mm의 카운터 구하기
							sql8 = "select count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'yy'))),count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'mm'))) from TURBOSOFT.SENSE where node_id = ? and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')";
							stmt4 = conn.prepareStatement(sql8);
							stmt4.setString(1, sense_nodeId);
							stmt4.setString(2, sel02);
							rs = stmt4.executeQuery();
							if(rs.next()) {
								fcountm = rs.getInt(2);
							}	
							System.out.println(fcountm);
								
							
							//	yy의 실 데이터 뿌리기
							String[] selString = new String[fcount];
							sql6 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') from TURBOSOFT.SENSE where node_id = '"+ sense_nodeId +"' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') asc";
							
							stmt4 = conn.prepareStatement(sql6);
							rs = stmt4.executeQuery();
							
							for(int i = 0; i < fcount ; i++){
								if(rs.next()) {
									selString[i] = rs.getString(1);
							System.out.println(selString[i]);
									 
								}
							}
							
							// mm의 실 데이터 뿌리기
							String[] selmString = new String[fcountm];
							sql7 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') from TURBOSOFT.SENSE where node_id = ? and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ?  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') asc";
							
							stmt4 = conn.prepareStatement(sql7);
							stmt4.setString(1, sense_nodeId);
							stmt4.setString(2, sel02);
							//stmt4.setString(2, sel03);
							rs = stmt4.executeQuery();
							
							for(int j = 0; j< fcountm ; j++){
								if(rs.next()) {
									selmString[j] = rs.getString(1); 
									//selmString[j] = rs.getString(2);
								 System.out.println(selmString[j]);
								}
							}
							
							
							
						%>
			 
						
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