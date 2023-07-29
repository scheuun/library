package com.my.library.service;

import com.my.library.model.Library;

import java.util.List;

public interface LibraryService {
    List<Library> list(String id);
    void reserve(Library library);
    void cancel(String id, int rki_no);
    int checkCnt(int rki_no);
    String checkRes(int rki_no);
    int checkMax(String id);
    int checkDup(String id, int rki_no);
}
