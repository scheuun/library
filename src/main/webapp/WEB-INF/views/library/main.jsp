<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%--
  Created by IntelliJ IDEA.
  User: sche1
  Date: 2022-11-10
  Time: 오후 3:31
  To change this template use File | Settings | File Templates.
--%>
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
</head>
<body>
<header>
    <h1>도서관</h1>
</header>
<div style="text-align: right">
    <a style='color:black' href = '<%=request.getContextPath() %>/member/login'>로그인</a> |
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
    </div>
    <div class="book">
    </div>
</section>

<section>
    <h2>대출 현황</h2><h2>대출 이력</h2><h2>마이페이지</h2>
</section>

<footer>
</footer>
</body>
</html>