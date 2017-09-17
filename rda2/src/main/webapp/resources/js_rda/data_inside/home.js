var xhr1 = null;
var xhr2 = null;
var xhr3 = null;
var xhr4 = null;
function getXMLHttpRequest1() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}
function getXMLHttpRequest2() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}
function getXMLHttpRequest3() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}
function getXMLHttpRequest4() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");
		} catch (e1) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");
			} catch (e2) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}
}
function get_select1() {
	var val = $("select[name=hd_search_select1]").val();
	var url = "page1.jsp";
	jQuery( function($) { 
		if(val!="" && val!="1") {
			$("#hd_search2").html('');
			$("#hd_search3").html('');
			$("#hd_search4").html('');
			$("#hd_search5").html('');
			
			url = url + "?value="+val;
			xhr1 = getXMLHttpRequest1();
			xhr1.onreadystatechange = responseSelect1;
			xhr1.open("POST", url, true);
			xhr1.send(null);
		} else if(val=="1") {
			$("#hd_search2").html('');
			$("#hd_search3").html('');
			$("#hd_search4").html('');
			$("#hd_search5").html('');
			url = "page4.jsp";
			url = url + "?value1="+val;
			xhr4 = getXMLHttpRequest4();
			xhr4.onreadystatechange = responseGetdatalist;
			xhr4.open("POST", url, true);
			xhr4.send(null);
		} else {
			$("#hd_search2").html('');
			$("#hd_search3").html('');
			$("#hd_search4").html('');
			$("#hd_search5").html('');
		}
	});
}
function responseSelect1() {
	if(xhr1.readyState == 4) {
		if(xhr1.status == 200) {
			var str = xhr1.responseText;
			jQuery( function($) { 
				$("#hd_search2").html(str);
				
			});
		} else {
			jQuery( function($) { });
			alert("시도명을 불러오지 못하였습니다.");
		}
	}
}
function get_select2() {
	var val1 = $("select[name=hd_search_select1]").val();
	var val2 = $("select[name=hd_search_select2]").val();
	var url = "page2.jsp";
	jQuery( function($) { 
		if(val1!="" && val1!="1") {
			$("#hd_search3").html('');
			$("#hd_search4").html('');
			$("#hd_search5").html('');
			
			url = url + "?value1="+val1+"&value2="+val2;
			xhr2 = getXMLHttpRequest2();
			xhr2.onreadystatechange = responseSelect2;
			xhr2.open("POST", url, true);
			xhr2.send(null);
		} else {
			$("#hd_search3").html('');
			$("#hd_search4").html('');
			$("#hd_search5").html('');
		}
	});
}
function responseSelect2() {
	if(xhr2.readyState == 4) {
		if(xhr2.status == 200) {
			var str = xhr2.responseText;
			jQuery( function($) { 
				$("#hd_search3").html(str);
				
			});
		} else {
			jQuery( function($) { });
			alert("선거구명/시군구명을 불러오지 못하였습니다.");
		}
	}
}
function get_select3() {
	var val1 = $("select[name=hd_search_select1]").val();
	var val2 = $("select[name=hd_search_select2]").val();
	var val3 = $("select[name=hd_search_select3]").val();
	var url = "page3.jsp";
	jQuery( function($) { 
		if(val1!="" && val1!="1") {
			$("#hd_search4").html('');
			$("#hd_search5").html('');
			
			url = url + "?value1="+val1+"&value2="+val2+"&value3="+encodeURIComponent(val3);
			xhr3 = getXMLHttpRequest3();
			xhr3.onreadystatechange = responseSelect3;
			xhr3.open("POST", url, true);
			xhr3.send(null);
		} else {
			$("#hd_search4").html('');
			$("#hd_search5").html('');
		}
	});
}
function responseSelect3() {
	if(xhr3.readyState == 4) {
		if(xhr3.status == 200) {
			var str = xhr3.responseText;
			jQuery( function($) { 
				$("#hd_search4").html(str);
			});
		} else {
			jQuery( function($) { });
			alert("읍면동명을 불러오지 못하였습니다.");
		}
	}
}
function get_data_list() {
	var val1 = $("select[name=hd_search_select1]").val();
	var val2 = $("select[name=hd_search_select2]").val();
	var val3 = $("select[name=hd_search_select3]").val();
	var val4 = "";
	if(val1=="4" || val1=="6") { 
		val4 = $("select[name=hd_search_select4]").val();
	}
	var url = "page4.jsp";
	jQuery( function($) { 
		if(val1!="" && val1!="1") {
			url = url + "?value1="+val1+"&value2="+val2+"&value3="+encodeURIComponent(val3)+"&value4="+encodeURIComponent(val4);
			xhr4 = getXMLHttpRequest4();
			xhr4.onreadystatechange = responseGetdatalist;
			xhr4.open("POST", url, true);
			xhr4.send(null);
		} else {
			
		}
	});
}
function responseGetdatalist() {
	if(xhr4.readyState == 4) {
		if(xhr4.status == 200) {
			var str = xhr4.responseText;
			jQuery( function($) { 
				$("#hd_list1").html(str);
			});
		} else {
			alert("데이터를 불러오지 못하였습니다.");
		}
	}
}