package com.projectImp.service;

import com.projectImp.domain.UserDetailsDTO;
import org.springframework.security.authentication.*;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class LoginAuthenticationProvider implements AuthenticationProvider {

    private final UserDetailsService userDetailsServcie;
    private final BCryptPasswordEncoder passwordEncoder;

    public LoginAuthenticationProvider(UserDetailsService userDetailsServcie, BCryptPasswordEncoder passwordEncoder) {
        this.userDetailsServcie = userDetailsServcie;
        this.passwordEncoder = passwordEncoder;
    }

    @Override
    public Authentication authenticate(Authentication authentication) throws AuthenticationException {
        String memberId = authentication.getName();
        String memberPw = (String) authentication.getCredentials();
        UserDetailsDTO userDetails = (UserDetailsDTO) userDetailsServcie.loadUserByUsername(memberId);
        if (userDetails == null) { throw new AuthenticationServiceException(memberId); }
        else if (!memberId.equals(userDetails.getName()) || !passwordEncoder.matches(memberPw, userDetails.getPassword())) { throw new BadCredentialsException(memberId); }
        else if (!userDetails.isAccountNonLocked()) { throw new LockedException(memberId); }
        else if (!userDetails.isEnabled()) { throw new DisabledException(memberId); }
        else if (!userDetails.isAccountNonExpired()) { throw new AccountExpiredException(memberId); }
        else if (!userDetails.isCredentialsNonExpired()) { throw new CredentialsExpiredException(memberId); }
        userDetails.setPassword(null);
        return new UsernamePasswordAuthenticationToken(userDetails, null, userDetails.getAuthorities());
    }

    @Override
    public boolean supports(Class<?> authentication) {
        return authentication.equals(UsernamePasswordAuthenticationToken.class);
    }

}
