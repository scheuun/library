package com.my.library.service;

import com.my.library.model.Member;

import java.util.List;

public interface MemberService {
    int joinMember(Member member);
    int idCheck(String id);
    String pwdCheck(String id);
    String findId(String email);
    int findPwd(String id, String email);
    void updatePwd(Member member);
    Member myPage(String id);
}
