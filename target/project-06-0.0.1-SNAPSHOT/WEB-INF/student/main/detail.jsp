<%@ page import="model.Profile" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! Profile profile; String img_url, smoking, sharing, lifestyle, grade, habitude, sleep_habit, cleaning, indoor_eating, mbti, isScraped; %>
<html>
<head>
    <title>detail profile</title>

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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>
</head>
<body>
<div class="w-auto p-2" style="background-color: lightcyan; text-align: center;">
    <h4>당신의 루미를 찾아보세요!
        <button class="btn btn-outline-success" type="submit">자동매칭 하러가기</button>
    </h4>
</div>

<div>
    <a href="${pageContext.request.contextPath}/student/main"><h3>Roomie</h3></a>
    <img src="/images/logo-font.png" id="logo"/>
</div>

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

    if (profile.getSharing()==0)
        sharing = "가능";
    else
        sharing = "불가능";

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
    else if (profile.getHabitude()==2)
        habitude = "둘 다 탐";
    else
        habitude = "상관없음";

    if (profile.getSleep_habit()==0)
        sleep_habit = "없음";
    else if (profile.getSleep_habit()==1)
        sleep_habit = "코골이";
    else if (profile.getSleep_habit()==2)
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
        indoor_eating = "가능";
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

    isScraped = (String) request.getAttribute("scrap");
%>
<script>
    function scrapBtn() {
        <c:set var="s" value="<%=isScraped%>" />
        <c:if test="${s eq 'true'}">
        alert('스크랩 취소되었습니다.');
        </c:if>
        <c:if test="${s eq 'false'}">
        alert('스크랩되었습니다.');
        </c:if>
    }
</script>

<div class="dv" align="center">
    <table style="border-radius: 10px; align: center;">
        <tr>
            <td colspan="2" rowspan="2">
                <img style="border-radius: 10px; width:300px; height:400px; object-fit:contain;" src="<%=img_url%>"/>
            </td>
            <td colspan="3" style="width:400px; text-align: center; font-size: x-large; font-weight: 800; padding-top: 5px;">
                &nbsp;&nbsp;프로필 옵션<br><br>
            </td>
            <td/>
        </tr>
        <tr>
            <td width="100"></td>
            <td width="400" rowspan="3">
                <table style="font-size: large; width:400px;">
                    <tr>
                        <td>닉네임</td>
                        <td>: &emsp;&emsp;&emsp;${profile.name}</td>
                    </tr>
                    <tr>
                    <td>전공</td>
                    <td>: &emsp;&emsp;&emsp;${profile.major}</td>
                    </tr>
                    <tr>
                    <td>학년</td>
                    <td>: &emsp;&emsp;&emsp;<%=grade%></td>
                    </tr>
                    <tr>
                        <td>나이</td>
                        <td>: &emsp;&emsp;&emsp;${profile.age}</td>
                    </tr>
                    <tr>
                        <td>흡연유무</td>
                        <td>: &emsp;&emsp;&emsp;<%=smoking%></td>
                    </tr>
                    <tr>
                        <td>잠버릇</td>
                        <td>: &emsp;&emsp;&emsp;<%=sleep_habit%></td>
                    </tr>
                    <tr>
                        <td>생활 패턴</td>
                        <td>: &emsp;&emsp;&emsp;<%=lifestyle%></td>
                    </tr>
                    <tr>
                        <td>청소 주기</td>
                        <td>: &emsp;&emsp;&emsp;<%=cleaning%></td>
                    </tr>
                    <tr>
                        <td>실내취식</td>
                        <td>: &emsp;&emsp;&emsp;<%=indoor_eating%></td>
                    </tr>
                    <tr>
                        <td>생필품 공유</td>
                        <td>: &emsp;&emsp;&emsp;<%=sharing%></td>
                    </tr>
                    <tr>
                        <td>체질</td>
                        <td>: &emsp;&emsp;&emsp;<%=habitude%></td>
                    </tr>
                    <tr>
                        <td>MBTI</td>
                        <td>: &emsp;&emsp;&emsp;<%=mbti%></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <% if (request.getAttribute("scrap").equals("false")) { %>
                <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/scrap/view">
                    <input type="hidden" name="scrap_id" value="${profile.s_id}">
                    <input type="submit" class="button" value="스크랩" onclick="scrapBtn()">
                </form>
                <%} else {%>
                <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/scrap/delete">
                    <input type="hidden" name="scrap_id" value="${profile.s_id}">
                    <input type="submit" class="button" value="스크랩 취소" onclick="scrapBtn()">
                </form>
                <%} %>
            </td>
            <td align="center">
                <a href="${pageContext.request.contextPath}/mail/sendForm?receiver=${profile.s_id}"
                   onClick="window.open(this.href, '', 'width=600, height=550'); return false;">
                        <input type="submit" class="button" value="쪽지" style="margin-top: -9%">
                </a>
            </td>
            <td width="100"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button class="button">나의 루미로 pick!</button>
            </td>
            <td width="100"></td>
        </tr>
    </table>
</div>

