var xhr = null;

function getXMLHttpRequest() {
	if (window.ActiveXObject) {
		try {
			return new ActiveXObject("Msxml2.XMLHTTP");//IE 상위 버젼
		} catch (e) {
			try {
				return new ActiveXObject("Microsoft.XMLHTTP");//IE 하위 버젼
			} catch (e) {
				return null;
			}
		}
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();//IE 이외의 브라우저(FireFox 등)
	} else {
		return null;
	}
}

function login() {
	var id = document.getElementById("id").value;
	var pw = document.getElementById("pw").value;
	requestLogin(id, pw);
}

function requestLogin(id, pw) {
	url = "./login/login_check.jsp?id=" + encodeURIComponent(id) + "&pw="
			+ encodeURIComponent(pw); // 한글처리
	xhr = getXMLHttpRequest();//XMLHttpRequest 객체 얻기
	xhr.onreadystatechange = responseLogin;//콜백 함수 등록
	xhr.open("GET", url, true);//연결
	xhr.send(null);//전송
}

function responseLogin() {
	if (xhr.readyState == 4) {//완료
		if (xhr.status == 200) {//오류없이 OK
			var str = xhr.responseText;//서버에서 보낸 내용 받기
			if (str.indexOf('실패') > -1) {//LoginCheck 페이지에서 '실패' 출력시 실패처리
				alert("로그인 실패하셨습니다.");
			}
			window.location.reload(true);
		} else {
			alert("Fail : " + xhr.status);
		}
	}
}

function logout() {
	window.location = "./login/logout.jsp";
}

function login_err(error) {
	var tt = error;
	if (tt.indexOf('1') > -1) {
		alert("로그인이 필요합니다.");
	} else {
		alert("권한이 필요합니다.");
	}
}

function openerclose() {
	opener.top.window.open('about:black', '_self').close();
}

onload = function() {
	var theframes = document.getElementsByTagName('iframe');
	for ( var i = 0; i < theframes.length; i++) {
		theframes[i].setAttribute("allowTransparency", "true");
	}
};

var select_td = null;
function tclick(obj) {
	if (obj.flag != "clicked") {
		if (select_td != null) {
			select_td.flag = '';
			select_td.style.backgroundColor = "#f2f4f7";
		}
		obj.flag = "clicked";
		obj.style.backgroundColor = "#c3cbd8";
		select_td = obj;
	}
}

jQuery( function($) {
	$('#id').keypress(function(e) {
		if ( e.keyCode == 13 ) {
			var id = $('#id'), pw = $('#pw');
			requestLogin(id.val(), pw.val());
		}
	});
	$('#pw').keypress(function(e) {
		if ( e.keyCode == 13 ) {
			var id = $('#id'), pw = $('#pw');
			requestLogin(id.val(), pw.val());
		}
	});
});