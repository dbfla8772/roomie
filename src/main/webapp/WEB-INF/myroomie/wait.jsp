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

<button type="button" class="btn btn-outline-secondary" name="go" onclick="document.location.href='${pageContext.request.contextPath}/myroomie/view'">신청대기 목록</button>

<h4>내가 보낸 신청</h4>
<%waitList = (List<Profile>) request.getAttribute("waitList");%>
<c:forEach var="profile" items="${waitList}">
    <div class="card-margin">
        <div class="card mb-3" style="border-radius: 10px;"
             onclick="location.href='/student/main/detail?s_id=' + ${profile.s_id}">
            <div class="row g-0">
                <div class="col-md-4">
                    <c:if test="${profile.pr_img eq 0}"><%img_url = "/images/man1.png";%></c:if>
                    <c:if test="${profile.pr_img eq 1}"><%img_url = "/images/man2.png";%></c:if>
                    <c:if test="${profile.pr_img eq 2}"><%img_url = "/images/woman1.png";%></c:if>
                    <c:if test="${profile.pr_img eq 3}"><%img_url = "/images/woman2.png";%></c:if>
                    <img style="border-radius: 10px;" src="<c:url value='<%=img_url%>' />"
                         class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">${profile.name}</h5>
                        <p class="card-text">전공: ${profile.major} <br>나이: ${profile.age}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>


<h4>나에게 온 신청</h4>
<%requestList = (List<Profile>) request.getAttribute("requestList");%>
<c:forEach var="profile" items="${requestList}">
    <div class="card-margin">
        <div class="card mb-3" style="border-radius: 10px;"
             onclick="location.href='/student/main/detail?s_id=' + ${profile.s_id}">
            <div class="row g-0">
                <div class="col-md-4">
                    <c:if test="${profile.pr_img eq 0}"><%img_url = "/images/man1.png";%></c:if>
                    <c:if test="${profile.pr_img eq 1}"><%img_url = "/images/man2.png";%></c:if>
                    <c:if test="${profile.pr_img eq 2}"><%img_url = "/images/woman1.png";%></c:if>
                    <c:if test="${profile.pr_img eq 3}"><%img_url = "/images/woman2.png";%></c:if>
                    <img style="border-radius: 10px;" src="<c:url value='<%=img_url%>' />"
                         class="img-fluid rounded-start" alt="...">
                </div>
                <div class="col-md-8">
                    <div class="card-body">
                        <h5 class="card-title">${profile.name}</h5>
                        <p class="card-text">전공: ${profile.major} <br>나이: ${profile.age}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

</body>
</html>
