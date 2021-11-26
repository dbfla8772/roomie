<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
	List<Profile> profileList; String img_url;
%>
<html>
<head>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
    <title>메인 페이지</title>
    <script>
    </script>
    <style>
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
            magrin: 0;
            width: auto;
            height: auto;
            margin-bottom: 4%;
        }
        a {
            font-family: SBAggroL;
        }
        h1 {
            padding-top: 10px;
            font-family: SBAggroB;
        }
        .card-margin {
            margin-left: 5%;
            font-family: SBAggroL;
        }
        .mb-3 {
            cursor: pointer;
            float: left;
            border-radius: 10px;
            width: 40%;
            margin: 0px 0% 100px 5%;
        }
        .page-float {
            clear: left;
            position: absolute;
            bottom: 1px;
            right: 43%
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>
<div class="w-auto p-2" style="background-color: lightcyan; text-align: center;"><h4 style="font-family: SBAggroL">당신의 루미를 찾아보세요! <button class="btn btn-outline-success" type="submit">자동매칭 하러가기</button></h4></div>
<div class="container">
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
            <a class="p-2 link-secondary" href="${pageContext.request.contextPath}/profile/myPage">마이페이지</a>
            <a class="p-2 link-secondary" href="${pageContext.request.contextPath}/scrap/view">스크랩</a>
            <a class="p-2 link-secondary" href="${pageContext.request.contextPath}/mail/receive/receiveList?flag=0"
               onClick="window.open(this.href, '', 'width=600, height=550'); return false;">쪽지</a>
            <a class="p-2 link-secondary" href="/WEB-INF/profile/myroomie/view.jsp">나의 루미</a> <%--myRoomie controller 생성 후 수정--%>
        </nav>
    </div>
</div>

<%profileList = (List<Profile>) request.getAttribute("profileList");%>
<form name="form">
    <c:forEach var="profile" items="${profileList}">
        <div class="card-margin">
            <div class="card mb-3" style="border-radius: 10px; max-width: 600px;" onclick="location.href='/student/main/detail?s_id=' + ${profile.s_id}">
                <div class="row g-0">
                    <div class="col-md-4">
                        <c:if test="${profile.pr_img eq 0}"><%img_url = "/images/man1.png";%></c:if>
                        <c:if test="${profile.pr_img eq 1}"><%img_url = "/images/man2.png";%></c:if>
                        <c:if test="${profile.pr_img eq 2}"><%img_url = "/images/woman1.png";%></c:if>
                        <c:if test="${profile.pr_img eq 3}"><%img_url = "/images/woman2.png";%></c:if>
                        <img style="border-radius: 10px;" src="<c:url value='<%=img_url%>' />" class="img-fluid rounded-start" alt="...">
                    </div>
                    <div class="col-md-8">
                        <div class="card-body">
                            <h5 class="card-title">${profile.name}</h5>
                            <p class="card-text">${profile.major} (${(profile.grade)+1}학년)&emsp;&emsp;&emsp;&emsp;&emsp; <br>${profile.age}세&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            <p class="card-text"><small class="text-muted"></small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</form>
<%--    int totalCount;--%>
<%--    int countList;--%>
<%--    int totalPage;--%>
<%--    int i;--%>
<%--%>--%>
<%--<%--%>
<%--    totalCount = 25;--%>
<%--    countList = 10;--%>

<%--    totalPage = totalCount / countList;--%>

<%--    if (totalCount % countList > 0) {--%>
<%--        totalPage++;--%>
<%--    }--%>
<%--%>--%>

<%--<div class="page-float">
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
</div>--%>
</body>
</html>
