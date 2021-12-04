<%@ page import="model.Profile" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
    List<Profile> waitList;
    List<Profile> requestList;
%>
<html>
<head>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
    <title>나의 루미_대기 목록</title>
    <style>
        @font-face {
            font-family: 'SBAggroB';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroB.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }

        @font-face {
            font-family: 'SBAggroM';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroM.woff') format('woff');
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
            width: auto;
            height: auto;
            text-align: center;
        }

        #logo {
            margin-top: 10px;
            width: 70px;
        }

        h3.roomietitle {
            margin-top: 40px;
            font-family: SBAggroB;
            float: left;
            color: black;
            margin-left: 8%;
        }

        h3.title {
            font-family: SBAggroL;
            text-align: right;
            padding-top: 5px;
            padding-bottom: 10px;
            margin-right: 8%;
        }

        h4 {
            font-family: SBAggroL;
        }

        a {
            font-family: SBAggroL;
        }

        .btn-outline-secondary {
            width: 100px;
            padding: 5px;
            color: black;
            border-color: lightgrey;
            background-color: white;
            float:right;
            margin-right: 7%;
        }

        .subtitle {
            font-family: SBAggroL;
            font-size: 17px;
            float: left;
            margin-left: 10%;
            font-weight: bold;
        }
        .list-group {
            margin-right: 1%;
            margin-left: 1%;
        }
        .mb-1 {
            font-family: SBAggroL;
            font-size: 13px;
        }
        #outline {
            font-family: SBAggroL;
            font-size: 14px;
            margin-top: 6px;
        }
        #footer {
            position: relative;
            width: 100%;
            bottom: 0;
            font-family: SBAggroL;
            text-align: center;
            font-size: x-small;
            padding-top: 100px;
            margin-bottom: 50px;
        }
        #footer p {
            padding: 0px 30px;
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

<div class="w-auto p-2" style="background-color: lightcyan; text-align: center;"><h4 id="top" style="font-family: SBAggroL">당신의 루미를 찾아보세요!
    <button class="btn btn-outline-success" type="submit" onClick="location.href='/student/automatch'">자동매칭 하러가기</button></h4></div>

<a href="${pageContext.request.contextPath}/student/main"><h3 class="roomietitle">Roomie</h3>
<img src="/images/logo-font.png" id="logo"/></a>

<h3 class="title">나의 루미</h3>

<button type="button" class="btn btn-outline-secondary" name="go" onclick="document.location.href='${pageContext.request.contextPath}/myroomie/view'">
    매칭 목록</button>



<div style="margin-top: 5%; margin-right: 10%;" align="center">
    <div class="subtitle">승인 대기</div><p/><br>
    <%waitList = (List<Profile>) request.getAttribute("waitList");%>
    <div class="list-group" align="center" style="width: 85%; margin-left: 12%">
        <div id="outline" class="d-flex w-100 justify-content-between" align="center">
            <span class="title" style="margin-left: 6.75%">닉네임</span>
            <span class="title" style="margin-right: 1%">전공</span>
            <span class="title" style="margin-right: 7.5%">나이</span>
        </div>
        <c:forEach var="w_profile" items="${waitList}">
            <a href="${pageContext.request.contextPath}/student/main/detail?s_id=${w_profile.s_id}" class="list-group-item list-group-item-action" aria-current="true">
                <div class="d-flex w-100 justify-content-between" align="center" style="width:30%;">
                    <span class="mb-1" style="width:15%;">${w_profile.name}</span>
                    <span class="mb-1" style="width:15%;">${w_profile.major}</span>
                    <span class="mb-1" style="width:15%;">${w_profile.age}세</span>
                </div>
            </a>
        </c:forEach>
    </div>
</div>


<div style="margin-top: 5%; margin-right: 10%;" align="center">
<span class="subtitle">승인 요청</span><p/><br>
    <%requestList = (List<Profile>) request.getAttribute("requestList");%>
    <div class="list-group" align="center" style="width: 85%; margin-left: 12%">
        <div id="outline" class="d-flex w-100 justify-content-between" align="center">
            <span class="title" style="margin-left: 6.75%">닉네임</span>
            <span class="title" style="margin-right: 1%">전공</span>
            <span class="title" style="margin-right: 7.5%">나이</span>
        </div>
        <c:forEach var="r_profile" items="${requestList}">
            <a href="${pageContext.request.contextPath}/myroomie/detail?s_id=${r_profile.s_id}" class="list-group-item list-group-item-action" aria-current="true">
                <div class="d-flex w-100 justify-content-between" align="center" style="width:30%;">
                    <span class="mb-1" style="width:15%;">${r_profile.name}</span>
                    <span class="mb-1" style="width:15%;">${r_profile.major}</span>
                    <span class="mb-1" style="width:15%;">${r_profile.age}세</span>
                </div>
            </a>
        </c:forEach>
    </div>
</div>
<footer id="footer">
    <hr>
    <p>데이터베이스프로그래밍 01-06 ©야-심차게<br>권민지 김유림 김은혜 박초은</p>
</footer>
<div onclick="goTop()" style="position: fixed; bottom: 20px; right: 20px; cursor: pointer;">
    <a href="#top"><img src="/images/btnTop2.png" title="맨 위로" style="width: 60px; height: 63px;"></a>
</div>
</body>
</html>
