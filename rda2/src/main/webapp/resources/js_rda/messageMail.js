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
                            if(!oEditors.getById["contents"].getIR())
                            {
                                alert("내용을 입력해주세요.");
                                //oEditors.getById["contents"].focus();
                                return false;
                            }
                            return true;
                        }
                        // 메일 발송 ///////////////////////////////////////////////////////////////////////////////
                        function getSendMail(form,module,test,kind){
                            var kmm_subject = document.getElementById("subject").value;
                            var kmm_content = oEditors.getById["contents"].getIR();
                            var kmm_sender_email = document.getElementById("mailfrom").value;
                            var sSearchTypeFirst = document.getElementById("searchTypeFirst").value;
                            var sSearchText = document.getElementById("searchText").value;
                            var sSearchType = document.getElementById("searchTypeFirst").options[document.getElementById("searchTypeFirst").selectedIndex].innerHTML;
                            var kmm_sender = document.getElementById("from_name").value;
                            var kmm_type = sSearchType+" "+sSearchText;
                            var kmm_kind = kind;
                            var kmmt_name;
                            var kmmt_email;
                             //
                            var item_cnt = document.getElementById('item_cnt').value;
                            var cnt = 0;
                            var rtn = false;
                            var val_return = false;
                            var value_str ='';
                            var jam_idx = 0;
                            var jam_email = '';
                            var email = '';
                            var msg = '';
                            var loader;
                            var kmm_idx = 0;
                            var kmm_test = 0;
                            
                            var kmm_send_count = checked_cnt(item_cnt);
                            // 주의 기존자료와 혼동 피하기 위해 kmm_test : 기존자료 0  테스트 발송 : 1   실발송 : 2
                            if(test == 1){
                                msg = '테스트 발송하시겠습니까?';
                                kmm_test = 1;
                            }else{
                                kmm_test = 2;
                                msg = "["+kmm_send_count+"]건을 발송 하시겠습니까?";
                                if(kmm_send_count == 0){
                                    alert('선택된 리스트가 없습니다!');
                                    return false;
                                }
                            }
                            //////////////////
                            value_str = "&kmm_type="+encodeURIComponent(kmm_type)+"&kmm_sender="+encodeURIComponent(kmm_sender)+"&kmm_sender_email="+encodeURIComponent(kmm_sender_email);
                            value_str += "&kmm_subject="+encodeURIComponent(kmm_subject)+"&kmm_content="+encodeURIComponent(kmm_content)+"&kmm_send_count="+encodeURIComponent(kmm_send_count);
                            value_str += "&kmm_test="+encodeURIComponent(kmm_test)+"&kmm_kind="+encodeURIComponent(kmm_kind);
                            ///
                            //alert(kmm_content);
                            val_return = goCheck_val();
                            if(val_return){
                                if(confirm(msg)){ 
                                    // DB 저당
                                    document.getElementById("working").style.display='inline';
                                    //kis_multi_mail 저장 후 kmm_idx
                                    loader = dhtmlxAjax.getSync("/intranet/?module="+module+"&method=InsertMail"+value_str);
                                    //alert(loader.xmlDoc.responseText);
                                    kmm_idx = Number(loader.xmlDoc.responseText);
                                    
                                    if(kmm_idx < 1){
                                        alert("[발송 실패]하였습니다.");
                                        return false;
                                    }
                                    //
                                    if(test == 1){    
                                        //kis_multi_mail_to에 저장
                                        //alert(kmm_idx);
                                        kmmt_name = kmm_sender;
                                        kmmt_email = kmm_sender_email;
                                        value_str = "&kmm_idx="+encodeURIComponent(kmm_idx)+"&kmmt_name="+encodeURIComponent(kmmt_name)+"&kmmt_email="+encodeURIComponent(kmmt_email);
                                        loader = dhtmlxAjax.getSync("/intranet/?module="+module+"&method=InsertMailTo"+value_str);
                                        rtn = loader.xmlDoc.responseText;
                                        //alert(rtn);
                                    }else{
                                        //alert(item_cnt);
                                        for(i=0;i<=item_cnt;i++){
                                            if(document.getElementById('chk_row_'+i)){
                                                if(document.getElementById('chk_row_'+i).checked){ 
                                                    //발송 루틴(하나씩)
                                                    kmmt_name = document.getElementById('jam_name_'+i).innerHTML;
                                                    kmmt_email = document.getElementById('jam_email_'+i).innerHTML;
                                                    value_str = "&kmm_idx="+encodeURIComponent(kmm_idx)+"&kmmt_name="+encodeURIComponent(kmmt_name)+"&kmmt_email="+encodeURIComponent(kmmt_email);
                                                    //alert(email);
                                                    loader = dhtmlxAjax.getSync("/intranet/?module="+module+"&method=InsertMailTo"+value_str);
                                                    rtn = loader.xmlDoc.responseText;
                                                }
                                            }
                                        }
                                    }
                                    // 발송 ///////////////////////////////
                                    //alert(kmm_idx+"확인");
                                    //아래방법 안됨
                                        //loader = dhtmlxAjax.getSync("http://www.research1.kr/background_app/KIS_sendMultiMail.php/?kmm_idx="+kmm_idx);
                                        //rtn = loader.xmlDoc.responseText;
                                        //alert(rtn);
                                    //
                                    var URL = "http://www.research1.kr/background_app/KIS_sendMultiMail.php/?kmm_idx="+kmm_idx;
                                    location.href = URL;
                                    //document.getElementById("working").style.display='none'; 
                                }
                            } 
                            return false;
                        }
