package com.projectImp.persistence;

import com.projectImp.domain.MemberDTO;
import com.projectImp.domain.UserDetailsDTO;

public interface MemberDAO {

    void registMember(MemberDTO memberDTO);

    void registAuthorities(MemberDTO memberDTO);

    UserDetailsDTO getMemberInfo(String memberId);

    int idCheckTest(String userId);
}
