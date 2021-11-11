<%--
  Created by IntelliJ IDEA.
  User: chdms
  Date: 2021-11-11
  Time: 오전 11:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<link rel="stylesheet" href="/css/bootstrap.css">
<html>
<head>
    <title>회원가입</title>
    <script>
        function studentCreate() {
            if (from.name.value == "") {
                alert("이름을 입력하세요.");
                form.name.focus();
                return false;
            }
            if (from.email.value == "") {
                alert("이메일을 입력하세요.");
                form.email.focus();
                return false;
            }
            if (from.password.value == "") {
                alert("비밀번호를 입력하세요.");
                form.password.focus();
                return false;
            }
            if (from.password.value != form.password2.value) {
                alert("비밀번호가 일치하지 않습니다.");
                form.password2.focus();
                return false;
            }
            var emailExp = /^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/;
            if(emailExp.test(form.email.value) == false) {
                alert("이메일 형식이 올바르지 않습니다.");
                form.email.focus();
                return false;
            }
            form.submit();
        }
    </script>
    <style>
        table {
            margin-top: 230px;
            width: 70%;
        }
        th {
            width: 70%;
            font-size: 40px;
            font-weight: bold;
            text-align: left;
        }
    </style>
</head>
<body>
<form name="form" method="POST" action="<c:url value='/student/register' />">
    <div align=center>
        <table>
            <tr>
                <th rowspan="2">Roomie<br>루미</th>
                <td>
                    이름<br>
                    <input type="text" placeholder="닉네임을 입력하세요." size="40" name="name"><p/>
                </td>
            </tr>
            <tr>
                <td>
                    아이디<br>
                    <input type="email" placeholder="본인의 학교 웹메일을 입력하세요." size="40" name="email"><p/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    비밀번호<br>
                    <input type="password" placeholder="비밀번호는 6~8자로 입력하세요." size="40" name="password"><p/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    비밀번호 확인<br>
                    <input type="password2" placeholder="비밀번호를 한 번 더 입력하세요." size="40" name="password"><p/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    성별<br>
                    <input type = "radio" name = "gender" value = "0">남자
                    <input type = "radio" name = "gender" value = "1">여자<p/>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    학교<br>

                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <input type="button" style="width: 302px;" value="가입하기" onClick="studentCreate()">
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
