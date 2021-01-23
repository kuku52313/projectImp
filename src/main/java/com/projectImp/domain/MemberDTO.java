package com.projectImp.domain;

import lombok.Data;

import java.sql.Date;

@Data
public class MemberDTO {
    /*
    멤버테이블은 보통 권한테이블하고 조인되서 쓰이기때문에 같이 필드선언

   "MEMBER_ID" varchar(15) [pk, not null]
  "MEMBER_PW" char(60) [not null]
  "MEMBER_NAME" varchar(20) [not null]
  "MEMBER_REGDATE" date [not null]
  "MEMBER_EMAIL" varchar(40) [not null]
  "MEMBER_TEL" char(11) [not null]
  "MEMBER_IMG_PATH" varchar(200) [default: NULL]
  "MEMBER_IMG" varchar(100) [default: NULL]

  "AUTHORITIES_MEMBER_ID" varchar(15) [not null]
  "AUTHORITIES_MEMBER" varchar(20) [not null]
  "AUTHORITIES_MANAGER" varchar(20) [default: NULL]
  "AUTHORITIES_ADMIN" varchar(20) [default: NULL]
   */

    private String memberId;
    private String memberPw;
    private String memberName;
    private Date memberRegdate;
    private String memberEmail;
    private String memberTel;
    private String memberImgPath;
    private String memberImg;

    private String authoritiesMemberId;
    private String authoritiesMember;
    private String authoritiesManager;
    private String authoritiesAdmin;

}
