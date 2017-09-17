//kis_member search
var km_source = '';
var km_party_name = '';
var km_sex = '';
var km_age = '';
var km_job  = ''; //field 추가 요
var km_support_party  = '';
var km_religion  = '';
var km_academy_background  = '';
var km_biz_name  = '';
var km_biz_position  = '';
var km_sido_code = '';
var km_sido_name = '';
var km_sigungu_code = '';
var km_sigungu_name = '';
var km_dong_code = '';
var km_dong_name = '';
//
var str = '';
//
var loader;
var rtn;
var arr;
var i;
////
function onchange_sido(){
    var tmp = document.getElementById('km_sido').value;
    var ObjSel = document.getElementById('km_sigungu');

    km_sido_code =  tmp.substr(0,2);
    km_sido_name = tmp.substr(3,2);
    //
    select_clear(ObjSel);
    select_clear(document.getElementById('km_dong'));
    new_option = new Option('읍면동','');  //innerHTML, value
    document.getElementById('km_dong').options.add(new_option,0);
    //sigungu list
    //alert(km_sido_name);
    loader = dhtmlxAjax.getSync("/intranet/?module=YellowpagesDistrict&method=SigunguList&sido_ad_code="+km_sido_code);
    rtn = loader.xmlDoc.responseText;
    rtn = trim(rtn);
    arr = rtn.split(';');
    select_add(ObjSel,arr,'시군구');
}
//
function onchange_sigungu(){
    var tmp = document.getElementById('km_sigungu').value;
    var ObjSel = document.getElementById('km_dong');

    km_sido_code =  tmp.substr(0,5);
    km_sido_name = tmp.substr(6,10);
    //
    select_clear(ObjSel);
    //sigungu list
    //alert(km_sido_name);
    loader = dhtmlxAjax.getSync("/intranet/?module=YellowpagesDistrict&method=DongList&sigungu_ad_code="+km_sido_code);
    rtn = loader.xmlDoc.responseText;
    rtn = trim(rtn);
    arr = rtn.split(';');
    select_add(ObjSel,arr,'읍면동');
}
//select box add
function select_add(Obj,arr,sTmp){
    var new_option;
    var code_txt;
    new_option = new Option(sTmp,'');  //innerHTML, value
    Obj.options.add(new_option,0);
    for(i=1; i < arr.length; i++){
        code_txt = arr[i-1].split(',');
        new_option = new Option(code_txt[1],code_txt[0]);
        Obj.options.add(new_option,i);
    }
}
//select box clear
function select_clear(Obj){
    for(var i= Obj.options.length ; i >=0 ; i--){
        Obj.options[i] = null;
    }
}
//
function trim(val){
    val = val.replace(/^\s+/,''); //왼쪽 공백제거
    val = val.replace(/\s+$/g,'');  // 오른쪽 공백제거
    val = val.replace(/\n/g,''); //행바꿈 제거
    val = val.replace(/\r/g,''); //엔터제거
    return val;
}
//
function search_member(SearchKind){
    var where = '';
    //
    document.getElementById("kmm_type_info").innerHTML = "로딩중";
    //
    km_source = document.getElementById('km_source').value;
    km_party_name = document.getElementById('km_party_name').value;
    km_sex = document.getElementById('km_sex').value;
    km_age = document.getElementById('km_age').value;
    km_job  = document.getElementById('km_job').value; //field 추가 요
    km_support_party  = document.getElementById('km_support_party').value;
    km_religion  = document.getElementById('km_religion').value;
    km_academy_background  = document.getElementById('km_academy_background').value;
    km_biz_name  = document.getElementById('km_biz_name').value;
    km_biz_position  = document.getElementById('km_biz_position').value;
    km_sido_code = document.getElementById('km_sido').value;
    km_sido_name = document.getElementById('km_sido').options[document.getElementById("km_sido").selectedIndex].innerHTML;
    km_sigungu_code = document.getElementById('km_sigungu').value;
    km_sigungu_name = document.getElementById('km_sigungu').options[document.getElementById("km_sigungu").selectedIndex].innerHTML;
    km_dong_code = document.getElementById('km_dong').value;
    km_dong_name = document.getElementById('km_dong').options[document.getElementById("km_dong").selectedIndex].innerHTML;
    //
    if(km_source != '전체'){ where = '&km_source='+encodeURIComponent(km_source);}
    if(km_party_name != '전체'){ where += '&km_party_name='+encodeURIComponent(km_party_name);}
    if(km_sex != '전체'){ where += '&km_sex='+encodeURIComponent(km_sex);}
    if(km_age != '전체'){ where += '&km_age='+encodeURIComponent(km_age);}
    if(km_job != '전체'){ where += '&km_job='+encodeURIComponent(km_job);}
    if(km_support_party != '전체'){ where += '&km_support_party='+encodeURIComponent(km_support_party);}
    if(km_religion != '전체'){ where += '&km_religion='+encodeURIComponent(km_religion);}
    if(km_academy_background != '전체'){ where += '&km_academy_background='+encodeURIComponent(km_academy_background);}
    if(km_biz_name != '전체'){ where += '&km_biz_name='+encodeURIComponent(km_biz_name);}
    if(km_biz_position != '전체'){ where += '&km_biz_position='+encodeURIComponent(km_biz_position);}
    if(km_sido_code != ''){ where += '&km_sido_code='+encodeURIComponent(km_sido_code);}
    if(km_sido_name != '시도'){ where += '&km_sido_name='+encodeURIComponent(km_sido_name);}
    if(km_sigungu_code != ''){ where += '&km_sigungu_code='+encodeURIComponent(km_sigungu_code);}
    if(km_sigungu_name != '시군구'){ where += '&km_sigungu_name='+encodeURIComponent(km_sigungu_name);}
    if(km_dong_code != ''){ where += '&km_dong_code='+encodeURIComponent(km_dong_code);}
    if(km_dong_name != '읍면동'){ where += '&km_dong_name='+encodeURIComponent(km_dong_name);}
    //
    where += '&SearchKind='+encodeURIComponent(SearchKind);
    //
    //alert(where);
    loader = dhtmlxAjax.getSync("/intranet/?module=KISMember&method=SearchMember"+where);
    rtn = loader.xmlDoc.responseText;
    //alert(rtn);
    //rtn = trim(rtn);
    if(rtn != null && rtn != ""){
        document.getElementById("SendItemBox").style.display = 'inline';
        document.getElementById("SendItemBox").innerHTML ="";
        document.getElementById("SendItemBox").innerHTML =rtn;
        document.getElementById("SendItem").style.display = 'inline-block'; 
        document.getElementById("SendItem").style.height = '300px'; 
        document.getElementById("SendItem").style.overflow = 'auto'; 
        document.getElementById("kmm_type_info").innerHTML = document.getElementById("all").value+"건 중 "+document.getElementById("item_cnt").value+"건이 검색되었습니다.";
    }

}
function search_cancel(){
    
}
//chk_select //////////////
function chk_select(){
    var row_cnt = document.getElementById('item_cnt').value;
    var chk_value = document.getElementById('chk_all').value;

    //alert(row_cnt);
    //alert(chk_value);
    for(i=0;i<=row_cnt;i++){
        if(document.getElementById('chk_row_'+i)){
            document.getElementById('chk_row_'+i).checked = document.getElementById('chk_all').checked; 
        }
    }                    
}