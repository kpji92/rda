<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:import url="../../module/top_menu.jsp"></c:import>
<c:import url="../../module/side_data_management.jsp"></c:import>
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
		window.location.href = "newFarmList?searchOption="+searchOption+"&searchValue="+ encodeURI(searchValue);
	}
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
										신규 목장자료
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
								<span class="button blue"><input type="button" value="엑셀" onClick="location.href='newFarmListExcel'"></span>
							</td>
							<td width="48" align="right">
								<span class="button black"><input type="button" value="인쇄" onClick="print(document.getElementById('amc_content_body').innerHTML)"></span>
							</td>
							<td width="48" align="right">
								<span class="button red"><input type="button" value="추가" onclick="location.href='newFarmAdd'"></span>
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
							<th style="font-size: 14px;" width="8%" rowspan="2">휴대폰</th>
							<th style="font-size: 14px;" width="8%" rowspan="2">지역</th>
							<th style="font-size: 14px;" width="5%" colspan="3">사육두수</th>
							<th style="font-size: 14px;" width="3%" rowspan="2">수정</th>
						</tr>
						<tr>
							<th style="font-size: 14px;" width="5%">어미소
							</td>
							<th style="font-size: 14px;" width="5%">송아지
							</td>
							<th style="font-size: 14px;" width="5%">육성비육
							</td>
						</tr>
						<c:forEach var="list" items="${farmList }">
							<tr onMouseOver="this.style.backgroundColor='#CCFFFF'" onMouseOut="this.style.backgroundColor=''">
								<td align="center">${list.rnum}</td>
								<td style="font-size: 13px;"><div align="center">${list.farmId} </div></td>
								<td style="font-size: 13px;"><div align="center">${list.farmName}</div></td>
								<td style="font-size: 13px;"><div align="center">${list.name}</div></td>
								<td style="font-size: 13px;"><div align="center">${list.phone1}-${list.phone2}-${list.phone3}</div></td>
								<td style="font-size: 13px;"><div align="center">${list.hp1}-${list.hp2}-${list.hp3}</div></td>
								<td style="font-size: 13px;"><div align="center">${list.address}</div></td>
								<td style="font-size: 13px;" width="5%"><div align="center">${list.mc}</div></td>
								<td style="font-size: 13px;" width="5%"><div align="center">${list.chc}</div></td>
								<td style="font-size: 13px;" width="5%"><div align="center">${list.cmoney}</div></td>
								<td style="font-size: 13px;">
									<div align="center">
										<input onclick="parent.center.location.href='/update/farm/farm_update.jsp?farmId=${list.farmId}'" type="button" value="수정">
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
						<a href="newFarmList?pageNum=1&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none; color: #494949; font-family: gulim;">◀처음&nbsp;</a>
						
						<c:choose>
				    		<c:when test="${paging.pageNum ne 1}">
				    			<a href="newFarmList?pageNum=${paging.pageNum-1}&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none; color: #494949; font-family: gulim;">[이전]&nbsp;</a>
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
					    			<a href="newFarmList?pageNum=${i }&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none;"><b>[${i }]</b>&nbsp;</a>
				    			</c:otherwise>
					    	</c:choose>
						</c:forEach>
						
						<c:choose>
				    		<c:when test="${paging.pageNum ne paging.lastPage}">
				    			<a href="newFarmList?pageNum=${paging.pageNum+1}&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none; color: #494949; font-family: gulim;">[다음]&nbsp;</a>
				    		</c:when>
				    		<c:otherwise>
				    			<a href="#" style="text-decoration: none; color: #494949; font-family: gulim;">[다음]&nbsp;</a>
			    			</c:otherwise>
				    	</c:choose>
				    							
						<a href="newFarmList?pageNum=${paging.lastPage }&searchOption=${searchOption}&searchValue=${searchValue}" style="text-decoration: none;">마지막▶</a>
					</td>
					
					<!-- 검색된 총 데이터 갯수 출력해주는부분 -->
					<td width="10%" align="right">
						<font style="font-weight: bold">검색수</font> : ${totalCount }&nbsp;&nbsp;&nbsp;
					</td>
				</tr>
			</table>
		</tr>
	</table>
</div>
<c:import url="../../module/footer.jsp"></c:import>