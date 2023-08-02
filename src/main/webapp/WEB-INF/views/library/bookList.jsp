<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>BOOK LIST</title>
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
            align-items: center;
        }

        .book-item img {
            width: 150px;
            height: 200px;
            object-fit: cover;
            margin-right: 10px;
        }

        table {
            border-collapse: collapse;
            width: 100%;
        }

        th, td {
            border: 1px solid black;
            padding: 8px;
            text-align: center;
        }
    </style>
    <script>
        <%@ page import="com.fasterxml.jackson.databind.ObjectMapper" %><%@ page import="com.my.library.model.Library"%><%@ page import="java.util.List"%>

        <%
            List<Library> list = (List<Library>) request.getAttribute("list");

            ObjectMapper objectMapper = new ObjectMapper();
            String jsonList = objectMapper.writeValueAsString(list);
        %>

        var bookList = <%= jsonList %>;

        $(document).ready(function () {
            if (bookList.length == 0) {
                $('.book-list').append($('<br><h5 style="text-align: center">').text("대출 도서가 없습니다."));
            } else {
                $('.book-item').each(function () {
                    const res_date = new Date($(this).find('.res_date').text());
                    const exp_date = new Date($(this).find('.exp_date').text());

                    res_date.setDate(res_date.getDate() + 21);

                    const extendButton = $('<button class="extBtn btn btn-primary">').text("반납 연기");

                    if (res_date < exp_date) {
                        $(this).find('.extend').append("반납 연기 불가");
                    } else {
                        $(this).find('.extend').append(extendButton);
                    }
                });

                $('.extBtn').click(function () {
                    var id = '<%= (String)session.getAttribute("id") %>';
                    var rki_no = $(this).closest('.book-item').find('.rki_no').val();

                    $.ajax({
                        type: "POST",
                        url: "/extend",
                        data: {
                            id: id,
                            rki_no: rki_no
                        },
                        success: function () {
                            location.reload();
                        },
                        error: function () {
                            alert("실패");
                        },
                    });
                });
            }
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
<div class="book-list">
<c:forEach var="list" items="${list}">
    <div class="book-item" id="book-item">
        <input type="hidden" class="rki_no" id="rki_no" value="${list.rki_no}">
        <img src="${list.book_image_url}" alt="도서 이미지"/>
        <h3 class="title">${list.book_nm_info}</h3>
        <p class="author">${list.author_nm_info}</p>
        <p class="publisher">${list.publshcmpy_nm}</p>
        <table>
            <tr>
                <th>대출일</th>
                <th>반납 예정일</th>
                <th>반납 연기</th>
            </tr>
            <tr>
                <td class="res_date" >${list.res_date}</td>
                <input type="hidden" class="res_date" id="res_date" value="${list.res_date}">
                <td class="exp_date">${list.exp_date}</td>
                <input type="hidden" class="exp_date" id="exp_date" value="${list.exp_date}">
                <td class="extend"></td>
            </tr>
        </table>
    </div>
</c:forEach>
</div>
</body>
</html>