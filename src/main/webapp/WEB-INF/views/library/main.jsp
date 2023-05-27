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

                    const imageElement1 = document.getElementById("image1");
                    imageElement1.src = jsonData.Poplitloanbook[1].row[0].BOOK_IMAGE_URL;

                    const imageElement2 = document.getElementById("image2");
                    imageElement2.src = jsonData.Poplitloanbook[1].row[1].BOOK_IMAGE_URL;

                    const imageElement3 = document.getElementById("image3");
                    imageElement3.src = jsonData.Poplitloanbook[1].row[2].BOOK_IMAGE_URL;

                    const imageElement4 = document.getElementById("image4");
                    imageElement4.src = jsonData.Poplitloanbook[1].row[3].BOOK_IMAGE_URL;

                    const imageElement5 = document.getElementById("image5");
                    imageElement5.src = jsonData.Poplitloanbook[1].row[4].BOOK_IMAGE_URL;

                },
                error: function (data) {
                    console.log(data);
                    alert("실패");
                }
            });
        });

        function openImg() {
            window.location.href = "<%=request.getContextPath() %>/library/bookDetail";
        }
    </script>
</head>
<body>
<header>
    <h1>도서관</h1>
</header>
<div style="text-align: right">
    <c:if test="${empty sessionScope.id}">
        <a style='color:black' href = '<%=request.getContextPath() %>/member/login'>로그인</a> |
    </c:if>
    <c:if test="${not empty sessionScope.id}">
        <a style='color:black' href = '<%=request.getContextPath() %>/member/logout'>로그아웃</a> |
    </c:if>
    <a style='color:black' href = '<%=request.getContextPath() %>/member/join'>회원가입</a>
</div>
<section>
    <h2>도서 검색</h2>
    <form>
        <input type="text" placeholder="도서명을 입력하세요">
        <button type="submit">검색</button>
    </form>
</section>

<section>
    <h2>이달의 추천 도서</h2>
    <div class="book">
        <img id="image1" onclick="openImg()">
    </div>
    <div class="book">
        <img id="image2">
    </div>
    <div class="book">
        <img id="image3">
    </div>
    <div class="book">
        <img id="image4">
    </div>
    <div class="book">
        <img id="image5">
    </div>
</section>

<section>
    <c:if test="${empty sessionScope.id}">
        <a style='color:black' href = '<%=request.getContextPath() %>/member/login'><h2>대출 현황</h2></a>
        <a style='color:black' href = '<%=request.getContextPath() %>/member/login'><h2>대출 이력</h2></a>
        <a style='color:black' href = '<%=request.getContextPath() %>/member/login'><h2>마이페이지</h2></a>
    </c:if>
    <c:if test="${not empty sessionScope.id}">
        <a style='color:black' href = '<%=request.getContextPath() %>/library/login'><h2>대출 현황</h2></a>
        <a style='color:black' href = '<%=request.getContextPath() %>/library/login'><h2>대출 이력</h2></a>
        <a style='color:black' href = '<%=request.getContextPath() %>/member/myPage'><h2>마이페이지</h2></a>
    </c:if>
</section>

<footer>
</footer>
</body>
</html>