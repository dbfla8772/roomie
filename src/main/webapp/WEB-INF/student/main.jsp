<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	@SuppressWarnings("unchecked")
	List<Profile> profileList = (List<Profile>)request.getAttribute("profileList");
%>
<html>
<head>
    <title>스크랩 목록</title>
    <style>
        html, body {
            width: auto;
            height: auto;
        }
        .card-margin {
            margin-left: 5%;
        }
        .mb-3 {
            float: left;
            border-radius: 10px;
            max-width: 600px;
            margin: 0px 5% 100px 5%;
        }
        .page-float {
            clear: left;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<%--<%!--%>
<%--    int totalCount;--%>
<%--    int countList;--%>
<%--    int totalPage;--%>
<%--    int i;--%>
<%--%>--%>
<%--<%--%>
<%--    totalCount = profileList.size();--%>
<%--    countList = 10;--%>

<%--    totalPage = totalCount / countList;--%>

<%--    if (totalCount % countList > 0) {--%>
<%--        totalPage++;--%>
<%--    }--%>
<%--%>--%>
<div class="container">
<div class="w-auto p-3" style="background-color: lightcyan; text-align: center;"><h4>당신의 루미를 찾아보세요! <button class="btn btn-outline-success" type="submit">자동매칭 하러가기</button></h4></div>
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="link-secondary" href="#"></a>
            </div>
            <div class="col-4 text-center">
                <a class="blog-header-logo text-dark" href="${pageContext.request.contextPath}/student/main"><h1>Roomie 루미</h1></a>
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <a class="link-secondary" href="${pageContext.request.contextPath}/student/search" aria-label="Search">
                    <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="none" stroke="currentColor" stroke-linecap="round" stroke-linejoin="round" stroke-width="2" class="mx-3" role="img" viewBox="0 0 24 24"><title>Search</title><circle cx="10.5" cy="10.5" r="7.5"/><path d="M21 21l-5.2-5.2"/></svg>
                </a>
            </div>
        </div>
    </header>
    <div class="nav-scroller py-1 mb-2">
        <nav class="nav d-flex justify-content-between">
            <a class="p-2 link-secondary" href="${pageContext.request.contextPath}/profile/mypage">마이페이지</a>
            <a class="p-2 link-secondary" href="${pageContext.request.contextPath}/scrap/view">스크랩</a>
            <a class="p-2 link-secondary" href="${pageContext.request.contextPath}/chat/sendList">채팅</a>
            <a class="p-2 link-secondary" href="${pageContext.request.contextPath}/profile/myroomie/view">나의루미</a>
        </nav>
    </div>
</div>

<%--<% for (i = 1; i <= countList/2; i++) { %>--%>
<%--<c:forEach var="profile" items="${profileList}">--%>
<%--<div style = "padding-top: 30px; padding-left: 200px;" class="row">--%>
<%--    <div class="col-sm-6">--%>
<%--        <div class="card mb-3" style="border-radius: 10px; max-width: 600px;" onClick="location.href='/student/main/detail.jsp'">--%>
<%--            <div class="row g-0">--%>
<%--                <div class="col-md-4">--%>
<%--                    <img style="border-radius: 10px;" src="<c:url value='/images/jjang.jpg' />" class="img-fluid rounded-start" alt="...">--%>
<%--                </div>--%>
<%--                <div class="col-md-8">--%>
<%--                    <div class="card-body">--%>
<%--                        <h5 class="card-title">${profile.name}</h5>--%>
<%--                        <p class="card-text">전공: >${profile.major}&emsp;&emsp;&emsp;&emsp;&emsp; <br>나이: ${profile.age}&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>--%>
<%--                        <p class="card-text"><small class="text-muted"></small></p>--%>
<%--                    </div>--%>
<%--                </div>--%>
<%--            </div>--%>
<%--        </div>--%>
<%--    </div>--%>
<%--</div>--%>
<%--</c:forEach>--%>
<%--<%--%>
<%--    }--%>
<%--%>--%>
<%--<nav aria-label="Page navigation example">--%>
<%--    <ul class="pagination justify-content-center">--%>
<%--        <li class="page-item disabled">--%>
<%--            <a class="page-link">Previous</a>--%>
<%--        </li>--%>
<%--        <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--        <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--        <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--        <li class="page-item">--%>
<%--            <a class="page-link" href="#">Next</a>--%>
<%--        </li>--%>
<%--    </ul>--%>
<%--</nav>--%>
<%--</body>--%>

<%!
    int totalCount;
    int countList;
    int totalPage;
    int i;
%>
<%
    totalCount = 25;
    countList = 10;

    totalPage = totalCount / countList;

    if (totalCount % countList > 0) {
        totalPage++;
    }
%>

<div class="card-margin">
    <% for (i = 1; i <= countList; i++) { %>
    <div class="card mb-3" onClick="location.href='${pageContext.request.contextPath}/student/main/detail'">
        <div class="row g-0">
            <div class="col-md-4">
                <img style="border-radius: 10px;" src="<c:url value='/images/jjang.jpg' />" class="img-fluid rounded-start" alt="...">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <h5 class="card-title">짱구</h5>
                    <p class="card-text">전공: 컴퓨터학과&emsp;&emsp;&emsp;&emsp;&emsp;&emsp; <br>나이: 21&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                    <p class="card-text"><small class="text-muted"></small></p>
                </div>
            </div>
        </div>
    </div>
    <%
        }
    %>
</div>
<br>
<div class="page-float">
    <nav aria-label="Page navigation example">
        <ul class="pagination justify-content-center">
            <li class="page-item disabled">
                <a class="page-link">Previous</a>
            </li>
            <li class="page-item"><a class="page-link" href="#">1</a></li>
            <li class="page-item"><a class="page-link" href="#">2</a></li>
            <li class="page-item"><a class="page-link" href="#">3</a></li>
            <li class="page-item">
                <a class="page-link" href="#">Next</a>
            </li>
        </ul>
    </nav>
</div>
</body>
</html>
