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
 <meta charset="utf-8">
<title>JOIN</title>
<script>
</script>
</head>
<body>
<br><br>
<h4 style='text-align:center;'><b>회원가입</b></h4><hr><br>
<div class='row'>
    <div class='col' id='view1' style='text-align:center;'>
        <label>아이디&emsp;</label><br>
        <input type='text' id='id' name='id'/><br>
        <span class="idMsg" style ="color:red;display:none;">필수 정보입니다.</span>
        <label>비밀번호</label><br>
        <input type='password' id='pwd' name='pwd'/><br>
        <span class="pwdMsg" style ="color:red;display:none;">필수 정보입니다.</span>
        <label>비밀번호 확인</label><br>
        <input type='password' id='pwdChk' name='pwdChk'/><br>
        <span class="pwdChkMsg" style ="color:red;display:none;">필수 정보입니다.</span>
        <label>이메일</label><br>
        <input type='text' id='email' name='email'/>
        <span class="emailMsg" style ="color:red;display:none;">필수 정보입니다.</span><br><br><br>
        <div  style="display: flex; justify-content: center;">
              <button type='button' class='btn btn-secondary btn-block'
                        id='joinBtn' style="width:120">회원가입</button>
        </div>
    </div>
    <div class='col' id='view2'  style ="display:none;text-align:center" >
        <h6>회원가입 완료</h6><br><br><br>
        <div  style="display: flex; justify-content: center;">
            <button type='button' class='btn btn-secondary btn-block'
                    id='mainBtn' style="width: 120" onclick="location.href='/'">메인으로</button>
        </div>
    </div>
</div>
</body>
</html>