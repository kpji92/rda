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
					
							
						var 	 varfarmId ="001"; 
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
				   
				      "url":"${pageContext.request.contextPath }/ajax/biochemicalEntityListDetail",
				      "type":"POST",
				      "data" : { ENTITY_ID :  "${entity_id}", },
				      "dataSrc": function(json){
				    	   console.log("======");  
				    	   console.log(json);
				    	   var farmlist = json.entityList;
				    	   if (json == 'null') {alert();}
				    	   if (json != 'null') {
				    		   
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
						   	    //  	farmlist[i].phone2 =" 	<div align='center'><a href='envEntityUpdate?farmId=${farmId }''><input type='button' value='수정'></a></div>";
						   	    	      	farmlist[i].phone3 =" <div align='center'><a href='biochemicalEntityUpdate?farmId=${farmId}&entity_id="+farmlist[i].entity_ID+"&seqno="+farmlist[i].seqno+"'><input type='button' value='수정'></a></div>";
		   	    	  
		   	    	     
						            //수정 버튼만들기
						   	    	  //phone3에 수정버튼 추가
						   	    	  
						   	    	     // 	farmlist[i].phone3 =" <div align='center'><a href='envEntityList?farmId="+farmlist[i].farmId+"'><input type='button' value=' 수정'></a></div>";
						   	    	  
						   	    	  
						   	    	   
//						   	     	   		<div align="center">
//						   	 										<input type="button" value="보기">
//						   	 									</div>
//						   	 								</td>
//						   	 								<td style="font-size: 13px;">
//						   	 									<div align="center">
//						   	 										<a href="farmUpdate?farmId=${list.farmId }"><input type="button" value="수정"></a>
//						   	 									</div>
						   	    	 
				   	          }
				    		   
				    	   }
				    	   //핸드폰번호 조합하여 phone1에 넣게
				    	   
				    	   //일반번호 조합하여 hp1에 넣기
				    	   
				    	   
				    //보기 버튼 만들기	   
				    	   
				    	   //수정 버튼만들기
//				     	   		<div align="center"><input type="button" value="보기"></div>
//				 							
//				 									<div align="center"><a href="farmUpdate?farmId=${list.farmId }"><input type="button" value="수정"></a></div>
				    	   
				    	   
//				         if (json.data != 'null') {
				       
//				          for(var i=0; i<json.length; i++){
//				          if( json[i].corpSttus == 'D'){
//				            json[i].corpSttus = '이용 중지'
//				          } else{
//				           json[i].corpSttus  = '이용중'
//				          }
//				          json[i].pageIndex = i+1;
				         
//				          }
				         
//				          return json;
//				          }
				return json.entityList
				      }
				  },            
				  columns : [
					   {data: "rnum", sClass:"counNo"},
					      {data: "entity_ID"},
					      {data: "bio_GATHERDATE"},
					      {data: "total_PROTEIN"},
					      {data: "glucose"},
					      {data: "na"},      
					      {data: "k"},
					      {data: "cl"},
					      {data: "equipment"},
// 					      {data: "feces_BLOOD"},
// 					      {data: "diarrhea"},
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
							 <input  class="btn btn-default buttons-excel buttons-html5" type="button" value="인쇄" onClick="print(document.getElementById('payList').innerHTML)">
							  
			 			 <input  class="btn btn-default buttons-excel buttons-html5"  type="button" value="추가" onclick="location.href='biochemicalEntityInsert?farmId=${farmId }&entity_id=${entity_id}'"> 
								  
				</div>	
				<div id="content">
	<table id="payList">
                   <colgroup>
                        <col width="70px">
                        <col width="100px">
                            <col width="150px">
                              <col width="150px">
                           <col width="100px">
               
                        <col width="100px">
                        <col width="100px">
                        <col width="100px">
                        <col width="100px">
                            <col width="70px">
<%--                         <col width="70px"> --%>
<%--                         <col width="70px"> --%>
<%--                       <col width="70px"> --%>
<%--                         <col width="70px"> --%>
                    </colgroup>
                    <thead>
                     <tr>
                                                  <th>
                             NO
                         </th>
                         <th>
                              개체ID
                         </th>
                         <th>
                            생화학 채취일
                         </th>
                         <th>
                             TOTAL_PROTEIN
                         </th>
                         <th>
                             GLUCOSE
                         </th>
                         
                            <th>
                             NA
                         </th>
                         <th>
                            K
                         </th>
                         <th>
                             CL
                         </th>
                          <th>
                            검사 장비	
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







				<c:import url="../../module/footer.jsp"></c:import>
				 

