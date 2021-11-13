<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>로그인</title>
    <script>
        function login() {
            if (form.email.value == "") {
                alert("사용자 ID(email)을 입력하세요.");
                form.email.focus();
                return false;
            }
            if (form.password.value == "") {
                alert("비밀번호를 입력하세요.");
                form.password.focus();
                return false;
            }
            form.submit();
        }
        function studentCreate(targetUri) {
            form.action = targetUri;
            form.method="GET";      //register form 요청
            form.submit();
        }
    </script>
    <style>
        @font-face {
            font-family: 'SBAggroB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        .main {
            position: relative;
            top: 200px;
        }
        #logo {
            width: 130px;
            margin-left: -4.5%;
            margin-top: -1.3%;
        }
        .roomie {
            font-family: SBAggroB;
            font-size: 45px;
            font-weight: bold;
            float: left;
            position: relative;
            left: 23%;
            padding-bottom: 50px;
            /*border: black 1px solid;*/
        }
        .in {
            font-size: 13px;
            float: right;
            padding-top: 15px;
            margin-left: 20%;
            margin-right: 23%;
        }
        input {
            margin: 2px;
            padding: 5px;
        }
        .img {
            position: relative;
            top: 13px;
        }
        .btn {
            position: relative;
            float: right;
        }
    </style>
</head>
<body>
<br>
<form name="form" method="POST" action="${pageContext.request.contextPath}/student/login">
    <div class="main">
        <div class="roomie" style="font-family: SBAggroB">
            <img src="images/logo-font.png" id="logo" /><br>
            Roomie
        </div>
        <div class="in">
            <br>
            <input type="image" class="img" src="/images/id.png" width="20px" height="20px">
            <input type="email" size="30" name="email">
            <br>
            <input type="image" class="img" src="/images/password2.png" width="20px" height="20px">
            <input type="password" size="30" name="password">
            <p/>
            <input type="button" class="btn" value="회원가입" onClick="studentCreate('${pageContext.request.contextPath}/student/register')">&nbsp;
            <input type="button" class="btn" value="로그인" onClick="login()">
        </div>
    </div>
</form>
</body>
</html>