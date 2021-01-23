package com.projectImp.service;

import org.springframework.security.authentication.*;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.security.web.authentication.session.SessionAuthenticationException;
import org.springframework.stereotype.Service;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@Service
public class LoginFailHandler implements AuthenticationFailureHandler {

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {
        if (exception instanceof AuthenticationServiceException) { request.setAttribute("loginFailMsg", "존재하지 않는 사용자입니다"); }
        else if (exception instanceof BadCredentialsException) { request.setAttribute("loginFailMsg", "아이디 또는 비밀번호가 틀립니다"); }
        else if (exception instanceof SessionAuthenticationException) request.setAttribute("loginFailMsg", "이미 로그인 된 상태입니다");
        request.setAttribute("loginStatus", false);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/member/login-fail");
        dispatcher.forward(request, response);
    }

}
