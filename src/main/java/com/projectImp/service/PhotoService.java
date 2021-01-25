package com.projectImp.service;

import com.projectImp.domain.PhotoDTO;
import com.projectImp.domain.UploadImgDTO;
import com.projectImp.persistence.PhotoDAO;
import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnails;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

@Service
@Log4j
public class PhotoService {

    private final PhotoDAO photoDAO;

    public PhotoService(PhotoDAO photoDAO) {
        this.photoDAO = photoDAO;
    }

    public String getFolderPath(String absolutePath) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date date = new Date();
        String datePath = sdf.format(date).replace("-", File.separator);
        return absolutePath + "\\" + datePath;
    }

    public void imageFileRegistration(HttpServletRequest request, PhotoDTO photoDTO, UploadImgDTO uploadImgDTO) throws IllegalStateException, IOException {

        String ImageName = UUID.randomUUID().toString() + "_" + uploadImgDTO.getUploadImg().getOriginalFilename();
        File path = new File(getFolderPath(request.getSession().getServletContext().getRealPath("/resources/img/")));
        File image = new File(path + "\\M_" + ImageName);
        File thumbnail = new File(path + "\\T_" + ImageName);
        File contextPath = new File(getFolderPath(request.getSession().getServletContext().getContextPath() + "/resources/img"));

        if (!image.exists()) {
            path.mkdirs();
            uploadImgDTO.getUploadImg().transferTo(image);
            Thumbnails.of(image).size(600, 400).toFile(thumbnail);
        }

        photoDTO.setPhotoImg(image.toString().replace(path.toString(), ""));
        photoDTO.setPhotoImgPath(contextPath.toString());
        photoDTO.setPhotoThumbnail(thumbnail.toString().replace(path.toString(), ""));

        photoDAO.savePhoto(photoDTO);

    }

    public void removingPhoto(String photoNumber) {
        photoDAO.removingPhoto(photoNumber);
    }
}
