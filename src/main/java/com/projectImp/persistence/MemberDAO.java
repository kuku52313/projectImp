package com.projectImp.persistence;

import com.projectImp.domain.MemberDTO;
import com.projectImp.domain.PageCriteriaVO;
import com.projectImp.domain.PhotoDTO;
import com.projectImp.domain.UserDetailsDTO;

import java.util.List;

public interface MemberDAO {

    void registMember(MemberDTO memberDTO);

    void registAuthorities(MemberDTO memberDTO);

    UserDetailsDTO getMemberInfo(String memberId);

    int idCheckTest(String userId);

    List<PhotoDTO> getPhotoList(PageCriteriaVO cri);

    List<PhotoDTO> goMyGallery(PageCriteriaVO cri, String memberId);
}
