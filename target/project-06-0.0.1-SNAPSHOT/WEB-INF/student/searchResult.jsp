<%@ page import="model.Profile" %>
<%@ page import="java.util.List" %>
<%@ page import="org.apache.commons.logging.Log" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%! List<Profile> profileList; String img_url; int[] filter; int i; String[] check; %>
<html>
<head>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
            integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
            crossorigin="anonymous"></script>

    <script>
        function search(targetUri) {
            form.action = targetUri;
            form.method = "GET";		// search form 요청
            form.submit();
        }
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

        body {
            margin: 5% 8%;
            align-content: center;
        }

        #logo {
            margin-top: -2.5%;
            width: 70px;
        }

        h3 {
            font-family: SBAggroB;
            float: left;
            color: black;
        }

        table {
            margin: 0 auto;
            width: 80%;
            height: 40%;
            position: relative;
            top: 20%;
            background-color: lightgrey;
        }

        td {
            padding: 2% 1% 2% 5%;
            font-family: SBAggroL;
        }

        select {
            width: 100px;
            height: 35px;
            padding: 5px 20px 5px 10px;
            border-radius: 4px;
            outline: 0 none;
        }
        .select option {
            background: black;
            color: #fff;
            padding: 3px 0;
        }

        .btn {
            margin-top: 10px;
            margin-right: 8%;
            font-family: SBAggroL;
            float: right;
        }

        .search-img {
            margin-top: 15px;
            margin-right: -10px;
            float: right;
        }

        #magnifier {
            width: 80px;
        }

        .btn-outline-secondary {
            width: 150px;
            padding: 5px;
            color: black;
            border-color: lightgrey;
            background-color: white;
        }

        div.search {
            width: 100%;
            height: 150px;
            float: right;
        }

        .card-margin {/*
            margin-left: 5%;*/
            font-family: SBAggroL;
        }

        .mb-3 {
            cursor: pointer;
            float: left;
            border-radius: 10px;
            width: 40%;
            margin: 0px 5% 100px 5%;
        }
    </style>

</head>
<body>
<a href = "${pageContext.request.contextPath}/student/main"><h3>&nbsp;Roomie</h3></a>
<a href = "${pageContext.request.contextPath}/student/main"><img src="/images/logo-font.png" id="logo"/></a>

<%
    filter = new int[10];
    filter = (int[]) request.getAttribute("filter");

    check = new String[10];

    for (i = 0; i < filter.length; i++) {
        if(filter[i] != -1) {
            check[i] = "checked";
        }
    }

    for (i = 0; i < check.length; i++) {
        System.out.println(filter[i]);
    }
%>

<%-- 검색 필터 --%>
<form name="form" method="GET" action="">
    <table>
        <tr>
            <td><input type="checkbox" id="habitude" name="searchFilter" checked="<%=check[9]%>" disabled="disabled"><label>&nbsp;체질</label></td>
            <td><input type="checkbox" id="sleep_habit" name="searchFilter" checked="<%=check[0]%>" disabled="disabled"><label>&nbsp;잠버릇</label></td>
            <td><input type="checkbox" id="lifestyle" name="searchFilter" checked="<%=check[1]%>" disabled="disabled"><label>&nbsp;생활 패턴</label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="smoking" name="searchFilter" checked="<%=check[2]%>" disabled="disabled"><label>&nbsp;흡연 유무</label></td>
            <td><input type="checkbox" id="grade" name="searchFilter" checked="<%=check[3]%>" disabled="disabled"><label>&nbsp;학년</label></td>
            <td><input type="checkbox" id="major" name="searchFilter" checked="<%=check[4]%>" disabled="disabled"><label>&nbsp;전공</label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="cleaning" name="searchFilter" checked="<%=check[5]%>" disabled="disabled"><label>&nbsp;청소 주기</label></td>
            <td><input type="checkbox" id="indoor_eating" name="searchFilter" checked="<%=check[6]%>" disabled="disabled"><label>&nbsp;실내 취식</label></td>
            <td><label>&nbsp;&nbsp;&nbsp;MBTI&nbsp;
                <select id="mbti" name="searchFilter" check="<%=check[7]%>" disabled="disabled">
                    <option value="0">ENFJ</option>
                    <option value="1">ENFP</option>
                    <option value="2">ENTJ</option>
                    <option value="3">ENTP</option>
                    <option value="4">ESFJ</option>
                    <option value="5">ESFP</option>
                    <option value="6">ESTJ</option>
                    <option value="7">ESTP</option>
                    <option value="8">INFJ</option>
                    <option value="9">INFP</option>
                    <option value="10">INTJ</option>
                    <option value="11">INTP</option>
                    <option value="12">ISFJ</option>
                    <option value="13">ISFP</option>
                    <option value="14">ISTJ</option>
                    <option value="15">ISTP</option>
                </select>
            </label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="sharing" name="searchFilter" checked="<%=check[8]%>" disabled="disabled"><label>&nbsp;생필품 공유</label></td>
        </tr>
    </table>

    <div class="search">
        <div class="btn">
            <%-- 검색 실행 버튼 --%>
            <button type="submit" class="btn btn-outline-secondary"
                    onclick="search('${pageContext.request.contextPath}/student/search')">검색필터 재설정
            </button>
        </div>
        <%-- 돋보기 이미지 --%>
        <div class="search-img">
            <img src="<c:url value='/images/magnifier.png'/>" id="magnifier"/>
        </div>
    </div>
</form>

<%profileList = (List<Profile>) request.getAttribute("profileList");%>
<%--<c:if test="${profileList}"></c:if>--%>
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
                            <p class="card-text">${profile.major} (${profile.grade}학년)&emsp;&emsp;&emsp;&emsp;&emsp; <br>${profile.age}세&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            <p class="card-text"><small class="text-muted"></small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</form>

<%-- 페이징 --%>
<%--<div class="page-float">--%>
<%--    <nav aria-label="Page navigation example">--%>
<%--        <ul class="pagination justify-content-center">--%>
<%--            <li class="page-item disabled">--%>
<%--                <a class="page-link">Previous</a>--%>
<%--            </li>--%>
<%--            <li class="page-item"><a class="page-link" href="#">1</a></li>--%>
<%--            <li class="page-item"><a class="page-link" href="#">2</a></li>--%>
<%--            <li class="page-item"><a class="page-link" href="#">3</a></li>--%>
<%--            <li class="page-item">--%>
<%--                <a class="page-link" href="#">Next</a>--%>
<%--            </li>--%>
<%--        </ul>--%>
<%--    </nav>--%>
<%--</div>--%>
</body>
</html>