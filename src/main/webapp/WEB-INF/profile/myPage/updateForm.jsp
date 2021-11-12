<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>프로필 수정</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
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
        }
    </script>
    <style>
        @font-face {
            font-family: 'SBAggroB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        #logo {
            margin-top: -2.5%;
            width: 6%;
        }

        h3 {
            font-family: SBAggroB;
            float: left;
        }
        th, td {
            font-family: 돋움;
            font-size: 12px;
            line-height: 18px;
            padding-left: 10px;
            padding-right: 10px;
        }
        .title {
            font-family: 돋움;
            font-size: 12pt;
            font-weight: bold;
            color: Black;
            background-color: Beige;
            line-height: 22px;
        }
        /* Form css */
        .text, .textarea, .password, .file, .select {
            font-family: 돋움;
            font-size: 8pt;
            color: #333333;
        }
        table.commTable {
            background: MediumBlue;
        }
        td.commHead, th.commHead {
            height: 22px;
            text-align: center;
            background: PowderBlue;
            font-weight: bold;
        }
        td.commCell {
            text-align: left;
            background: White;
            padding-left: 10px;
            padding-right: 10px;
        }
    </style>
</head>
<body>

<h3>&nbsp;Roomie</h3>
<img src="images/logo-font.png" id="logo" />

<br>
<!-- Update Form  -->
<form name="form" method="POST" action="${pageContext.serveltContext.contextPath}/profile/update">
    <input type="hidden" name="s_id" value="${profile.s_id}"/>
    <table style="width: 100%">
        <tr>
            <td width="20"></td>
            <td>
                <table>
                    <tr>
                        <td class="title">&nbsp;&nbsp;<b>프로필 관리 - 수정</b>&nbsp;&nbsp;</td>
                    </tr>
                </table>
                <br>
                <table class="commTable">
                    <tr height="40">
                        <td class="commHead">이름</td>
                        <td class="commCell">
                            <input type="text" style="width: 240px" name="name" value="${profile.name}">
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">프로필 이미지</td>
                        <td class="commCell">
                            <input type="radio" name="pr_img" value="0"
                            <c:if test="${profile.pr_img eq '0'}"> checked </c:if>>
                            <img src="">
                            <input type="radio" name="pr_img" value="1"
                            <c:if test="${profile.pr_img eq '1'}"> checked </c:if>>
                            <img src="">
                            <input type="radio" name="pr_img" value="2"
                            <c:if test="${profile.pr_img eq '2'}"> checked </c:if>>
                            <img src="">
                            <input type="radio" name="pr_img" value="3"
                            <c:if test="${profile.pr_img eq '3'}"> checked </c:if>>
                            <img src="">
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">나이</td>
                        <td class="commCell">
                            <input type="text" style="width: 240px" name="age" value="${profile.age}">
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">잠버릇</td>
                        <td class="commCell">
                            <input type="radio" name="sleep_habit" value="0"
                            <c:if test="${profile.sleep_habit eq '0'}"> checked </c:if>>코골이
                            <input type="radio" name="sleep_habit" value="1"
                            <c:if test="${profile.sleep_habit eq '1'}"> checked </c:if>>이갈이
                            <input type="radio" name="sleep_habit" value="2"
                            <c:if test="${profile.sleep_habit eq '2'}"> checked </c:if>>몽유병
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">생활형</td>
                        <td class="commCell">
                            <input type="radio" name="lifestyle" value="0"
                            <c:if test="${profile.lifestyle eq '0'}"> checked </c:if>>아침형
                            <input type="radio" name="lifestyle" value="1"
                            <c:if test="${profile.lifestyle eq '1'}"> checked </c:if>>저녁형
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">흡연 여부</td>
                        <td class="commCell">
                            <input type="radio" name="smoking" value="0"
                            <c:if test="${profile.smoking eq '0'}"> checked </c:if>>O
                            <input type="radio" name="smoking" value="1"
                            <c:if test="${profile.smoking eq '1'}"> checked </c:if>>X
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">학년</td>
                        <td class="commCell">
                            <input type="radio" name="grade" value="1"
                            <c:if test="${profile.grade eq '1'}"> checked </c:if>>1학년
                            <input type="radio" name="grade" value="2"
                            <c:if test="${profile.grade eq '2'}"> checked </c:if>>2학년
                            <input type="radio" name="grade" value="3"
                            <c:if test="${profile.grade eq '3'}"> checked </c:if>>3학년
                            <input type="radio" name="grade" value="4"
                            <c:if test="${profile.grade eq '4'}"> checked </c:if>>4학년
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">학과</td>
                        <td class="commCell">
                            <input type="text" style="width: 240px" name="major" value="${profile.major}">
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">MBTI</td>
                        <td class="commCell">
                            <select name="mbti">
                                <option value="0" <c:if test="${profile.mbti eq '0'}"> selected </c:if>ENFJ</option>
                                <option value="1" <c:if test="${profile.mbti eq '1'}"> selected </c:if>ENFP</option>
                                <option value="2" <c:if test="${profile.mbti eq '2'}"> selected </c:if>ENTJ</option>
                                <option value="3" <c:if test="${profile.mbti eq '3'}"> selected </c:if>ENTP</option>
                                <option value="4" <c:if test="${profile.mbti eq '4'}"> selected </c:if>ESFJ</option>
                                <option value="5" <c:if test="${profile.mbti eq '5'}"> selected </c:if>ESFP</option>
                                <option value="6" <c:if test="${profile.mbti eq '6'}"> selected </c:if>ESTJ</option>
                                <option value="7" <c:if test="${profile.mbti eq '7'}"> selected </c:if>ESTP</option>
                                <option value="8" <c:if test="${profile.mbti eq '8'}"> selected </c:if>INFJ</option>
                                <option value="9" <c:if test="${profile.mbti eq '9'}"> selected </c:if>INFP</option>
                                <option value="10" <c:if test="${profile.mbti eq '10'}"> selected </c:if>INTJ</option>
                                <option value="11" <c:if test="${profile.mbti eq '11'}"> selected </c:if>INTP</option>
                                <option value="12" <c:if test="${profile.mbti eq '12'}"> selected </c:if>ISFJ</option>
                                <option value="13" <c:if test="${profile.mbti eq '13'}"> selected </c:if>ISFP</option
                                <option value="14" <c:if test="${profile.mbti eq '14'}"> selected </c:if>ISTJ</option>
                                <option value="15" <c:if test="${profile.mbti eq '15'}"> selected </c:if>ISTP</option>
                            </select>
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">청소주기</td>
                        <td class="commCell">
                            <input type="radio" name="cleaning" value="0"
                            <c:if test="${profile.cleaning eq '0'}"> checked </c:if>>매일
                            <input type="radio" name="cleaning" value="1"
                            <c:if test="${profile.cleaning eq '1'}"> checked </c:if>>3일
                            <input type="radio" name="cleaning" value="2"
                            <c:if test="${profile.cleaning eq '2'}"> checked </c:if>>1주
                            <input type="radio" name="cleaning" value="3"
                            <c:if test="${profile.cleaning eq '3'}"> checked </c:if>>2주
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">실내 취식여부</td>
                        <td class="commCell">
                            <input type="radio" name="indoor_eating" value="0"
                            <c:if test="${profile.indoor_eating eq '0'}"> checked </c:if>>냄새 나는 음식도 가능
                            <input type="radio" name="indoor_eating" value="1"
                            <c:if test="${profile.indoor_eating eq '1'}"> checked </c:if>>냄새 안나는 음식만 가능
                            <input type="radio" name="indoor_eating" value="2"
                            <c:if test="${profile.indoor_eating eq '2'}"> checked </c:if>>불가능
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">생필품 공유여부</td>
                        <td class="commCell">
                            <input type="radio" name="sharing" value="0"
                            <c:if test="${profile.sharing eq '0'}"> checked </c:if>>전부 가능
                            <input type="radio" name="sharing" value="1"
                            <c:if test="${profile.sharing eq '1'}"> checked </c:if>>공용 용품만 가능
                            <input type="radio" name="sharing" value="2"
                            <c:if test="${profile.sharing eq '2'}"> checked </c:if>>전부 불가능
                        </td>
                    </tr>
                    <tr height="40">
                        <td class="commHead">체질</td>
                        <td class="commCell">
                            <input type="radio" name="habitude" value="0"
                            <c:if test="${profile.habitude eq '0'}"> checked </c:if>>추위를 탐
                            <input type="radio" name="habitude" value="1"
                            <c:if test="${profile.habitude eq '1'}"> checked </c:if>>더위를 탐
                            <input type="radio" name="habitude" value="2"
                            <c:if test="${profile.habitude eq '2'}"> checked </c:if>>둘 다 안탐
                        </td>
                    </tr>
                </table>
                <br>
                <table style="width: 100%">
                    <tr>
                        <td align="left">
                            <input type="button" value="수정" onClick="profModify()"> &nbsp;
                            <input type="button" value="취소" onClick="history.back()">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</form>
</body>
</html>