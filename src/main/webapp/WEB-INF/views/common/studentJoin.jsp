<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width,user-scalable=no,initial-scale=1.0,maximum-scale=1.0, minimum-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <title>Final Project</title>
   <!-- CSS -->
   <link href="https://fonts.googleapis.com/css?family=Noto+Sans+KR&display=swap" rel="stylesheet">
   <script src="../../../resources/lib/jquery/jquery-3.4.1.min.js"></script>
   <link rel="stylesheet" type="text/css" href="../../../resources/css/common.css">
   <link rel="stylesheet" type="text/css" href="../../../resources/css/main3.css">
   <link href="https://fonts.googleapis.com/css?family=Roboto:400,500,700" rel="stylesheet">

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
         	<div class="loginform">
               <h1><b>학생 회원가입</b></h1>
               <form>
                  <div class="joinInput">
                  <input class="joinInputText" type="text" placeholder="아이디">
                  <button class="Btn"> 중복체크</button><br>
                  <input class="joinInputText" type="password" placeholder="비밀번호"><br>
                  <input class="joinInputText" type="password" placeholder="비밀번호 확인">
                  <button  class="Btn"> 비밀번호 확인</button><br>
                  <input class="joinInputText" type="text" placeholder="이름"><br>
                 </div>
                 <div class="radiogender">
                 	<label><input class="radiogenderRadio" type="radio" name="gender" value="m" >남</label> 
               	  	<label><input class="radiogenderRadio" type="radio" name="gender" value="f">여</label>
                 </div> 
                  
                 <div class="joinInput2">
                   <input class="joinInputText2" type="text" placeholder="주소"> <input class="joinInputText2" type="text" placeholder="주소"> <button  class="Btn2">주소찾기</button><br>
                 <input class="joinInputText2" type="tel" placeholder="연락처">-<input class="joinInputText2" type="tel" placeholder="연락처">-<input class="joinInputText2" type="tel" placeholder="연락처"><br>
                 <input class="joinInputText2" type="email" placeholder="이메일">@<input class="joinInputText2" type="tel" placeholder="이메일"><select><option>직접입력</option><option>naver.com</option><option>daum.net</option><option>gmail.com</option></select><br>
                 </div>
                  <button class = "joinBtn" >가입하기</button>
                  </form> 
            </div>
            
         </div>
      </div><!-- container -->
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
</body>
</html>