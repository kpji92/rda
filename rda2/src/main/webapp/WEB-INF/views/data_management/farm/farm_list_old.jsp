<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../module/top_menu.jsp"></c:import>
<c:import url="../../module/side_data_management.jsp"></c:import>
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
<style >
     @import url(http://fonts.googleapis.com/earlyaccess/notosanskr.css);

body{font-family: 'Noto Sans KR', sans-serif;}
a{ text-decoration:none }
#wrap{width:100%; height:100%;}
#wrap #sideMenu{height:100%; position:fixed; border-right:1px solid #ccc; float:left; z-index: 1; background:#fff;}
#wrap #sideMenu #loginMenu{width:100%; margin-top:50px; margin-left:60px;}
#wrap #sideMenu #loginMenu li{float:left;width:30%; padding:0 10px; text-align: center;}
#wrap #sideMenu #loginMenu li a{color:#7F7D7F; font-size:15px; text-decoration:none;}
#wrap #sideMenu #nameTitle{width:100%; text-align: center;margin-top:220px; font-size:36px; font-weight:500; color:#DA653A;}
#wrap #sideMenu #categoryMenu{width:100%;margin-top:50px; text-align:center;}
#wrap #sideMenu #categoryMenu li{width:100%; padding:15px 0;}
#wrap #sideMenu #categoryMenu li a{color:#434343; text-align: center; font-size:18px;}
#wrap #sideMenu #categoryMenu li:hover a{font-weight: bold;}
#wrap #sideMenu #openSide {margin-top:30px; margin-left:20px;}
#wrap #sideMenu #openSide{display: none;}
.noneAppear{display: none;}

#wrap #content{height:100%;margin-left:320px; }
#wrap #content #container{width:1200px; height:100%;margin-left:20px; margin-top:150px; padding-right:20px;}
#wrap #content #container h4{font-size:40px;}
#wrap #content #container table{margin-top:10px; border-top:2px solid #DA653A;}
#wrap #content #container table tr{height:55px; border-bottom:1px solid #ccc;}
#wrap #content #container table th{height:55px; vertical-align: middle; background:#F8F7F8; text-align: center !important; border-right:1px solid #ccc; border-bottom: 1px solid #ccc;}
#wrap #content #container table th:last-child{border-right: 0;}
#wrap #content #container table thead{border-bottom:1px solid #ccc;}
#wrap #content #container table td{height:50px; vertical-align: middle; text-align: center; border-right:1px solid #ccc;  border-bottom: 1px solid #ccc;}
#wrap #content #container table td:last-child{border-right:0;}
#wrap #content #container table td.title{background:#F8F8F8; text-align: left;}
#wrap #content #container table td.title .area{margin-left:15px;}
#wrap #content #container table td.title .area2{margin-left:28px;}
#wrap #content #container table td .star{color:#DA653A; display: inline-block; font-size: 20px; margin-right:5px;}
#wrap #content #container table td.inputTd{text-align: left;}
#wrap #content #container table td.inputTd input{ margin-left:30px; width:300px; padding-left:15px; height:40px; border:1px solid #ccc;}
#wrap #content #container table td.inputTd input#nickName{ margin-left:30px; width:200px; padding-left:15px; height:40px; }
#wrap #content #container table td.inputTd input#id{ margin-left:30px; width:200px; padding-left:15px; height:40px;}
#wrap #content #container table td #cmmPercent{width:120px;}
#wrap #content #container table td #calcCost{width:120px;}
#wrap #content #buttonWrap{width:100%; margin-top:50px;}
.btn-primary{background:#e8540b !important; border:0;}
#addTeam{float:right; margin-top:-90px;}
#submitTeam{margin-left:200px;}
#submitInfo{margin-left:220px;}
.checkNickName{float:right;margin-top:2px;margin-right:30px; font-size:16px;}
.checkId{float:right;margin-top:2px;margin-right:30px; font-size:16px;}
#dataWrap table input{text-align:center;}
#wrap #content #container #listTab{width:100%; border-top:2px solid #DA653A;  border-bottom:1px solid #ccc; margin-top:30px;}
#wrap #content #container #listTab ul{width:100%;}
#wrap #content #container #listTab ul li{float:left; width:33.3%; text-align: center; cursor: pointer; }
#wrap #content #container #listTab ul li a{color:#434343; font-size:20px; padding:15px 0; padding-bottom:20px; text-decoration:none; display:block;}  
#wrap #content #container #listTab ul li a.on{color:#DA653A; }
#wrap #content #container #listTab ul li span{ margin-left:10px;}
#wrap #content #container #listTab ul li span img{margin-bottom:-5px;}
#wrap #content #container .tabTable{margin-top:30px;}
#wrap #content #container .tabTable h5{font-size: 30px;}
#wrap #content #container .tabTable h5 span{font-size:25px;}

.searchWrap{width:100%; text-align:right;}
.searchWrap .searchContent{ position:absolute; top:363px; margin-top margin-bottom:100px; z-index:1;}
.searchWrap select{margin:0 4px;  background: #fff;}
.searchWrap span{font-weight: bold; font-size:20px; margin-left: 10px;}
.searchWrap input{width:180px; height:30px; font-size:20px; padding-bottom:2px; border:0; text-align: right; margin-left:3px; font-weight:500;}

.searchWrap2{width:100%; text-align:right;}
.searchWrap2 .searchContent{ position:absolute; height:30px; top:242px; z-index:1;}
.searchWrap2 select{margin:0 4px;  background: #fff;}
.searchWrap2 span{font-weight: bold; font-size:20px; margin-left: 10px;}
.searchWrap2 input{width:180px; height:30px;  font-size:20px; padding-bottom:2px; border:0; text-align: right; margin-left:3px;  font-weight:500;}

#commissionWrap{width:190px; border:1px solid #ccc; border-radius: 3px; line-height: 2em; position:absolute; margin-left:20px; top:70px;}
#commissionWrap #commissionTxt{float:left; margin-left:10px;}
#commissionWrap #commissionPercent{float:right; margin-right:10px;}


#DataTables_Table_0_wrapper{width:1200px; !important; margin-top:50px;}
#DataTables_Table_0_filter{width:1200px; !important;}
.pagination{margin:0 auto;}
div.dataTables_wrapper div.dataTables_paginate{text-align: center !important; margin-top:60px;}
div.dataTables_filter{text-align:right !important;}
.dataTables_paginate{width:1200px !important;}
.dataTables_info{display: none;}
div.dataTables_filter input{width:150px !important;}
div.dataTables_wrapper div.dataTables_filter input{  font-size:16px !important; margin-bottom:5px !important;}
.btn-group, .btn-group-vertical{display: block !important; margin-bottom:20px;}
.dt-buttons a{margin-bottom:15px !important;}
.pagination > .active > a, .pagination > .active > span, .pagination > .active > a:hover, .pagination > .active > span:hover, .pagination > .active > a:focus, .pagination > .active > span:focus{background:#e8540b; border-color:#ccc;}
.pagination > li > a, .pagination > li > span{color:#434343;}



.clearFix{content: ""; display: inline-block; clear: both;}
 
 #content table{
                
               width: 100%;;
                border-top:2px solid cornflowerblue;
             
            }
           #content  table thead th{
                
   
                  background-color: lightgoldenrodyellow;
               padding: 10px;
               border-right: 1px  solid #ccc;
                  border-bottom: 1px solid #ccc;
       text-align: center;
            }  
              #content  table tbody tr td{
                            
           
                padding: 10px !important;
                  border-right: 1px  solid #ccc;
                  border-bottom: 1px solid #ccc;
            }  
            #content  table tbody tr:hover{
                 background-color : #dbdef8;
/*                  color : white */
            }
             #content  table tbody tr:hover td{
               
/*                  color : white */
            }
  #content .buttons-excel{
/*                  background-color: aqua; */
  border: 2px  solid #ccc;
            }       
</style>

<script>
	$(document).ready(function(){
	    $("#searchValue").keydown(function (key) {
	        if(key.keyCode == 13){ //엔터키
	        	searchList();
	        }
	    });
	    $("#searchBtn").click(function (key) {
	        	searchList();
	    });
	});
	
	function searchList(){
		var searchOption = $('#searchOption').val();
		var searchValue = $('#searchValue').val();
		window.location.href = "farmList?searchOption="+searchOption+"&searchValue="+ encodeURI(searchValue);
	}
	
	
	
	
	//==============================================================
		
		$(document).ready(function(){
   var table = 
        $('#payList').DataTable( {
          dom: 'Bfrtip',
          lengthChange: false,
          autoWidth : false,
          processing: false,
          ordering: true,
          serverSide: false,
          searching: true,
          //lengthMenu : [ [ 3, 5, 10, -1 ], [ 3, 5, 10, "All" ] ],
          pageLength: 10,
          bPaginate: true,
          bLengthChange: false,
          bAutoWidth: false,
          bStateSave: true,
          buttons: ['excel'], 
          oLanguage : {
             sProcessing : "처리중...",
             sZeroRecords : "데이터가 없습니다.",
             oPaginate : {
                   sFirst : "처음",
                   sNext : ">",
                   sPrevious : "<",
                   sLast : "끝"
 
             },
             sInfo : "총_TOTAL_건 중, _START_건부터_END_건까지 표시",
             sInfoEmpty : "0 건 중, 0부터 0 까지 표시", 
             sInfoFiltered : "(총 _MAX_ 건에서 추출 )",
             sSearch : "상세 검색 : "                
       },
    ajax : {
   
      "url":"${pageContext.request.contextPath }/ajax/farmList",
      "type":"POST",
      "dataSrc": function(json){
    	   console.log("======");  console.log(json.farmList);
    	   var farmlist = json.farmList;
    	   if (json.farmList != 'null') {
    		   
    		   console.log("===ok==");  
    		   console.log(farmlist.length);  
            
    		   for(var i=0; i<farmlist.length; i++){
    			   //핸드폰번호 조합하여 phone1에 넣게
    			   if(farmlist[i].phone1=="null"){ farmlist[i].phone1=""   }
    			   if(farmlist[i].phone2=="null"){ farmlist[i].phone2=""   }
    			   if(farmlist[i].phone3=="null"){ farmlist[i].phone3=""   }
    			   if(farmlist[i].phone1==null){ farmlist[i].phone1=""   }
    			   if(farmlist[i].phone2==null){ farmlist[i].phone2=""   }
    			   if(farmlist[i].phone3==null){ farmlist[i].phone3=""   }
    			   
    			   console.log(farmlist[i].phone1);  
		   	        	
 		   	        	farmlist[i].phone1 = farmlist[i].phone1+"-" +farmlist[i].phone2+"-" +farmlist[i].phone3 ;
 
		   	             
		   	             
		   	     
		   	    	   
		   	       //일반번호 조합하여 hp1에 넣기
 		   	        if(farmlist[i].hp1=="null"){ farmlist[i].hp1=""   }
     			   if(farmlist[i].hp2=="null"){ farmlist[i].hp2=""   }
     			   if(farmlist[i].hp3=="null"){ farmlist[i].hp3=""   }
     			   if(farmlist[i].hp1==null){ farmlist[i].hp1=""   }
     			   if(farmlist[i].hp2==null){ farmlist[i].hp2=""   }
     			   if(farmlist[i].hp3==null){ farmlist[i].hp3=""   }
     			   
     			   

	   	        	
	   	        	farmlist[i].hp1 = farmlist[i].hp1+"-" +farmlist[i].hp2+"-" +farmlist[i].hp3 ;

     			   
		   	    	   
		   	       //보기 버튼 만들기	
		   	       // phone2에 지도보기버튼 추가
		   	      	farmlist[i].phone2 =" 	<div align='center'><a href='farmUpdate?farmId=${list.farmId }''><input type='button' value='보기'></a></div>";
		   	    	   
		            //수정 버튼만들기
		   	    	  //phone3에 수정버튼 추가
		   	    	  
		   	    	      	farmlist[i].phone3 =" <div align='center'><a href='farmUpdate?farmId=${list.farmId }''><input type='button' value='수정'></a></div>";
		   	    	  
		   	    	  
		   	    	   
//		   	     	   		<div align="center">
//		   	 										<input type="button" value="보기">
//		   	 									</div>
//		   	 								</td>
//		   	 								<td style="font-size: 13px;">
//		   	 									<div align="center">
//		   	 										<a href="farmUpdate?farmId=${list.farmId }"><input type="button" value="수정"></a>
//		   	 									</div>
		   	    	 
   	          }
    		   
    	   }
    	   //핸드폰번호 조합하여 phone1에 넣게
    	   
    	   //일반번호 조합하여 hp1에 넣기
    	   
    	   
    //보기 버튼 만들기	   
    	   
    	   //수정 버튼만들기
//     	   		<div align="center"><input type="button" value="보기"></div>
// 							
// 									<div align="center"><a href="farmUpdate?farmId=${list.farmId }"><input type="button" value="수정"></a></div>
    	   
    	   
//         if (json.data != 'null') {
       
//          for(var i=0; i<json.length; i++){
//          if( json[i].corpSttus == 'D'){
//            json[i].corpSttus = '이용 중지'
//          } else{
//           json[i].corpSttus  = '이용중'
//          }
//          json[i].pageIndex = i+1;
         
//          }
         
//          return json;
//          }
return json.farmList
      }
  },            
  columns : [
      {data: "rnum", sClass:"counNo"},
      {data: "farmId"},
      {data: "fname"},
      {data: "name"},
      {data: "hp1"},
      {data: "phone1"},      
      {data: "address"},
      {data: "kc"},
      {data: "mc"},
      {data: "calf"},
      {data: "phone2"},
      {data: "phone3"}
      
  ]
   });      
      
       
});

 
		//=======================================

		
		
</script>
<div id="amc_content_body" class="amc_content_body">
	<table width="100%" height="415">
		<tr height="30">
			<td height="33" colspan="4">
				<div>
					<table width="100%">
						<tr>
							<td align="left" style="padding-bottom: 5px">
								<font style="color: #000000; font-family: gulim; font-size: 14px;">
									<b>
										<img src="<c:url value='resources/img/board.png'/>" style="width: 20px; position: relative; top: 0.2em">
										목장자료
									</b>
								</font>
								<br>
							</td>
							<td width="71">
								<select id="searchOption" name="searchOption">
									<c:choose>
										<c:when test="${searchOption eq 'fname' }">
											<option value="fname" selected>목장명</option>
											<option value="name">목장주 이름</option>
										</c:when>
										<c:when test="${searchOption eq 'name' }">
											<option value="fname">목장명</option>
											<option value="name" selected>목장주 이름</option>
										</c:when>
										<c:otherwise>
											<option value="fname" selected>목장명</option>
											<option value="name">목장주 이름</option>
										</c:otherwise>
									</c:choose>
								</select>
							</td>
							<td width="149">
								<c:choose>
									<c:when test="${searchValue ne '' and searchValue ne 'none'}">
										<input type="text" id="searchValue" name="searchValue" size="25" value="${searchValue }">
									</c:when>
									<c:otherwise>
										<input type="text" id="searchValue" name="searchValue" size="25">
									</c:otherwise>
								</c:choose>
							</td>
							<td width="40">
								<span class="button white">
									<input class="button blue" id="searchBtn" type="submit" value="검색">
								</span>
							</td>
							<td width="48" align="right">
								<span class="button blue"><input type="button" value="엑셀" onClick="location.href='farmListExcel'"></span>
							</td>
							<td width="48" align="right">
								<span class="button black"><input type="button" value="인쇄" onClick="print(document.getElementById('amc_content_body').innerHTML)"></span>
							</td>
							<td width="48" align="right">
								<span class="button red"><input type="button" value="추가" onclick="location.href='farmAdd'"></span>
							</td>
						</tr>
					</table>
				</div>
			</td>
		</tr>
		<tr height="400">
			<td colspan="4" valign="top">
				<div id="Contents">
					<table class="table_003 w100p">
						<tr>
							<th style="font-size: 14px;" width="5%" rowspan="2">No</th>
							<th style="font-size: 14px;" width="5%" rowspan="2">목장번호</th>
							<th style="font-size: 14px;" width="15%" rowspan="2">목장명</th>
							<th style="font-size: 14px;" width="8%" rowspan="2">목장주</th>
							<th style="font-size: 14px;" width="8%" rowspan="2">일반전화</th>
							<th style="font-size: 14px;" width="8%" rowspan="2">휴태폰</th>
							<th style="font-size: 14px;" width="8%" rowspan="2">지역</th>
							<th style="font-size: 14px;" width="5%" colspan="3">사육두수</th>
							<th style="font-size: 14px;" width="3%" rowspan="2">지도</th>
							<th style="font-size: 14px;" width="3%" rowspan="2">수정</th>
						</tr>
						<tr>
							<th style="font-size: 14px;" width="5%">황소
							</td>
							<th style="font-size: 14px;" width="5%">젖소
							</td>
							<th style="font-size: 14px;" width="5%">송아지
							</td>
						</tr>
						<c:forEach var="list" items="${farmList }">
							<tr onMouseOver="this.style.backgroundColor='#CCFFFF'" onMouseOut="this.style.backgroundColor=''">
								<td align="center">${list.rnum}</td>
								<td style="font-size: 13px;"><div align="center">${list.farmId} </div></td>
								<td style="font-size: 13px;"><div align="center">${list.fname}</div></td>
								<td style="font-size: 13px;"><div align="center">${list.name}</div></td>
								<td style="font-size: 13px;"><div align="center">${list.phone1}-${list.phone2}-${list.phone3}</div></td>
								<td style="font-size: 13px;"><div align="center">${list.hp1}-${list.hp2}-${list.hp3}</div></td>
								<td style="font-size: 13px;"><div align="center">${list.address}</div></td>
								<td style="font-size: 13px;" width="5%"><div align="center">${list.kc}</div></td>
								<td style="font-size: 13px;" width="5%"><div align="center">${list.mc}</div></td>
								<td style="font-size: 13px;" width="5%"><div align="center">${list.calf}</div></td>
								<td style="font-size: 13px;">
									<div align="center">
										<input type="button" value="보기">
									</div>
								</td>
								<td style="font-size: 13px;">
									<div align="center">
										<a href="farmUpdate?farmId=${list.farmId }"><input type="button" value="수정"></a>
									</div>
								</td>
							</tr>
						</c:forEach>
					</table>
				</div>
			</td>
		</tr>
		<tr>
			<table width="100%">
				<tr height="30">
					<td width="10%"></td>
					<td width="80%" align="center">
						<a href="farmList?pageNum=1&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none; color: #494949; font-family: gulim;">◀처음&nbsp;</a>
						
						<c:choose>
				    		<c:when test="${paging.pageNum ne 1}">
				    			<a href="farmList?pageNum=${paging.pageNum-1}&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none; color: #494949; font-family: gulim;">[이전]&nbsp;</a>
				    		</c:when>
				    		<c:otherwise>
				    			<a href="#" style="text-decoration: none; color: #494949; font-family: gulim;">[이전]&nbsp;</a>
			    			</c:otherwise>
				    	</c:choose>
						
						<c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}" step="1">
							<c:choose>
					    		<c:when test="${paging.pageNum eq i}">
					    			<a href="#" style="text-decoration: none; color: #0000FF"><b>[${i }]</b>&nbsp;</a>
					    		</c:when>
					    		<c:otherwise>
					    			<a href="farmList?pageNum=${i }&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none;"><b>[${i }]</b>&nbsp;</a>
				    			</c:otherwise>
					    	</c:choose>
						</c:forEach>
						
						<c:choose>
				    		<c:when test="${paging.pageNum ne paging.lastPage}">
				    			<a href="farmList?pageNum=${paging.pageNum+1}&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none; color: #494949; font-family: gulim;">[다음]&nbsp;</a>
				    		</c:when>
				    		<c:otherwise>
				    			<a href="#" style="text-decoration: none; color: #494949; font-family: gulim;">[다음]&nbsp;</a>
			    			</c:otherwise>
				    	</c:choose>
				    							
						<a href="farmList?pageNum=${paging.lastPage }&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none;">마지막▶</a>
					</td>
 
 검색된 총 데이터 갯수 출력해주는부분
 <td width="10%" align="right">
						<font style="font-weight: bold">검색수</font> : ${totalCount }&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</tr>
	</table>
	
	<div id="content">
	<table id="payList">
                   <colgroup>
                        <col width="100px">
                          <col width="100px">
                            <col width="150px">
                              <col width="150px">
               
                        <col width="100px">
                        <col width="100px">
                        <col width="100px">
                            <col width="70px">
                        <col width="70px">
                        <col width="70px">
                            <col width="70px">
                        <col width="70px">
                    </colgroup>
                    <thead>
                     <tr>
                         <th>
                             NO
                         </th>
                         <th>
                             목장번호
                         </th>
                         <th>
                             목장명
                         </th>
                         <th>
                             목장주
                         </th>
                         <th>
                             일반전화
                         </th>
                         
                            <th>
                             휴대폰
                         </th>
                         <th>
                             지역
                         </th>
                         <th>
                             황소
                         </th>
                          <th>
                             젖소
                         </th>
                          <th>
                             송아지
                         </th>
                            <th>
                             지도
                         </th>
                          <th>
                             수정
                         </th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
    	</div>
</div>








<c:import url="../../module/footer.jsp"></c:import>