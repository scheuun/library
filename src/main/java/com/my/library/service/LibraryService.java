package com.my.library.service;

import com.my.library.model.Library;

public interface LibraryService {
    // void reserve(int rki_no, String book_nm_info, String author_nm_info, String publshcmpy_nm, String publcatn_yy, String id);
    void reserve(Library library);
}
