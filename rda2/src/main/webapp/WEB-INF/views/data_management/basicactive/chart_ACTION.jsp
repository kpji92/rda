<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.text.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.io.*"%>

<%
	request.setCharacterEncoding("UTF-8");

	Connection conn = null;
	PreparedStatement stmt = null;
	PreparedStatement stmt_2 = null;
	PreparedStatement stmt_3 = null;
	PreparedStatement stmt_4 = null;
	PreparedStatement stmt_5 = null;
	PreparedStatement stmt_6 = null;
	PreparedStatement stmt_7 = null;
	PreparedStatement stmt_8 = null;
	PreparedStatement stmt_9 = null;
	PreparedStatement stmt_10 = null;
	
	PreparedStatement stmt2 = null;
	Statement stmt3 = null;
	PreparedStatement stmt4 = null;
	
	ResultSet rs = null;
	ResultSet rs_2 = null;
	ResultSet rs_3 = null;
	ResultSet rs_4 = null;
	ResultSet rs_5 = null;
	ResultSet rs_6 = null;
	ResultSet rs_7 = null;
	ResultSet rs_8 = null;
	ResultSet rs_9 = null;
	ResultSet rs_10 = null;
	
	ResultSet rs2 = null;
	ResultSet rs3 = null;

	
	String entity="", entity1="" ,xdate= "", xdate1= "" , avr="", avr1="", e="";
	String entity3="", entity4="" ,entity5= "", entity6= "" , entity7="", entity8="", entity9="";
	String avr2="", avr3="" ,avr4= "", avr5= "" , avr6="", avr7="", avr8="", avr9="" , avr10=""; 
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
	String SQL = null;
	String SQL1 = null;
	String SQL3 = null;
	String SQL4 = null;
	String SQL_2 = null;
	String SQL_3 = null;
	String SQL_4 = null;
	String SQL_5 = null;
	String SQL_6 = null;
	String SQL_7 = null;
	String SQL_8 = null;
	String SQL_9 = null;
	String SQL_10 = null;
	
	
	
	
	
	//
	
	
	SQL3 = "select distinct substr(node_id,11,2) from TURBOSOFT.SENSE where DEV_TYPE = '1' ORDER BY substr(node_id,11,2) asc";

	
	
	if(sel02 != "" && sel02 != null ){
		//년도쿼리뽑아내기
		SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') from TURBOSOFT.SENSE where DEV_TYPE = '1' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
		stmt2 = conn.prepareStatement(SQL1);
		stmt2.setString(1, sel02);
	
		//년 안에서 월쿼리뽑아내기
		if(sel03 != "" && sel03 != null ){
	SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') from TURBOSOFT.SENSE where DEV_TYPE = '1' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'mm') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm.dd') asc";
	stmt2 = conn.prepareStatement(SQL1);
	
	stmt2.setString(1, sel03);
	}

	}else{
		//전체일일쿼리뽑아내기
		SQL1 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') from TURBOSOFT.SENSE where DEV_TYPE = '1' and DTIME BETWEEN TO_DATE('20161026', 'yyyymmdd') AND TO_DATE('20161220', 'yyyymmdd')  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy.mm.dd') asc";
		stmt2 = conn.prepareStatement(SQL1);
		
	}
	//System.out.println("sel02 go "+sel02);
	//System.out.println("sel03 go "+sel03);
	//System.out.println("stmt2 go "+SQL1);
	
	//System.out.println("sel03 come"+sel03);
	
	///////1번객체////////////

	SQL = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260001 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt = conn.prepareStatement(SQL);
	
	
	///////2번객체////////////

	SQL_2 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260002 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_2 = conn.prepareStatement(SQL_2);
	
	
	
	///////3번객체////////////

	SQL_3 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260003 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_3 = conn.prepareStatement(SQL_3);
	
	
	///////4번객체////////////

	SQL_4 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260004 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_4 = conn.prepareStatement(SQL_4);
	
	
	///////5번객체////////////

	SQL_5 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260005 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_5 = conn.prepareStatement(SQL_5);
	
	
	///////6번객체////////////

	SQL_6 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260006 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_6 = conn.prepareStatement(SQL_6);
	
	
	///////7번객체////////////

	SQL_7 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260007 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_7 = conn.prepareStatement(SQL_7);
	
	
	///////8번객체////////////

	SQL_8 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260008 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_8 = conn.prepareStatement(SQL_8);
	
	
	///////9번객체////////////

	SQL_9 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260009 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_9 = conn.prepareStatement(SQL_9);
	
	
	///////10번객체////////////

	SQL_10 = "select DTIME, ACTION_VALUE from TURBOSOFT.SENSE where NODE_ID = 201610260010 and ACTION_VALUE >=1  ORDER BY DTIME asc";
	stmt_10 = conn.prepareStatement(SQL_10);
	

	//System.out.println(SQL);

	rs3 = stmt3.executeQuery(SQL3);

	List<String> list_date = new ArrayList<String>();
	List<String> list1 = new ArrayList<String>();
	List<String> list2 = new ArrayList<String>();
	List<String> list3 = new ArrayList<String>();//1
	List<String> list4 = new ArrayList<String>();//2
	List<String> list5 = new ArrayList<String>();//3
	List<String> list6 = new ArrayList<String>();//4
	List<String> list7 = new ArrayList<String>();//5
	List<String> list8 = new ArrayList<String>();//6
	List<String> list9 = new ArrayList<String>();//7
	List<String> list10 = new ArrayList<String>();//8
	List<String> list11 = new ArrayList<String>();//9
	List<String> list12 = new ArrayList<String>();//10
	try {
		rs2 = stmt2.executeQuery();
		rs = stmt.executeQuery();
		rs_2 = stmt_2.executeQuery();
		rs_3 = stmt_3.executeQuery();
		rs_4 = stmt_4.executeQuery();
		rs_5 = stmt_5.executeQuery();
		rs_6 = stmt_6.executeQuery();
		rs_7 = stmt_7.executeQuery();
		rs_8 = stmt_8.executeQuery();
		rs_9 = stmt_9.executeQuery();
		rs_10 = stmt_10.executeQuery();
		
	

		//x축 일일 증가
		if (rs2 != null) {
			while (rs2.next()) {

				xdate = rs2.getString(1);
				xdate1 = "'" + xdate + "'";
				//xdate1.replaceAll("-", ".");
				list_date.add(xdate1);

			}
			//System.out.println(list_date);

		}
		//개체 따로 뽑아오기
		if (rs3 != null) {
			while (rs3.next()) {

				en1 = rs3.getString(1);
				//en2 = "["+"'" + en1 + "'"+"]";
				list1.add(en1);

				//System.out.println(en1);
				//en = "'" + xdate + "'";
				//list_date.add(xdate1);
			}
		}
		//1번객체
		if (rs != null) {
			while (rs.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr = rs.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list3.add(avr);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//2번객체
		
		if (rs != null) {
			while (rs_2.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr2 = rs_2.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list4.add(avr2);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//3번객체
		if (rs_3 != null) {
			while (rs_3.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr3 = rs_3.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list5.add(avr3);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//4번객체
		if (rs_4 != null) {
			while (rs_4.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr4 = rs_4.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list6.add(avr4);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//5번객체
		if (rs_5 != null) {
			while (rs_5.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr5 = rs_5.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list7.add(avr5);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//6번객체
		if (rs_6 != null) {
			while (rs_6.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr6 = rs_6.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list8.add(avr6);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//7번객체
		if (rs_7 != null) {
			while (rs_7.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr7 = rs_7.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list9.add(avr7);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//8번객체
		if (rs_8 != null) {
			while (rs_8.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr8 = rs_8.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list10.add(avr8);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//9번객체
		if (rs_9!= null) {
			while (rs_9.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr9 = rs_9.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list11.add(avr9);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}
		
		//10번객체
		if (rs_10 != null) {
			while (rs_10.next()) {

				//평균온도 값 가져와 series 형식에 맞게끔 파싱
				avr10 = rs_10.getString(2);
				//avr1 = "["+avr+"]";
				//avr1 = "["+avr+"]";
				list12.add(avr10);

			}

			//System.out.println(list4);

			// String x = list_date.toString().replace("[", "['").replace("]", "']").replace(", ", "','");

		}

	} catch (SQLException sqlException) {
		System.out.println("sql exception");
	} catch (Exception exception) {
		System.out.println("exception");
	} finally {
		if (rs != null)
			try {
				rs.close();
			} catch (SQLException ex) {
			}
		if (stmt != null)
			try {
				stmt.close();
			} catch (SQLException ex) {
			}
		if (conn != null)
			try {
				conn.close();
			} catch (Exception ex) {
			}
	}
%>

<!DOCTYPE HTML>
<html>
	<head>
	<title>Ritis appr_an</title>
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
		var entity3 = <%=list1.get(2)%>+"번 개체"
		var entity4 = <%=list1.get(3)%>+"번 개체"
		var entity5 = <%=list1.get(4)%>+"번 개체"
		var entity6 = <%=list1.get(5)%>+"번 개체"
		var entity7 = <%=list1.get(6)%>+"번 개체"
		var entity8 = <%=list1.get(7)%>+"번 개체"
		var entity9 = <%=list1.get(8)%>+"번 개체"
		var entity10 = <%=list1.get(9)%>+"번 개체"
		
		//평균온도
		var avr = <%=list3%>
		var avr1 = <%=list4%>
		var avr2 = <%=list5%>
		var avr3 = <%=list6%>
		var avr4 = <%=list7%>
		var avr5 = <%=list8%>
		var avr6 = <%=list9%>
		var avr7 = <%=list10%>
		var avr8 = <%=list11%>
		var avr9 = <%=list12%>
	
		
		$(function () {
		    var chart;
		    $(document).ready(function() {
		        chart = new Highcharts.stockChart({
		            chart: {
		                renderTo: 'container',
//		                 type: 'line',
//		                 marginRight: 0,
		                height: 600,
		                marginTop: 70,
		               zoomType : 'x'
		                               
		            },
		            rangeSelector: {
//		                 inputEnabled: $('#container').width() > 480,
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
		                text: '개체 일일 활동량',
		                style: {
							color: 'black',
							fontWeight: 'bold',
							fontSize: '17px',
							
						
						}
		            },
		           	            
		            xAxis: {
		            	text: '입력날자',
		            	type: 'datetime',
                          	min: new Date('2016/10/26').getTime(),
	                        max: new Date('2016/12/20').getTime(),
		                dateTimeLabelFormats: {
		                    second: '<br/>%H:%M:%S',
		                    minute: '<br/>%H:%M:%S',
		                    hour: '<br/>%H:%M:%S',
		                    day: '%Y<br/>%b-%d',
		                    week: '%Y<br/>%b-%d',
		                    month: '%Y-%b',
		                    year: '%Y'
// 		                    	min: new Date('2016/10/26').getTime(),
// 		                        max: new Date('2016/12/20').getTime(),
		                },
// 		                TICKINTERVAL: 1000 * 60 * 15 // INTERVAL OF 1 DAY
		                minTickInterval: 3600000
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
		           
		            exporting: {
		            	csv: {
		                    dateFormat: '%Y-%m-%d'
		                },
		                buttons: {
		                    contextButton: {
		                        menuItems: [{
		                            text: 'Print chart',
		                            onclick: function () {
		                                this.print(
		                                   
		                                );
		                            }
		                        },{separator:!0}, {
		                            text: 'Export to PNG',
		                            onclick: function () {
		                            	this.exportChart();
		                            },
		                            separator: false
		                        },
		                        {
		                            text: 'Export to JPG',
		                            onclick: function () {
		                            	this.downloadXLS();
		                            	this.exportChart({type:"image/jpeg"});
		                            },
		                            separator: false
		                        },
		                        {
		                            text: 'downloadXLS',
		                            onclick: function () {
		                            	this.downloadXLS();
		                            },
		                            separator: false
		                        }]
		                    }
		                }
		            },
		            
		            
		            tooltip: {
		                headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		                pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
		                    '<td style="padding:0"><b>{point.y:.2f}</b></td></tr>',
		                footerFormat: '</table>',
		                shared: true,
		                useHTML: true
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
// 		                    pointStart: Date.UTC(2016, 9, 26) // feb 12, 2015
		                }
		            },
// 		            exporting: {
// 		                csv: {
// 		                    dateFormat: '%Y-%m-%d'
// 		                }
// 		            },
		            
		            series: 
		            	[{name: entity1,
		                type: 'spline',
		               
		                data: avr,
		               
		                pointInterval: 1000 * 60 * 15,
		                pointStart: Date.UTC(2016, 9, 26),
		                pointEnd: Date.UTC(2016, 11, 20),
		                tooltip: {
		                    valueSuffix: ' '
		                }

		            }, {
		                name: entity2,
		                type: 'spline',
		              
		                data: avr1,
		              
		                pointInterval: 1000 * 60 * 15,
		                pointStart: Date.UTC(2016, 9, 26),
		                pointEnd: Date.UTC(2016, 11, 20),
		                marker: {
		                    enabled: false
		                },
		                dashStyle: 'shortdot',
		                tooltip: {
		                    valueSuffix: ' '
		                },
		                
		                }, 
		                
		                
		                
		                { 
		                	name: entity3,
		                    type: 'spline',
		                    
		                    data: avr2,
		                   
		                    pointInterval: 1000 * 60 * 15,
		                    pointStart: Date.UTC(2016, 9, 26),
		                    pointEnd: Date.UTC(2016, 11, 20),
		                    tooltip: {
		                        valueSuffix: ' '
		                    },
		                   
										
		                },
		                { 
		                	name: entity4,
		                    type: 'spline',
		                    
		                    data: avr3,
		                   
		                    pointInterval: 1000 * 60 * 15,
		                    pointStart: Date.UTC(2016, 9, 26),
		                    pointEnd: Date.UTC(2016, 11, 20),
		                    tooltip: {
		                        valueSuffix: ' '
		                    },
		                   
										
		                },
		                { 
		                	name: entity5,
		                    type: 'spline',
		                    
		                    data: avr4,
		                   
		                    pointInterval: 1000 * 60 * 15,
		                    pointStart: Date.UTC(2016, 9, 26),
		                    pointEnd: Date.UTC(2016, 11, 20),
		                    tooltip: {
		                        valueSuffix: ' '
		                    },
		                   
										
		                },
		                { 
		                	name: entity6,
		                    type: 'spline',
		                    
		                    data: avr5,
		                   
		                    pointInterval: 1000 * 60 * 15,
		                    pointStart: Date.UTC(2016, 9, 26),
		                    pointEnd: Date.UTC(2016, 11, 20),
		                    tooltip: {
		                        valueSuffix: ' '
		                    },
		                   
										
		                },
		                { 
		                	name: entity7,
		                    type: 'spline',
		                    
		                    data: avr6,
		                   
		                    pointInterval: 1000 * 60 * 15,
		                    pointStart: Date.UTC(2016, 9, 26),
		                    pointEnd: Date.UTC(2016, 11, 20),
		                    tooltip: {
		                        valueSuffix: ' '
		                    },
		                   
										
		                },
		                { 
		                	name: entity8,
		                    type: 'spline',
		                    
		                    data: avr7,
		                   
		                    pointInterval: 1000 * 60 * 15,
		                    pointStart: Date.UTC(2016, 9, 26),
		                    pointEnd: Date.UTC(2016, 11, 20),
		                    tooltip: {
		                        valueSuffix: ' '
		                    },
		                   
										
		                },
		                { 
		                	name: entity9,
		                    type: 'spline',
		                    
		                    data: avr8,
		                   
		                    pointInterval: 1000 * 60 * 15,
		                    pointStart: Date.UTC(2016, 9, 26),
		                    pointEnd: Date.UTC(2016, 11, 20),
		                    tooltip: {
		                        valueSuffix: ' '
		                    },
		                   
										
		                },
		                { 
		                	name: entity10,
		                    type: 'spline',
		                    
		                    data: avr9,
		                   
		                    pointInterval: 1000 * 60 * 15,
		                    pointStart: Date.UTC(2016, 9, 26),
		                    pointEnd: Date.UTC(2016, 11, 20),
		                    tooltip: {
		                        valueSuffix: ' '
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
			
			$('#getcsv').click(function () {
			    alert(chart.getCSV(2));
			});

		</script>
	</head>
	<body>
	<br>
<!-- <script src="http://www.k-call.com/js/highcharts.js"></script> -->
<!-- <script src="http://www.k-call.com/js/modules/exporting.js"></script> -->

<!-- <script type="text/javascript" src="../../../js/jquery-1.9.0.js"></script> -->
<!-- <script type="text/javascript" src="../../../js/highstock.js"></script> -->
<%-- <script src="<%=request.getContextPath() %>/js/exporting_chart.js"></script> --%>


<script src="https://code.highcharts.com/stock/highstock.js"></script>
<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="https://code.highcharts.com/stock/modules/exporting.js"></script>
<script src="https://highcharts.github.io/export-csv/export-csv.js"></script>




	 <form id ="chart3" name = "chart3" method ="post" action="chart.jsp?pageNum=1">

		<tr height="30" >
			<td height="33" colspan="4" >
			<div>
				
				<table width="100%" >
					<tr>
						<td align="left" style="padding-bottom: 5px; ">
							<font style="color:#000000; font-family:gulim; font-size:14px;"><b><img src="<%= request.getContextPath() %>/images/icon/board.png" style="width:20px; position:relative; top:0.2em"> 센서측정 > 활동량분석</b></font><br>
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
							sql5 = "select count(count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')))) from TURBOSOFT.SENSE where DEV_TYPE = '1' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')";
							stmt4 = conn.prepareStatement(sql5);
							rs = stmt4.executeQuery();
							if(rs.next()) {
								fcount = rs.getInt(1);
								
							}
								//System.out.println(fcount);
								
							// mm의 카운터 구하기
							sql8 = "select count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'yy'))),count(distinct(to_char(to_date(DTIME,'yyyy-mm-dd'),'mm'))) from TURBOSOFT.SENSE where DEV_TYPE = '1' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ? GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy')";
							stmt4 = conn.prepareStatement(sql8);
							stmt4.setString(1, sel02);
							rs = stmt4.executeQuery();
							if(rs.next()) {
								fcountm = rs.getInt(2);
							}	
								//System.out.println(fcountm);
								
							
							//	yy의 실 데이터 뿌리기
							String[] selString = new String[fcount];
							sql6 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') from TURBOSOFT.SENSE where DEV_TYPE = '1' GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'yy') asc";
							
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
							sql7 = "select to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') from TURBOSOFT.SENSE where DEV_TYPE = '1' and to_char(to_date(DTIME, 'yyyy-mm-dd'),'yy') = ?  GROUP BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') ORDER BY to_char(to_date(DTIME,'yyyy-mm-dd'),'mm') asc";
							
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
					
						
						        <td width="28px" align="right"><span class="button blue"><input onclick="window.open('chart_excel2.jsp','엑셀','fullscreen');" type="button" value="엑셀"></span></td>
								<td width="28px" align="right"><span class="button green"><input onclick="parent.center.location.href='../sense/chart_11.jsp?sense_nodeId=<%=sense_nodeId%>&sense_cuId=<%=sense_cuId %>'" type="button" value="중앙값분석"></span></td>
								<td width="28px" align="right"><span class="button green"><input onclick="parent.center.location.href='../sense/chart.jsp?sense_nodeId=<%=sense_nodeId%>&sense_cuId=<%=sense_cuId %>'" type="button" value="평균값분석"></span></td>
						        <td width="28px" align="right"><span class="button red"><input onclick="window.open('chart_tr.jsp','활동량수치','top=100px, left=100px, height=200px, width=800px');" type="button" value="활동량 설명"></span></td>
						        <td width="28px" align="right"><span class="button black"><input onclick="window.open('list_sense.jsp','전체 수치표','fullscreen');" type="button" value="전체 수치표"></span></td>
						
						
						
						
						
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
