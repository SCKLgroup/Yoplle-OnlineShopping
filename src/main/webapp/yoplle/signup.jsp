<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%@ taglib prefix="functions" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<head>
    <title>요리 플러스 레시피 | 요플레</title>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="css/form-basic.css">

</head>

<body>
<jsp:include page="header.jsp" />   

	<div class="main-content">

		<form class="form-basic signup" method="post" action="signup.do">

			<div class="form-title-row">
				<h1>Sign Up</h1>
			</div>

			<div class="rqd">
				<span class="rqdchar">*</span> 필수 사항
			</div>
			<div class="form-row">
				<label> <span class="title">아이디 <span class="rqdchar">*</span> </span> 
				<input type="text" name="user_id" id="user_id" placeholder="6~20자의 영문 소문자와 숫자 조합">
					<button class="btn-css" type="button" id="duplCheck">중복확인</button>
				</label>
				<div class="validCheck" id="validId"></div>
			</div>

			<div class="form-row">
				<label> <span class="title">비밀번호 <span class="rqdchar">*</span></span> 
					<input type="password" name="user_pw" id="user_pw" placeholder="4~20자의 영문 소문자와 숫자 조합">
				</label>
				<div class="validCheck" id="validPw"></div>
			</div>

			<div class="form-row">
				<label> <span class="title">비밀번호 확인 <span class="rqdchar">*</span></span> 
					<input type="password" id="pwCheck">
				</label>
				<div class="validCheck" id="validPwCheck"></div>
			</div>

			<div class="form-row">
				<label> <span class="title">이름 <span class="rqdchar">*</span></span> 
					<input type="text" name="user_name" id="user_name">
				</label>
				<div class="validCheck" id="validName"></div>
			</div>

			<div class="form-row">
				<label> <span class="title">핸드폰 번호 <span class="rqdchar">*</span></span> 
					<input type="tel" name="user_tel" id="user_tel" placeholder="010-0000-0000">
				</label>
				<div class="validCheck" id="validTel"></div>
			</div>
			
			<div class="form-row">
				<label class="email"> 
				<span class="title">이메일 <span class="rqdchar">*</span></span> 
					<input type="email" name="user_mail" id="user_mail"  placeholder="yoplle@market.com">
				</label>
				<div class="validCheck" id="validMail"></div>
			</div>

			<div class="form-row">
				<label> <span class="title">우편번호 <span class="rqdchar">*</span></span> 
					<input type="text" name="user_postcode" id="user_postcode">
					<button class="btn-css" type="button" id="addrsearch">주소검색</button>
				</label> 
				<div class="validCheck" id="validPost"></div>
				<label> 
					<span class="title">주소 <span class="rqdchar">*</span></span> 
						<input type="text" name="addr" id="addr">
						<input type="text" name="user_address" id="user_address" hidden="hidden"> 
				</label> 
				<div class="validCheck" id="validAddr"></div>
				<label> 
					<span class="title">상세주소</span> <input type="text" name="addrDetail" id="addrDetail">
				</label>
			</div>


			<div class="form-row">
				<label> <span class="title">생년월일 <span class="rqdchar">*</span></span> 
					<input type="date" name="user_birth" id="user_birth">
				</label>
				<div class="validCheck" id="validBirth"></div>
			</div>

			<div class="form-row">
				<span class="titlegen">성별 <span class="rqdchar">*</span></span> 
				<div class="form-radio">
					<input type="radio" name="user_gender" id="male" checked="checked" value="남자">
					<label for="male">남자</label>
				</div>
				<div class="form-radio">
					<input type="radio" name="user_gender" id="female" value="여자">
					<label for="female">여자</label>
				</div>
			</div>


			<div class="form-submit">
				<button type="submit" class="btn-submit" id="join">가입하기</button>
			</div>

		</form>

	</div>
	<jsp:include page="footer.jsp" />
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	
	<script type="text/javascript">
		$(function() {
			$("button#addrsearch").click(function(){ //다음 오픈api(주소) 열기
				adrr();
			});
			
			$("input#user_postcode").click(function(){ //다음 오픈api(주소) 열기
				adrr();
			});
			
			function adrr(){ //다음 오픈api(주소)
			    new daum.Postcode({
			        oncomplete: function(data) { //선택시 입력값 세팅
			            document.getElementById("user_postcode").value = data.zonecode; // 우편번호 넣기
			            document.getElementById("addr").value = data.address; //주소 넣기
			            document.querySelector("input[name=addrDetail]").focus(); //상세입력 포커싱
			        }
			    }).open();
			}

			$("button#join").click(function(){ //회원 가입 버튼 클릭 시
				if($("input#user_id").val()=="" || $("input#user_pw").val()=="" ||$("input#pwCheck").val()=="" ||
						$("input#user_name").val()=="" ||$("input#user_tel").val()=="" ||$("input#user_mail").val()=="" ||
						$("input#user_postcode").val()=="" ||$("input#addr").val()=="" ||$("input#user_birth").val()==""){
					//회원 가입 필수 조건 작성 여부 확인 
					alert('필수사항을 확인해주세요');
					return false;
				}
				if(dup==0){ //아이디 중복 체크 1회 이상 필수 
					alert('아이디 중복 확인이 필요합니다');
					return false;
				}
				$("input#user_address").val($("input#addr").val()+','+$("input#addrDetail").val()); 
				$("form").submit();
			});
			
	
			
			var idval; //아이디 유효성 여부 체크
			$("input[name='user_id']").blur(function(){ //아이디 유효성 검사
				var idRegExp = /^[a-z0-9]{6,20}$/; //6~20자 영문소문자, 숫자 사용가능
				idval=0;
				if(!idRegExp.test($(this).val())){ //아이디가 유효하지 않을 때
					idval+=1;  
					$("div#validId").text("6~20자의 영문 소문자와 숫자만 가능합니다");
					$(this).val('');            
		            return false;
				}
				$("div#validId").text("");
		    });
			
			var dup;
			$("button#duplCheck").click(function(){ //중복 체크
				//var idRegExp = /^[a-z0-9]{6,20}$/;
				if(idval==0){
					dup+=1;
					$.ajax({
				          url:'/web/idCheck.do',
				          type:'post',
				          data: {"user_id":$("#user_id").val()},
				          dataType:'json',              
				          success:function(v){
				            if(v=="1"){ //중복 아이디 존재 
								$("div#validId").text("중복된 아이디가 존재합니다");
								$("input#user_id").val('');
								return false;
				            }else {
								$("div#validId").text("사용 가능한 아이디입니다");
				            }
				          },
				          error:function(e){
				             alert('error'+e);
				          }
				    });
				}
			});
		
			$("input[name='user_id']").click(function(){ //아이디 재입력시 중복체크 다시 0으로 리셋
				dup=0;
			});
			
			
			$("input#user_pw").blur(function(){ //비밀번호 유효성 검사
				var pwRegExp = /^[a-z0-9]{4,20}$/;
				if(!pwRegExp.test($(this).val())){
					$("div#validPw").text("4~20자의 영문 소문자와 숫자만 가능합니다");
					$(this).val('');          
		            return false;
				}
				if ($("input[name='user_id']").val() == $(this).val()) { 
					$("div#validPw").text("아이디와 비밀번호를 다르게 설정해주세요");
					$(this).val('');          
			        return false;
			    }
				$("div#validPw").text("");
			});
			
			$("input#pwCheck").blur(function(){ //비밀번호 확인 유효성 검사 
		        if($("input#user_pw").val()!=$("input#pwCheck").val()){
					$("div#validPwCheck").text("비밀번호가 일치하지 않습니다");
		        	$(this).val('');
		        	return false;
		       	}
				$("div#validPwCheck").text("");
		   	});
			
			$("input[name='user_tel']").blur(function(){ //핸드폰 번호 유효성 검사
				var telRegExp = /^01(?:0|1|[6-9])-(\d{3}|\d{4})-(\d{4})$/;
				if(!telRegExp.test($(this).val())){
					$("div#validTel").text("형식이 올바르지 않습니다 (010-1234-1234)");
					$(this).val('');            
		            return false;
				}
				$("div#validTel").text("");
		    });
			
			$("input[name='user_mail']").blur(function(){ //이메일 유효성 검사
				var mailRegExp = /^[A-Za-z0-9_]+[A-Za-z0-9]*[@]{1}[A-Za-z0-9]+[A-Za-z0-9]*[.]{1}[A-Za-z]{1,3}$/;
				if(!mailRegExp.test($(this).val())){
					$("div#validMail").text("이메일 형식이 올바르지 않습니다");
					$(this).val('');            
		            return false;
				}
				$("div#validMail").text("");
		    });
			
			$("input[name='user_birth']").blur(function(){ //생년월일 유효성 검사
				var date=new Date($(this).val())
				var today=new Date();
			
				var birthRegExp = /^\d{4}-(0[1-9]|1[012])-(0[1-9]|[12][0-9]|3[01])$/;
				if(!birthRegExp.test($(this).val())){
					$("div#validBirth").text("생년월일을 확인해주세요");
					$(this).val('');            
			        return false;
				}
				if(today<=date){
					$("div#validBirth").text("생년월일을 확인해주세요");
					$(this).val('');            
			        return false;
				}
				$("div#validBirth").text("");
			});
			
		});
	
	</script>
	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</body>


</html>
