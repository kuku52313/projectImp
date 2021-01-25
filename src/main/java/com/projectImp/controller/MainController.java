package com.projectImp.controller;

import com.projectImp.domain.PageCriteriaVO;
import com.projectImp.domain.PageDTO;
import com.projectImp.service.MemberService;
import com.projectImp.service.PageService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

@RequestMapping("/")
@Controller
public class MainController {

    private final MemberService memberService;
    private final PageService pageService;

    public MainController(MemberService memberService, PageService pageService) {
        this.memberService = memberService;
        this.pageService = pageService;
    }

    @GetMapping("/")
    public String goIndex(PageCriteriaVO cri, Model model){

        model.addAttribute("photoList", memberService.getPhotoList(cri));
        int total = pageService.getPhotoListTotal();
        model.addAttribute("pageMaker", new PageDTO(cri, total));

        return "index";
    }
    @GetMapping("/my-gallery")
    public String goMyGallery(PageCriteriaVO cri, Model model, Principal principal){

        model.addAttribute("photoList", memberService.goMyGallery(cri,principal.getName()));
        int total = pageService.goMyGalleryListTotal(principal.getName());
        model.addAttribute("pageMaker", new PageDTO(cri, total));


        return "index";
    }


    @PostMapping("/idCheck")
    @ResponseBody
    public Map<String, Object> idCheck(@RequestBody String userId) {
        Map<String, Object> map = new HashMap<>();
        map.put("cnt", memberService.idCheckTest(userId));
        return map;
    }




}
