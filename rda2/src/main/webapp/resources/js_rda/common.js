if (typeof(COMMON_JS) == 'undefined') { // 한번만 실행
    var COMMON_JS = true;

    function trim(s)
    {
        var t = "";
        var from_pos = to_pos = 0;

        for (i=0; i<s.length; i++)
        {
            if (s.charAt(i) == ' ')
                continue;
            else 
            {
                from_pos = i;
                break;
            }
        }

        for (i=s.length; i>=0; i--)
        {
            if (s.charAt(i-1) == ' ')
                continue;
            else 
            {
                to_pos = i;
                break;
            }
        }    

        t = s.substring(from_pos, to_pos);
        //                alert(from_pos + ',' + to_pos + ',' + t+'.');
        return t;
    }

    // 자바스크립트로 PHP의 number_format 흉내를 냄
    // 숫자에 , 를 출력
    function number_format(data) 
    {
        
        var tmp = '';
        var number = '';
        var cutlen = 3;
        var comma = ',';
        var i;
       
        len = data.length;
        mod = (len % cutlen);
        k = cutlen - mod;
        for (i=0; i<data.length; i++) 
        {
            number = number + data.charAt(i);
            
            if (i < data.length - 1) 
            {
                k++;
                if ((k % cutlen) == 0) 
                {
                    number = number + comma;
                    k = 0;
                }
            }
        }

        return number;
    }

    // 폼메일 창
    function popup_formmail(url)
    {
        opt = 'scrollbars=yes,width=417,height=385,top=10,left=20';
        popup_window(url, "wformmail", opt);
    }

    // , 를 없앤다.
    function no_comma(data)
    {
        var tmp = '';
        var comma = ',';
        var i;

        for (i=0; i<data.length; i++)
        {
            if (data.charAt(i) != comma)
                tmp += data.charAt(i);
        }
        return tmp;
    }

    // 삭제 검사 확인
    function del(href) 
    {
        if(confirm("한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?")) 
            document.location.href = href;
    }
 
    
    // 삭제 검사 확인
    function deleteAll(){
        if(confirm("한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?")){
            return true;
        }
        return false;
    }
    
    // 확인 후 url 이동
    function confirmThenGotoURL(msg,url){
        if(confirm(msg)){
            location.href = url;
        }
    }
    
    // 삭제 검사 확인
    function deleteByObject(ojb){
        if(confirm("한번 삭제한 자료는 복구할 방법이 없습니다.\n\n정말 삭제하시겠습니까?")){
            return ojb.submit();
        }
        return false;
    }
    
    // 전체 체크
    function chk_view(a,b){
        for(i=0;i<document.getElementById(a).value;i++){
            if(document.getElementById(b+'['+i+']')){
                document.getElementById(b+'['+i+']').checked = document.getElementById(a).checked; 
            }
        }
    }

    // 쿠키 입력
    function set_cookie(name, value, expirehours, domain) 
    {
        var today = new Date();
        today.setTime(today.getTime() + (60*60*1000*expirehours));
        document.cookie = name + "=" + escape( value ) + "; path=/; expires=" + today.toGMTString() + ";";
        if (domain) {
            document.cookie += "domain=" + domain + ";";
        }
    }

    // 쿠키 얻음
    function get_cookie(name) 
    {
        var find_sw = false;
        var start, end;
        var i = 0;

        for (i=0; i<= document.cookie.length; i++)
        {
            start = i;
            end = start + name.length;

            if(document.cookie.substring(start, end) == name) 
            {
                find_sw = true
                break
            }
        }

        if (find_sw == true) 
        {
            start = end + 1;
            end = document.cookie.indexOf(";", start);

            if(end < start)
                end = document.cookie.length;

            return document.cookie.substring(start, end);
        }
        return "";
    }

    // 쿠키 지움
    function delete_cookie(name) 
    {
        var today = new Date();

        today.setTime(today.getTime() - 1);
        var value = get_cookie(name);
        if(value != "")
            document.cookie = name + "=" + value + "; path=/; expires=" + today.toGMTString();
    }

    // 이미지의 크기에 따라 새창의 크기가 변경됩니다.
    // zzzz님께서 알려주셨습니다. 2005/04/12
    function image_window(img)
    {
        var w = img.tmp_width; 
        var h = img.tmp_height; 
        var winl = (screen.width-w)/2; 
        var wint = (screen.height-h)/3; 

        if (w >= screen.width) { 
            winl = 0; 
            h = (parseInt)(w * (h / w)); 
        } 

        if (h >= screen.height) { 
            wint = 0; 
            w = (parseInt)(h * (w / h)); 
        } 

        var js_url = "<script language='JavaScript1.2'> \n"; 
            js_url += "<!-- \n"; 
            js_url += "var ie=document.all; \n"; 
            js_url += "var nn6=document.getElementById&&!document.all; \n"; 
            js_url += "var isdrag=false; \n"; 
            js_url += "var x,y; \n"; 
            js_url += "var dobj; \n"; 
            js_url += "function movemouse(e) \n"; 
            js_url += "{ \n"; 
            js_url += "  if (isdrag) \n"; 
            js_url += "  { \n"; 
            js_url += "    dobj.style.left = nn6 ? tx + e.clientX - x : tx + event.clientX - x; \n"; 
            js_url += "    dobj.style.top  = nn6 ? ty + e.clientY - y : ty + event.clientY - y; \n"; 
            js_url += "    return false; \n"; 
            js_url += "  } \n"; 
            js_url += "} \n"; 
            js_url += "function selectmouse(e) \n"; 
            js_url += "{ \n"; 
            js_url += "  var fobj      = nn6 ? e.target : event.srcElement; \n"; 
            js_url += "  var topelement = nn6 ? 'HTML' : 'BODY'; \n"; 
            js_url += "  while (fobj.tagName != topelement && fobj.className != 'dragme') \n"; 
            js_url += "  { \n"; 
            js_url += "    fobj = nn6 ? fobj.parentNode : fobj.parentElement; \n"; 
            js_url += "  } \n"; 
            js_url += "  if (fobj.className=='dragme') \n"; 
            js_url += "  { \n"; 
            js_url += "    isdrag = true; \n"; 
            js_url += "    dobj = fobj; \n"; 
            js_url += "    tx = parseInt(dobj.style.left+0); \n"; 
            js_url += "    ty = parseInt(dobj.style.top+0); \n"; 
            js_url += "    x = nn6 ? e.clientX : event.clientX; \n"; 
            js_url += "    y = nn6 ? e.clientY : event.clientY; \n"; 
            js_url += "    document.onmousemove=movemouse; \n"; 
            js_url += "    return false; \n"; 
            js_url += "  } \n"; 
            js_url += "} \n"; 
            js_url += "document.onmousedown=selectmouse; \n"; 
            js_url += "document.onmouseup=new Function('isdrag=false'); \n"; 
            js_url += "//--> \n"; 
            js_url += "</"+"script> \n"; 

        var settings;

        if (g4_is_gecko) {
            settings  ='width='+(w+10)+','; 
            settings +='height='+(h+10)+','; 
        } else {
            settings  ='width='+w+','; 
            settings +='height='+h+','; 
        }
        settings +='top='+wint+','; 
        settings +='left='+winl+','; 
        settings +='scrollbars=no,'; 
        settings +='resizable=yes,'; 
        settings +='status=no'; 


        win=window.open("","image_window",settings); 
        win.document.open(); 
        win.document.write ("<html><head> \n<meta http-equiv='imagetoolbar' CONTENT='no'> \n<meta http-equiv='content-type' content='text/html; charset="+g4_charset+"'>\n"); 
        var size = "이미지 사이즈 : "+w+" x "+h;
        win.document.write ("<title>"+size+"</title> \n"); 
        if(w >= screen.width || h >= screen.height) { 
            win.document.write (js_url); 
            var click = "ondblclick='window.close();' style='cursor:move' title=' "+size+" \n\n 이미지 사이즈가 화면보다 큽니다. \n 왼쪽 버튼을 클릭한 후 마우스를 움직여서 보세요. \n\n 더블 클릭하면 닫혀요. '"; 
        } 
        else 
            var click = "onclick='window.close();' style='cursor:pointer' title=' "+size+" \n\n 클릭하면 닫혀요. '"; 
        win.document.write ("<style>.dragme{position:relative;}</style> \n"); 
        win.document.write ("</head> \n\n"); 
        win.document.write ("<body leftmargin=0 topmargin=0 bgcolor=#dddddd style='cursor:arrow;'> \n"); 
        win.document.write ("<table width=100% height=100% cellpadding=0 cellspacing=0><tr><td align=center valign=middle><img src='"+img.src+"' width='"+w+"' height='"+h+"' border=0 class='dragme' "+click+"></td></tr></table>");
        win.document.write ("</body></html>"); 
        win.document.close(); 

        if(parseInt(navigator.appVersion) >= 4){win.window.focus();} 
    }

    // a 태그에서 onclick 이벤트를 사용하지 않기 위해
    function win_open(url, name, option)
    {
        var popup = window.open(url, name, option);
        popup.focus();
    }

    var last_id = null;
    function menu(id)
    {
        if (id != last_id)
        {
            if (last_id != null)
                document.getElementById(last_id).style.display = "none";
            document.getElementById(id).style.display = "block";
            last_id = id;
        }
        else
        {
            document.getElementById(id).style.display = "none";
            last_id = null;
        }
    }

    function textarea_decrease(id, row)
    {
        if (document.getElementById(id).rows - row > 0)
            document.getElementById(id).rows -= row;
    }

    function textarea_original(id, row)
    {
        document.getElementById(id).rows = row;
    }

    function textarea_increase(id, row)
    {
        document.getElementById(id).rows += row;
    }

    // 글숫자 검사
    function check_byte(content, target)
    {
        var i = 0;
        var cnt = 0;
        var ch = '';
        var cont = document.getElementById(content).value;

        for (i=0; i<cont.length; i++) {
            ch = cont.charAt(i);
            if (escape(ch).length > 4) {
                cnt += 2;
            } else {
                cnt += 1;
            }
        }
        // 숫자를 출력
        document.getElementById(target).innerHTML = cnt;
        return cnt;
    }

    // 브라우저에서 오브젝트의 왼쪽 좌표
    function get_left_pos(obj)
    {
        var parentObj = null;
        var clientObj = obj;
        //var left = obj.offsetLeft + document.body.clientLeft;
        var left = obj.offsetLeft;

        while((parentObj=clientObj.offsetParent) != null)
        {
            left = left + parentObj.offsetLeft;
            clientObj = parentObj;
        }

        return left;
    }

    // 브라우저에서 오브젝트의 상단 좌표
    function get_top_pos(obj)
    {
        var parentObj = null;
        var clientObj = obj;
        //var top = obj.offsetTop + document.body.clientTop;
        var top = obj.offsetTop;

        while((parentObj=clientObj.offsetParent) != null)
        {
            top = top + parentObj.offsetTop;
            clientObj = parentObj;
        }

        return top;
    }

    function flash_movie(src, ids, width, height, wmode)
    {
        var wh = "";
        if (parseInt(width) && parseInt(height)) 
            wh = " width='"+width+"' height='"+height+"' ";
        return "<object classid='clsid:d27cdb6e-ae6d-11cf-96b8-444553540000' codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,0,0' "+wh+" id="+ids+"><param name=wmode value="+wmode+"><param name=movie value="+src+"><param name=quality value=high><embed src="+src+" quality=high wmode="+wmode+" type='application/x-shockwave-flash' pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?p1_prod_version=shockwaveflash' "+wh+"></embed></object>";
    }

    function obj_movie(src, ids, width, height, autostart)
    {
        var wh = "";
        if (parseInt(width) && parseInt(height)) 
            wh = " width='"+width+"' height='"+height+"' ";
        if (!autostart) autostart = false;
        return "<embed src='"+src+"' "+wh+" autostart='"+autostart+"'></embed>";
    }

    function doc_write(cont)
    {
        document.write(cont);
    }
    
    function styleDisplay(id,type){
        if(document.getElementById(id))
            document.getElementById(id).style.display = type;    
    }
    
    // 숫자 검사
    function is_numeric(val){
        var is_numeric = true;
        for(var i=0; i<val.length; i++){
            var chk = val.substring(i,i+1);
            if(!chk.match(/[0-9]/)){
                is_numeric = false;
                break;
            }
        }
        return is_numeric;
    }
    
    function openSite(url){
        if(url){
            popup_window(url,'','');
        }
    }
    
    // 새 창
    function popup_window(url, winname, opt)
    {
        window.open(url, winname, opt);
    }
    
    // 오브젝트 가져오기
    function xGetElementById(e)
    {
      if(typeof(e)!='string') return e;
      if(document.getElementById) e=document.getElementById(e);
      else if(document.all) e=document.all[e];
      else e=null;
      return e;
    }
    
    // 모듈 목록 오픈
    function toggleModuleMenu(category) {
        var obj = xGetElementById('module_'+category);
        if(obj.className == 'open') obj.className = '';
        else obj.className = 'open';
    }

    
     
    function setFocus(id)
    {
        document.getElementById(id).focus();
    }
    
    //Email 형식 체크
    function CheckEmail(email_str){
        var filter=/^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
        if (filter.test(email_str)) {
            return true;
        }else{
            return false;
        }
    }
    //CheckCell 형식체크
    function CheckCell(val){
        val = val.replace('-',''); 
        val = val.replace('.','');
        if(!is_numeric(val)){ alert('숫자를 입력해주세요'); return false; }
        if((val.charAt(0)+val.charAt(1)) != '01' || val.length < 10 || val.length > 11){ alert('핸드폰번호 형식오류입니다.'); return false; }
        return true;
    }
    //CheckTEL 형식체크
    function CheckTEL(val){
        tel = val;
        //tel = tel.replace(/-/gi,''); 
        //tel = tel.replace(/./gi,'');
        if(!is_numeric(tel)){ alert('숫자를 입력해주세요'); return false; }
        if(tel.charAt(0) != '0' || tel.length < 9 || tel.length > 12){ alert('번호 형식오류입니다.'); return false; }
        return true;
    }
    

    
    /* 객체 멤버 추가 변경 시작 */
    Number.prototype.to2 = function() { return (this > 9 ? "" : "0")+this; };
    Date.MONTHS = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];
    Date.DAYS   = ["Sun", "Mon", "Tue", "Wed", "Tur", "Fri", "Sat"];
    Date.prototype.getDateString = function(dateFormat) {
      var result = "";
      
      dateFormat = dateFormat == 8 && "YYYY.MM.DD" ||
                   dateFormat == 6 && "hh:mm:ss" ||
                   dateFormat ||
                   "YYYY.MM.DD hh:mm:ss";
      for (var i = 0; i < dateFormat.length; i++) {
        result += dateFormat.indexOf("YYYY", i) == i ? (i+=3, this.getFullYear()                     ) :
                  dateFormat.indexOf("YY",   i) == i ? (i+=1, String(this.getFullYear()).substring(2)) :
                  dateFormat.indexOf("MMM",  i) == i ? (i+=2, Date.MONTHS[this.getMonth()]           ) :
                  dateFormat.indexOf("MM",   i) == i ? (i+=1, (this.getMonth()+1).to2()              ) :
                  dateFormat.indexOf("M",    i) == i ? (      this.getMonth()+1                      ) :
                  dateFormat.indexOf("DDD",  i) == i ? (i+=2, Date.DAYS[this.getDay()]               ) :
                  dateFormat.indexOf("DD",   i) == i ? (i+=1, this.getDate().to2()                   ) :
                  dateFormat.indexOf("D"   , i) == i ? (      this.getDate()                         ) :
                  dateFormat.indexOf("hh",   i) == i ? (i+=1, this.getHours().to2()                  ) :
                  dateFormat.indexOf("h",    i) == i ? (      this.getHours()                        ) :
                  dateFormat.indexOf("mm",   i) == i ? (i+=1, this.getMinutes().to2()                ) :
                  dateFormat.indexOf("m",    i) == i ? (      this.getMinutes()                      ) :
                  dateFormat.indexOf("ss",   i) == i ? (i+=1, this.getSeconds().to2()                ) :
                  dateFormat.indexOf("s",    i) == i ? (      this.getSeconds()                      ) :
                                                       (dateFormat.charAt(i)                         ) ;
      }
      return result;
    };
}
