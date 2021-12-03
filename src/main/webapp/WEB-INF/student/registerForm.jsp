<%@ page import="java.util.Collection" %>
<%@ page import="model.College" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! String name, email, err;%>
<html>
<head>
    <title>회원가입</title>
    <script>
        function studentCreate() {
            if (form.name.value == "") {
                alert("이름을 입력하세요.");
                form.name.focus();
                return false;
            }

            if (form.email.value == "") {
                alert("이메일을 입력하세요.");
                form.email.focus();
                return false;
            }

            if (form.password.value == "") {
                alert("비밀번호를 입력하세요.");
                form.password.focus();
                return false;
            }

            if (form.password.value != form.password2.value) {
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
        function emailCheck(targetUri) {
            form.action = targetUri;
            form.method = "POST";
            if (form.name.value == "") {
                alert("이름을 입력하세요.");
                form.name.focus();
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
        .frm {
            margin-top: 7%;
        }
        table {
            width: 55%;
            font-size: 13px;
        }
        @font-face {
            font-family: 'SBAggroB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        @font-face {
            font-family: 'SBAggroL';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroL.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        #logo {
            margin-top: 0;
            width: 130px;
        }
        .title {
            font-size: 45px;
            font-weight: bold;
            text-align: left;
        }
        input {
            margin: 2px;
            padding: 5px;
            font-family: SBAggroL;
        }
        #college {
            padding: 5px 10px;
            font-size: 12px;
            margin: 2px;
        }
        td {
            font-family: SBAggroL;
        }
        button {
            font-family: SBAggroL;
            height: 30px;
            width: 370px;
        }
        select {
            font-family: SBAggroL;
        }
        option {
            font-family: SBAggroL;
        }
    </style>
</head>
<body>
<%
    name = (String) request.getAttribute("name");
    email = (String) request.getAttribute("email");
    err = (String) request.getAttribute("err");
    if (err != null) {
        if (err.equals("0")) {
            out.println("<script>alert('사용 가능한 아이디입니다.');</script>");
        } else {
            out.println("<script>alert('이미 존재하는 아이디입니다.');</script>");
        }
    }
%>
<form name="form" method="POST" action="${pageContext.request.contextPath}/student/register">
    <div class="frm" align="center">
        <table>
            <tr>
                <td rowspan="3">
                    <a href="${pageContext.request.contextPath}/student/login"><img src="/images/logo-font.png" id="logo"/><br>
                    <span class="title" style="color:black; font-family: SBAggroB">Roomie</span></a>
                </td>
                <td width="20%">
                    <br>
                    이름<br>
                    <% if (name != null) { %>
                        <input type="text" size="40%" name="name" value="<%=name%>">
                    <% }else { %>
                        <input type="text" placeholder="실명을 입력하세요." size="40%" name="name">
                    <% } %>
                </td>
            </tr>
            <tr>
                <td>
                    <br>
                    아이디<br>
                    <% if (email != null) { %>
                        <input type="email" size="30%" name="email" value="<%=email%>">
                    <% }else { %>
                        <input type="email" placeholder="본인의 학교 웹메일을 입력하세요." size="30%" name="email">
                    <% } %><button style="width:20%" type="button" value="중복확인" onClick="emailCheck('${pageContext.request.contextPath}/student/mailCheck')">중복확인</button>
                </td>
            </tr>
            <tr>
                <td>
                    <br>
                    비밀번호<br>
                    <% if (err != null && err.equals("0")) { %>
                        <input type="password" placeholder="비밀번호를 입력하세요." size="40%" name="password">
                    <% }else { %>
                        <input disabled type="password" placeholder="비밀번호를 입력하세요." size="40%" name="password">
                    <% } %>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <br>
                    비밀번호 확인<br>
                    <% if (err != null && err.equals("0")) { %>
                        <input type="password" placeholder="비밀번호를 한 번 더 입력하세요." size="40%" name="password2">
                    <% }else { %>
                        <input disabled type="password" placeholder="비밀번호를 한 번 더 입력하세요." size="40%" name="password2">
                    <% } %>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <br>
                    성별<br>
                    <% if (err != null && err.equals("0")) { %>
                        <input type = "radio" name = "gender" value = "0">남자&nbsp;&nbsp;&nbsp;
                        <input type = "radio" name = "gender" value = "1">여자
                    <% }else { %>
                        <input disabled type = "radio" name = "gender" value = "0">남자&nbsp;&nbsp;&nbsp;
                        <input disabled type = "radio" name = "gender" value = "1">여자
                    <% } %>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <br>
                    학교<br>
                    <% if (err != null && err.equals("0")) { %>
                        <select id="college" name="college">
                            <c:forEach var="col" items="${colList}">
                                <option value="${col.c_id}">${col.c_name}</option>
                            </c:forEach>
                        </select>
                    <% }else { %>
                        <select disabled id="college" name="college">
                            <c:forEach var="col" items="${colList}">
                                <option value="${col.c_id}">${col.c_name}</option>
                            </c:forEach>
                        </select>
                    <% } %>
                </td>
            </tr>
            <tr>
                <td></td>
                <td>
                    <br>
                    <% if (err != null && err.equals("0")) { %>
                        <button style="width:100%" type="button" value="가입하기" onClick="studentCreate()">가입하기</button>
                    <% }else { %>
                        <button style="width:100%" disabled type="button" value="가입하기">가입하기</button>
                    <% } %>
                </td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>