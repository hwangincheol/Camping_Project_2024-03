package com.camping.security;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.aspectj.bridge.MessageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.CredentialsExpiredException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.CredentialsContainer;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Data //getter/setter: 이거 없으면 <bean> 등록 시 <property> 태그에 오류 발생함
@Log4j2
public class CustomLoginFailureHandler implements AuthenticationFailureHandler{ //로그인 실패 시 동작하는 클래스
	//파라미터 설정
	private String username; //입력 받은 로그인 아이디가 저장된 파라미터 이름
	private String password; //입력 받은 로그인 비밀번호가 저장된 파라미터 이름
	private String errorMsgName; //로그인 페이지에서 jstl로 에러메시지 가져올 때 사용할 변수
	private String defaultFailureUrl; //로그인 실패 시 보여줄 화면의 url
	
	@Setter(onMethod_ = @Autowired)
	private CustomUserDetailsService service;
	
	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
	//HttpServletRequest: 웹에서 넘어온 Request 값을 가진 객체
	//HttpServletResponse: 출력을 정의할 수 있는 객체
	//AuthenticationException: 로그인 실패 정보를 가진 객체
		
		//로그인 실패 시 입력한 로그인 정보 띄우기
		String userName = request.getParameter(username); //input 태그의 아이디와 비번을 getParameter()로 가져옴
		String pwd = request.getParameter(password);
		
		//세션을 이용하지 않고 에러 메시지 보여주기
		String errormsg = null; //에러 메시지를 담을 변수
		
		ResourceBundle bundle = ResourceBundle.getBundle("security_message", Locale.KOREAN);
		
		
		//AuthenticationException에서 오는 예외 타입을 체크해 알맞은 에러 메시지 변수를 담음(properties 사용)
		//아이디와 비번 둘 다 틀리게 작성하면 정상적으로 동작함, 근데 아이디만 맞을 때 예외처리가 안 먹힘
		if(exception instanceof BadCredentialsException) {
//			loginFailureCount(userName, request, response); //비밀번호 틀렸을 경우 실패 카운터와 관련된 메서드 실행
			errormsg = bundle.getString("error.BadCredentials");
			log.info("에러 메시지!!!!!!!!1" + errormsg);
			
		} else if(exception instanceof InternalAuthenticationServiceException) {
			errormsg = bundle.getString("error.BadCredentials");
			log.info("에러 메시지!!!!!!!!1" + errormsg);
			
		} else if(exception instanceof DisabledException) {
			errormsg = bundle.getString("error.Disable");
			log.info("에러 메시지!!!!!!!!1" + errormsg);
			
		} else if(exception instanceof CredentialsExpiredException) {
			errormsg = bundle.getString("error.CredentialsExpired");
			log.info("에러 메시지!!!!!!!!1" + errormsg);
		}
		
		//로그인 실패 시 입력한 로그인 정보 띄우기
		request.setAttribute(username, userName); //input 태그의 name에서 가져온 아이디, 비번 정보를 HttpServletRequest에서 제공하는 메서드로 셋팅
		request.setAttribute(password, pwd);
		
		//세션을 이용하지 않고 에러 메시지 보여주기 -> 웹에서 jstl 사용해서 보여줌
		request.setAttribute("errorMsgName", errormsg);
		//defaultFailureUrl: 로그인 실패 시 이동할 페이지
		request.getRequestDispatcher(defaultFailureUrl).forward(request, response); //HttpServletRequest의 getRequestDispathcer 메서드로 보여줄 화면으로 foward 해줌
	}

//	protected void loginFailureCount(String username, HttpServletRequest request, HttpServletResponse resp) throws IOException { //실패 카운터 메서드
//		service.countFailure(username); //실패 카운터 증가
//		
//		int cnt = service.checkFailureCount(username); //실패 횟수
//		
//		if(cnt == 3) { //실패 횟수가 3회일 때 계정 잠금 처리
//			service.disabledUserName(username); 
//			request.setAttribute("failureCnt", "3회 초과");
//		}
//		
//	}
	
}
