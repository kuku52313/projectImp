package com.projectImp.service;

import com.projectImp.domain.MemberDTO;
import com.projectImp.domain.PageCriteriaVO;
import com.projectImp.domain.PhotoDTO;
import com.projectImp.domain.UserDetailsDTO;
import com.projectImp.persistence.MemberDAO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberService {

    private final BCryptPasswordEncoder passwordEncoder;
    private final MemberDAO memberDAO;

    public MemberService(BCryptPasswordEncoder passwordEncoder, MemberDAO memberDAO) {
        this.passwordEncoder = passwordEncoder;
        this.memberDAO = memberDAO;
    }

    public void registMember(MemberDTO memberDTO) {
        memberDTO.setAuthoritiesMember("ROLE_MEMBER");
        memberDTO.setAuthoritiesManager(null);
        memberDTO.setAuthoritiesAdmin(null);
        memberDTO.setMemberPw(passwordEncoder.encode(memberDTO.getMemberPw()));
        memberDAO.registMember(memberDTO);
        memberDAO.registAuthorities(memberDTO);
    }
    public UserDetailsDTO getMemberInfo(String memberId) {
        return memberDAO.getMemberInfo(memberId);
    }

    public int idCheckTest(String userId) {
        return memberDAO.idCheckTest(userId);
    }

    public List<PhotoDTO> getPhotoList(PageCriteriaVO cri) {
        cri.setOffset((cri.getPageNum()-1)*cri.getAmount());
        return memberDAO.getPhotoList(cri);
    }

    public List<PhotoDTO> goMyGallery(PageCriteriaVO cri, String memberId) {
        cri.setOffset((cri.getPageNum()-1)*cri.getAmount());
        return memberDAO.goMyGallery(cri, memberId);
    }
}
