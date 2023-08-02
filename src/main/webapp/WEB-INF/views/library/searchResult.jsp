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
            background-color: #ffffff;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px;
            padding: 10px;
            text-align: center;
            box-shadow: 0px 2px 4px rgba(0, 0, 0, 0.1);
        }

        .book-item img {
            width: 10%;
            height: auto;
            object-fit: cover;
            margin-right: 10px;
        }

        .title {
            font-size: 1.2em;
            margin: 10px 0;
        }

        .author, .publisher {
            color: #777;
            margin: 5px 0;
        }
    </style>
    <script>
        $(document).ready(function () {
            var keyword = '<%= request.getParameter("keyword") %>';
            console.log(keyword);
            $.ajax({
                url: 'https://openapi.gg.go.kr/Poplitloanbook?KEY=eb69202112ec4d8399e7b233465154e8&Type=json&pIndex=1&pSize=1000',
                type: 'GET',
                success: function (data) {
                    const jsonData = JSON.parse(data);

                    let searchResults = [];

                    for (const item of jsonData.Poplitloanbook[1].row) {
                        if ((item.BOOK_NM_INFO && item.BOOK_NM_INFO.includes(keyword)) ||
                            (item.AUTHOR_NM_INFO && item.AUTHOR_NM_INFO.includes(keyword)) ||
                            (item.PUBLSHCMPY_NM && item.PUBLSHCMPY_NM.includes(keyword))) {
                            searchResults.push(item);
                        }
                    }

                    $("#bookCount").append(searchResults.length);

                    if (searchResults.length > 0) {
                        $("#searchResults").empty();

                        for (const result of searchResults) {
                            const bookItem = $('<div class="book-item">');
                            const bookImage = $('<img src="' + result.BOOK_IMAGE_URL + '" alt="도서 이미지">');// 이미지 누르면 이동
                            const bookTitle = $('<h4 class="title">').text(result.RKI_NO + ". " + result.BOOK_NM_INFO);
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
                        $("#searchResults").append($('<br><h5 style="text-align: center">').text("검색 결과가 존재하지 않습니다."));
                    }
                },
                error: function (data) {
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
<b style="float: right">총 <b id="bookCount"></b>권이 검색되었습니다.</b><br>
<div id="searchResults" class="searchResults">
</div>
</body>
</html>