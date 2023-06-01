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
}
