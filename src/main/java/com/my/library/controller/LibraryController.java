package com.my.library.controller;

import com.my.library.model.Library;
import com.my.library.service.LibraryService;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
public class LibraryController {
    @Autowired
    LibraryService libraryService;

    @GetMapping("/")
    public String Main(HttpSession session) {
        session.getAttribute("id");
        return "library/main";
    }

    @RequestMapping(value="/library/bookDetail" , method = {RequestMethod.GET, RequestMethod.POST})
    public String BookDetail(HttpServletRequest httpServletRequest, HttpSession session, Model model) throws JSONException {
        JSONObject json = new JSONObject(httpServletRequest.getParameter("bookData"));

        String id = (String) session.getAttribute("id");

        model.addAttribute("rki_no", json.getInt("rki_no"))
                .addAttribute("book_nm_info", json.getString("book_nm_info"))
                .addAttribute("author_nm_info", json.getString("author_nm_info"))
                .addAttribute("publshcmpy_nm", json.getString("publshcmpy_nm"))
                .addAttribute("publcatn_yy", json.getString("publcatn_yy"))
                .addAttribute("book_image_url", json.getString("book_image_url"))
                .addAttribute("res_date", libraryService.checkRes(json.getInt("rki_no")))
                .addAttribute("state_cnt", libraryService.checkCnt(json.getInt("rki_no")))
                .addAttribute("max", libraryService.checkMax(id))
                .addAttribute("dup", libraryService.checkDup(id, json.getInt("rki_no")));

        return "library/bookDetail";
    }

    @PostMapping("/reserve")
    @ResponseBody
    public void reserve(Library library) {
        libraryService.reserve(library);
    }
}
