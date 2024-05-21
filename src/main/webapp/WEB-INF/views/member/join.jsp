<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="../includes/header.jsp"%>
<br>
<br>
<br>


<!-- ======= My & Family Section ======= -->
<section id="about" class="about">
	<div class="section">
	<div class="container">
    	<form id="joinForm" name="joinForm" action="/member/join" method="post">
	      <div class="title"><span class="yogi">회원가입</span></div>
	      <div class="card-3d-wrap mx-auto">
							<div class="card-3d-wrapper">
								<div class="card-front">
									<div class="center-wrap">
										<div class="section text-center">
	        <div class="form-groups" id="info__id">
	        	<div class="error-msg emsg yogi yo"></div>
			    <div id="id-input">
			        <input class="form-styles yogi yo" name="mem_id" id="mem_id" type="text" placeholder="아이디(6~20)"/>
			        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			    </div>
			    <button type="button" name="chkId" id="chkId"
			    class="btn-chk btn-block yogi yo">중복 확인</button>
			    <input type="hidden" name="idUncheck" value="" />
			    <div id="id_error_msg yogi yo"></div>
			</div>
	        <div class="form-groups" id="info__pw">
	          <input class="form-styles yogi yo" name="mem_pw" id="mem_pw" type="password" placeholder="비밀번호(8~20)"/>
	          <div class="error-msg emsg yogi yo"></div>
	        </div>
	        <div class="form-groups" id="info__pwRe">
	          <input class="form-styles yogi yo" name="reMem_pw" id="reMem_pw" type="password" placeholder="비밀번호 확인"/>
	          <div class="error-msg emsg yogi yo"></div>
	        </div>
	        <div class="form-groups" id="info__name">
	          <input class="form-styles yogi yo" name="mem_name" id="mem_name" type="text" placeholder="이름(숫자 사용 불가능)"/>
	          <div class="error-msg emsg yogi yo"></div>
	        </div>
	        <div class="form-groups" id="info__email">
	          <input type="hidden" name="email" id="totalemail" value="" />
	          <input type="text" name="mem_email" id="mem_email" class="form-styles yogi yo" required placeholder="이메일"/>
	          <span id="middle">@</span>
	          <input type="text" value="" id="email_address" class="form-styles yogi yo" list="user_email_address" placeholder="직접 입력">
	          <datalist id="user_email_address">
	            <option value="naver.com" id="naver.com">naver.com</option>
	            <option value="gmail.com" id="gmail.com">gmail.com</option>
	            <option value="daum.com" id="daum.com">daum.com</option>
	            <option value="nate.com" id="nate.com">nate.com</option>
	            <option value="directly" id="textEmail">직접 입력</option>
	          </datalist>
	          
	        </div>
	        <div class="form-groups" id="info__mobile">
	          <input class="form-styles yogi yo" name="mem_tel" onclick="addhyphen()" id="mem_tel" type="text" placeholder="전화번호"/>
	          <div class="error-msg emsg yogi yo"></div>
	        </div>
	      <div id="result-fail"></div>
	      <button name="btn-join" id="submitBtn" class="btn-lg btn-login yogi" type="button">완료</button>
    	</div>
    	</div>
    	</div>
    	</div>
    	</div>
    	</form>
  </div>
 </div>

<script>
$(".btn-chk").click(function(){

$("input[name=idUncheck]").val('y');
});	
</script>

<script>
	
$(document).ready(function() {
	let csrfHeaderName = "${_csrf.headerName}"; //"X-CSRF-TOKEN"
	let csrfTokenValue = "${_csrf.token}";
	let alertCheckId = false; // 기본값 false 부여
 	//아이디 중복 체크
    $("#chkId").click(function() {
    	
    	$("#submitBtn").attr("type", "button");
    	if($("input[name='btn-join']").val()==''){
            alert('아이디중복 확인을 해주세요.');
            $("input[name='btn-join']").eq(0).focus();
            return false;
       	}
    	
        const mem_id = $("#mem_id").val();
        console.log('mem_id :',mem_id); 

        if (mem_id == '' || mem_id.length == 0) {
            $("#id_error_msg").css("color", "red").text("공백은 ID로 사용할 수 없습니다.");
            return false;
        }

        // Ajax로 전송
        $.ajax({
            url: '/member/idCheck',
            type: 'GET',
            async: true,
            data: {mem_id:mem_id},
            dataType: 'text',
		            beforeSend: function(xhr){   // 헤더에 csrf 값 추가
						xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
					},
            success: function(result) {
            	console.log('AJAX request success. Result:', result);
                if (result == "1") {
                	console.log(result);
                	alert("이미 사용중인 ID 입니다.");
                	$("#id_error_msg").text("이미 사용중인 ID 입니다.");
        			$("#id_error_msg").addClass("id_error_msgf");
        			$("#id_error_msg").removeClass("id_error_msgt");
                	alertCheckId = false;
                } else {
                	console.log(result);
                	alert("사용 가능한 ID 입니다.");
                	$("#id_error_msg").text("사용 가능한 ID 입니다.");
        			$("#id_error_msg").addClass("id_error_msgt");
        			$("#id_error_msg").removeClass("olmessagef");
                    $("#submitBtn").attr("type", "button");
                	alertCheckId = true;
                }
            },
            error: function(xhr, status, error) {
                // 서버 요청 실패 시 실행할 코드
                alertCheckId = false;
                alert("오류 코드 발생");
                console.error('AJAX request failed:', error);
            }
        }); // End Ajax
    });

	//email
	$("#mem_email").blur(function() {
		email();
	});
	
	$("#email_address").change(function(){
		email();
	});
	
	function email() { //사용자가 input에 입력한 세 개의 값을 가져오되 사용자 이메일 주소의 아이디와 도메인 주소는 val() 메서드를 사용
		const email = $("#mem_email").val();
		const middle = $("#middle").text(); //@: html로 입력했으므로 html() 혹은 text()로 가져옴
		const address = $("#email_address").val();
		if(email != "" && address != "") {
			$("#totalemail").val(email + middle + address);
		}	
	};
	
	/*** SECTION - 이름 ***/
	const nameInputEl = document.querySelector('#info__name input');
	const nameErrorMsgEl = document.querySelector('#info__name .error-msg');
	
	nameInputEl.addEventListener('change', () => {
	    const nameRegExp = /^[a-zA-Z가-힣\s]{2,}$/;
	    if (nameRegExp.test(nameInputEl.value)) { //정규식 조건 만족
	        nameErrorMsgEl.textContent = "";
	    } else {
	        nameErrorMsgEl.style.color = "red";
	        nameErrorMsgEl.textContent = "이름은 숫자와 특수문자 사용이 불가능합니다.";
	    }
	    console.log(account);
	});
	
	/*** SECTION - ID ***/
	const idInputEl = document.querySelector('#info__id input');
	const idErrorMsgEl = document.querySelector('#info__id .error-msg');
	const idCheckBtn = document.querySelector('#id-check');
	var account = {};
	var errMsg = {
					id: {
				    invalid: "올바른 형식의 아이디를 입력하세요."
				  },
				  pwRe: {
				    success: "비밀번호가 일치합니다.",
				    fail: "비밀번호가 일치하지 않습니다."
				  },
				  pw: "영문, 숫자, 특수문자를 포함하여 8자 이상 20자 이하로만 사용 가능합니다."
	};
	
	idInputEl.addEventListener('change', () => {
	  const idRegExp = /^[a-zA-Z0-9]{6,20}$/;
	  if(idRegExp.test(idInputEl.value)) { // 정규식 조건 만족
	    idErrorMsgEl.textContent = "";
	    account.id = idInputEl.value;
	  } else { // 정규식 조건 만족 X
	    idErrorMsgEl.style.color = "red";
	    idErrorMsgEl.textContent = errMsg.id.invalid;
	    account.id = null;
	  }
	  console.log(account);
	});
	
	/*** SECTION - PASSWORD ***/
	//pwVal: 패스워드, pwReVal: 패스워드 재입력, isPwValid: 패스워드 유효 여부
	let pwVal = "", pwReVal = "", isPwValid = false
	//비밀번호와 재입력 값 일치 여부
	function checkPwValid() {
		var account = {};
		var errMsg = {
			id: {
		    invalid: "아이디 입력은 필수 입니다."
		  },
		  pwRe: {
		    success: "비밀번호가 일치합니다.",
		    fail: "비밀번호가 일치하지 않습니다."
		  },
		  pw: "영문, 숫자, 특수문자를 포함하여 8자 이상 20자 이하로만 사용 가능합니다."};
		var success = {};
		var fail = {};
	if(pwReVal === "") { // 미입력
	 pwReErrorMsgEl.textContent = ""
	} else if(pwVal === pwReVal) { // 비밀번호 재입력 일치
	   if(isPwValid)
	    account.pw = pwVal
	    pwReErrorMsgEl.style.color = "green"
	    pwReErrorMsgEl.textContent = errMsg.pwRe.success
	}
	else { // 비밀번호 재입력 불일치
	 pwReErrorMsgEl.style.color = "red"
	 pwReErrorMsgEl.textContent = errMsg.pwRe.fail
	}
	}
	
	const pwInputEl = document.querySelector('#info__pw input')
	const pwErrorMsgEl = document.querySelector('#info__pw .error-msg')
	pwInputEl.addEventListener('change', () => {
	const pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/
	pwVal = pwInputEl.value
	if(pwRegExp.test(pwVal)) { // 유효성 검사 성공
	 isPwValid = true
	 pwErrorMsgEl.textContent = ""
	} 
	else { // 유효성 검사 실패
	 isPwValid = false
	 pwErrorMsgEl.textContent = errMsg.pw
	}
	checkPwValid()
	console.log(pwVal, pwReVal, isPwValid, account)
	});
	
	/*** SECTION - PASSWORD RECHECK ***/
	const pwReInputEl = document.querySelector('#info__pwRe input')
	const pwReErrorMsgEl = document.querySelector('#info__pwRe .error-msg')
	pwReInputEl.addEventListener('change', () => {
		pwReVal = pwReInputEl.value
		checkPwValid()
		console.log(pwVal, pwReVal, isPwValid, account);
	});
	
	/*** 전송 버튼 클릭 시 alert창 띄우기 ***/
	$("#submitBtn").on("click", function(e){
		//이름 유효성 검사
		const nameRegExp = /^[a-zA-Z가-힣\s]{2,}$/; // Allow alphabets, spaces, and Korean characters
	    const nameInput = $("#info__name input").val().trim();
	    if (!nameRegExp.test(nameInput)) {
	        alert("올바른 형식으로 작성하세요.");
	        return false;
	    }
	    
		//id 유효성 검사	
		const idRegExp = /^[a-zA-Z0-9]{6,20}$/;
		if(!idRegExp.test(idInputEl.value)) {
			alert("영문자 또는 숫자로 6자 이상 20자 이하로만 사용 가능합니다.");
			return false;
		}
		
		// 비밀번호 유효성 검사
	    const pwRegExp = /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&*])[a-zA-Z0-9!@#$%^&*]{8,20}$/;
	    if (!pwRegExp.test(pwVal)) {
	        alert("영문, 숫자, 특수문자를 포함하여 8자 이상 20자 이하로만 사용 가능합니다.");
	        return;
	    }
		
	 	// 비밀번호 재입력 일치 여부 확인
	    if (pwVal !== pwReVal) {
	        alert("비밀번호가 일치하지 않습니다.");
	        return;
	    }
	 	
    	if($("input[name='idUncheck']").val()==''){
            alert('아이디중복 확인을 해주세요.');
            $("input[name='idUncheck']").eq(0).focus();
           
            $(".btn-chk").click(function(){

            	$("input[name=idUncheck]").val('y');
            	});	
            return false;
       	} else {
       		var form = $("form[name='joinForm']"); // ID를 사용하여 폼 요소를 선택
    		form.submit();
       		return true;
       	}
	    
	    var form = $("form[name='joinForm']"); // ID를 사용하여 폼 요소를 선택
		form.submit();
	    
	});
});

</script>

	<script>
	$(document).on("focus", "#mem_tel", function () {
        addhyphen();
        
      //전화번호 자동 입력 함수 구현
		function addhyphen() {
		 		$(document).on("keyup", "#mem_tel", function () {
  				$(this).val( 
    				$(this).val().replace(/[^0-9]/g, "") // 숫자 이외의 문자 제거
                 	.replace(/(^02.{0}|^01.{1}|[0-9]{3})([0-9]+)([0-9]{4})/,"$1-$2-$3") // 전화번호에 하이픈 추가
                	.replace("--", "-") // 중복된 하이픈 제거
  				);
			});
    });
			
}
			
			/* //인증문자
			function authnum(){
				var inputed=$("#jointel").val();
				$.ajax({
					data: {
						jointel : inputed
					},
					url : "sendMessage",
					success : function(){
						$(".authbtn").prop("disabled",true);
				        $(".authbtn").css("display", "none");
				        $(".successMessage").css("display", "block");
					}
				});
			} */
			
			//회원가입 조건 확인
			function activateSignupbtn() {
			   
			   if( idCheck == 1 && pwdCheck == 1  && nameCheck == 1  && pwCheck == 1 && authCheck ==1) {
			      $(".signupbtn").prop("disabled", false);   
			      $(".signupbtn").css("background-color", "#B0F6AC");
			   }
			   else  {
			      $(".signupbtn").css("background-color", "#aaaaaa");
			      $(".signupbtn").prop("disabled", true);
			   }
			}
	</script>
</section>

<%@include file="../includes/footer.jsp"%>