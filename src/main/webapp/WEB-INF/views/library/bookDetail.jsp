<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib prefix='c' uri='http://java.sun.com/jsp/jstl/core'%>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>BOOK DETAIL</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
        }

        #book-details {
            max-width: 600px;
            margin: 0 auto;
            background-color: #f5f5f5;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }

        h1 {
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
</head>
<body>
<div id="book-details">
    <h1>${book_nm_info}</h1>
    <div class="book">
        <img src=${book_image_url} >
    </div>
    <p>저자: ${author_nm_info}</p>
    <p>출판사: ${publshcmpy_nm}</p>
    <p>출판 날짜: ${publcatn_yy}</p>
    <p>책상태: (대출 가능 여부)</p>
</div>
</body>
</html>