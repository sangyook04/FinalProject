<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project_studentJoin</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   <script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/main3.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
	
	<!-- 주소창 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
            }
        }).open();
    }
</script>

<!-- 회원가입 유효성검사 -->
<script>
//폼 입력 데이터 확인 함수
function studentJoinCheck(){
	var id = document.studentJoin.stuId; 
	var pwd = document.studentJoin.stuPassword; 
	var pwd2 = document.studentJoin.stuPassword2; 
	var usernm = document.studentJoin.stuName;
	var email1 = document.studentJoin.stuEmail1;
	var email2 = document.studentJoin.stuEmail2;
	var gender = document.studentJoin.stuGender;
	var post = document.studentJoin.post;
	var Address = document.studentJoin.Address;
	var phonenum1 = document.studentJoin.phonenum1;
	var phonenum2 = document.studentJoin.phonenum2;
	var phonenum3 = document.studentJoin.phonenum3;

	
	if( id.value == '') {
		alert('아이디를 입력해 주세요');
		id.focus();
		return;
	} else if(id.value.length <= 8 || id.value.length >= 16) {
		alert('아이디는 10자 이상 15자 이내로 입력해 주세요');
		id.focus();
		return;
	} else if( pwd.value == ''){
		alert('비밀번호를 입력해 주세요');
		pwd.focus();
		return;
	} else if( pwd2.value == ''){
		alert('비밀번호 확인을 입력해 주세요');
		pwd2.focus();
		return;
	} else if( pwd.value !== pwd2.value ){
		alert('비밀번호가 일치하지 않습니다.');	
		//비밀번호 값을 모두 지우기
		pwd.value = "";
		pwd2.value = '';
		pwd.focus();
		return;
	} else if( usernm.value == ''){
		alert('이름을 입력해 주세요');
		usernm.focus();
		return;
	} else if( email1.value == '' || email2.value == ''){
		alert('이메일을 입력해 주세요');
		email1.focus();
		return;
	} else if( birthdate.value == ''){
		alert('생년월일을 입력해 주세요');
		birthdate.focus();
		return;
	} else if( gender.value == ''){
		alert('성별을 선택해 주세요');
		gender.focus();
		return;
	}
	
	document.frm2.submit();
	
}

//이메일 자동완성 함수
function setEmail2(email3Obj){
	var email2 = document.studentJoin.stuEmail2;
	var email3 = email3Obj.value;
	
	if(email3 != 'direct'){	//직접 선택이 아닌 경우
		email2.value = email3;
	} else {//직접 선택인 경우
		email2.value = "";
		email2.focus();
	}
}

//비밀번호 확인 함수
function pwChk(){
	var pwd = document.studentJoin.stuPassword; 
	var pwd2 = document.studentJoin.stuPasswordChk; 
	
	if (pwd.value != pwd2.value){
		alert('비밀번호가 일치하지 않습니다.');
		return;
	} else if (pwd.value == ""){
		alert('비밀번호를 입력해주세요.')
		return;
	}
	alert('비밀번호가 일치합니다.');
}
</script>






<script>
         $(document).ready(function(){

         $('nav .one').hover(function () {
             if($(".callsenterSub").css("display") == "none"){
                $('.callsenterSub').slideDown();
                $("headerA").css("color","#f15b6d");
                event.preventDefault();
             } else {
                $('.callsenterSub').css("display", "none");
             }
         });

      });//ready
   </script>
</head>
<body>
   <div id="wrap">
      <header>
         <nav>
            <div class="inner">
               <div class="headerContent">
                  <div class="mainlogo"></div>
                  <ul class="mainmenu">
                     <li><a href="#">스터디 찾기</a></li>
                     <li><a href="#">레벨 테스트</a></li>
                     <li><a href="#">공지사항</a></li>
                     <li class="one"><a href="#">고객센터</a>
                        <ul class="callsenterSub">
                        
                           <li><a href="#">FAQ</a></li>
                           <li><a href="#">QnA</a></li>
                        </ul>
                     </li>
                  </ul>
                  <ul class="gnb">
                     <li><a href="#">로그인</a></li>
                     <li><a href="#">학생 회원가입</a></li>
                     <li><a href="#">리더 시작하기</a></li>
                  </ul>
               </div>
            </div>
         </nav>
      </header>
      <div id="container">

			<div class="inner">
				<div class="content">
					<h1>학생 회원가입</h1>
					<div class="studentJoin">
						<form role="form" name="studentJoin" action="/common/studentJoin" id="joinForm" method="post">
							<div class="textInput"><input type="text" placeholder="아이디" name="stuId" class="joinInput"><button class="btn">중복확인</button></div>
							<div class="textInput"><input type="password" placeholder="비밀번호" name="stuPassword" class="joinInput"></div>
							<div class="textInput"><input type="password" placeholder="비밀번호 확인" name="stuPasswordChk" class="joinInput"><button type="button" class="btn" onclick="pwChk()">비밀번호 확인</button></div>
							<div class="textInput"><input type="text" placeholder="이름" name="stuName" class="joinInput"></div>
							<div class="textInput"><label><input class="radiogenderRadio" type="radio" name="stuGender" value="m">남</label><span class="joinText"></span>
													 <label><input class="radiogenderRadio" type="radio" name="stuGender" value="f">여</label></div>
							<div class="textInput"><input type="text" placeholder="우편번호" name="stuPostcode" id="sample4_postcode" class="joinInput2" readonly="readonly"><input type="button" onclick="sample4_execDaumPostcode()" value="주소찾기" class="btn"></div>
							<div class="textInput"><input type="text" placeholder="도로명주소" name="stuRoadAdd" id="sample4_roadAddress" class="joinInput" readonly="readonly"></div>
							<div class="textInput"><input type="text" placeholder="지번주소" name="stuJibunAdd" id="sample4_jibunAddress" class="joinInput" readonly="readonly"></div>
							<div class="textInput"><input type="text" placeholder="상세주소" name="stuAddress" id="sample4_detailAddress" class="joinInput1"><input type="text" placeholder="참고항목" name="stuExtraAdd" id="sample4_extraAddress" class="joinInput1" readonly="readonly"></div>
							<div class="textInput"><input type="tel" placeholder="연락처" name="stuPhonenum" class="joinInput2"><span class="joinText">-</span><input type="tel" placeholder="연락처" name="stuPhonenum2" class="joinInput2"><span class="joinText">-</span><input type="tel" placeholder="연락처" name="stuPhonenum3" class="joinInput2"></div>
							<div class="textInput"><input type="text" placeholder="이메일" name="stuEmail" class="joinInput2"><span class="joinText">@</span><input type="text" placeholder="이메일" name="stuEmail2" class="joinInput2">
							<select class="joinInput2" name="stuEmail3" onchange="setEmail2(this)">
													<option value="direct" selected>직접입력</option>
													<option value="naver.com">naver.com</option>
													<option value="daum.net">daum.net</option>
													<option value="gmail.com">gmail.com</option></select></div>
							<div class="textBtn"><button class="joinBtn" id="joinBtnId" type="submit" data-oper="join">가입하기</button></div>
						</form>
					</div>
				</div>
			</div>

		</div>
		<!-- container -->
      <footer>
         <div class="inner">
            <div class="footArea">
               <div class="footerLeft">
                  <div class="callNumber"><b>고객센터</b><strong> 1588-0000</strong> 평일 09:00~18:00(공휴일 제외)</div>
                  <div class="footerinfo">
                     <ul>
                        <li><a href="#">개인정보 처리방침</a></li>
                        <li><a href="#">서비스약관</a></li>
                     </ul>
                  </div>
                  <address>서울특별시 마포구 서교동 447-5 풍성빌딩 쌍용강북교육센터</address>
               </div>
               <div class="footerRight">
                  <div class="sns">
                          <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_instar.png" alt="인스타"></a>
                          <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_blog.png" alt="블로그"></a>
                          <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_facebook.png" alt="페이스북"></a>
                          <a href="#" target="_blank"><img src="../../../resources/img/GumonMain/img_sns_kakaostory.png" alt="카카오스토리"></a>
                      </div>
               </div>
            </div>
            <div class="copyright">Copyrightⓒ AGUMON. All Right Reserved</div>
         </div><!-- inner -->
      </footer>
   </div><!-- wrap -->
  
   <script>
		$(function() {
			var joinForm = $("#joinForm");
		
			//register
			$('button[data-oper="join"]').on("click", function(e){
			      
			      var conf = confirm("가입이 완료되었습니다.");
			      alert(conf);
			      
			      if(conf == true){
			     
			         $("#joinForm").submit();
			      } 
			   });
			
			
			
		});
	</script>
   
</body>
</html>