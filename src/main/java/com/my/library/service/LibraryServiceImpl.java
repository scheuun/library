package com.my.library.service;

import com.my.library.dao.map.LibraryMap;
import com.my.library.model.Library;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class LibraryServiceImpl implements LibraryService{
    @Autowired
    LibraryMap libraryMap;

    @Override
    public List<Library> list(String id) { return libraryMap.list(id); }

    @Override
    public void reserve(Library library) {
        libraryMap.reserve(library);
    }

    @Override
    public void cancel(String id, int rki_no) { libraryMap.cancel(id, rki_no); }

    @Override
    public void extend(String id, int rki_no) { libraryMap.extend(id, rki_no); }

    @Override
    public int checkCnt(int rki_no) {
        return libraryMap.checkCnt(rki_no);
    }

    @Override
    public String checkRes(int rki_no) {
        return libraryMap.checkRes(rki_no);
    }

    @Override
    public int checkMax(String id) {
        return libraryMap.checkMax(id);
    }

    @Override
    public int checkDup(String id, int rki_no) {
        return libraryMap.checkDup(id, rki_no);
    }


}
