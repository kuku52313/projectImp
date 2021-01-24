package com.projectImp.domain;

import lombok.Data;
import org.springframework.web.multipart.MultipartFile;

import java.sql.Date;

@Data
public class UploadImgDTO {

    private MultipartFile uploadImg;

}
