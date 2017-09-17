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
<link rel="StyleSheet" href="<c:url value='resources/css/datatable.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/datatableUse.css'/>" type="text/css">
<style>
/* table tbody tr td{ */
/* 	text-align:center; */
/* } */
 
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
		window.location.href = "quList?searchOption="+searchOption+"&searchValue="+ encodeURI(searchValue);
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
   
      "url":"${pageContext.request.contextPath }/ajax/quList",
      "type":"POST",
      "dataSrc": function(json){
    	   console.log("======");  console.log(json.quList);
    	   var quList = json.quList;
    	   if (json.quList != 'null') {
    		   
    		   console.log("===ok==");  
    		   console.log(quList.length);  
            
    		   for(var i=0; i<quList.length; i++){
    			   //핸드폰번호 조합하여 phone1에 넣게
    			   if(quList[i].phone1=="null"){ quList[i].phone1=""   }
    			   if(quList[i].phone2=="null"){ quList[i].phone2=""   }
    			   if(quList[i].phone3=="null"){ quList[i].phone3=""   }
    			   if(quList[i].phone1==null){ quList[i].phone1=""   }
    			   if(quList[i].phone2==null){ quList[i].phone2=""   }
    			   if(quList[i].phone3==null){ quList[i].phone3=""   }
    			   
    			   console.log(quList[i].phone1);  
		   	        	
 		   	        	quList[i].phone1 = quList[i].phone1+"-" +quList[i].phone2+"-" +quList[i].phone3 ;
 
		   	             
		   	             
		   	     
		   	    	   
		   	       //일반번호 조합하여 hp1에 넣기
 		   	        if(quList[i].hp1=="null"){ quList[i].hp1=""   }
     			   if(quList[i].hp2=="null"){ quList[i].hp2=""   }
     			   if(quList[i].hp3=="null"){ quList[i].hp3=""   }
     			   if(quList[i].hp1==null){ quList[i].hp1=""   }
     			   if(quList[i].hp2==null){ quList[i].hp2=""   }
     			   if(quList[i].hp3==null){ quList[i].hp3=""   }
     			   
     			   

	   	        	
	   	        	quList[i].hp1 = quList[i].hp1+"-" +quList[i].hp2+"-" +quList[i].hp3 ;

     			   
		   	    	   
		   	       //보기 버튼 만들기	
		   	       // phone2에 지도보기버튼 추가
		   	      	quList[i].phone2 =" 	<div align='center'><a href='farmUpdate?farmId=${list.farmId }''><input type='button' value='보기'></a></div>";
		   	    	   
		            //수정 버튼만들기
		   	    	  //phone3에 수정버튼 추가
		   	    	  
		   	    	      //	quList[i].phone3 =" <div align='center'><input type='button' onclick=\"window.open('qu2?farm_fname="+	quList[i].fname+"','설문조사','top=100px, left=200px, height=800px, width=850px');\" value='수정'></div>";
		   	    	     // 	quList[i].phone3 =" <div align='center'><input type='button' onclick=\"window.open('qu2?farm_fname="+quList[i].fname+"','설문조사','top=100px, left=200px, height=800px, width=850px');\" value='수정'></div>";
		   	    	     
		   	    		quList[i].phone3 =" <div align='center'><input type='button' onclick=\"window.open('qu2?farm_fname="+encodeURI(quList[i].fname)+"','설문조사','top=100px, left=200px, height=800px, width=850px');\" value='시작'></div>";

		   	    	       //  window.open('qu2.jsp?farm_fname=산청)남산목장','설문조사','top=100px, left=200px, height=800px, width=850px');
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
return json.quList
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
      
  ],
         initComplete : function() {
 
        	 
        	 
        	 $('#payList_filter').prepend( $('#buttonWrap')) ;
        	 
         }
  
  
  
  //=============
   });      
      
       
});

 
		
</script>
 <div id="buttonWrap">
			 <input  class="btn btn-default buttons-excel buttons-html5" type="button" value="인쇄" onclick="window.print(document.getElementById('content').innerHTML)">
			   
			 
				  
</div>	
	<div id="content">
	<table id="payList">
                   <colgroup>
                        <col width="70px">
                          <col width="70px">
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
                             조사
                         </th>
                        </tr>
                    </thead>
                    <tbody>
                        
                    </tbody>
                </table>
    	</div>
 








<c:import url="../../module/footer.jsp"></c:import>