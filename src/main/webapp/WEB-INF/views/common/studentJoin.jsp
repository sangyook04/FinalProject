<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project_studentJoin</title>
<!-- CSS -->
<link
	href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap"
	rel="stylesheet">
<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="../../../resources/css/main3.css">
<link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../../resources/css/headerfooter.css">

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
                //document.getElementById('sample4_postcode').value = data.zonecode;
                //document.getElementById("sample4_roadAddress").value = roadAddr;
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                var str = "";
                str += "[" + data.zonecode + "] ";
                str += roadAddr + ", ";
                str += data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    //document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                    str += extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }
                
                document.getElementById('sample4_roadAddress').value = str;
            }
        }).open();
    }
</script>

<!-- 회원가입 유효성검사 -->
<script>
/* 	var idck = 0;
	$(".idCheck").click(function() {	
			var query = {
				stuId : $("#stuId").val()
			};

			var stuId = $("#stuId").val()
			
			var csrfHeaderName = "${_csrf.headerName}";
			var csrfTokenValue = "${_csrf.token}";
			console.log(stuId);
			$.ajax({
				url : "/common/idCheck",
				type : "post",
				data : {
					stuId : stuId
				},
				dataType : "json",
				beforeSend  : function(xhr){
		            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
		         },       
				success : function(data) {
					if ($.trim(data) == 0) {
						console.log("시발!!");
						$(".result .msg").text("사용가능");
						$(".result .msg").attr("style", "color:#00f");
						idck = 1;
						
					} else if ($.trim(data) == 1){
						$(".result .msg").text("사용불가");
						$(".result .msg").attr("style", "color:#f00");
					}
				}
			}); // ajax 끝
		}); // End id check */


//폼 입력 데이터 확인 함수
function studentJoinCheck(){
   var id = document.studentJoin.stuId; 
   var pwd = document.studentJoin.stuPassword; 
   var pwd2 = document.studentJoin.stuPassword2; 
   var usernm = document.studentJoin.stuName;
   var email1 = document.studentJoin.stuEmail;
   var email2 = document.studentJoin.stuEmail2;
   var gender = document.studentJoin.stuGender;
   var Address = document.studentJoin.stuAddress;
   var phonenum = document.studentJoin.stuPhonenum;
   var idck = document.studentJoin.idck;
   
   if( id.value == '') {
      alert('아이디를 입력해 주세요');
      id.focus();
      return;
   } else if(pwd.value.length <= 8 || pwd.value.length >= 16) {
      alert('비밀번호는8자 이상 16자 이내로 입력해 주세요');
      pwd.focus();
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
   } else if( gender.value == ''){
      alert('성별을 선택해 주세요');
      return;
   } else if( Address.value == ''){
      alert('주소를 입력해 주세요');
      Address.focus();
      return;
   } else if( phonenum.value == ''){
      alert('연락처를 입력해 주세요');
      phonenum.focus();
      return;
   } else if( email1.value == '' || email2.value == ''){
      alert('이메일을 입력해 주세요');
      email1.focus();
      return;
   }
	
   if(confirm("회원가입을 하시겠습니까?")){
       if(idck.value==0){
			alert('아이디 중복체크를 해주세요');
           return false;
       }else{
       alert("회원가입을 축하합니다");
       $("#frm").submit();
       }
   }
   /* alert('학생 회원가입이 완료되었습니다.');
   document.studentJoin.submit(); */
   
}

//이메일 자동완성 함수
function setEmail2(email3Obj){
   var email2 = document.studentJoin.stuEmail2;
   var email3 = email3Obj.value;
   
   if(email3 != 'direct'){   //직접 선택이 아닌 경우
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
		<%@ include file="../common/header.jsp"%>
		<div id="container">

			<div class="inner">
				<div class="content">
					<h1>학생 회원가입</h1>
					<div class="studentJoin">
						<form role="form" id="frm" name="studentJoin" action="/common/studentJoin"
							method="post">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<input type="hidden" name="idck" value="0">
              
							<div class="textInput">
									<input type="text"
										class="joinInput" id="stuId"
										placeholder="아이디" name="stuId"><button type="button" id="stuIdInput" class="idCheck btn">중복체크</button>
							</div>
							<div class="textInput">
									<p class="result">
										<span class="msg"></span>
									</p>
							</div>

         
                     <div class="textInput">
                        <input type="password" placeholder="비밀번호(8~16자 이내)" name="stuPassword"
                           class="joinInput">
                     </div>
                     <div class="textInput">
                        <input type="password" placeholder="비밀번호 확인"
                           name="stuPassword2" class="joinInput">
                       
                     </div>
                     <div class="textInput">
                        <input type="text" placeholder="이름" name="stuName"
                           class="joinInput">
                     </div>
                     <div class="textInput">
                        <label><input class="radiogenderRadio" type="radio"
                           name="stuGender" value="m">남</label><span class="joinText"></span>
                        <label><input class="radiogenderRadio" type="radio"
                           name="stuGender" value="f">여</label>
                     </div>
                     <div class="textInput">
                     <input type="text" placeholder="주소" name="stuAddress"
                           id="sample4_roadAddress" class="joinInput" readonly="readonly">
                           <input type="button" onclick="sample4_execDaumPostcode()" value="주소찾기" class="btn">
                     </div>
                     <div class="textInput">
                        <input type="tel" placeholder="연락처(- 없이 입력해주세요)" name="stuPhonenum"
                           class="joinInput">
                     </div>
                     <div class="textInput">
                        <input type="text" placeholder="이메일" name="stuEmail"
                           class="joinInput2"><span class="joinText">@</span><input
                           type="text" placeholder="이메일" name="stuEmail2"
                           class="joinInput2"> <select class="joinInput2"
                           name="stuEmail3" onchange="setEmail2(this)">
                           <option value="direct" selected>직접입력</option>
                           <option value="naver.com">naver.com</option>
                           <option value="daum.net">daum.net</option>
                           <option value="gmail.com">gmail.com</option>
                        </select>
                     </div>
                 
                     
                     <div class="textBtn">
                        <input id="joinBtn" type="button" onclick="studentJoinCheck()" value="가입하기">
                     </div>
                  </form>
               </div>
            </div>
         </div>




		</div>
		<!-- container -->
		<%@ include file="../common/footer.jsp"%>
	</div>
	<!-- wrap -->

	<script type="text/javascript">
//아이디 체크여부 확인 (아이디 중복이 아닐 경우 = 0 , 중복일 경우 = 1 )
$(".idCheck").click(function() {

	var idck = document.studentJoin.idck;
	var query = {
		stuId : $("#stuId").val()
	};

	var stuId = $("#stuId").val()
	
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	console.log(stuId);
	$.ajax({
		url : "/common/idCheck",
		type : "post",
		data : {
			stuId : stuId
		},
		dataType : "json",
		beforeSend  : function(xhr){
            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
         },       
		success : function(data) {
			if ($.trim(data) == 0) {
				console.log("안녕");
				$(".result .msg").text("사용가능");
				$(".result .msg").attr("style", "color:#00f");
				idck.value = '1';
				
			} else if ($.trim(data) == 1){
				$(".result .msg").text("사용불가");
				$(".result .msg").attr("style", "color:#f00");
				idck.value = '0';
			}
		}
	}); // ajax 끝
}); // End id check
</script>
</body>
</html>