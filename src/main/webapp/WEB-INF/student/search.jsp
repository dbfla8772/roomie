<%@ page import="model.Profile" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%! Profile profile; %>
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
            form.method="POST";		// register form 요청
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

        div {
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

        #mbti {
            padding: 5px 10px;
            font-size: 15px;
            margin: 2px;
        }
    </style>

</head>
<body>

<a href = "${pageContext.request.contextPath}/student/main"><h3>&nbsp;Roomie</h3></a>
<a href = "${pageContext.request.contextPath}/student/main"><img src="/images/logo-font.png" id="logo"/></a>


<%-- 검색 필터 --%>
<%--<form name="form" method="post" action="<c:url value='/student/searchResult'>">--%>
<% profile = (Profile) request.getAttribute("profile"); %>
<form name="form" method="POST" action="${pageContext.request.contextPath}/student/searchResult">
    <table>
        <tr>
            <td><input type="checkbox" name="habitude" value="<%= profile.getHabitude() %>"><label>&nbsp;체질</label></td>
            <td><input type="checkbox" name="sleep_habit" value="<%= profile.getSleep_habit() %>"><label>&nbsp;잠버릇</label></td>
            <td><input type="checkbox" name="lifestyle" value="<%= profile.getLifestyle() %>"><label>&nbsp;생활 패턴</label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" name="smoking" value="<%= profile.getSmoking() %>"><label>&nbsp;흡연 유무</label></td>
            <td><input type="checkbox" name="grade" value="<%= profile.getGrade() %>"><label>&nbsp;학년</label></td>
            <td><input type="checkbox" name="major" value="<%= profile.getMajor() %>"><label>&nbsp;전공</label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" name="cleaning" value="<%= profile.getCleaning() %>"><label>&nbsp;청소 주기</label></td>
            <td><input type="checkbox" name="indoor_eating" value="<%= profile.getIndoor_eating() %>"><label>&nbsp;실내 취식</label></td>
            <td><label>&nbsp;&nbsp;&nbsp;MBTI&nbsp;
                <select id="mbti" name="mbti">
                    <option value="-1">선택안함</option>
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
            <td><input type="checkbox" name="sharing" value="<%= profile.getSharing() %>"><label>&nbsp;생필품 공유</label></td>
        </tr>
    </table>

    <div class="btn">
        <%-- 검색 실행 버튼 --%>
        <button type="submit" class="btn btn-outline-secondary" onclick="search('${pageContext.request.contextPath}/student/search')">검색하기</button>
    </div>
    <%-- 돋보기 이미지 --%>
    <div class="search-img">
        <img src="<c:url value='/images/magnifier.png'/>" id="magnifier"/>
    </div>
</form>
</body>
</html>
