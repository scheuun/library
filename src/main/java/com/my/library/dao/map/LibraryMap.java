package com.my.library.dao.map;

import com.my.library.model.Library;

public interface LibraryMap {
    void reserve(Library library);
    int checkRes(int rki_no);
}
