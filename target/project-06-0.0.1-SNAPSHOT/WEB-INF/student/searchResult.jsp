<%@ page import="model.Profile" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%! List<Profile> profileList; %>
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
            margin: 5%;
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
            border-radius: 5px;
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

        .btn, .search-img {
            float: right;
        }

        .btn {
            margin-top: 10px;
            margin-right: 8%;
            font-family: SBAggroL;
        }

        .search-img {
            margin-top: 15px;
            margin-right: -20px;
        }

        #magnifier {
            width: 80px;
        }

        .btn-outline-secondary {
            width: 100px;
            padding: 5px;
            color: black;
            border-color: lightgrey;
            background-color: white;
        }

        div.search {
            width: auto;
            height: 100px;
        }

        .mb-3 {
            width: 40%;
            border-radius: 10px;
            float: left;
            max-width: 600px;
            margin: 0px 5% 100px 5%;
            font-family: SBAggroL;
        }

        .page-float {
            clear: left;
        }


    </style>

</head>
<body>

<a href = "${pageContext.request.contextPath}/student/main"><h3>&nbsp;Roomie</h3></a>
<a href = "${pageContext.request.contextPath}/student/main"><img src="/images/logo-font.png" id="logo"/></a>

<%-- 검색 필터 --%>
<%--<form name="form" method="get" action="<c:url value="/student/searchResult">">--%>
<form name="form" method="GET" action="">
    <table>
        <tr>
            <td><input type="checkbox" id="age" name="searchFilter"><label>&nbsp;나이</label></td>
            <td><input type="checkbox" id="sleep_habit" name="searchFilter"><label>&nbsp;잠버릇</label></td>
            <td><input type="checkbox" id="lifestyle" name="searchFilter"><label>&nbsp;생활 패턴</label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="smoking" name="searchFilter"><label>&nbsp;흡연 유무</label></td>
            <td><input type="checkbox" id="grade" name="searchFilter"><label>&nbsp;학년</label></td>
            <td><input type="checkbox" id="major" name="searchFilter"><label>&nbsp;전공</label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="cleaning" name="searchFilter"><label>&nbsp;청소 주기</label></td>
            <td><input type="checkbox" id="indoor_eating" name="searchFilter"><label>&nbsp;실내 취식</label></td>
            <td><label>&nbsp;&nbsp;&nbsp;MBTI&nbsp;
                <select id="mbti" name="searchFilter">
                    <option value="istj">ISTJ</option>
                    <option value="isfj">ISFJ</option>
                    <option value="infj">INFJ</option>
                    <option value="intj">INTJ</option>
                    <option value="istp">ISTP</option>
                    <option value="isfp">ISFP</option>
                    <option value="infp">INFP</option>
                    <option value="intp">INTP</option>
                    <option value="estp">ESTP</option>
                    <option value="esfp">ESFP</option>
                    <option value="enfp">ENFP</option>
                    <option value="entp">ENTP</option>
                    <option value="estj">ESTJ</option>
                    <option value="esfj">ESFJ</option>
                    <option value="enfj">ENFJ</option>
                    <option value="entj">ENTJ</option>
                </select>
            </label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="sharing" name="searchFilter"><label>&nbsp;생필품 공유</label></td>
            <td><input type="checkbox" id="habitude" name="searchFilter"><label>&nbsp;체질</label></td>
        </tr>
    </table>

    <div class="search">
        <div class="btn">
            <%-- 검색 실행 버튼 --%>
            <button type="submit" class="btn btn-outline-secondary"
                    onclick="search('${pageContext.request.contextPath}/student/login')">검색하기
            </button>
        </div>
        <%-- 돋보기 이미지 --%>
        <div class="search-img">
            <img src="<c:url value='/images/magnifier.png'/>" id="magnifier"/>
        </div>
    </div>
</form>

<% profileList = (List<Profile>) request.getAttribute("profileList"); %>
<%-- 프로필 카드 for문 이용 --%>
<c:forEach var="profile" items="${profileList}">
    <div class="card mb-3" onclick="location.href='/student/main/detail?s_id=' + ${profile.s_id}">
        <div class="row g-0">
            <div class="col-md-4">
                <img src="https://media.istockphoto.com/vectors/teddy-bear-character-isolated-on-white-background-soft-toy-in-flat-vector-id691840414?k=20&m=691840414&s=612x612&w=0&h=f19dyCnUA0QWienuthsMdHzKEzY1RnMOYcJp8dF_iaA="
                     class="img-fluid rounded-start" alt="card">
            </div>
            <div class="col-md-8">
                <div class="card-body">
                    <p class="card-text">나이 : ${profile.age}</p>
                    <p class="card-text">학년 : ${profile.grade}</p>
                    <p class="card-text">전공 : ${profile.major}</p>
                    <p class="card-text"><small class="text-muted">뭐 적지</small></p>
                </div>
            </div>
        </div>
    </div>
</c:forEach>

<%-- 페이징 --%>
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