package com.my.library.service;

import com.my.library.model.Library;

import java.util.Date;


public interface LibraryService {
    void reserve(Library library);
    int checkCnt(int rki_no);
    Date checkRes(int rki_no);
    int checkMax(String id);
    int checkDup(String id, int rki_no);
}
