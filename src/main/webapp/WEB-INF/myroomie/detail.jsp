<%@ page import="model.Profile" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!Profile profile; String img_url, smoking, sharing, lifestyle, grade, habitude, sleep_habit, cleaning, indoor_eating, mbti, isScraped;%>
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
    <h4>????????? ????????? ???????????????!
        <button class="btn btn-outline-success" type="submit">???????????? ????????????</button>
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
        lifestyle = "?????????";
    else
        lifestyle = "?????????";

    if (profile.getGrade()==0)
        grade = "1??????";
    else if (profile.getGrade()==1)
        grade = "2??????";
    else if (profile.getGrade()==2)
        grade = "3??????";
    else if (profile.getGrade()==3)
        grade = "4??????";

    if (profile.getSharing()==0)
        sharing = "??????";
    else
        sharing = "?????????";

    if (profile.getLifestyle()==0)
        lifestyle = "?????????";
    else
        lifestyle = "?????????";

    if (profile.getGrade()==0)
        grade = "1??????";
    else if (profile.getGrade()==1)
        grade = "2??????";
    else if (profile.getGrade()==2)
        grade = "3??????";
    else if (profile.getGrade()==3)
        grade = "4??????";

    if (profile.getHabitude()==0)
        habitude = "????????? ???";
    else if (profile.getHabitude()==1)
        habitude = "????????? ???";
    else if (profile.getHabitude()==2)
        habitude = "??? ??? ???";
    else
        habitude = "????????????";

    if (profile.getSleep_habit()==0)
        sleep_habit = "??????";
    else if (profile.getSleep_habit()==1)
        sleep_habit = "?????????";
    else if (profile.getSleep_habit()==2)
        sleep_habit = "?????????";
    else
        sleep_habit = "?????????";

    if (profile.getCleaning()==0)
        cleaning = "??????";
    else if (profile.getCleaning()==1)
        cleaning = "3???";
    else if (profile.getCleaning()==2)
        cleaning = "1???";
    else
        cleaning = "2???";

    if (profile.getIndoor_eating()==0)
        indoor_eating = "??????";
    else
        indoor_eating = "?????????";

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
<script>
    function Accept() {
        if (confirm("?????????????????????????") == true){
            form1.submit();
            alert("????????? ?????????????????????.");
        } else {
            return;
        }

    }
    function Refuse() {
        if (confirm("?????????????????????????") == true){
            form1.submit();
            alert("????????? ?????????????????????.");
        } else {
            return;
        }
    }
    function DeleteRoomie() {
        if (confirm("????????? ?????????????????????????") == true){
            form1.submit();
            alert("????????? ?????????????????????.");
        } else {
            return;
        }
    }
</script>

<div class="dv" align="center">
    <table style="border-radius: 10px; align: center;">
        <tr>
            <td colspan="2" rowspan="2">
                <img style="border-radius: 10px; width:300px; height:400px; object-fit:contain;" src="<%=img_url%>"/>
            </td>
            <td colspan="3" style="width:400px; text-align: center; font-size: x-large; font-weight: 800; padding-top: 5px;">
                &nbsp;&nbsp;????????? ??????<br><br>
            </td>
            <td/>
        </tr>
        <tr>
            <td width="100"></td>
            <td width="400" rowspan="3">
                <table style="font-size: large; width:400px;">
                    <tr>
                        <td>?????????</td>
                        <td>: &emsp;&emsp;&emsp;${profile.name}</td>
                    </tr>
                    <tr>
                        <td>??????</td>
                        <td>: &emsp;&emsp;&emsp;${profile.major}</td>
                    </tr>
                    <tr>
                        <td>??????</td>
                        <td>: &emsp;&emsp;&emsp;<%=grade%></td>
                    </tr>
                    <tr>
                        <td>??????</td>
                        <td>: &emsp;&emsp;&emsp;${profile.age}</td>
                    </tr>
                    <tr>
                        <td>????????????</td>
                        <td>: &emsp;&emsp;&emsp;<%=smoking%></td>
                    </tr>
                    <tr>
                        <td>?????????</td>
                        <td>: &emsp;&emsp;&emsp;<%=sleep_habit%></td>
                    </tr>
                    <tr>
                        <td>?????? ??????</td>
                        <td>: &emsp;&emsp;&emsp;<%=lifestyle%></td>
                    </tr>
                    <tr>
                        <td>?????? ??????</td>
                        <td>: &emsp;&emsp;&emsp;<%=cleaning%></td>
                    </tr>
                    <tr>
                        <td>????????????</td>
                        <td>: &emsp;&emsp;&emsp;<%=indoor_eating%></td>
                    </tr>
                    <tr>
                        <td>????????? ??????</td>
                        <td>: &emsp;&emsp;&emsp;<%=sharing%></td>
                    </tr>
                    <tr>
                        <td>??????</td>
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
            <% if ((int)request.getAttribute("flag") == 0) {    //flag??? 1?????? ????????????, ????????? ??????&????????????%>
            <td align="center">
                <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/myroomie/accept">
                    <input type="hidden" name="roomie_id" value="${profile.s_id}">
                    <input type="submit" class="button" value="??????" onclick="Accept()">
                </form>
            </td>
            <td align="center">
                <form name="form" method="GET" action="${pageContext.servletContext.contextPath}/myroomie/delete?roomie_id=${profile.s_id}">
                    <input type="submit" class="button" value="??????" onclick="Refuse()">
                </form>
            </td>
            <%} else {%>
            <td colspan="2" align="center">
                <form name="form1" method="GET" action="${pageContext.servletContext.contextPath}/myroomie/delete?roomie_id=${profile.s_id}">
                    <input type="submit" class="button" value="?????? ???????????? ??????" onclick="DeleteRoomie()">
                </form>
            </td>
            <%} %>
            <td width="100"></td>
        </tr>
    </table>
</div>

