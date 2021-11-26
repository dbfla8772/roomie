<%--
<% response.sendRedirect(request.getContextPath() + "/student/login"); %>--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>받은 쪽지함</title>

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
        body {
            margin: 3%;
            width: auto;
            height: auto;
        }
        h4, p {
            font-family: SBAggroL;
            text-align: center;
        }

        #outline {
            margin: 10px 1% 0 1%;
        }
        #content {
            text-align: center;
        }

    </style>
</head>
<%!
    List<Mail> receiveList;
%>
<body>
<h4>받은 쪽지함</h4> <br>

<div class="list-group" align="center">
        <div class="list-group">
            <div id="outline" class="d-flex w-100 justify-content-between" align="center">
                <p>보낸 사람</p>
                <p id="content">내용</p>
                <p>날짜</p>
            </div>
            <a href="'${pageContext.request.contextPath}/mail/receive/detail?ch_id=' <%--+ ${receiveMail.ch_id} + '&flag=0'--%>" class="list-group-item list-group-item-action" aria-current="true">
                <div class="d-flex w-100 justify-content-between">
                    <p class="mb-1">보낸 사람</p>
                    <p class="mb-1">쪽지 내용</p>
                    <p class="mb-1">날짜</p>
                </div>
            </a>
            <a href="'${pageContext.request.contextPath}/mail/receive/detail?ch_id=' <%--+ ${receiveMail.ch_id} + '&flag=0'--%>" class="list-group-item list-group-item-action" aria-current="true">
                <div class="d-flex w-100 justify-content-between">
                    <p class="mb-1">보낸 사람</p>
                    <p class="mb-1">쪽지 내용</p>
                    <p class="mb-1">날짜</p>
                </div>
            </a>
            <a href="'${pageContext.request.contextPath}/mail/receive/detail?ch_id=' <%--+ ${receiveMail.ch_id} + '&flag=0'--%>" class="list-group-item list-group-item-action" aria-current="true">
                <div class="d-flex w-100 justify-content-between">
                    <p class="mb-1">보낸 사람</p>
                    <p class="mb-1">쪽지 내용</p>
                    <p class="mb-1">날짜</p>
                </div>
            </a>
        </div>

</div>

<%--<% receiveList = (List<Mail>) request.getAttribute("receiveList"); %>
<div class="list-group">
    <c:forEach var="receiveMail" items="${receiveList}">
        <div class="list-group">
            <a href="'${pageContext.request.contextPath}/mail/receive/detail?ch_id=' + ${receiveMail.ch_id} + '&flag=0'" class="list-group-item list-group-item-action active" aria-current="true">
                <div class="d-flex w-100 justify-content-between">
                    <p class="mb-1">${receiveMail.message}</p>
                    <small>${receiveMail.datetime}</small>
                </div>
                <p class="mb-1">Some placeholder content in a paragraph.</p>
                <small>And some small print.</small>
            </a>
        </div>
    </c:forEach>
</div>--%>
</body>
</html>