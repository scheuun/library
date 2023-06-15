package com.my.library.dao.map;

import com.my.library.model.Library;
import org.apache.ibatis.annotations.Param;
import java.util.Date;

public interface LibraryMap {
    void reserve(Library library);
    int checkCnt(int rki_no);
    Date checkRes(int rki_no);
    int checkMax(String id);
    int checkDup(@Param("id") String id, @Param("rki_no") int rki_no);
}
