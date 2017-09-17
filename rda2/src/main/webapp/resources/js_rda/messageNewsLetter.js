                        // 테스트 발송 ///////////////////////////////////////////////////////////////////////////////
                        function getSendNewsLetterTest(form,module){
                            var sSubject = document.getElementById("subject").value;
                            var sMailFrom = document.getElementById("mailfrom").value;
                            var SendNewsLetterSubject = document.getElementById('send_newsletter').innerHTML;
                            var sFromName = document.getElementById("from_name").value;
                            var value_str = '';
                            //
                            var val_return = goCheck_val();
                            if(val_return){
                                if(confirm("테스트 발송 하시겠습니까?")){ 
                                    document.getElementById("working").style.display='inline';  
                                    value_str = "&subject="+encodeURIComponent(sSubject)+"&mailfrom="+encodeURIComponent(sMailFrom)+"&SendNewsLetterSubject"+encodeURIComponent(SendNewsLetterSubject)
                                    value_str += "&from_name="+encodeURIComponent(sFromName) 
                                    dhtmlxAjax.get("/intranet/?module="+module+"&method=SendNewsLetterTestAjax"+value_str, outputSendNewsLetterTestResponse);
                                    document.getElementById("working").style.display='none';
                                } 
                            }
                            return false;
                        }
                        function outputSendNewsLetterTestResponse(loader){
                            //alert("]"+loader.xmlDoc.responseText+"[");
                            var rtn = loader.xmlDoc.responseText;
                            
                            if(rtn.match('1')){
                                alert("테스트 발송하였습니다.");
                                document.getElementById("msg_send").innerHTML ='테스트 발송하였습니다.'; 
                            }else{
                                alert("발송 실패하였습니다.");
                            }
                        }
                        
                        // 뉴스레터 발송 ///////////////////////////////////////////////////////////////////////////////
                        function getSendNewsLetter(form,module){
                            var sSubject = document.getElementById("subject").value;
                            var sMailFrom = document.getElementById("mailfrom").value;
                            var sSearchTypeFirst = document.getElementById("searchTypeFirst").value;
                            var sSearchText = document.getElementById("searchText").value;
                            var sSearchType = document.getElementById("searchTypeFirst").options[document.getElementById("searchTypeFirst").selectedIndex].innerHTML;
                            var SendNewsLetterSubject = document.getElementById('send_newsletter').innerHTML;
                            var sFromName = document.getElementById("from_name").value;
                            //
                            var item_cnt = document.getElementById('item_cnt').value;
                            var cnt = 0;
                            var rtn = false;
                            var val_return = false;
                            var value_str ='';
                            var jam_idx = 0;
                            var jam_email = '';
                            var email = '';
                            var BaseTime = '';
                            var JOB_ID = '';
                            
                            BaseTime = getJobIdTime();
                            cnt = checked_cnt(item_cnt);
                            //alert(cnt);
                            if(cnt == 0){
                                alert('선택된 리스트가 없습니다!');
                                return false;
                            }
                            //////////////////
                            JOB_ID = 'Aca_N_'+BaseTime;
                            value_str =  "&subject="+encodeURIComponent(sSubject)+"&mailfrom="+encodeURIComponent(sMailFrom)+"&v_first="+encodeURIComponent(sSearchTypeFirst)+"&v_second="+encodeURIComponent(sSearchText);
                            value_str += "&searchtype="+encodeURIComponent(sSearchType)+"&SendNewsLetterSubject"+encodeURIComponent(SendNewsLetterSubject);
                            value_str += "&cnt="+encodeURIComponent(cnt)+"&from_name="+encodeURIComponent(sFromName)+"&JOB_ID="+encodeURIComponent(JOB_ID);
                            
                            var val_return = goCheck_val();
                            if(val_return){
                                if(confirm("["+cnt+"]건을 발송 하시겠습니까?")){ 
                                    // 발송
                                    document.getElementById("working").style.display='inline';
                                    for(i=0;i<=item_cnt;i++){
                                        if(document.getElementById('chk_row_'+i)){
                                            if(document.getElementById('chk_row_'+i).checked){ 
                                                //발송 루틴(하나씩)
                                                jam_idx = document.getElementById('jam_idx_'+i).value;
                                                jam_email = document.getElementById('jam_email_'+i).innerHTML;
                                                email = "&jam_idx="+encodeURIComponent(jam_idx)+"&jam_email="+encodeURIComponent(jam_email);
                                                //alert(email);
                                                dhtmlxAjax.get("/intranet/?module="+module+"&method=SendNewsLetterUnitAjax"+value_str+email, outputSendNewsLetterUnitAjax);
                                            }
                                        }
                                    }
                                    // 발송정보 저장
                                    dhtmlxAjax.get("/intranet/?module="+module+"&method=SendNewsLetterSaveAjax"+value_str, outputSendNewsLetterSaveResponse);
                                    document.getElementById("working").style.display='none';
                                }
                            } 
                            return false;
                        }
                         ///
                        function outputSendNewsLetterUnitAjax(loader){
                            //alert("]"+loader.xmlDoc.responseText+"[");
                            var rtn = loader.xmlDoc.responseText;
                            
                            if(!rtn.match('1')){
                                alert("[발송] 실패하였습니다.");
                                document.getElementById("msg_send").innerHTML =loader.xmlDoc.responseText; 
                            }
                            return false;
                        }
                        //
                        function outputSendNewsLetterSaveResponse(loader){
                            //alert("]"+loader.xmlDoc.responseText+"[");
                            var rtn = loader.xmlDoc.responseText;
                            
                            if(rtn.match('1')){
                                alert("발송하였습니다.");
                                document.getElementById("msg_send").innerHTML ='발송하였습니다.'; 
                                location.reload(); 
                            }else{
                                alert("발송 실패하였습니다.");
                            }
                            document.getElementById("working").style.display='none';
                        }

                        // validation /////////////////////////////////////////////////////////////////////////
                       function goCheck_val(){
                            var sEmail = document.getElementById('mailfrom').value;
                            if(!document.getElementById('subject').value)
                            {
                                alert("제목을 입력해주세요.");
                                document.getElementById('subject').focus();
                                return false;
                            }
                            if(!document.getElementById('from_name').value)
                            {
                                alert("발송자명을 입력해주세요.");
                                document.getElementById('from_name').focus();
                                return false;
                            }
                            if(!sEmail)
                            {
                                alert("발송자 메일주소를 입력해주세요.");
                                document.getElementById('mailfrom').focus();
                                return false;
                            }else{
                                if(!CheckEmail(sEmail)){
                                    alert("메일형식 오류입니다.");
                                    document.getElementById('mailfrom').focus();
                                    return false;
                                }                                
                            }
                            return true;
                        }
                        
                        // move newsletter show
                        function moveiFrame(letter,subject){
                            //alert(str);
                            document.getElementById('newsletter_show').src="/intranet/newsletter/"+letter;
                            document.getElementById('send_newsletter').innerHTML=subject;
                            //
                            window.open('/intranet/newsletter/'+letter,'','width=800, location=no, directories=no,resizable=yes, scrollbars=yes, status=no')
                            
                        }
                        ///////////////
                        function setAttachName(name){
                            if(name.lastIndexOf(">") != 20){   
                                document.getElementById("uploaded").innerHTML ='Done!'; 
                            }
                        } 