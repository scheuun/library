<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>BOOK DETAIL</title>
    <style>
        header {
            background-color: #f5f5f5;
            padding: 20px;
            text-align: center;
        }

        #book-details {
            max-width: 600px;
            margin: 0 auto;
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        .title {
            font-size: 24px;
            margin-top: 0;
        }

        p {
            font-size: 16px;
            line-height: 1.5;
        }

        .book {
            display: inline-block;
            width: 200px;
            margin: 0 10px 20px;
            padding: 10px;
            border: 1px solid #ccc;
        }

        .book img {
            width: 100%;
            height: auto;
        }

        .book h3 {
            margin: 10px 0;
        }

        .book p {
            font-size: 14px;
            color: #888;
        }
    </style>
    <script>
        $(document).ready(function () {

            $('#reserveBtn').click(function (){
            if (${max >= 7}) {
                alert("최대 예약권수를 초과하였습니다.");
            } else if (${dup > 0}) {
                alert("이미 예약된 도서입니다.");
            } else {
                var id = '<%= (String)session.getAttribute("id") %>';
                var rki_no = $('#rki_no').val();
                var book_nm_info = $('#book_nm_info').val();
                var author_nm_info = $('#author_nm_info').val();
                var publshcmpy_nm = $('#publshcmpy_nm').val();
                var publcatn_yy = $('#publcatn_yy').val();
                var book_image_url = $('#book_image_url').val();
                var state_cnt = $('#state_cnt').val();

                if (id === null || id === "null" || id.length === 0)
                    location.href="<%=request.getContextPath() %>/member/login";
                else
                    $.ajax({
                        type: "POST",
                        url: "/reserve",
                        data: {
                            rki_no: rki_no,
                            book_nm_info: book_nm_info,
                            author_nm_info: author_nm_info,
                            publshcmpy_nm: publshcmpy_nm,
                            publcatn_yy: publcatn_yy,
                            book_image_url: book_image_url,
                            state_cnt: state_cnt,
                            id: id
                        },
                        success: function (data) {
                            result: data;
                            alert("예약 성공");
                            location.reload();
                        },
                        error: function (data) {
                            result: data;
                            alert("실패");
                        }
                    });
                }
            });


            $('#cancelBtn').click(function (){
                var id = '<%= (String)session.getAttribute("id") %>';
                var rki_no = $('#rki_no').val();

                if (id === null || id === "null" || id.length === 0)
                    location.href="<%=request.getContextPath() %>/member/login";
                else if (${dup == 0}) alert("이미 취소된 도서입니다.");
                else
                    $.ajax({
                    type: "POST",
                    url: "/cancel",
                    data: {
                        rki_no: rki_no,
                        id: id
                    },
                    success: function () {
                        alert("취소 성공");
                        location.reload();
                    },
                    error: function () {
                        alert("실패");
                    }
                });
            });
        });
    </script>
</head>
<body>
<header>
    <h1>소복도서관</h1>
</header>
<div style="text-align: right">
    <c:if test="${empty sessionScope.id}">
        <a style='color:black' href = '<%=request.getContextPath() %>/member/login'>로그인</a> |
    </c:if>
    <c:if test="${not empty sessionScope.id}">
        <a style='color:black' href = '<%=request.getContextPath() %>/member/logout'>로그아웃</a> |
    </c:if>
    <a style='color:black' href = '<%=request.getContextPath() %>/member/join'>회원가입</a> |
    <a style='color:black' href = '<%=request.getContextPath() %>/'>메인</a>
</div>
<div id="book-details">
    <h1 class="title">${rki_no}. ${book_nm_info}</h1>
    <input type="hidden" id="rki_no" value="${rki_no}">
    <input type="hidden" id="book_nm_info" value="${book_nm_info}">
    <div class="book">
        <img src=${book_image_url} >
        <input type="hidden" id="book_image_url" value="${book_image_url}">
    </div>
    <p>저자: ${author_nm_info}</p>
    <input type="hidden" id="author_nm_info" value="${author_nm_info}">
    <p>출판사: ${publshcmpy_nm}</p>
    <input type="hidden" id="publshcmpy_nm" value="${publshcmpy_nm}">
    <p>출판 날짜: ${publcatn_yy}</p>
    <input type="hidden" id="publcatn_yy" value="${publcatn_yy}">
    <p>책상태: ${state_cnt == 0? "O":"X"} (예약 대기: ${state_cnt == 0?0:state_cnt-1}명)</p>
    <p>반납 예정일: ${res_date}</p>
    <button id="reserveBtn" class="btn btn-primary">예약</button>
    <button id="cancelBtn" class="btn btn-primary">취소</button>
</div>
</body>
</html>