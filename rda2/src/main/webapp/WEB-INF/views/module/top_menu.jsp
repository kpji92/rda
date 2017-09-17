<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
<script type="text/javascript" src="<c:url value='resources/js/side_menu.js'/>"></script>
<script type="text/javascript" src="<c:url value='resources/js/common.js'/>"></script>
<script type="text/javascript" src="<c:url value='resources/js/print.js'/>"></script>

<link rel="StyleSheet" href="<c:url value='resources/css/main.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/side_menu.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/common.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/layout.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/button.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/table.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/box.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/searchbox.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/jquery-ui.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/navigation.css'/>" type="text/css">
<link rel="StyleSheet" href="<c:url value='resources/css/location.css'/>" type="text/css">
<style>
.login .id ,.login .pw  {
    width: 110px;
    height: 28px;
    }
</style>
<title>RDA</title>
</head>
<body bgcolor="#c3cbd8" marginwidth="0" marginheight="0" bottommargin="0" style="margin: 0" leftmargin="0" rightmargin="0" topmargin="0">
	<div class="admin_wrap">
		<div class="admin_top">
			<div class="logo">
				<img class="logoimg" src="<c:url value='resources/img/logo_rda.png'/>">
			</div>
			<div class="login">
				<div class="login-left">
					<input type="text" class="id" name="id" placeholder="아이디"> 
					<input type="text" class="pw" name="pw" placeholder="비밀번호">
				</div>
				<div class="login-right">
					<input type="button" class="logbt" value="login" onclick="login()" accesskey="l" style="margin-top: 2px; margin-right: 5px;">
					<%-- title="ID와 Password 입력 후 <%out.println();%>Alt+L을 누르면 로그인 됩니다." --%>
				</div>
				<%-- <div class="login-left"
					style="height: 54px; line-height: 27px; text-align: right; margin-right: 8px; padding-top: 3px;">
					<font style="color: #000000; font-size: 14px;"><b><%=name%></b><font
						style="font-size: 13px;"> 님</font></font><br> <font
						style="color: #494949; font-size: 13px;"><%=(String) session.getAttribute("login_time")%></font>
				</div>
				<div class="login-right">
					<input type="button" class="logbt" value="logout"
						onclick="logout2()" accesskey="q"
						style="margin-top: 2px; margin-right: 5px;"
						title="Alt+Q를 누르면 로그아웃 됩니다.">
				</div> --%>
			</div>
		</div>
		<div class="admin_middle_menu">
			<ul class="menu">
				<li style="border: none; background-color: #f2f2f2; width: 12%; height: 36px;"></li>
				<li class="admin_middle_menu_tab"><a href="farmList">자료관리</a></li>
				<li class="admin_middle_menu_tab"><a href="basicTempList">기초통계</a></li>
				<li class="admin_middle_menu_tab"><a href="fecesmanageList">분변분석</a></li>
				<li class="admin_middle_menu_tab"><a href="test4">질병예측</a></li>
				<li class="admin_middle_menu_tab"><a href="test5">질병지도</a></li>
				<li class="admin_middle_menu_tab"><a href="test6">커뮤니티</a></li>
				<%-- 					<li id="amm_5" ><a <%out.print("href=\"layout/sub_active.jsp\" target=\"amc_sub_menu_iframe\"");%>>활동량분석</a></li> --%>
				<%-- 					<li id="amm_6" ><a <%out.print("href=\"layout/sub_pridiction.jsp\" target=\"amc_sub_menu_iframe\"");%>>질병예측</a></li> --%>
			</ul>
		</div>
		
	<!-- 사이드바 div 시작 -->
	<div class="admin_middle_content">			