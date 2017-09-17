<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<div class="amc_sub_menu">
	<div class="amc_sub_menu_body" id="amc_sub_menu_iframe">
		<div style="margin: 0px; padding: 0px;">
			<ul class="accordion">
				<li class="files">
					<a   href="basicTempList" ><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">체온</a></li>
				<li class="files">
					<a href="basicActiveList"><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">활동량</a></li>
				<li class="files">
					<a href=""><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">혈액검사</a></li>
				<li class="files">
					<a href=""><img class="side_icon" src="<c:url value='resources/img/side_icon.png'/>">설문조사</a></li>
			</ul>
		</div>
	</div>
</div>

<!-- 본문 시작 -->
<div class="amc_content">