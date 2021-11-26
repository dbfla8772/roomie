<%@page contentType="text/html; charset=utf-8" %>
<%@page import="java.util.*" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%!
    List<Profile> profileList; String img_url; int j = 0, k = 2;
%>
<html>
<head>
    <link href="css/styles.css" rel="stylesheet" type="text/css">
    <title>자동매칭 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</head>
<body>
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
            <a class="p-2 link-secondary" href="${pageContext.request.contextPath}/chat/receiveList">쪽지</a>
            <a class="p-2 link-secondary" href="/WEB-INF/profile/myroomie/view.jsp">나의 루미</a> <%--myRoomie controller 생성 후 수정--%>
        </nav>
    </div>
</div>

<% profileList = (List<Profile>) request.getAttribute("profileList"); %>
<form name="form">
<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>

    <div class="carousel-inner">
        <div class="carousel-item active">
            <% for (int i = 0; i < 2; i++) { %>
                <div class="card-margin">
                    <div class="card mb-3" style="border-radius: 10px; max-width: 600px;" onclick="location.href='/student/main/detail?s_id=' + <%= profileList.get(i).getS_id() %>">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <%
                                    if (profileList.get(i).getPr_img() == 0) {
                                        img_url = "/images/man1.png";
                                    } else if (profileList.get(i).getPr_img() == 1) {
                                        img_url = "/images/man2.png";
                                    } else if (profileList.get(i).getPr_img() == 2) {
                                        img_url = "/images/woman1.png";
                                    } else {
                                        img_url = "/images/woman2.png";
                                    }
                                %>
                                <img style="border-radius: 10px;" src="<c:url value='<%=img_url%>' />" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%= profileList.get(i).getName() %></h5>
                                    <p class="card-text"><%= profileList.get(i).getMajor() %>
                                        (<%= profileList.get(i).getGrade() + 1 %>학년)&emsp;&emsp;&emsp;&emsp;&emsp; <br>
                                        <%= profileList.get(i).getAge() %>세&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                                    <p class="card-text"><small class="text-muted"></small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <% } %>
        </div>

        <% for (int i = 2; i < (profileList.size() / 2) + 2; i++) { %>
            <div class="carousel-item">
                <% for (j = k; j < j+2; j++) { %>
                    <div class="card-margin">
                        <div class="card mb-3" style="border-radius: 10px; max-width: 600px;" onclick="location.href='/student/main/detail?s_id=' + <%= profileList.get(j).getS_id() %>">
                            <div class="row g-0">
                                <div class="col-md-4">
                                    <%
                                        if (profileList.get(j).getPr_img() == 0) {
                                            img_url = "/images/man1.png";
                                        } else if (profileList.get(j).getPr_img() == 1) {
                                            img_url = "/images/man2.png";
                                        } else if (profileList.get(j).getPr_img() == 2) {
                                            img_url = "/images/woman1.png";
                                        } else {
                                            img_url = "/images/woman2.png";
                                        }
                                    %>
                                    <img style="border-radius: 10px;" src="<c:url value='<%=img_url%>' />" class="img-fluid rounded-start" alt="...">
                                </div>
                                <div class="col-md-8">
                                    <div class="card-body">
                                        <h5 class="card-title"><%= profileList.get(j).getName() %></h5>
                                        <p class="card-text"><%= profileList.get(j).getMajor() %>
                                            (<%= profileList.get(j).getGrade() + 1 %>학년)&emsp;&emsp;&emsp;&emsp;&emsp; <br>
                                            <%= profileList.get(j).getAge() %>세&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                                        <p class="card-text"><small class="text-muted"></small></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                <% } %>
            </div>
        <%
            k += 2;
        } %>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>

    <div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item">
                <img src="..." class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="..." class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>

</div>
</form>
</body>
</html>

