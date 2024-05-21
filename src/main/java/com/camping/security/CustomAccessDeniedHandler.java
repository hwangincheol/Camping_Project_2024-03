package com.camping.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;
import lombok.extern.log4j.Log4j2;

@Log4j2
public class CustomAccessDeniedHandler implements AccessDeniedHandler {  //접근 제한 시 URI보다 더 다양한 처리 가능
	//접근 제한이 되었을 때 쿠키나 세션에 특정한 작업을 하거나 HttpServletResponse에 특정한 헤더 정보를 추가하는 등의 경우에 사용 권장

  @Override
  public void handle(HttpServletRequest request, 
      HttpServletResponse response, AccessDeniedException accessException)
      throws IOException, ServletException { //직접적으로 서블릿 API를 이용한 처리가 가능

    log.error("접근 제한 핸들러 실행");

    log.error("접근 제한 되었습니다. accessError로 보내드리죠.");

    response.sendRedirect("/member/accessError"); //접근 제한이 걸리는 경우 리다이렉트 함

  }

}
