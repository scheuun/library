package com.my.library.service;

import com.my.library.model.Library;

public interface LibraryService {
    void reserve(Library library);
    int checkRes(int rki_no);
}
