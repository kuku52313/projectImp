package com.projectImp.domain;

import lombok.Data;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

@Data
public class UserDetailsDTO implements UserDetails {

    private static final long serialVersionUID = 1L;
    private String username;
    private String password;
    private String memberId;
    private String memberPw;
    private String memberName;
    private String memberEmail;
    private String memberTel;
    private String authoritiesMember;
    private String authoritiesManager;
    private String authoritiesAdmin;
    private List<GrantedAuthority> authorities;

    public void setUsername(String username) {
        this.username = username;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setAuthorities(String member, String manager, String admin) {
        List<GrantedAuthority> authorities = new ArrayList<>();
        if (member != null) authorities.add(new SimpleGrantedAuthority(member));
        if (manager != null) authorities.add(new SimpleGrantedAuthority(manager));
        if (admin != null) authorities.add(new SimpleGrantedAuthority(admin));
        this.authorities = authorities;
    }

    @Override
    public String getUsername() {
        return username;
    }

    @Override
    public String getPassword() {
        return password;
    }

    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return authorities;
    }

    @Override
    public boolean isAccountNonExpired() {
        return true;
    }

    @Override
    public boolean isAccountNonLocked() {
        return true;
    }

    @Override
    public boolean isCredentialsNonExpired() {
        return true;
    }

    @Override
    public boolean isEnabled() {
        return true;
    }

}