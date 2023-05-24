package com.my.library.dao.map;

import com.my.library.model.Member;
import org.apache.ibatis.annotations.Param;

public interface MemberMap {
    int joinMember(Member member);
    int idCheck(String id);
    String pwdCheck(String id);
    String findId(String email);
    int findPwd(@Param("id") String id, @Param("email") String email);
    void updatePwd(Member member);
}
