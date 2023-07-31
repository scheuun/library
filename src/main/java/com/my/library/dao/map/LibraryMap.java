package com.my.library.dao.map;

import com.my.library.model.Library;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface LibraryMap {
    List<Library> list(String id);
    void reserve(Library library);
    void cancel(@Param("id") String id, @Param("rki_no") int rki_no);
    void extend(@Param("id") String id, @Param("rki_no") int rki_no);
    int checkCnt(int rki_no);
    String checkRes(int rki_no);
    int checkMax(String id);
    int checkDup(@Param("id") String id, @Param("rki_no") int rki_no);
}
