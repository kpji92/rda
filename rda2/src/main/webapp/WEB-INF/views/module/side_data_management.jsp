<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.js"></script>
<script type="text/javascript">
$(document).ready(function(){
//      $("a").click(function () {
//         alert($(this).html());
   

// });
  
});
$(function(){
	$("form").submit(function(){
		if($("input[name='name']").val()==""){

			if($("#warning").length == 0){

				$("input[name='name']").css("border","1px solid red").after("<span id='warning'>이름을 입력해 주세요</span>");
				$("span").css("color","red");
			}
			return false;
		}
	});
});
		
</script>
<div class="amc_sub_menu">
	<div class="amc_sub_menu_body" id="amc_sub_menu_iframe">
		<div style="margin: 0px; padding: 0px;">
			<ul class="accordion">
				<li class="files">
					<a><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">목장자료</a>
					<ul class="sub_menu">
						<li>
							<a href="farmList"><font class="sub_menu_font"><font style="color: #496189;">├</font> 기존목장</font></a></li>
						<li>
							<a href="newFarmList"><font class="sub_menu_font"><font style="color: #496189;">└</font> 신규목장</font></a></li>
					</ul>
				<li class="files">
					<img class="side_icon" src="resources/img/side_icon.png"><a href="quList">설문조사</a></li>
				<li class="files">
					<a href="envList"><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">환경자료</a></li>
				<li class="files">
					<a href="entityList"><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">개체자료</a></li>
				<li class="files">
					<a href="birList"><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">생체자료</a></li>
				<li class="files">
					<a  href="mhList"><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">병력자료</a></li>
				<li class="files">
					<a href="feseList"><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">분변자료</a></li>
				<li class="files">
					<a><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">혈액분석</a>
					<ul class="sub_menu">
						<li>
							<a href="cbcList"><font class="sub_menu_font"><font style="color: #496189;">├</font> CBC</font></a></li>
						<li>
							<a href="biochemicalList"><font class="sub_menu_font"><font style="color: #496189;">├</font> 생화학</font></a></li>
						<li>
							<a href="phosList"><font class="sub_menu_font"><font style="color: #496189;">├</font> PHOS</font></a></li>
						<li>
							<a href="istatList"><font class="sub_menu_font"><font style="color: #496189;">├</font> iStat</font></a></li>
						<li>
							<a href="immuneList"><font class="sub_menu_font"><font style="color: #496189;">├</font> 면역 및 염증인자</font></a></li>
						<li>
							<a href="infectionList"><font class="sub_menu_font"><font style="color: #496189;">└</font> 감염성원인체조사</font></a></li>
					</ul>
				</li>
				<li class="files">
					<a><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">센싱자료</a>
					<ul class="sub_menu">
						<li>
							<a href="senseCountList"><font class="sub_menu_font"><font style="color: #496189;">├</font> 현황</font></a></li>
						<li>
							<a href="senseEntityList"><font class="sub_menu_font"><font style="color: #496189;">├</font> 개체</font></a></li>
						<li>
							<a href="senseStableList"><font class="sub_menu_font"><font style="color: #496189;">└</font> 축사</font></a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</div>

<!-- 본문 시작 -->
<div class="amc_content">