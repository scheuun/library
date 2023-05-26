package com.my.library.service;

import com.my.library.dao.map.MemberMap;
import com.my.library.model.EncryptionUtils;
import com.my.library.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    MemberMap memberMap;


    @Override
    public int joinMember(Member member) {
        member.setPwd(EncryptionUtils.encryptSHA256(member.getPwd()));
        return memberMap.joinMember(member);
    }

    @Override
    public int idCheck(String id) {
        return memberMap.idCheck(id);
    }

    @Override
    public String pwdCheck(String id) {
        return memberMap.pwdCheck(id);
    }

    @Override
    public String findId(String email) {
        return memberMap.findId(email);
    }

    @Override
    public int findPwd(String id, String email) {
        return memberMap.findPwd(id, email);
    }

    @Override
    public void updatePwd(Member member) {
        memberMap.updatePwd(member);
    }

    @Override
    public Member myPage(String id) {
        return memberMap.myPage(id);
    }
}
