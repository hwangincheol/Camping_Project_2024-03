package com.camping.security;

import java.io.IOException;
import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.web.DefaultRedirectStrategy;
import org.springframework.security.web.RedirectStrategy;
import org.springframework.security.web.WebAttributes;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.savedrequest.HttpSessionRequestCache;
import org.springframework.security.web.savedrequest.RequestCache;
import org.springframework.security.web.savedrequest.SavedRequest;
import org.springframework.stereotype.Component;

import lombok.Data;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

@Primary
@Component
@Data
@Log4j2
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler { //로그인 한 사용자에게 부여되는 권한 객체를 이용해 사용자가 가진 모든 권한을 문자열로 체크
//로그인 성공 후 동작할 클래스
	
	private String username; //input 태그의 아이디
	private String defaultUrl; //로그인 성공 시 기본 경로
	
	//referer 헤더 값을 사용하지 않기 위해 지정된 화면으로 이동하게 만들어줄 것
	private RequestCache requestCache = new HttpSessionRequestCache();
//	private RedirectStrategy redirectStrategy = new DefaultRedirectStrategy();
	
	//로그인 성공 시 실패 카운터 초기화
	//로그인 실패 시 실패 카운터 증가시킴(customLoginFailureHandler)
	//실패 카운터가 증가된 상태로 로그인 성공 시 다음 번 로그인에는 더 적은 실패 기회를 얻게 됨
	//따라서 로그인 시도마다 같은 횟수를 주기 위해 실패 카운터 초기화 필요
	@Setter(onMethod_ = @Autowired)
	private CustomUserDetailsService service;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth)
			throws IOException, ServletException {
		
		username = request.getParameter("username"); //input 태그의 입력값 가져와 userName에 넣음
		//로그인 실패 카운터 초기화
		service.resetFailureCnt(username);
		
		log.info("username 값: " + username);

		List<String> roleNames = new ArrayList<>(); //String 타입의 roleNames에 ArrayList<> 객체를 생성해 List 배열에 담음

		auth.getAuthorities().forEach(authority -> { //auth의 getAuthorities()를 반복 출력 시킴 -> 배열 객체에 반복되는 authority를 각각 추가함

			roleNames.add(authority.getAuthority());

		});

		log.warn("ROLE NAMES: " + roleNames);

		if (roleNames.contains("ROLE_ADMIN")) { //ROLE_ADMIN 권한을 가졌으면 로그인 후 바로 /sample/admin으로 이동

			response.sendRedirect("/sample/admin");
			return;
		}

		if (roleNames.contains("ROLE_MEMBER")) { //ROLE_ADMIN 권한을 가졌으면 로그인 후 바로 /sample/member로 이동

			response.sendRedirect("/sample/member");
			return;
		}
		
		request.setAttribute("chk", "success");
		response.sendRedirect("/");
		
//		resultRedirectStrategy(request, response, auth);
		
		//로그인 실패 에러 세션 지우기
		clearAuthenticationAttributes(request);
	}

	protected void clearAuthenticationAttributes(HttpServletRequest request) { //로그인 실패 에러 세션 지우기(로그인 실패 후 로그인에 성공할 시 에러 세션을 지움)

		HttpSession session = request.getSession(false); //세션 받아옴
		
		if(session == null) return; //세션에 에러가 없다면 그냥 리턴
		
		session.removeAttribute(WebAttributes.AUTHENTICATION_EXCEPTION); //WebAttributes.AUTHENTICATION_EXCEPTION 이름 값으로 정의된 세션 지움
		//WebAttributes.AUTHENTICATION_EXCEPTION(속성 키): 인증 예외를 HTTP Servlet 요청의 속성으로 저장하기 위해 사용,
		//인증 예외가 발생했을 때, Spring Security는 해당 예외를 HttpServletRequest의 속성으로 저장하여 나중에 사용자에게 적절한 에러 메시지를 표시하거나 로깅할 수 있음
		
	}

//	protected void resultRedirectStrategy(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException {
//
//		SavedRequest savedRequest = requestCache.getRequest(request, response);
//		
//		List<String> roleNames = new ArrayList<>(); //String 타입의 roleNames에 ArrayList<> 객체를 생성해 List 배열에 담음
//
//		auth.getAuthorities().forEach(authority -> { //auth의 getAuthorities()를 반복 출력 시킴 -> 배열 객체에 반복되는 authority를 각각 추가함
//
//			roleNames.add(authority.getAuthority());
//
//		});
//		log.info("이건 찍히나?");
//		
//		if(savedRequest != null) {
//			log.info("로그인 성공 메서드 - 이전페이지 확인######%%%%%%%%******");
//			String targetUrl = savedRequest.getRedirectUrl();  //savedRequest로 getRedirectUrl(로그인화면을 보기 전에 갔던 url)을 가져옴
//			redirectStrategy.sendRedirect(request, response, targetUrl); //화면 이동을 위해 redirectStrategy의 sendRedirect 재정의
//			
//		} else if(roleNames.contains("ROLE_ADMIN")){ //직접 로그인 화면으로 이동한 경우
//			log.info("로그인 성공 메서드 - /sample/admin 확인######%%%%%%%%******");
//			request.setAttribute("chk", "success");
//			redirectStrategy.sendRedirect(request, response, "/sample/admin"); //화면 이동을 위해 redirectStrategy의 sendRedirect 재정의
//			
//		} else if(roleNames.contains("ROLE_MEMBER")) {
//			log.info("로그인 성공 메서드 - /sample/member 확인######%%%%%%%%******");
//			request.setAttribute("chk", "success");
//			redirectStrategy.sendRedirect(request, response, "/sample/member");
//		} else {
//			log.info("로그인 성공 메서드 - /sample/all 확인######%%%%%%%%******");
//			request.setAttribute("chk", "success");
//			redirectStrategy.sendRedirect(request, response, "/sample/all");
//		}
//		
//		
//		
//	}
}


