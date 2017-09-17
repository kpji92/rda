                        // validation /////////////////////////////////////////////////////////////////////////
                       function goCheck_val(){
                            var faxno = document.getElementById('sender_faxno').value;
                            var auto_check_val = document.getElementById("img_confirm").value; 
                            if(!document.getElementById('subject').value)
                            {
                                alert("제목을 입력해주세요.");
                                document.getElementById('subject').focus();
                                return false;
                            }
                            if(!document.getElementById("file_name").value)
                            {
                                alert("FAX파일을 업로드한 후 진행하세요.");
                                return false;
                            }
                            if(!faxno)
                            {
                                alert("발송자번호를 입력해주세요.");
                                document.getElementById('sender_faxno').focus();
                                return false;
                            }else if(!is_numeric(faxno)){
                                alert("숫자만 입력해주세요.");
                                document.getElementById('sender_faxno').focus();
                                return false;
                            }
                            if(!document.getElementById("img_confirm").value)
                            {
                                alert("자동발송 확인 번호를 입력해주세요.");
                                document.getElementById('img_confirm').focus(); 
                                return false;
                            }else{
                                var loader = dhtmlxAjax.getSync("/intranet/check_val.php/?val="+encodeURIComponent(auto_check_val));
                                var rtn = loader.xmlDoc.responseText ;
                                if(!rtn.match('Done')){
                                    alert("자동발송 확인 번호를 확인해주세요");
                                    document.getElementById("img_confirm").focus();
                                    return false;
                                }
                            }
                            return true;
                        }

                        //FAX 발송 ///////////////////////////////////////////////////////////////////////////////
                        function getSendFax(form,module){
                            var subject = document.getElementById("subject").value;
                            var filename = document.getElementById("file_name").value;
                            var originalfilename = document.getElementById("original_file_name").value;
                            var senderfaxno = document.getElementById("sender_faxno").value;
                            var pagecnt = document.getElementById("pagecnt").value; 
                            var sSearchTypeFirst = document.getElementById("searchTypeFirst").value;
                            var sSearchText = document.getElementById("searchText").value;
                            var sSearchType = document.getElementById("searchTypeFirst").options[document.getElementById("searchTypeFirst").selectedIndex].innerHTML;
                            var item_cnt = document.getElementById('item_cnt').value;
                            var auto_check_val = document.getElementById("img_confirm").value;
                            var cnt = 0;
                            var rtn = false;
                            var val_return = false;
                            var value_str ='';
                            var value_str_fax = '';
                            var fax_unit = '';
                            var send_type = '';
                            var send_time = '';
                            var send_method = '';
                            var faxno = '';
                            var jam_idx = 0;
                            var jam_fax = '';
                            var j = 0;   //time gap
                            var JOB_ID = '';
                            var BaseTime = '';
                            var loader;
                            var rtn = '';
                            var send_success_cnt = 0;

                            BaseTime = getJobIdTime();
                            JOB_ID_date = BaseTime;

                            cnt = checked_cnt(item_cnt);
                            
                            if(cnt == 0){
                                alert('선택된 리스트가 없습니다!');
                                return false;
                            }
                             //////////////////
                            JOB_ID = 'Aca_F_'+BaseTime;
                            value_str = "&subject="+encodeURIComponent(subject)+"&filename="+encodeURIComponent(filename)+"&originalfilename="+encodeURIComponent(originalfilename);
                            value_str += "&senderfaxno="+encodeURIComponent(senderfaxno)+"&pagecnt="+encodeURIComponent(pagecnt)+"&v_first="+encodeURIComponent(sSearchTypeFirst);
                            value_str += "&v_second="+encodeURIComponent(sSearchText)+"&searchtype="+encodeURIComponent(sSearchType)+"&cnt="+encodeURIComponent(cnt);
                            value_str += "&JOB_ID="+encodeURIComponent(JOB_ID)+"&base_time="+encodeURIComponent(BaseTime)+"&auto_check_val="+encodeURIComponent(auto_check_val);
                            //
                            val_return = goCheck_val();
                            //////////////////////////////////////////////
                            if(val_return){
                                 if(confirm("["+cnt+"]건을 발송 하시겠습니까?")){ 
                                    //fax file upload
                                    loader = dhtmlxAjax.getSync("/intranet/?module="+module+"&method=FaxFileUpload"+value_str);
                                    rtn = loader.xmlDoc.responseText;
                                    if(!rtn.match('success')){
                                        alert("[파일 업로드] 실패하였습니다.");
                                        document.getElementById("msg_send").innerHTML =loader.xmlDoc.responseText; 
                                        return false;
                                    }
                                    //alert('upload_ok')
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
                                                jam_fax = document.getElementById('fax_'+i).value;
                                                faxno = "&faxno="+encodeURIComponent(jam_idx+"^"+jam_fax)+"&jam_idx="+encodeURIComponent(jam_idx);
                                                //alert(jam_idx);
                                                loader = dhtmlxAjax.getSync("/intranet/?module="+module+"&method=SendFaxUnitAjax"+value_str+faxno+send_method);
                                                rtn = loader.xmlDoc.responseText;
                                                if(rtn.match('success')){
                                                    send_success_cnt++; 
                                                }
                                            }
                                        }
                                    }
                                    document.getElementById("working").style.display='none';
                                    // 발송정보 저장
                                    if(send_success_cnt > 0 || cnt > 0){
                                        dhtmlxAjax.get("/intranet/?module="+module+"&method=SendFaxSaveAjax"+value_str, outputSendFaxSaveResponse);
                                    }else{
                                        alert("저장할 정보가 없습니다.");
                                    }
                                }
                            } 
                            return false;
                        }
                        ///
                        function outputSendFaxSaveResponse(loader){
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
                            return false;
                        }
                        //FAX test발송 /////////////////////////////////////////////////////////////////////////////// 
                        function getSendTestFax(form,module){
                            var subject = document.getElementById("subject").value;
                            var filename = document.getElementById("file_name").value;
                            var originalfilename = document.getElementById("original_file_name").value;
                            var senderfaxno = document.getElementById("sender_faxno").value;
                            var pagecnt = document.getElementById("pagecnt").value; 
                            var sSearchTypeFirst = document.getElementById("searchTypeFirst").value;
                            var sSearchText = document.getElementById("searchText").value;
                            var sSearchType = document.getElementById("searchTypeFirst").options[document.getElementById("searchTypeFirst").selectedIndex].innerHTML;
                            var auto_check_val = document.getElementById("img_confirm").value;
                            var JOB_ID = '';
                            var BaseTime = '';
                            var str = '';
                            //
                            BaseTime = getJobIdTime();
                            JOB_ID = 'Aca_F_'+BaseTime;
                            //
                            val_return = goCheck_val();
                            //////////////////////////////////////////////
                            if(val_return){
                                if(confirm("테스트 발송 하시겠습니까?")){ 
                                        document.getElementById("working").style.display='inline'; 
                                        //
                                        str = "&subject="+encodeURIComponent(subject)+"&filename="+encodeURIComponent(filename)+"&originalfilename="+encodeURIComponent(originalfilename);
                                        str += "&senderfaxno="+encodeURIComponent(senderfaxno)+"&faxtestno="+encodeURIComponent(senderfaxno)+"&pagecnt="+encodeURIComponent(pagecnt);
                                        str += "&v_first="+encodeURIComponent(sSearchTypeFirst)+"&v_second="+encodeURIComponent(sSearchText)+"&searchtype="+encodeURIComponent(sSearchType);
                                        str += "&auto_check_val="+encodeURIComponent(auto_check_val);
                                        str += "&JOB_ID="+encodeURIComponent(JOB_ID)+"&jam_idx="+encodeURIComponent(senderfaxno.substr(3,8));   
                                        //
                                        dhtmlxAjax.get("/intranet/?module="+module+"&method=SendFaxTestAjax"+str, outputSendFaxTestResponse);
                                        document.getElementById("working").style.display='none'; 
                                } 
                            }
                            return false;
                        }
                        function outputSendFaxTestResponse(loader){
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

                        ///////////////
                        function setAttachFile(file){
                            //alert(file.lastIndexOf(">"));
                            if(file.lastIndexOf(">") != 20){ 
                                document.getElementById("file_name").value = file;  
                            }
                            return false;
                        }
                        
                        function setAttachName(name){
                            if(name.lastIndexOf(">") != 20){   
                                document.getElementById("original_file_name").value = name;  
                                document.getElementById("msg_send").innerHTML ='['+ name+']파일을 업로드하였습니다. 계속 진행하여 주세요!'; 
                            }
                            return false;
                        }
                        //발송결과 가져오기
                        function getFaxResult(form,module){
                            dhtmlxAjax.get("/intranet/?module="+module+"&method=MessageResult&kind=FAX", outputMessageResult);
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