<%@page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! Profile profile; String img_url, smoking, sharing, lifestyle, grade, habitude, sleep_habit, cleaning, indoor_eating, mbti;%>
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

<a href = "${pageContext.request.contextPath}/student/main"><h3>&nbsp;Roomie</h3></a>
<a href = "${pageContext.request.contextPath}/student/main"><img src="/images/logo-font.png" id="logo"/></a>
<% profile = (Profile) request.getAttribute("profile");
    img_url = "/images/";
    if (profile.getPr_img()==0)
        img_url += "man1.png";
    else if (profile.getPr_img()==1)
        img_url += "man2.png";
    else if (profile.getPr_img()==2)
        img_url += "woman1.png";
    else
        img_url += "woman2.png";

    if (profile.getSmoking()==0)
        smoking = "O";
    else
        smoking = "X";

    if (profile.getSharing()==0)
        sharing = "O";
    else

        sharing = "X";
    if (profile.getLifestyle()==0)
        lifestyle = "아침형";
    else
        lifestyle = "저녁형";

    if (profile.getGrade()==0)
        grade = "1학년";
    else if (profile.getGrade()==1)
        grade = "2학년";
    else if (profile.getGrade()==2)
        grade = "3학년";
    else if (profile.getGrade()==3)
        grade = "4학년";

    if (profile.getHabitude()==0)
        habitude = "추위를 탐";
    else if (profile.getHabitude()==1)
        habitude = "더위를 탐";
    else
        habitude = "둘 다 안 탐";

    if (profile.getSleep_habit()==0)
        sleep_habit = "코골이";
    else if (profile.getSleep_habit()==1)
        sleep_habit = "이갈이";
    else
        sleep_habit = "몽유병";

    if (profile.getCleaning()==0)
        cleaning = "매일";
    else if (profile.getCleaning()==1)
        cleaning = "3일";
    else if (profile.getCleaning()==2)
        cleaning = "1주";
    else
        cleaning = "2주";

    if (profile.getIndoor_eating()==0)
        indoor_eating = "냄새나는 음식도 가능";
    else if (profile.getIndoor_eating()==0)
        indoor_eating = "냄새 안 나는 음식만 가능";
    else
        indoor_eating = "불가능";

    if (profile.getMbti()==0)
        mbti = "ENFJ";
    else if (profile.getMbti()==1)
        mbti = "ENFP";
    else if (profile.getMbti()==2)
        mbti = "ENTJ";
    else if (profile.getMbti()==3)
        mbti = "ENTP";
    else if (profile.getMbti()==4)
        mbti = "ESFJ";
    else if (profile.getMbti()==5)
        mbti = "ESFP";
    else if (profile.getMbti()==6)
        mbti = "ESTJ";
    else if (profile.getMbti()==7)
        mbti = "ESTP";
    else if (profile.getMbti()==8)
        mbti = "INFJ";
    else if (profile.getMbti()==9)
        mbti = "INFP";
    else if (profile.getMbti()==10)
        mbti = "INTJ";
    else if (profile.getMbti()==11)
        mbti = "INTP";
    else if (profile.getMbti()==12)
        mbti = "ISFJ";
    else if (profile.getMbti()==13)
        mbti = "ISFP";
    else if (profile.getMbti()==14)
        mbti = "ISTJ";
    else
        mbti = "ISTP";
%>
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
                        <img style="border-radius: 10px; width:300px; height:400px;" src="<%=img_url%>" width="100px" height="100px"/>
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
                        <%=sleep_habit%>
                    </td>
                </tr>
                <tr>
                    <td class="commHead">생활형</td>
                    <td class="commCell">
                        <%=lifestyle%>
                    </td>
                </tr>
                <tr>
                    <td class="commHead">흡연 여부</td>
                    <td class="commCell">
                        <%=smoking%>
                    </td>
                </tr>
                <tr>
                    <td class="commHead">학년</td>
                    <td class="commCell">
                        <%=grade%>
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
                        <%=mbti%>
                    </td>
                </tr>
                <tr>
                    <td class="commHead">청소주기</td>
                    <td class="commCell">
                        <%=cleaning%>
                    </td>
                </tr>
                <tr>
                    <td class="commHead">실내 취식여부</td>
                    <td class="commCell">
                        <%=indoor_eating%>
                    </td>
                </tr>
                <tr>
                    <td class="commHead">생필품 공유여부</td>
                    <td class="commCell">
                        <%=sharing%>
                    </td>
                </tr>
                <tr>
                    <td class="commHead">체질</td>
                    <td class="commCell">
                        <%=habitude%>
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