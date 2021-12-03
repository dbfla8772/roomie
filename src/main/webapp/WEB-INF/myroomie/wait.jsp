<%@ page import="model.Profile" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
    List<Profile> waitList;
    List<Profile> requestList;
    String img_url;
%>
<html>
<head>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
    <title>My Roomie Waiting</title>
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
            /*font-family: SBAggroB; float: left; padding-top: 30px; padding-left: 100px; color: black;*/
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

        .card-margin {
            margin: 0 5%;
            float: left;
            font-family: SBAggroL;
            width: 40%;
            padding: 20px;
        }

        .mb-3 {
            cursor: pointer;
            float: none;
            border-radius: 10px;
            height: 180px;
            max-height: 180px;
            margin-bottom: 0px;
            display: flex;
        }

        .col-md-4 {
            margin: auto;
        }
        .col-md-8 {
            padding-top: 1%;
            margin: auto;
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

<a href="${pageContext.request.contextPath}/student/main"><h3 class="roomietitle">Roomie</h3></a>
<img src="/images/logo-font.png" id="logo"/>

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
<%--    <c:forEach var="r_profile" items="${requestList}">--%>
<%--        <div class="card-margin">--%>
<%--            <div class="card mb-3" style="border-radius: 10px;"--%>
<%--                onclick="location.href='/myroomie/detail?s_id=' + ${r_profile.s_id}">--%>
<%--                <div class="row g-0">--%>
<%--                    <div class="col-md-4">--%>
<%--                        <c:if test="${r_profile.pr_img eq 0}"><%img_url = "/images/man1.png";%></c:if>--%>
<%--                        <c:if test="${r_profile.pr_img eq 1}"><%img_url = "/images/man2.png";%></c:if>--%>
<%--                        <c:if test="${r_profile.pr_img eq 2}"><%img_url = "/images/woman1.png";%></c:if>--%>
<%--                        <c:if test="${r_profile.pr_img eq 3}"><%img_url = "/images/woman2.png";%></c:if>--%>
<%--                        <img style="border-radius: 10px;" src="<c:url value='<%=img_url%>' />"--%>
<%--                            class="img-fluid rounded-start" alt="...">--%>
<%--                    </div>--%>
<%--                    <div class="col-md-8">--%>
<%--                        <div class="card-body">--%>
<%--                            <h5 class="card-title">${r_profile.name}</h5>--%>
<%--                            <p class="card-text">전공: ${r_profile.major} <br>나이: ${r_profile.age}</p>--%>
<%--                        </div>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </c:forEach>--%>
</div>

</body>
</html>
