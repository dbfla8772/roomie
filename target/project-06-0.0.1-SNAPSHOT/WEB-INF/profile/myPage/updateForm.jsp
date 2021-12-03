<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Profile profile = (Profile) request.getAttribute("profile");
%>
<!DOCTYPE html>
<html>
<head>
    <title>프로필 수정</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script>
        function profModify() {
            if (form.name.value == "") {
                alert("이름을 입력하십시오.");
                form.name.focus();
                return false;
            }
            if (form.age.value == "") {
                alert("나이를 입력하십시오.");
                form.age.focus();
                return false;
            }
            if (form.major.value == "") {
                alert("학과를 입력하십시오.");
                form.major.focus();
                return false;
            }
            form.submit();
            alert("수정되었습니다.");
        }
    </script>
    <style>
        .dv {
            margin-top: 0%;
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

        html, body {
            margin: 0;
            width: auto;
            height: auto;
            margin-bottom: 4%;
        }

        h3 {
            font-family: SBAggroB;
            float: left;
            padding-top: 30px;
            padding-left: 100px;
            color: black;
        }

        h4 {
            font-family: SBAggroL;
        }

        #logo {
            width: 70px;
            margin-left: 5px;
        }

        .dv {
            margin-top: 50px;
            margin-bottom: 30px;
        }

        td {
            padding-left: 10px;
            padding-bottom: 15px;
            font-family: SBAggroL;
        }

        ul.space_list li {
            margin-bottom: 1em;
        }

        ul.none {
            margin-bottom: 1em;
            list-style: none;
        }

        .layer {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%)
        }

        .button {
            border: 0px;
            border-radius: 10px;
            background-color: lightgray;
            padding: 7px 50px 7px 50px;
        }
    </style>
</head>
<body>

<a href = "${pageContext.request.contextPath}/student/main" style="color: black"><h3>&nbsp;Roomie</h3></a>
<a href = "${pageContext.request.contextPath}/student/main"><img src="/images/logo-font.png" id="logo"/></a>

<!-- Update Form  -->
<form name="form" method="POST" action="${pageContext.servletContext.contextPath}/profile/update">
    <input type="hidden" name="s_id" value="${profile.s_id}"/>
    <div style="text-align: right; padding-left: 100px; padding-right: 80px;">
        <h4 style="text-align: right; padding-left: 100px; padding-right: 80px;">프로필 수정</h4><br>
    </div>

    <div class="dv" align="center">
        <table style="border-radius: 10px; align: center;">
            <tr>
                <td colspan="2" rowspan="2">
                    <input type="radio" name="pr_img" value="0"
                        <%if (profile.getPr_img() == 0) {%> checked <%} %>>
                    <img src="/images/man1.png" width="150px" height="150px">
                    <input type="radio" name="pr_img" value="1"
                        <%if (profile.getPr_img() == 1) {%> checked <%} %>>
                    <img src="/images/man2.png" width="150px" height="150px"><br>
                    <input type="radio" name="pr_img" value="2"
                        <%if (profile.getPr_img() == 2) {%> checked <%} %>>
                    <img src="/images/woman1.png" width="150px" height="150px">
                    <input type="radio" name="pr_img" value="3"
                        <%if (profile.getPr_img() == 3) {%> checked <%} %>>
                    <img src="/images/woman2.png" width="150px" height="150px">
                </td>
            </tr>
            <tr>
                <td width="100"></td>
                <td width="400" rowspan="3">
                    <table style="font-size: large; width:500px;">
                        <tr>
                            <td>전공</td>
                            <td>
                                <input type="text" style="width: 240px" name="major" value="${profile.major}">
                            </td>
                        </tr>
                        <tr>
                            <td>학년</td>
                            <td>
                                <input type="radio" name="grade" value="0"
                                    <%if (profile.getGrade() == 0) {%> checked <%} %>>1학년
                                <input type="radio" name="grade" value="1"
                                    <%if (profile.getGrade() == 1) {%> checked <%} %>>2학년
                                <input type="radio" name="grade" value="2"
                                    <%if (profile.getGrade() == 2) {%> checked <%} %>>3학년
                                <input type="radio" name="grade" value="3"
                                    <%if (profile.getGrade() == 3) {%> checked <%} %>>4학년
                            </td>
                        </tr>
                        <tr>
                            <td>나이</td>
                            <td>
                                <input type="number" style="width: 240px" name="age" value="${profile.age}" min="20" max="30">
                            </td>
                        </tr>
                        <tr>
                            <td>흡연유무</td>
                            <td>
                                <input type="radio" name="smoking" value="0"
                                    <%if (profile.getSmoking() == 0) {%> checked <%} %>>O
                                <input type="radio" name="smoking" value="1"
                                    <%if (profile.getSmoking() == 1) {%> checked <%} %>>X
                            </td>
                        </tr>
                        <tr>
                            <td>잠버릇</td>
                            <td>
                                <input type="radio" name="sleep_habit" value="0"
                                    <%if (profile.getSleep_habit() == 0) {%> checked <%} %>>없음
                                <input type="radio" name="sleep_habit" value="1"
                                    <%if (profile.getSleep_habit() == 1) {%> checked <%} %>>코골이
                                <input type="radio" name="sleep_habit" value="2"
                                    <%if (profile.getSleep_habit() == 2) {%> checked <%} %>>이갈이
                                <input type="radio" name="sleep_habit" value="3"
                                    <%if (profile.getSleep_habit() == 3) {%> checked <%} %>>몽유병
                            </td>
                        </tr>
                        <tr>
                            <td>생활 패턴</td>
                            <td>
                                <input type="radio" name="lifestyle" value="0"
                                    <%if (profile.getLifestyle() == 0) {%> checked <%} %>>아침형
                                <input type="radio" name="lifestyle" value="1"
                                    <%if (profile.getLifestyle() == 1) {%> checked <%} %>>저녁형
                            </td>
                        </tr>
                        <tr>
                            <td>청소 주기</td>
                            <td>
                                <input type="radio" name="cleaning" value="0"
                                    <%if (profile.getCleaning() == 0) {%> checked <%} %>>매일
                                <input type="radio" name="cleaning" value="1"
                                    <%if (profile.getCleaning() == 1) {%> checked <%} %>>3일
                                <input type="radio" name="cleaning" value="2"
                                    <%if (profile.getCleaning() == 2) {%> checked <%} %>>1주
                                <input type="radio" name="cleaning" value="3"
                                    <%if (profile.getCleaning() == 3) {%> checked <%} %>>2주
                            </td>
                        </tr>
                        <tr>
                            <td>실내취식</td>
                            <td>
                                <input type="radio" name="sharing" value="0"
                                    <%if (profile.getSharing() == 0) {%> checked <%} %>>가능
                                <input type="radio" name="sharing" value="1"
                                    <%if (profile.getSharing() == 1) {%> checked <%} %>>불가능
                            </td>
                        </tr>
                        <tr>
                            <td>생필품 공유</td>
                            <td>
                                <input type="radio" name="sharing" value="0"
                                    <%if (profile.getSharing() == 0) {%> checked <%} %>>가능
                                <input type="radio" name="sharing" value="1"
                                    <%if (profile.getSharing() == 1) {%> checked <%} %>>불가능
                            </td>
                        </tr>
                        <tr>
                            <td>체질</td>
                            <td>
                                <input type="radio" name="habitude" value="0"
                                    <%if (profile.getHabitude() == 0) {%> checked <%} %>>추위를 탐
                                <input type="radio" name="habitude" value="1"
                                    <%if (profile.getHabitude() == 1) {%> checked <%} %>>더위를 탐
                                <input type="radio" name="habitude" value="2"
                                    <%if (profile.getHabitude() == 2) {%> checked <%} %>>둘 다 탐
                                <input type="radio" name="habitude" value="3"
                                    <%if (profile.getHabitude() == 3) {%> checked <%} %>>상관없음
                            </td>
                        </tr>
                        <tr>
                            <td>MBTI</td>
                            <td>
                                <select name="mbti">
                                    <option value="0" <% if(profile.getMbti() == 0) {%> selected <% } %>>ENFJ</option>
                                    <option value="1" <% if(profile.getMbti() == 1) {%> selected <% } %>>ENFP</option>
                                    <option value="2" <% if(profile.getMbti() == 2) {%> selected <% } %>>ENTJ</option>
                                    <option value="3" <% if(profile.getMbti() == 3) {%> selected <% } %>>ENTP</option>
                                    <option value="4" <% if(profile.getMbti() == 4) {%> selected <% } %>>ESFJ</option>
                                    <option value="5" <% if(profile.getMbti() == 5) {%> selected <% } %>>ESFP</option>
                                    <option value="6" <% if(profile.getMbti() == 6) {%> selected <% } %>>ESTJ</option>
                                    <option value="7" <% if(profile.getMbti() == 7) {%> selected <% } %>>ESTP</option>
                                    <option value="8" <% if(profile.getMbti() == 8) {%> selected <% } %>>INFJ</option>
                                    <option value="9" <% if(profile.getMbti() == 9) {%> selected <% } %>>INFP</option>
                                    <option value="10" <% if(profile.getMbti() == 10) {%> selected <% } %>>INTJ</option>
                                    <option value="11" <% if(profile.getMbti() == 11) {%> selected <% } %>>INTP</option>
                                    <option value="12" <% if(profile.getMbti() == 12) {%> selected <% } %>>ISFJ</option>
                                    <option value="13" <% if(profile.getMbti() == 13) {%> selected <% } %>>ISFP</option
                                    <option value="14" <% if(profile.getMbti() == 14) {%> selected <% } %>>ISTJ</option>
                                    <option value="15" <% if(profile.getMbti() == 15) {%> selected <% } %>>ISTP</option>
                                </select>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center">
                    닉네임: <input type="text" style="width: 240px" name="name" value="${profile.name}">
                </td>
                <td align="center">
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" name="activation" value="1"
                               style="margin-top: 0px; padding-top: 0px;"
                            <%if (profile.getActivation()==1) {%> checked <%} %>>
                    </div>
                </td>
            </tr>
<%--            <tr>--%>
<%--                <td align="center">--%>
<%--                    <% if (request.getAttribute("scrap").equals("false")) { %>--%>
<%--                    <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/scrap/view">--%>
<%--                        <input type="hidden" name="scrap_id" value="${profile.s_id}">--%>
<%--                        <input type="submit" class="button" value="스크랩" onclick="scrapBtn()">--%>
<%--                    </form>--%>
<%--                    <%} else {%>--%>
<%--                    <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/scrap/delete">--%>
<%--                        <input type="hidden" name="scrap_id" value="${profile.s_id}">--%>
<%--                        <input type="submit" class="button" value="스크랩 취소" onclick="scrapBtn()">--%>
<%--                    </form>--%>
<%--                    <%} %>--%>
<%--                </td>--%>
<%--                <td align="center">--%>
<%--                    <a href="${pageContext.request.contextPath}/mail/sendForm?receiver=${profile.s_id}"--%>
<%--                       onClick="window.open(this.href, '', 'width=600, height=550'); return false;">--%>
<%--                        <input type="submit" class="button" value="쪽지" style="margin-top: -9%">--%>
<%--                    </a>--%>
<%--                </td>--%>
<%--                <td width="100"></td>--%>
<%--            </tr>--%>
        </table>
    </div>
    <div style="text-align: right; margin-right: 80px;">
        <input type="button" value="수정" class="btn btn-outline-primary" onClick="profModify()"> &nbsp;
        <input type="button" value="취소" class="btn btn-outline-primary" onClick="history.back()" style="margin-right: 80px;">
    </div>
</form>
</body>
</html>