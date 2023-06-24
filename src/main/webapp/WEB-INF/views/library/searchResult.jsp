<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>SEARCH RESULT</title>
    <style>
        .search-results {
            display: flex;
            flex-wrap: wrap;
        }

        header {
            background-color: #f5f5f5;
            padding: 20px;
            text-align: center;
        }

        .book-item {
            width: 200px;
            padding: 10px;
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            text-align: center;
        }

        .book-item img {
            width: 150px;
            height: 200px;
            object-fit: cover;
            margin-bottom: 10px;
        }

        .book-item h3 {
            font-size: 16px;
            margin-bottom: 5px;
        }

        .book-item p {
            font-size: 14px;
            color: #666;
            margin-bottom: 5px;
        }

        .book-item .publisher {
            font-size: 14px;
            color: #888;
        }
    </style>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: 'https://openapi.gg.go.kr/Poplitloanbook?KEY=eb69202112ec4d8399e7b233465154e8&Type=json&pIndex=1&pSize=1000',
                type: 'GET',
                success: function (data) {
                    const jsonData = JSON.parse(data);
                    $.ajax({
                        url: '/library/searchResult',
                        type: 'POST',
                        contentType: 'application/json',
                        data: JSON.stringify(jsonData),
                        success: function (data) {
                            result:data;
                            console.log('전달 성공');

                            // if ((jsonData.Poplitloanbook[1].row[1].BOOK_NM_INFO).match("아버지")) {
                            //     console.log("검색 성공")
                            // } else {
                            //     console.log("검색 실패")
                            // }
                            // console.log(jsonData.Poplitloanbook[1].row[1].BOOK_NM_INFO)
                            // console.log(jsonData.Poplitloanbook[1].row[1].AUTHOR_NM_INFO)
                            // console.log(jsonData.Poplitloanbook[1].row[1].PUBLSHCMPY_NM)
                        },
                        error: function (error) {
                            console.log(error);
                            alert("실패");
                        }
                    });
                },
                error: function (data) {
                    console.log(data);
                    alert("실패");
                }
            });
        });
    </script>
</head>
<body>
<header>
    <h1>도서 검색 결과</h1>
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
<div class="search-results">
    <!-- 검색 결과 도서 아이템 -->
    <div class="book-item">
        <img src="" alt="도서 이미지">
        <h3>도서 제목</h3>
        <p>저자</p>
        <p class="publisher">출판사</p>
    </div>

    <!-- 추가 검색 결과 도서 아이템 -->
    <div class="book-item">
        <!-- ... -->
    </div>

    <!-- 추가 검색 결과 도서 아이템 -->
    <div class="book-item">
        <!-- ... -->
    </div>

    <!-- ... -->
</div>
</body>
</html>