<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>MAIN</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #f5f5f5;
            padding: 20px;
            text-align: center;
        }

        header h1 {
            margin: 0;
        }

        section {
            padding: 20px;
        }

        section h2 {
            margin: 0 0 20px;
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

        form {
            margin-top: 20px;
        }

        input[type="text"] {
            padding: 10px;
            width: 200px;
        }

        button[type="submit"] {
            padding: 10px 20px;
            background-color: #333;
            color: #fff;
            border: none;
            cursor: pointer;
        }

        footer {
            background-color: #f5f5f5;
            padding: 20px;
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

                    for (let i = 0; i < 5; i++) {
                        const  imageNum = document.getElementById("image" + (i + 1));
                        imageNum.src = jsonData.Poplitloanbook[1].row[i].BOOK_IMAGE_URL;

                        imageNum.addEventListener("click", function() {;
                            var form = document.createElement("form");
                            form.method = "POST";
                            form.action = "<%=request.getContextPath() %>/library/bookDetail";

                            var input = document.createElement("input");
                            input.type = "hidden";
                            input.name = "bookData";
                            input.value = JSON.stringify({
                                rki_no: jsonData.Poplitloanbook[1].row[i].RKI_NO,
                                book_nm_info: jsonData.Poplitloanbook[1].row[i].BOOK_NM_INFO,
                                author_nm_info: jsonData.Poplitloanbook[1].row[i].AUTHOR_NM_INFO,
                                publshcmpy_nm: jsonData.Poplitloanbook[1].row[i].PUBLSHCMPY_NM,
                                publcatn_yy: jsonData.Poplitloanbook[1].row[i].PUBLCATN_YY,
                                book_image_url: jsonData.Poplitloanbook[1].row[i].BOOK_IMAGE_URL
                            });

                            form.appendChild(input);
                            document.body.appendChild(form);
                            form.submit();
                        })
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
<section>
    <h2>도서 검색</h2>
    <form method="post" action="library/searchResult">
        <input type="text" name="keyword" placeholder="도서명을 입력하세요">
        <button type="submit">검색</button>
    </form>
</section>

<section>
    <h2>이달의 추천 도서</h2>
    <div id="book1" class="book">
        <img id="image1">
    </div>
    <div id="book2" class="book">
        <img id="image2">
    </div>
    <div id="book3" class="book">
        <img id="image3">
    </div>
    <div id="book4" class="book">
        <img id="image4">
    </div>
    <div id="book5" class="book">
        <img id="image5">
    </div>
</section>

<section>
    <c:if test="${empty sessionScope.id}">
        <a style='color:black' href = '<%=request.getContextPath() %>/member/login'><h2>대출 현황</h2></a>
        <a style='color:black' href = '<%=request.getContextPath() %>/member/login'><h2>마이페이지</h2></a>
    </c:if>
    <c:if test="${not empty sessionScope.id}">
        <a style='color:black' href = '<%=request.getContextPath() %>/library/login'><h2>대출 현황</h2></a>
        <a style='color:black' href = '<%=request.getContextPath() %>/member/myPage'><h2>마이페이지</h2></a>
    </c:if>
</section>

<footer>
</footer>
</body>
</html>