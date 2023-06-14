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

        session.getAttribute("id");

        model.addAttribute("rki_no", json.getInt("rki_no"));
        model.addAttribute("book_nm_info", json.getString("book_nm_info"));
        model.addAttribute("author_nm_info", json.getString("author_nm_info"));
        model.addAttribute("publshcmpy_nm", json.getString("publshcmpy_nm"));
        model.addAttribute("publcatn_yy", json.getString("publcatn_yy"));
        model.addAttribute("book_image_url", json.getString("book_image_url"));
        model.addAttribute("state_cnt", libraryService.checkRes(json.getInt("rki_no")) == 0 ? "O" : "X");
        return "library/bookDetail";
    }

    @PostMapping("/reserve")
    @ResponseBody
    public void reserve(Library library, HttpServletRequest httpServletRequest) {

        int rki_no = Integer.parseInt(httpServletRequest.getParameter("rki_no"));
        System.out.println(rki_no);

        if (libraryService.checkRes(rki_no) == 0){
            library.setState_cnt(0);
        } else {
            library.setState_cnt(library.getState_cnt() + 1);
        }

        libraryService.reserve(library);
    }
}
