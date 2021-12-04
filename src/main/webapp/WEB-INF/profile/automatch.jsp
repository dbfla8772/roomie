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
    <title>자동매칭</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
        h4, h5 {
            font-family: SBAggroB;
        }
        .card-margin {
            margin-left: 500px;
            font-family: SBAggroL;
        }
        .mb-3 {
            cursor: pointer;
            float: left;
            border-radius: 10px;
            width: 60%;
            margin: 0px 0% 100px 5%;
        }
        #footer {
            position: relative;
            width: 100%;
            bottom: 0;
            font-family: SBAggroL;
            text-align: center;
            font-size: x-small;
            padding-bottom: 50px;
        }
        #footer p {
            padding: 0px 30px;
        }
    </style>
</head>
<body>
<div class="container">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="blog-header-logo text-dark" href="${pageContext.request.contextPath}/student/main"><h1>Roomie 루미</h1></a>
            </div>
            <div class="col-4 text-center">
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <h4>자동매칭 결과</h4>
            </div>
        </div>
        <br>
    </header>
</div>

<% profileList = (List<Profile>) request.getAttribute("profileList"); %>
    <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel"
         style="margin: 10px 100px 0px 100px; text-align: center;">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
            <%
                for (int i = 0; i < profileList.size(); i++) {
            %>
            <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="<%= i+1 %>" aria-label="Slide 2"></button>
            <% } %>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="10000">
                <img src="/images/room.jpg" class="d-block w-100" alt="..." style="height: 750px">
                <div class="carousel-caption d-none d-md-block">
                    <h5>옆으로 넘겨서 당신에게 맞는 룸메이트를 찾아보세요!</h5>
                </div>
            </div>

            <% for (int i = 0; i < profileList.size(); i++) { %>
            <div class="carousel-item" data-bs-interval="2000">
                <div class="card-margin">
                    <div class="card mb-3" style="border-radius: 10px; max-width: 600px;" onclick="location.href='/student/main/detail?s_id=' + <%= profileList.get(i).getS_id() %>">
                        <div class="row g-0">
                            <div class="col-md-4">
                                <%
                                    if (profileList.get(i).getPr_img() == 0) img_url = "/images/man1.png";
                                    else if (profileList.get(i).getPr_img() == 1) img_url = "/images/man2.png";
                                    else if (profileList.get(i).getPr_img() == 2) img_url = "/images/woman1.png";
                                    else img_url = "/images/woman2.png";
                                %>
                                <img style="border-radius: 10px;" src="<c:url value='<%= img_url %>' />" class="img-fluid rounded-start" alt="...">
                            </div>
                            <div class="col-md-8">
                                <div class="card-body">
                                    <h5 class="card-title"><%= profileList.get(i).getName() %></h5>
                                    <p class="card-text"><%= profileList.get(i).getMajor() %> (<%= profileList.get(i).getGrade() %>학년)&emsp;&emsp;&emsp;&emsp;&emsp; <br>
                                        <%= profileList.get(i).getAge() %>세&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                                    <p class="card-text"><small class="text-muted"></small></p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <% } %>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleDark" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
</div>
<footer id="footer">
    <hr>
    <p>데이터베이스프로그래밍 01-06 ©야-심차게<br>권민지 김유림 김은혜 박초은</p>
</footer>
</body>
</html>
