package com.projectImp.controller;

import com.projectImp.domain.MemberDTO;
import com.projectImp.service.MemberService;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/member")
@Controller
public class MemberController {

    private final MemberService memberService;

    public MemberController(MemberService memberService) {
        this.memberService = memberService;
    }

    @RequestMapping("/login-page")
    public String tryLogin(Authentication authentication) {
        if (authentication == null) { return "login-page"; }
        else { return "redirect:/"; }
    }

    @PostMapping("/signup")
    public String doSignUp(MemberDTO memberDTO) {
        memberService.registMember(memberDTO);
        return "redirect:/";
    }

    @PostMapping("/login-fail")
    @ResponseBody
    public Map<String, Object> failLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> loginObj = new HashMap<>();
        loginObj.put("loginStatus", request.getAttribute("loginStatus"));
        loginObj.put("loginFailMsg", request.getAttribute("loginFailMsg"));
        return loginObj;
    }

    @PostMapping("/login-success")
    @ResponseBody
    public Map<String, Object> successLogin(Model model, HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> loginObj = new HashMap<>();
        loginObj.put("loginStatus", request.getAttribute("loginStatus"));
        return loginObj;
    }


}
