package com.projectImp.service;

import com.projectImp.domain.MemberDTO;
import com.projectImp.domain.UserDetailsDTO;
import com.projectImp.persistence.MemberDAO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
}
