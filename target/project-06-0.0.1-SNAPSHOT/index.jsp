<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>스크랩 목록</title>
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
        }
        h4 {
            font-family: SBAggroL;
        }
        #logo {
            margin-top: 0;
            width: 6%;
        }
        .card-margin {
            margin-left: 13%;
        }
        .mb-3 {
            float: left;
            border-radius: 10px;
            max-width: 440px;
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
    <%--    <script>--%>
    <%--        function card_click() {--%>
    <%--            <jsp:forward page="/student/main/detail.jsp"/>--%>
    <%--        }--%>
    <%--    </script>--%>
</head>
<body>
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

<div class="w-auto p-3" style="background-color: lightcyan; text-align: center;"><h4 style="font-family: SBAggroL;">당신의 루미를 찾아보세요! <button class="btn btn-outline-success" type="submit">자동매칭 하러가기</button></h4></div>

<a href = "${pageContext.request.contextPath}/student/main"><h3 style="font-family: SBAggroB; float: left; padding-top: 30px; padding-left: 100px; color: black;">Roomie</h3></a>
<img src="images/logo-font.png" id="logo" />

<h3 style="font-family:SBAggroL; text-align: right; padding-top: 0px; padding-right: 200px;">스크랩</h3>
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