<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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

</head>
<%!
    List<Mail> receiveList;
%>
<body>
<h4>받은 쪽지함</h4>

<% receiveList = (List<Mail>) request.getAttribute("receiveList"); %>
<div class="list-group">
    <c:forEach var="receiveMail" items="${receiveList}">
    <div class="list-group">
        <a href="'${pageContext.request.contextPath}/mail/receive/detail?ch_id=' + ${receiveMail.ch_id} + '&flag=0'" class="list-group-item list-group-item-action active" aria-current="true">
            <div class="d-flex w-100 justify-content-between">
                <c:choose>
                    <c:when test="${fn:length(receiveMail.message.nm) > 14}">
                        <p class="mb-1">${fn:substring(receiveMail.message.nm,0,13)}...</p>
                    </c:when>
                    <c:otherwise>
                        <p class="mb-1">${receiveMail.message.nm}</p>
                    </c:otherwise>
                </c:choose>
                <small>${receiveMail.datetime}</small>
            </div>
        </a>
    </div>
    </c:forEach>
</div>
</body>
</html>