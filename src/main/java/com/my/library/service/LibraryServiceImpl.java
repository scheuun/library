package com.my.library.service;

import com.my.library.dao.map.LibraryMap;
import com.my.library.model.Library;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class LibraryServiceImpl implements LibraryService{
    @Autowired
    LibraryMap libraryMap;

    @Override
    public void reserve(Library library) {
        libraryMap.reserve(library);
    }

//    @Override
//    public void reserve(int rki_no, String book_nm_info, String author_nm_info, String publshcmpy_nm, String publcatn_yy, String id) {
//        libraryMap.reserve(rki_no, book_nm_info, author_nm_info, publshcmpy_nm, publcatn_yy, id);
//    }


}
