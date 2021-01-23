package com.projectImp.controller;

import com.projectImp.service.MemberService;
import lombok.extern.log4j.Log4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.Map;

@Log4j
@RequestMapping("/")
@Controller
public class MainController {

    private final MemberService memberService;

    public MainController(MemberService memberService) {
        this.memberService = memberService;
    }

    @GetMapping("/")
    public String goIndex(){
        return "index";
    }

    @GetMapping("/login-page")
    public String goLoginPage(){
        return "login-page";
    }

    @GetMapping("/regist-photo")
    public String registPhoto(){
        return "regist-photo";
    }

    @PostMapping("/idCheck")
    @ResponseBody
    public Map<String, Object> idCheck(@RequestBody String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("cnt", memberService.idCheckTest(userId));
        return map;
    }

}
