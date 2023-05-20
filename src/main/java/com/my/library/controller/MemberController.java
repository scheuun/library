package com.my.library.controller;

import com.my.library.model.EncryptionUtils;
import com.my.library.model.Member;
import com.my.library.service.MemberService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class MemberController {
  @Autowired
  MemberService memberService;

  @GetMapping("/member/join")
  public String join() {
      return "member/join";
  }

  @PostMapping("/join")
  @ResponseBody
    public int join(Member member) {
    member.setPwd(EncryptionUtils.encryptMD5(member.getPwd()));

    return memberService.joinMember(member);
  }
}
