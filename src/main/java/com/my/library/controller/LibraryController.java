package com.my.library.controller;

import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LibraryController {
    @GetMapping("/")
    public String Main(HttpSession session) {
        session.getAttribute("id");
        return "library/main";
    }

    @RequestMapping(value="/library/bookDetail" , method = {RequestMethod.GET, RequestMethod.POST})
    public String BookDetail(HttpServletRequest httpServletRequest, Model model) throws JSONException {
        System.out.println(httpServletRequest.getParameter("bookData"));

        JSONObject json = new JSONObject(httpServletRequest.getParameter("bookData"));
//        String rkiNo = json.getString("rki_no");
//        System.out.println("RKI_NO: " + rkiNo);

        model.addAttribute("book_nm_info", json.getString("book_nm_info"));
        model.addAttribute("author_nm_info", json.getString("author_nm_info"));
        model.addAttribute("publshcmpy_nm", json.getString("publshcmpy_nm"));
        model.addAttribute("publcatn_yy", json.getString("publcatn_yy"));
        model.addAttribute("book_image_url", json.getString("book_image_url"));
        return "library/bookDetail";
    }
}
