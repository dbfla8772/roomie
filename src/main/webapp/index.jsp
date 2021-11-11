<%--
  Created by IntelliJ IDEA.
  User: chdms
  Date: 2021-11-11
  Time: 오전 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
        table {
            margin-top: 230px;
            width: 60%;
            /*border: black 1px solid;*/
        }
        td {
            text-align: right;
        }
        th {
            width: 70%;
            font-size: 40px;
            font-weight: bold;
            text-align: left;
        }
        input {
            margin: 2px;
            padding: 5px;
        }
    </style>
</head>
<body>
<br>
<form name="form" method="POST" action="<c:url value='/student/login' />">
    <div align=center>
        <table>
            <tr>
                <th rowspan="4">Roomie<br>루미</th>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <p/>
                    ID <input type="email" size="30" name="email">
                </td>
            </tr>
            <tr>
                <td>
                    P/W <input type="password" size="30" name="password">
                </td>
            </tr>
            <tr>
                <td>
                    <input type="button" style="width: 70px;" value="회원가입" onClick="studentCreate('<c:url value='/student/register'/>')">
                    <input type="button" style="width: 70px;" value="로그인" onClick="login()">
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>