package com.projectImp.service;

import com.projectImp.domain.UserDetailsDTO;
import com.projectImp.persistence.MemberDAO;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {

    private final MemberDAO member;

    public UserDetailsServiceImpl(MemberDAO mapper) {
        this.member = mapper;
    }

    @Override
    public UserDetails loadUserByUsername(String memberId) {
        UserDetailsDTO userDetails = member.getMemberInfo(memberId);
        if (userDetails == null) { return null; }
        else {
            userDetails.setUsername(userDetails.getMemberId());
            userDetails.setPassword(userDetails.getMemberPw());
            userDetails.setAuthorities(userDetails.getAuthoritiesMember(), userDetails.getAuthoritiesManager(), userDetails.getAuthoritiesAdmin());
        }
        return userDetails;
    }

}