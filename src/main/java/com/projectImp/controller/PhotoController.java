package com.projectImp.controller;

import com.projectImp.domain.PageCriteriaVO;
import com.projectImp.domain.PhotoDTO;
import com.projectImp.domain.UploadImgDTO;
import com.projectImp.service.PhotoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.security.Principal;

@RequestMapping("/photo")
@Controller
public class PhotoController {

    private final PhotoService photoService;

    public PhotoController(PhotoService photoService) {
        this.photoService = photoService;
    }

    @GetMapping("/regist-photo")
    public String registPhoto(){
        return "regist-photo";
    }

    @PostMapping("/photo-regist-up")
    public String imageFileRegistration(HttpServletRequest request, PhotoDTO photoDTO, UploadImgDTO uploadImgDTO, Principal principal) throws IllegalStateException, IOException {

        photoDTO.setPhotoMemberId(principal.getName());

        photoService.imageFileRegistration(request,photoDTO,uploadImgDTO);

        return "redirect:/photo/regist-photo";
    }

    @GetMapping("/photo-remove")
    public String removingPhoto(@RequestParam("photoNumber") String photoNumber, PageCriteriaVO cri) {

        photoService.removingPhoto(photoNumber);

        return "redirect:/?pageNum=" + cri.getPageNum() +"&amount=" + cri.getAmount();
    }
}
