<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Final Project_leaderInfoModify</title>
<!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
	<script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/adminMain2.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet"><link href="css/bootstrap.min.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css"
	href="../../../resources/css/adminheaderfooter.css">

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
   
<script>
	$(function(){
		var formObj = $("form");
		
		$('button').on("click", function(e){
			e.preventDefault();
			
			var operation = $(this).data("oper");
			
			console.log(operation);
			
			if(operation === 'close'){
				self.location = "/admin/adminLeaderInfo?leaId=<c:out value="${ leader.leaId }"/>";
				return;
			}
			
			var pwd = document.leaderModify.leaPassword; 
			var pwd2 = document.leaderModify.leaPassword2; 
				
			if (pwd.value != pwd2.value){
				alert('비밀번호가 일치하지 않습니다.');
				return;
			} else if (pwd.value == ""){
				alert('비밀번호를 입력해주세요.')
				return;
			}
			
			var str = "";
			 $('.img ul li').each(function(i, obj){	
				 var jobj = $(obj);	//첨부 파일 정보 hidden 태그로 추가
				 console.log('jobj : ' + obj);
				 str += "<input type='hidden' " +
				 		"       name='pictureList[" + i + "].fileName' " +
				 		"       value='" + jobj.data("filename") + "'>";

				 str += "<input type='hidden' " +
				 		"       name='pictureList[" + i + "].uuid' " +
				 		"       value='" + jobj.data("uuid") + "'>";

				 str += "<input type='hidden' " +
				 		"       name='pictureList[" + i + "].uploadPath' " +
				 		"       value='" + jobj.data("path") + "'>";

				 str += "<input type='hidden' " +
				 		"       name='pictureList[" + i + "].fileType' " +
				 		"       value='" + jobj.data("type") + "'>";
			 });//END 첨부 파일 정보 hidden 태그로 추가
			 formObj.append(str)
			
			alert('수정이 완료되었습니다.');
			formObj.submit();
		});
	});
</script>
<script>
function setEmail2(email3Obj){
	var email2 = document.leaderModify.leaEmail2;
	var email3 = email3Obj.value;
	
	if(email3 != 'direct'){	//직접 선택이 아닌 경우
		email2.value = email3;
	} else {//직접 선택인 경우
		email2.value = "";
		email2.focus();
	}
}
</script>

</head>
<body>
	<div id="wrap">
		<%@ include file="../common/adminheader.jsp" %>
		<div id="container">
			<%@ include file="../common/adminaside.jsp" %>
			<div class="inner">
				<div class="content">
					<div class="infoContent">
						<form role="form" name="leaderModify" action="/admin/adminLeaderModify" method="post">
							<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
							<div class="img"><ul></ul></div>
							<div class="info">사진수정</div>
							<div class="userInfo"><input type="file" name="leaImage"></div>
							<div class="info">아이디</div>
							<div class="userInfo"><c:out value="${ leader.leaId }"/></div>
							<div class="info">비밀번호 수정</div>
							<div class="userInfo">
								<input type="password" placeholder="비밀번호" name="leaPassword" class="joinInput1"><input type="password" placeholder="비밀번호 확인"
									name="leaPassword2" class="joinInput1"></div>
							<div class="info">이름</div>
							<div class="userInfo"><c:out value="${ leader.leaName }"/></div>
							<div class="info">성별</div>
							<div class="userInfo"><c:out value="${ leader.leaGender }"/></div>
							<div class="info">주소</div>
							<div class="userInfo"><input type="text" placeholder="주소" name="leaAddress" value="${ leader.leaAddress }"
									id="sample4_roadAddress" class="joinInput" readonly="readonly">
									<input type="button" onclick="sample4_execDaumPostcode()" value="주소찾기" class="btn"></div>
							<div class="info">연락처</div>
							<div class="userInfo"><input type="tel" placeholder="연락처(- 없이 입력해주세요)" name="leaPhonenum" value="${ leader.leaPhonenum }"
									class="joinInput"></div>
							<div class="info">이메일</div>
							<div class="userInfo"><input type="text" placeholder="이메일" name="leaEmail" value="${ leader.leaEmail }"
									class="joinInput2"><span class="joinText">@</span><input
									type="text" placeholder="이메일" name="leaEmail2" value="${leader.leaEmail2 }"
									class="joinInput2"> <select class="joinInput2"
									name="leaEmail3" onchange="setEmail2(this)">
									<option value="direct" selected>직접입력</option>
									<option value="naver.com">naver.com</option>
									<option value="daum.net">daum.net</option>
									<option value="gmail.com">gmail.com</option>
								</select></div>
							<div class="info">계좌번호</div>
							<div class="userInfo"><select name="leaBank" class="joinInput2">
									<option value="국민은행">국민은행</option>
									<option value="신한은행">신한은행</option>
									<option value="우리은행">우리은행</option>
									<option value="기업은행">기업은행</option>
								</select> <input type="text" placeholder="계좌번호" name="leaAccount" value="${ leader.leaAccount }"
									class="joinInput1"></div>
							<div class="info">자기소개</div>
							<div class="userInfo"><textarea class="joinInput3" name="leaIntroduce"><c:out value="${ leader.leaIntroduce }"/></textarea></div>
							<input type="hidden" name="leaId" value="${leader.leaId }">
							<input type="hidden" name="pageNum" value='<c:out value="${ cri.pageNum }"/>'>
							<input type="hidden" name="amount" value='<c:out value="${ cri.amount }"/>'>
							<input type="hidden" name="list" value='<c:out value="${list }"/>'>
							<button type="button" data-oper="modify" id="modBtn">확인</button><button type="button" data-oper="close" id="listBtn">취소</button>
						</form>
					</div>
				</div>
			</div>
		</div>
		<!-- container -->
		<%@ include file="../common/adminfooter.jsp" %>
	</div>
	<!-- wrap -->
	<script>
$(function(){
	//첨부파일 목록 가져오기
	(function(){	
		var leaId = '<c:out value="${leader.leaId}"/>';
		
		$.getJSON("/admin/getPictureList", {leaId:leaId}, function(arr){
			console.log(arr);	
			
			//첨부파일 목록
			if(!arr || arr.length == 0){
				return;
			}

			var img = $('.img ul');
			var str = "";
			$(arr).each(function(i, obj){
				//업로드 파일명 <li>추가
				if(obj.fileType){	//이미지인 경우
					var fileCallPath = encodeURIComponent(obj.uploadPath + 
													      "/s_" + obj.uuid  + "_" +
													      obj.fileName);

					str += "<li data-path='" + obj.uploadPath + "' " 			+
					   "data-uuid='" + obj.uuid + "' " 					+
					   "data-filename='" + obj.fileName + "'" 			+
					   "data-type='" + obj.fileType + "'>" 				+ 
					   "<div>"			+
				       "    <button type='button' " 					+ 
				       "            data-file='" + fileCallPath + "'" 	+
				       "            data-type='image'" 					+
				       "        class='btn btn-warning btn-circle'>" 	+
				       "        <i class='fa fa-times'></i></button><br>" +
				       "    <img src='/display?fileName="+ fileCallPath + "'>" +
				       "    </div></li>";
			} else {		//이미지가 아닌 경우
				var fileCallPath 
				= encodeURIComponent(obj.uploadPath + 
									 "/" + obj.uuid  + "_" +
									 obj.fileName);
				var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");			
				str += "<li data-path='" + obj.uploadPath + "' " 	+
					   "    data-uuid='" + obj.uuid + "' " 			+
					   "    data-filename='" + obj.fileName + "'" 	+
					   "    data-type='" + obj.fileType + "'>" 		+ 
					   "    <div>"	    +  
				       "    <button type='button' " 					+ 
				       "            data-file='" + fileCallPath + "'" 	+
				       "            data-type='image'" 					+
				       "        class='btn btn-warning btn-circle'>" 	+
				       "        <i class='fa fa-times'></i></button><br>" +
					   "    <img src='/resources/img/attach.png'></div></li>";
				}
			});
			img.append(str);
		});//END getJSON()
	})();//END 첨부파일 목록 가져오기
	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");	//확장자 제한 정규표현식
	var maxSize = 5242880;	//파일 최대 업로드 크기 제한 5MB
	
	//CSRF 처리
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	
	//확장자 및 파일 크기 확인 함수
	function checkExension(fileName, fileSize){
		if(fileSize >= maxSize) {	//파일 크기 확인
			alert("파일 사이즈 초과!");	//크기를 초과하면 알림 메시지 출력
			return false;
		}
		if(regex.test(fileName)) {	//확장자 확인
			alert("업로드 불가 파일");	//제한 확장자인 경우 알림 메시지 출력
			return false
		}
		return true;	//파일 크기 및 확장자 문제가 없는 경우
	}//END checkExension()
	
	//첨부파일 상태 변화 이벤트 핸들러 등록
	$("input[type='file']").change(function(e){
		var formData = new FormData();	//가상의 <form> 태그
		
		var inputFile = $("input[name='leaImage']");
		var files = inputFile[0].files;
		console.log(files);
		
		//formData 객체에 선택한 파일 추가
		for(var i=0 ; i<files.length ; i++){
			//확장자 및 파일 크기 확인
			if(!checkExension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			type : 'post',
			url :'/uploadAjaxAction',
			data : formData,
			dataType : 'json',
			contentType : false,
			processData : false,
			beforeSend  : function(xhr){
				xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			},
			success : function(result){
				console.log(result);	//콘솔로 결과 확인
				
				showUploadResult(result); //
				
				//복사해 둔 div를 이용하여 업로드 영역 초기화
				//$('.uploadDiv').html(cloneObj.html());
			}
		})//END .ajax()
	});//END uploadBtn 이벤트 처리 
	
	//업로드 결과 출력 처리
	function showUploadResult(uploadResultArr){
		if(!uploadResultArr || uploadResultArr.length == 0){
			return;
		}

		var uploadUL = $('.img ul');
		var str = "";
		$(uploadResultArr).each(function(i, obj){
			//업로드 파일명 <li>추가
			if(obj.image){	//이미지인 경우
				var fileCallPath = encodeURIComponent(obj.uploadPath + 
												      "/s_" + obj.uuid  + "_" +
												      obj.fileName);

				str += "<li data-path='" + obj.uploadPath + "' " 			+
				   "data-uuid='" + obj.uuid + "' " 					+
				   "data-filename='" + obj.fileName + "'" 			+
				   "data-type='" + obj.image + "'>" 				+ 
				   "<div>"			+
			       "    <button type='button' " 					+ 
			       "            data-file='" + fileCallPath + "'" 	+
			       "            data-type='image'" 					+
			       "        class='btn btn-warning btn-circle'>" 	+
			       "        <i class='fa fa-times'></i></button><br>" +
			       "    <img src='/display?fileName="+ fileCallPath + "'>" +
			       "    </div></li>";
		} else {		//이미지가 아닌 경우
			var fileCallPath 
			= encodeURIComponent(obj.uploadPath + 
								 "/" + obj.uuid  + "_" +
								 obj.fileName);
			var fileLink = fileCallPath.replace(new RegExp(/\\/g), "/");			
			str += "<li data-path='" + obj.uploadPath + "' " 	+
				   "    data-uuid='" + obj.uuid + "' " 			+
				   "    data-filename='" + obj.fileName + "'" 	+
				   "    data-type='" + obj.image + "'>" 		+ 
				   "    <div>"	+  
			       "    <button type='button' " 					+ 
			       "            data-file='" + fileCallPath + "'" 	+
			       "            data-type='file'" 					+
			       "        class='btn btn-warning btn-circle'>" 	+
		       	   "        <i class='fa fa-times'></i></button><br>" +
				   "    <img src='/resources/img/attach.png'></div></li>";
		}
		});
		uploadUL.html(str);
	}//END showUploadResult()
});

</script>
</body>
</html>