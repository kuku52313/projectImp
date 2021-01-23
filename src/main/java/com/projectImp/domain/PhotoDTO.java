package com.projectImp.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class PhotoDTO {
   /* "PHOTO_NUMBER" int(11) [pk, not null]
            "PHOTO_DATE" date [default: NULL]
            "PHOTO_MEMBER_ID" varchar(15) [not null]
            "PHOTO_REGDATE" date [not null]
            "PHOTO_IMG_PATH" varchar(200) [not null]
            "PHOTO_IMG" varchar(100) [not null]
            "PHOTO_THUMBNAIL" varchar(100) [not null]
            "PHOTO_TITLE" varchar(50) [not null]
            "PHOTO_CONTENT" text [not null] */

    private String photoNumber;
    private String photoMemberId;
    private Date photoDate;
    private Date photoRegdate;
    private String photoImgPath;
    private String photoImg;
    private String photoThumbnail;
    private String photoTitle;
    private String photoContent;


}
