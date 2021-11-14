<%@page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! Profile profile; %>
<html>
<head>
    <title>마이 페이지</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script>
        /*function update() {/!*
            form.action = targetUri;
            form.method = "POST";  *!/    //register form 요청
            form.submit();
        }*/
        function update() {
            form.method = "GET";
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
            width: 70px;
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
<img src="/images/logo-font.png" id="logo"/>
<% profile = (Profile) request.getAttribute("profile");%>
<br>
<table style="width:100%">
    <tr>
        <td width="20"></td>
        <td>
            <table>
                <tr>
                    <td class="title">&nbsp;&nbsp;<b>마이 페이지</b>&nbsp;&nbsp;</td>
                </tr>
            </table>
            <br>
            <table class="commTable">
                <tr>
                    <td class="commHead">이름</td>
                    <td class="commCell">
                        ${profile.name}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">프로필 이미지</td>
                    <td class="commCell">
                        ${profile.pr_img}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">나이</td>
                    <td class="commCell">
                        ${profile.age}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">잠버릇</td>
                    <td class="commCell">
                        ${profile.sleep_habit}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">생활형</td>
                    <td class="commCell">
                        ${profile.lifestyle}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">흡연 여부</td>
                    <td class="commCell">
                        ${profile.smoking}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">학년</td>
                    <td class="commCell">
                        ${profile.grade}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">학과</td>
                    <td class="commCell">
                        ${profile.major}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">MBTI</td>
                    <td class="commCell">
                        ${profile.mbti}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">청소주기</td>
                    <td class="commCell">
                        ${profile.cleaning}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">실내 취식여부</td>
                    <td class="commCell">
                        ${profile.indoor_eating}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">생필품 공유여부</td>
                    <td class="commCell">
                        ${profile.sharing}
                    </td>
                </tr>
                <tr>
                    <td class="commHead">체질</td>
                    <td class="commCell">
                        ${profile.habitude}
                    </td>
                </tr>
            </table>
            <br>
            <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/profile/update">
                <input type="hidden" name="s_id" value="${profile.s_id}">
                <input type="button" class="button" value="수정하기" onclick="update()">
            </form>
            <br><br>

            <!-- 수정이 실패한 경우 exception 객체에 저장된 오류 메시지를 출력 -->
            <%-- <c:if test="${updateFailed}">
                 <font color="red"><c:out value="${exception.getMessage()}" /></font>
             </c:if>--%>
        </td>
    </tr>
</table>
</body>
</html>

