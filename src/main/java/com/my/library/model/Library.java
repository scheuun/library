package com.my.library.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;
import java.time.LocalDate;
import java.util.Date;

public class Library {
    private LocalDate std_ym;
    private int rki_no;
 	private String book_nm_info;
	private String author_nm_info;
	private String publshcmpy_nm;
	private String publcatn_yy;
	private String book_image_url;
    @DateTimeFormat(pattern="yyyy-mm-dd")
    @JsonFormat(pattern="yyyy-mm-dd", timezone="Asia/Seoul")
    private Date res_date;
	private String id;

    public LocalDate getStd_ym() {
        return std_ym;
    }

    public void setStd_ym(LocalDate std_ym) {
        this.std_ym = std_ym;
    }

    public int getRki_no() {
        return rki_no;
    }

    public void setRki_no(int rki_no) {
        this.rki_no = rki_no;
    }

    public String getBook_nm_info() {
        return book_nm_info;
    }

    public void setBook_nm_info(String book_nm_info) {
        this.book_nm_info = book_nm_info;
    }

    public String getAuthor_nm_info() {
        return author_nm_info;
    }

    public void setAuthor_nm_info(String author_nm_info) {
        this.author_nm_info = author_nm_info;
    }

    public String getPublshcmpy_nm() {
        return publshcmpy_nm;
    }

    public void setPublshcmpy_nm(String publshcmpy_nm) {
        this.publshcmpy_nm = publshcmpy_nm;
    }

    public String getPublcatn_yy() {
        return publcatn_yy;
    }

    public void setPublcatn_yy(String publcatn_yy) {
        this.publcatn_yy = publcatn_yy;
    }

    public String getBook_image_url() {
        return book_image_url;
    }

    public void setBook_image_url(String book_image_url) {
        this.book_image_url = book_image_url;
    }

    public Date getRes_date() {
        return res_date;
    }

    public void setRes_date(Date res_date) {
        this.res_date = res_date;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
}
