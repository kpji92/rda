// 대상자 선택 /////////////////////////////////////////////////////////////////////////////////////////////////////////////////
function getSendCount(form,module){
    //alert(form.AndOr.value);
    //alert(form.searchTypeSecond.value);
    //alert(form.searchTextSecond.value);
    dhtmlxAjax.get("/intranet/?module="+module+"&method=SendCountAjax&v_first="+encodeURIComponent(form.searchTypeFirst.value)+"&v_second="+encodeURIComponent(form.searchText.value)+"&AndOr="+encodeURIComponent(form.AndOr.value)+"&searchTypeSecond="+encodeURIComponent(form.searchTypeSecond.value)+"&searchTextSecond="+encodeURIComponent(form.searchTextSecond.value), outputSendCountResponse);
    dhtmlxAjax.get("/intranet/?module="+module+"&method=SendItemAjax&v_first="+encodeURIComponent(form.searchTypeFirst.value)+"&v_second="+encodeURIComponent(form.searchText.value)+"&AndOr="+encodeURIComponent(form.AndOr.value)+"&searchTypeSecond="+encodeURIComponent(form.searchTypeSecond.value)+"&searchTextSecond="+encodeURIComponent(form.searchTextSecond.value), outputSendItemResponse);
    return false;
}
function outputSendCountResponse(loader){
    //alert(loader.xmlDoc.responseText);
    if(loader.xmlDoc.responseText != null && loader.xmlDoc.responseText != ""){
        //alert("자료수는 "+loader.xmlDoc.responseText+"개 입니다.");
        document.getElementById("msg_count").innerHTML = "<br />검색된 자료수는 <b>"+loader.xmlDoc.responseText+"</b>개 입니다.";
        document.getElementById("item_cnt").value = loader.xmlDoc.responseText;
    }else{
        alert("다시 선택해주세요.");
    }
    return false;
}

function outputSendItemResponse(loader){
    //alert(loader.xmlDoc.responseText);
    if(loader.xmlDoc.responseText != null && loader.xmlDoc.responseText != ""){
        document.getElementById("SendItemBox").style.display = 'block';
        document.getElementById("SendItemBox").innerHTML ="";
        document.getElementById("SendItemBox").innerHTML =loader.xmlDoc.responseText;
        document.getElementById("SendItem").style.display = 'inline-block'; 
        document.getElementById("SendItem").style.height = '300px'; 
        document.getElementById("SendItem").style.overflow = 'auto'; 

    }
    return false;
}
//발송된 리스트 보이기(sms,fax)
function ShowSentList(module,job_id,cnt){
    dhtmlxAjax.get("/intranet/?module="+module+"&method=SentList&JOB_ID="+encodeURIComponent(job_id)+"&cnt="+encodeURIComponent(cnt), outputSendItemResponse); 
    document.getElementById("msg_count").innerHTML = "<br />발송된 자료수는 <b>"+cnt+"</b>개 입니다.";
    document.getElementById("item_cnt").value = cnt;
    return false;   
}
//발송된 리스트 보이기(mail)
function ShowMailSentList(module,kmm_idx,cnt){
    //alert(module);
    dhtmlxAjax.get("/intranet/?module="+module+"&method=MailSentList&kmm_idx="+encodeURIComponent(kmm_idx)+"&cnt="+encodeURIComponent(cnt), outputSendItemResponse); 
    document.getElementById("msg_count").innerHTML = "<br />발송된 자료수는 <b>"+cnt+"</b>개 입니다.";
    document.getElementById("item_cnt").value = cnt;
    return false;   
}
//예약발송 select value
$(document).ready(function(){
    var dt = new Date();
    //
    tYear = dt.getFullYear();
    tMonth = dt.getMonth()+1;
    tMonth = (tMonth < 10 ? "0"+tMonth:tMonth);
    tDate = dt.getDate();
    tDate = (tDate < 10 ? "0"+tDate:tDate);
    tHour = dt.getHours()
    tHour = (tHour < 10 ? "0"+tHour:tHour);
    tMinute = dt.getMinutes();
    tMinute = (tMinute < 10 ? "0"+tMinute:tMinute);
    tSecond = dt.getSeconds();
    tSecond = (tSecond < 10 ? "0"+tSecond:tSecond); 
    //
    document.getElementById('send_month').options[tMonth].selected = true;
    document.getElementById('send_date').options[tDate].selected = true;
    document.getElementById('send_hour').options[tHour].selected = true;
    document.getElementById('send_minute').options[tMinute].selected = true;
});

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

//선택된 개수
function checked_cnt(itemCnt){
    var j=0;
    for(i=0;i<=itemCnt;i++){
        if(document.getElementById('chk_row_'+i)){
            if(document.getElementById('chk_row_'+i).checked){ j++ }
        }
    }
    return j;
}

//발송대상 텍스트 박스 클리어
function TextBox_Clear(){
    document.getElementById("searchText").value = "";
    document.getElementById("searchText").focus();
    return true;
}

//JOB_ID 생성 년월일시분
function getJobIdTime(){
    var dt = new Date();

    tYear = dt.getFullYear();
    tMonth = dt.getMonth()+1;
    tMonth = (tMonth < 10 ? "0"+tMonth:tMonth);
    tDate = dt.getDate();
    tDate = (tDate < 10 ? "0"+tDate:tDate);
    tHour = dt.getHours()
    tHour = (tHour < 10 ? "0"+tHour:tHour);
    tMinute = dt.getMinutes();
    tMinute = (tMinute < 10 ? "0"+tMinute:tMinute);
    tSecond = dt.getSeconds();
    tSecond = (tSecond < 10 ? "0"+tSecond:tSecond);
    
    return tYear+tMonth+tDate+tHour+tMinute+tSecond;
}