<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>SEARCH RESULT</title>
    <style>
        header {
            background-color: #f5f5f5;
            padding: 20px;
            text-align: center;
        }

        .book-item {
            padding: 10px;
            margin: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            display: flex;
            align-items: center;
        }

        .book-item img {
            width: 150px;
            height: 200px;
            object-fit: cover;
            margin-right: 10px;
        }

        .title {
            font-size: 16px;
            margin-bottom: 150px;
            text-align: center;
        }

        .author {
            font-size: 14px;
            color: #666;
            margin-bottom: 50px;
            text-align: center;
        }

        .publisher {
            font-size: 14px;
            color: #666;
            margin-bottom: 0px;
            text-align: center;
        }
    </style>
    <script>
        $(document).ready(function () {
            $.ajax({
                url: 'https://openapi.gg.go.kr/Poplitloanbook?KEY=eb69202112ec4d8399e7b233465154e8&Type=json&pIndex=1&pSize=1000',
                type: 'GET',
                success: function (data) {
                    const jsonData = JSON.parse(data);
                    console.log('성공');

                    let searchResults = [];

                    for (const item of jsonData.Poplitloanbook[1].row) {
                        // 속성 값이 keyword와 일치하는지 값이 있는 지 검사
                        if ((item.BOOK_NM_INFO && item.BOOK_NM_INFO.includes(keyword)) ||
                            (item.AUTHOR_NM_INFO && item.AUTHOR_NM_INFO.includes(keyword)) ||
                            (item.PUBLSHCMPY_NM && item.PUBLSHCMPY_NM.includes(keyword))) {
                            searchResults.push(item);
                        }
                    }
                    $("#bookCount").append(searchResults.length);
                    if (searchResults.length > 0) {
                        console.log("검색 성공");
                        $("#searchResults").empty();

                        for (const result of searchResults) {
                            const bookItem = $('<div class="book-item">');
                            const bookImage = $('<img src="' + result.BOOK_IMAGE_URL + '" alt="도서 이미지">');// 이미지 누르면 이동
                            const bookTitle = $('<h3 class="title">').text(result.BOOK_NM_INFO);
                            const bookAuthor = $('<p class="author">').text(result.AUTHOR_NM_INFO);
                            const bookPublisher = $('<p class="publisher">').text(result.PUBLSHCMPY_NM);

                            bookItem.append(bookImage);
                            bookItem.append(bookTitle);
                            bookItem.append(bookAuthor);
                            bookItem.append(bookPublisher);

                            $("#searchResults").append(bookItem);

                            bookImage.on('click', function() {
                                var form = document.createElement("form");
                                form.method = "POST";
                                form.action = "<%=request.getContextPath() %>/library/bookDetail";

                                var input = document.createElement("input");
                                input.type = "hidden";
                                input.name = "bookData";
                                input.value = JSON.stringify({
                                    rki_no: result.RKI_NO,
                                    book_nm_info: result.BOOK_NM_INFO,
                                    author_nm_info: result.AUTHOR_NM_INFO,
                                    publshcmpy_nm: result.PUBLSHCMPY_NM,
                                    publcatn_yy: result.PUBLCATN_YY,
                                    book_image_url: result.BOOK_IMAGE_URL
                                });
                                form.append(input);
                                $('body').append(form);
                                form.submit();
                            });
                        }
                    } else {
                        $("#searchResults").append("검색 결과가 존재하지 않습니다.");
                    }
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
    <h1>도서 대출 현황</h1>
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
<div id="searchResults" class="searchResults">
</div>
</body>
</html>