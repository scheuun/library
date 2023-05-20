package com.my.library.service;

import com.my.library.dao.map.MemberMap;
import com.my.library.model.Member;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    MemberMap memberMap;


    @Override
    public int joinMember(Member member) {
        return memberMap.joinMember(member);
    }
}
