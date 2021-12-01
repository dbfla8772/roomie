<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
    <title>보낸 쪽지함</title>

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

    <style>
        @font-face {
            font-family: 'SBAggroL';
            src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2108@1.1/SBAggroL.woff') format('woff');
            font-weight: normal;
            font-style: normal;
        }
        div{
            font-family: SBAggroL;
        }
        h4 {
            margin-top: 3%;
            font-weight: bold;
        }
        .title{
            font-size: 13px;
            margin-right: 2%;
            margin-left: 2%;
        }
        .link {
            font-size: 14px;
            margin-left: 3.5%;
        }
        .move-link:hover {
            font-weight: bold;
            color: #858585;
            text-decoration-line: none;
        }
        .move-link {
            color: #858585;
            text-decoration-line: none;
        }
        #outline {
            margin-top: 6px;
        }
        .list-group {
            margin-right: 1%;
            margin-left: 1%;
        }
    </style>
</head>
<%!
    List<Mail> sendList;
%>
<body>
<div align="center">
    <h4>보낸쪽지함</h4>

    <div class="link" align="left">
        <a href="${pageContext.request.contextPath}/mail/receive/receiveList?flag=0" class="move-link">받은쪽지</a>&nbsp;
        <a href="${pageContext.request.contextPath}/mail/send/sendList?flag=1" class="move-link">보낸쪽지</a>
    </div>

    <% sendList = (List<Mail>) request.getAttribute("sendList"); %>
    <div class="list-group" align="center">
        <div id="outline" class="d-flex w-100 justify-content-between" align="center">
            <span class="title" style="margin-left: 3%">받은사람</span>
            <span class="title" style="margin-right: -4.5%">내용</span>
            <span class="title" style="margin-right: 14%">날짜</span>
        </div>
        <div class="list-group" align="center">
            <c:forEach var="sendMail" items="${sendList}">
            <a href="${pageContext.request.contextPath}/mail/send/detail?ch_id=${sendMail.ch_id}&flag=1" class="list-group-item list-group-item-action" aria-current="true">
                <div class="d-flex w-100 justify-content-between" align="center">
                    <span class="mb-1" style="width:15%; text-align: left;">${sendMail.receiver_s}</span>
                    <span class="mb-1" style="margin-left: 10.5%; width: 30%; overflow: hidden;
                                                text-overflow: ellipsis; white-space: nowrap;">${sendMail.message}</span>
                    <span class="mb-1" style="width:27%;">${sendMail.datetime}</span>
                </div>
            </a>
            </c:forEach>
        </div>
    </div>
</div>
</body>
</html>