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
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project</title>
   <!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"> 
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain3.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">
	<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminheaderfooter.css">
   
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
function studentModCheck(){
	var id = document.studentMod.stuId; 
	var pwd = document.studentMod.stuPassword; 
	var pwd2 = document.studentMod.stuPassword2; 
	var usernm = document.studentMod.stuName;
	var email1 = document.studentMod.stuEmail1;
	var email2 = document.studentMod.stuEmail2;
	var gender = document.studentMod.stuGender;
	var post = document.studentMod.post;
	var Address = document.studentMod.Address;
	var phonenum1 = document.studentMod.phonenum1;
	var phonenum2 = document.studentMod.phonenum2;
	var phonenum3 = document.studentMod.phonenum3;

	
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
	var email2 = document.studentMod.stuEmail2;
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
	var pwd = document.studentMod.stuPassword; 
	var pwd2 = document.studentMod.stuPasswordChk; 
	
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

			$('.first').hover(function () {
			    if($(".firstSub").css("display") == "none"){
			       $('.firstSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.firstSub').css("display", "none");
			    }
			});

			$('.firstSub2').hover(function () {
			    if($(".asideSubmenu2").css("display") == "none"){
			       $('.asideSubmenu2').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.asideSubmenu2').css("display", "none");
			    }
			});

			$('.second').hover(function () {
			    if($(".secondSub").css("display") == "none"){
			       $('.secondSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.secondSub').css("display", "none");
			    }
			});

			$('.third').hover(function () {
			    if($(".thirdSub").css("display") == "none"){
			       $('.thirdSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.thirdSub').css("display", "none");
			    }
			});

			$('.fourth').hover(function () {
			    if($(".fourthSub").css("display") == "none"){
			       $('.fourthSub').css("display", "block");
			       event.preventDefault();
			    } else {
			       $('.fourthSub').css("display", "none");
			    }
			});

		});//ready
   </script>
</head>
<body>
	<div id="wrap">
			<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
			
		<div class="inner">
				<div class="content">
					<h1><b>학생 정보수정</b></h1>
					<div class="studentMod">
						<form role="form" name="studentMod" action="/admin/adminStudentMod" id="ModForm" method="post">
						  <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<div class="textInputEx">아이디: <input type="text" name="stuId" value="${stuInfo.stuId }" readonly="readonly"></div>
							<div class="textInput"><input type="password" placeholder="새로운 비밀번호 입력" name="stuPassword" class="joinInput"></div>
							<div class="textInput"><input type="password" placeholder="비밀번호 확인" name="stuPasswordChk" class="joinInput"><button type="button" class="btn" onclick="pwChk()">비밀번호 확인</button></div>
							<div class="textInputEx">이름: <input type="text" name="stuName" value="${stuInfo.stuName }"></div>
							<div class="textInputEx">성별: <input type="text" name="stuGender" value="${stuInfo.stuGender}" readonly="readonly"></div>
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
							<div class="textBtn"><button class="modBtn" id="joinBtnId" type="submit" data-oper="mod">수정</button>
							<button class="closeBtn" id="joinBtnId" type="button" data-oper="close">취소</button>	</div>
							
													</form>
												
							
											
							<form id="CloseForm" action="/admin/adminStudentInfo" method="get">
					<input type="hidden" id="stuId" name="stuId"
						value="${stuInfo.stuId }">
					</form> 
													
													
													
					</div>
				</div>
			</div>
	</div>
		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div><!-- wrap -->
	
	   <script>
		$(function() {
			var ModForm = $("#ModForm");
			var CloseForm = $("#CloseForm");
		
			//modify
			$('button[data-oper="mod"]').on("click", function(e){
			      
			      var conf = confirm("수정이 완료되었습니다.");
			      alert(conf);
			      
			      if(conf == true){
			     
			         $("#ModForm").submit();
			      } 
			   });
			
			
			
			//close
			$('button[data-oper="close"]').on("click", function(e) {
				//CloseForm.find('#stuId').remove();
				CloseForm.attr("action", "/admin/adminStudentInfo");
				CloseForm.submit();
			});

			
			
			
		});
	</script>
	
	
	
</body>
</html>