package com.my.library.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;

@Controller
public class LibraryController {
    @GetMapping("/")
    public String Main(HttpSession session) {
        session.getAttribute("id");
        return "library/main";
    }
}
