<%@ page contentType="text/html; charset=utf-8" import="java.sql.*" import="java.text.*" import="java.util.*"%>

<html>
<head>
        <link rel="stylesheet" href="../css/common.css" type="text/css" />
        <link rel="stylesheet" href="../css/layout.css" type="text/css" />
        <link rel="stylesheet" href="../css/button.css" type="text/css" />
        <link rel="stylesheet" href="../css/table.css" type="text/css" />
        <link rel="stylesheet" href="../css/box.css" type="text/css" />
        <link rel="stylesheet" href="../css/searchbox.css" type="text/css" />
        <link rel="stylesheet" href="../css/jquery-ui.css" type="text/css" />
        <link rel="stylesheet" href="../css/navigation.css" type="text/css" />
        <link rel="stylesheet" href="../css/location.css" type="text/css" />


	    <script type="text/javascript" src="../js/common.js"></script>
        <script type="text/javascript" src="../js/jquery-1.4.1.js"></script>
        <script type="text/javascript" src="../js/jquery-ui.js"></script>
		<script type="text/javascript">
function listView()
{
	location.reload(); 
}
function sendView()
{
	location.href='http://192.168.0.200:5030/kis_system/YYS/flex_jsp/kis_jsp/hongbosms/smsMain.jsp'; 
}
function moneyView()
{
	alert("준비중입니다");
}




		</script>
</head>
<body>
<%


        Class.forName("org.gjt.mm.mysql.Driver");
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		

		String DB_URL = "jdbc:mysql://115.68.22.146:3306/mcssdk?autoReconnect=true";
		String DB_USER = "sdkmsg"; 
		String DB_PASSWORD= "Sdk_2708"; 
		



			 int rowCount = 0;
			 int pageCount = 0;
			 int viewCount = 15;
			 String pageNum = request.getParameter("pageNum");
			 int current_page = 1;
			 
			 conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
		     stmt = conn.createStatement();
			 String SQL = "select count(*) from SDK_SMS_REPORT  WHERE USER_ID LIKE 'ceo'";
			 String MSG_ID,SUBJECT,DEST_COUNT,SUCC_COUNT,FAIL_COUNT,USER_ID,SEND_DATE;
			 int idx =1;


			   
			   
			 rs = stmt.executeQuery(SQL);

			  if(rs.next())rowCount = rs.getInt(1);
			  pageCount=((rowCount-1)/15)+1;


 
			 if(pageNum != null)
			 current_page = Integer.parseInt(pageNum);

			
			// int start = (current_page -1) * viewCount +1;
			 int end = current_page * viewCount;
%>
<br>
<div width="100%" align="right">
<table border="0"  >
<tr>
<td align="right"><span class="button blue"><input type="button" value="목록" onclick="listView()"></span>
<td align="center"><span class="button red"><input type="button" value="발송" onclick="sendView()"></span>
<td align="left"><span class="button black"><input type="button" value="요금" onclick="moneyView()"></span>
</tr>
</table>
</div>
<br>
<table class="table_003 w100p">
	<tr>
		<th style="font-size: 12px;" width="5%">Index</th>
		<th style="font-size: 12px;" width="50%">제목</th>
		<th style="font-size: 12px;" width="10%">발송자</th>
		<th style="font-size: 12px;" width="20%">발송일</th>
		<th style="font-size: 12px;" width="5%">대상</th>
		<th style="font-size: 12px;" width="5%">성공</th>
		<th style="font-size: 12px;" width="5%">실패</th>
	</tr>
	
<%


		try{
http://192.168.0.200:5030/kis_system/YYS/flex_jsp/kis_jsp/hongbosms/faxList.jsp?pageNum=2
			conn = DriverManager.getConnection(DB_URL,DB_USER,DB_PASSWORD);
		    stmt = conn.createStatement();
	//		SQL = " select * from(select SDK_SMS_REPORT.*, rownum as rnum from SDK_SMS_REPORT) where between "+start+" and "+end+"" ;
		  
			SQL = "select * from SDK_SMS_REPORT  WHERE USER_ID LIKE 'ceo' LIMIT "+ (current_page-1)*15 +", 15";

			rs = stmt.executeQuery(SQL);

			while(rs.next()){
				MSG_ID = rs.getString("MSG_ID");
				SUBJECT = rs.getString("SUBJECT");
				DEST_COUNT = rs.getString("DEST_COUNT");
				SUCC_COUNT = rs.getString("SUCC_COUNT");
				FAIL_COUNT = rs.getString("FAIL_COUNT");
				USER_ID = rs.getString("USER_ID");
				SEND_DATE = rs.getString("SEND_DATE");

				
	%><tr>
		<td><%=MSG_ID%></td>
		<td><div width="100%" align="left">&nbsp;&nbsp;<%=SUBJECT%></div></td>
		<td><%=USER_ID%></td>
		<td><%=SEND_DATE%></td>
		<td><%=DEST_COUNT%></td>
		<td><%=SUCC_COUNT%></td>
		<td><%=FAIL_COUNT%></td>	  
	</tr>

	<%
		}

	%>
	</table>
	<%

			   
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

<br>
<div width="100%" align="center">
<%
	if(current_page >10)
	{
		%>
		<a href="smsListv.jsp?pageNum=<%=current_page-10%>"><<</a>
		<%
	}

	if(current_page >1)
	{
		%>
		<a href="smsListv.jsp?pageNum=<%=current_page-1%>"><</a>
		<%
	}

	for(int i=current_page; i<current_page+10;i++){
		if(i<=pageCount)
		{
			%>
			<a href="smsListv.jsp?pageNum=<%=i%>"><%=i%></a>
			<%
			}
	}

	if(pageCount >= current_page+1)
	{
		%>
		<a href="smsListv.jsp?pageNum=<%=current_page+1%>">></a>
		<%
	}

	if(pageCount >= current_page+10)
	{
		%>
		<a href="smsListv.jsp?pageNum=<%=current_page+10%>">>></a>
		<%
	}

%>
</div>
</body>
</html>