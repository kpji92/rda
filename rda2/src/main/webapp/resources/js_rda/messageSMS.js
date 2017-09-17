        // 메세지 바이트 체크
        function chkMsgLength(intMax,objMsg,st) 
        {
            
            var length = lengthMsg(objMsg.value);

            st.innerHTML = length;  //현재 byte수를 넣는다
            
            if (length > intMax) 
            {
                alert("문자메세지는 "+intMax+"글자 이상이므로 초과된 글자수는 자동으로 삭제됩니다.\n");
                objMsg.value = objMsg.value.replace(/\r\n$/, "");
                objMsg.value = assertMsg(intMax,objMsg.value, st);                
            }
        }   
        
        function TempNull()
        {
            return false;
        } 
        
        // 현재 메시지 바이트 수 계산
        function lengthMsg(objMsg) 
        {
        
            var nbytes = 0;
            for (i=0; i<objMsg.length; i++) 
            {
                var ch = objMsg.charAt(i);
                if(escape(ch).length > 4) 
                {
                    nbytes += 2;
                } 
                else if (ch == '\n') 
                {
                    if (objMsg.charAt(i-1) != '\r') 
                    {
                        nbytes += 1;
                    }
                } 
                else if (ch == '<' || ch == '>') 
                {
                    nbytes += 4;
                } 
                else 
                {
                    nbytes += 1;
                }
            }
            return nbytes;
        }
        
        // 80 바이트 넘는 문자열 자르기
        function assertMsg(intMax, objMsg, st) 
        {
            var inc = 0;
            var nbytes = 0;
            var msg = "";
        
            var msglen = objMsg.length;
            
            for (i=0; i < msglen; i++) 
            {
                var ch = objMsg.charAt(i);
                
                if (escape(ch).length > 4) 
                {
                    inc = 2;
                } 
                else if (ch == '\n') 
                {
                    if (objMsg.charAt(i-1) != '\r') 
                    {
                        inc = 1;
                    }
                } 
                else if (ch == '<' || ch == '>') 
                {
                    inc = 4;
                } 
                else 
                {
                    inc = 1;
                }
                
                if ((nbytes + inc) > intMax) 
                {
                    break;
                }
                
                nbytes += inc;
                msg += ch;
            }
            
            st.innerHTML = nbytes; //현재 byte수를 넣는다
            
            return msg;
        } 

       //SMS 발송 ///////////////////////////////////////////////////////////////////////////////
        function getSendSMS(form,module){
            var msg = document.getElementById("sms_contents").value;
            var callback = document.getElementById("sms_callback_number").value;
            var sSearchTypeFirst = document.getElementById("searchTypeFirst").value;
            var sSearchText = document.getElementById("searchText").value;
            var sSearchType = document.getElementById("searchTypeFirst").options[document.getElementById("searchTypeFirst").selectedIndex].innerHTML;
            //
            var item_cnt = document.getElementById('item_cnt').value;
            var auto_check_val = document.getElementById("img_confirm").value;
            var cnt = 0;
            var rtn = false;
            var val_return = false;
            var value_str ='';
            var send_type = '';
            var send_time = '';
            var send_method = '';
            var cellno = '';
            var jam_idx = 0;
            var jam_cell = '';
            var JOB_ID = '';
            var BaseTime = '';
            var send_success_cnt = 0;
            var loader;
            //
            BaseTime = getJobIdTime();
            JOB_ID_date = BaseTime;

            cnt = checked_cnt(item_cnt);
            if(cnt == 0){
                alert('선택된 리스트가 없습니다!');
                return false;
            }
             //////////////////
            JOB_ID = 'Aca_S_'+BaseTime;
            value_str = "&contents="+encodeURIComponent(msg)+"&callback="+encodeURIComponent(callback);
            value_str += "&v_first="+encodeURIComponent(sSearchTypeFirst)+"&v_second="+encodeURIComponent(sSearchText)+"&searchtype="+encodeURIComponent(sSearchType);
            value_str += "&JOB_ID="+encodeURIComponent(JOB_ID)+"&cnt="+encodeURIComponent(cnt)+"&auto_check_val="+encodeURIComponent(auto_check_val);
            //
            val_return = goCheck_val();
            //////////////////////////////////////////////
            if(val_return){
                if(confirm("["+cnt+"]건을 발송 하시겠습니까?")){ 
                    // 발송
                    document.getElementById("working").style.display='inline';  
                    /////즉시 예약
                    if(document.getElementById('send_type_reservation').checked){
                        send_type = '1';  
                        send_time = document.getElementById('send_year').value;
                        send_time += document.getElementById('send_month').value;
                        send_time += document.getElementById('send_date').value;
                        send_time += document.getElementById('send_hour').value;
                        send_time += document.getElementById('send_minute').value+"00";
                    }else{
                        send_type = '0';
                        send_time = BaseTime+"00";
                    }
                    send_method = "&send_type="+encodeURIComponent(send_type)+"&send_time="+encodeURIComponent(send_time);
                    /////
                    for(i=0;i<=item_cnt;i++){
                        if(document.getElementById('chk_row_'+i)){
                            if(document.getElementById('chk_row_'+i).checked){ 
                                //발송 루틴(하나씩)
                                jam_idx = document.getElementById('jam_idx_'+i).value;
                                jam_cell = document.getElementById('jam_cell_'+i).innerHTML;
                                cellno = "&cellno="+encodeURIComponent(jam_idx+"^"+jam_cell)+"&jam_idx="+encodeURIComponent(jam_idx);
                                //alert(value_str+cellno+send_method);
                                loader = dhtmlxAjax.getSync("/intranet/?module="+module+"&method=SendSMSUnitAjax"+value_str+cellno+send_method);
                                rtn = loader.xmlDoc.responseText;
                                if(rtn.match('success')){
                                    send_success_cnt++; 
                                }
                            }
                        }
                    }
                    // 발송정보 저장
                    if(send_success_cnt > 0 || cnt > 0){
                        dhtmlxAjax.get("/intranet/?module="+module+"&method=SendSMSSaveAjax"+value_str, outputSendSMSSaveResponse);
                    }else{
                        alert("저장할 정보가 없습니다.");
                    }
                    document.getElementById("working").style.display='none'; 
                }
            } 
            return false;
        }
        ///
        function outputSendSMSSaveResponse(loader){
            //alert("]"+loader.xmlDoc.responseText+"[");
            var rtn = loader.xmlDoc.responseText;
            
            if(rtn.match('success')){
                //alert(loader.xmlDoc.responseText);
                alert("발송하였습니다.");
                document.getElementById("msg_send").innerHTML ='발송하였습니다.';
                location.reload();
            }else{
                alert("발송 실패하였습니다.");
                document.getElementById("msg_send").innerHTML =loader.xmlDoc.responseText; 
            }
        }
        //SMS test발송 /////////////////////////////////////////////////////////////////////////////// 
        function getSendTestSMS(form,module){
            var msg = document.getElementById("sms_contents").value;
            var callback = document.getElementById("sms_callback_number").value; 
            var sSearchTypeFirst = document.getElementById("searchTypeFirst").value;
            var sSearchText = document.getElementById("searchText").value;
            var sSearchType = document.getElementById("searchTypeFirst").options[document.getElementById("searchTypeFirst").selectedIndex].innerHTML;
            var auto_check_val = document.getElementById("img_confirm").value;
            var JOB_ID = '';
            var BaseTime = '';
            var str = '';
            //
            BaseTime = getJobIdTime();
            JOB_ID = 'Aca_S_'+BaseTime;
            val_return = goCheck_val();
            //////////////////////////////////////////////
            if(val_return){
                if(confirm("테스트 발송 하시겠습니까?")){ 
                        document.getElementById("working").style.display='inline';
                        str = "&contents="+encodeURIComponent(msg)+"&callback="+encodeURIComponent(callback)+"&v_first="+encodeURIComponent(sSearchTypeFirst);
                        str += "&v_second="+encodeURIComponent(sSearchText)+"&searchtype="+encodeURIComponent(sSearchType)+"&auto_check_val="+encodeURIComponent(auto_check_val);
                        str += "&JOB_ID="+encodeURIComponent(JOB_ID)+"&jam_idx="+encodeURIComponent(callback.substr(3,8));
                        dhtmlxAjax.get("/intranet/?module="+module+"&method=SendSMSTestAjax"+str, outputSendSMSTESTResponse);
                        document.getElementById("working").style.display='none'; 
                } 
            }
            return false;
        }
        //
        function outputSendSMSTESTResponse(loader){
            //alert("]"+loader.xmlDoc.responseText+"[");
            var rtn = loader.xmlDoc.responseText;
            
            if(rtn.match('success')){
                //alert(loader.xmlDoc.responseText);
                alert("테스트 발송하였습니다.");
                document.getElementById("msg_send").innerHTML ='테스트 발송하였습니다.';
            }else{
                alert("발송 실패하였습니다.");
                document.getElementById("msg_send").innerHTML =loader.xmlDoc.responseText;
            }
            return false;
        }

        // goCheck //////////////////////////////////////////////////////////////
        function goCheck_val(){
            var callback = document.getElementById('sms_callback_number').value;
            var auto_check_val = document.getElementById("img_confirm").value;
            var loader;
            var rtn = '';
            //
            if(!document.getElementById('sms_contents').value) {
                alert("문자메시지를 입력해주세요.");
                document.getElementById('sms_contents').focus();
                return false;
            }
            if(!callback){
                alert("회신번호를 입력해주세요.");
                document.getElementById('sms_callback_number').focus();
                return false;
            } 
            if(!is_numeric(callback)){
                alert("숫자만 입력해주세요.");
                document.getElementById('sms_callback_number').focus();
                return false;
            }
            if(!document.getElementById("img_confirm").value)
            {
                alert("자동발송 확인 번호를 입력해주세요.");
                document.getElementById('img_confirm').focus(); 
                return false;
            }else{
                loader = dhtmlxAjax.getSync("/intranet/check_val.php/?val="+encodeURIComponent(auto_check_val));
                rtn = loader.xmlDoc.responseText ;
                if(!rtn.match('Done')){
                    alert("자동발송 확인 번호를 확인해주세요");
                    document.getElementById("img_confirm").focus();
                    return false;
                }
            }
            ///if(callback.length < 10 || callback.length > 11){
            ///    alert("전화번호를 확인해주세요.");
            ///    document.getElementById('sms_callback_number').focus();
            ///    return false;
            ///}
            ///if(callback.substr(0,2) != '01'){
            ///    alert("전화번호를 확인해주세요.");
            ///    document.getElementById('sms_callback_number').focus();
            ///    return false;
            ///}
            return true;
        }
        //
        function write_contents(str){
            document.getElementById('sms_contents').value=str;
        }
        //발송결과 가져오기
        function getFaxResult(form,module){
            dhtmlxAjax.get("/intranet/?module="+module+"&method=MessageResult&kind=SMS", outputMessageResult);
            return false;
        }
        function outputMessageResult(loader){
            //alert("]"+loader.xmlDoc.responseText+"[");
            var rtn = loader.xmlDoc.responseText;
            var length=rtn.length;
            
            if(is_numeric(rtn) && rtn != 0){
                //alert(loader.xmlDoc.responseText);
                alert("발송결과를 가져왔습니다.");
                location.reload();
            }else if(rtn.match('0') && length == 1){
                //alert(length);
                alert("가져올 자료가 없습니다.");
            }
            return false;
        }