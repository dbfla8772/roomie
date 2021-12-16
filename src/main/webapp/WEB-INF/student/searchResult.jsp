<%@ page import="model.Profile" %>
<%@ page import="java.util.List" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%! List<Profile> profileList; String img_url; int[] filter; int i; String[] check; %>
<html>
<head>
    <title>검색 결과</title>
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
            form.method = "GET";
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
            margin-top: 5%;
            align-content: center;
        }

        #logo {
            margin-top: -2%;
            width: 70px;
        }

        h3 {
            font-family: SBAggroB;
            float: left;
            color: black;
            margin-left: 8%;
        }

        table {
            margin: 0 auto;
            width: 70%;
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
            margin-right: 13%;
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

        .card-margin {
            font-family: SBAggroL;
            width: 40%;
            display: inline-block;
            /*padding: 2%;*/
            padding-bottom: 2%;
            margin: 0 4.9%;
        }
        .mb-3 {
            width: 100%;
            padding: 4%;
            border-radius: 10px;
            cursor: pointer;
        }
        .col-md-4 {
            border-radius: 10px;
            margin: 0 2%;
        }
        .col-md-8 {
            margin-right: -7%;
            margin-left: 3%;
        }

        #mbti {
            padding: 5px 10px;
            font-size: 15px;
            margin: 2px;
        }

        .empty {
            text-align: center;
        }
        h5 {
            font-family: SBAggroL;
        }

        #footer {
            position: relative;
            width: 100%;
            bottom: 0;
            font-family: SBAggroL;
            text-align: center;
            font-size: x-small;
            padding-bottom: 50px;
            margin-top: 100px;
        }
        #footer p {
            padding: 0px 30px;
        }

        .search_result {
            margin: 0 7%;
        }

    </style>

</head>
<body>
<a href = "${pageContext.request.contextPath}/student/main"><h3 id="top">&nbsp;Roomie</h3></a>
<a href = "${pageContext.request.contextPath}/student/main"><img src="/images/logo-font.png" id="logo"/></a>

<%
    filter = new int[10];
    filter = (int[]) request.getAttribute("filter");

    check = new String[10];

    for (i = 0; i < filter.length; i++) {
        if(filter[i] != -1) {
            check[i] = "checked";
            if(i == 7) {
                check[i] = String.valueOf(filter[i]);
            }
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
            <td><input type="checkbox" id="habitude" name="searchFilter" <%=check[9]%> disabled="disabled"><label>&nbsp;체질</label></td>
            <td><input type="checkbox" id="sleep_habit" name="searchFilter" <%=check[0]%> disabled="disabled"><label>&nbsp;잠버릇</label></td>
            <td><input type="checkbox" id="lifestyle" name="searchFilter" <%=check[1]%> disabled="disabled"><label>&nbsp;생활 패턴</label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="smoking" name="searchFilter" <%=check[2]%> disabled="disabled"><label>&nbsp;흡연 유무</label></td>
            <td><input type="checkbox" id="grade" name="searchFilter" <%=check[3]%> disabled="disabled"><label>&nbsp;학년</label></td>
            <td><input type="checkbox" id="major" name="searchFilter" <%=check[4]%> disabled="disabled"><label>&nbsp;전공</label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="cleaning" name="searchFilter" <%=check[5]%> disabled="disabled"><label>&nbsp;청소 주기</label></td>
            <td><input type="checkbox" id="indoor_eating" name="searchFilter" <%=check[6]%> disabled="disabled"><label>&nbsp;실내 취식</label></td>
            <td><label>&nbsp;&nbsp;&nbsp;MBTI&nbsp;
                <select id="mbti" name="searchFilter" disabled="disabled">
                    <option value="-1" <% if(filter[7] == -1) {%> selected <% } %>>선택안함</option>
                    <option value="0" <% if(filter[7] == 0) {%> selected <% } %>>ENFJ</option>
                    <option value="1" <% if(filter[7] == 1) {%> selected <% } %>>ENFP</option>
                    <option value="2" <% if(filter[7] == 2) {%> selected <% } %>>ENTJ</option>
                    <option value="3" <% if(filter[7] == 3) {%> selected <% } %>>ENTP</option>
                    <option value="4" <% if(filter[7] == 4) {%> selected <% } %>>ESFJ</option>
                    <option value="5" <% if(filter[7] == 5) {%> selected <% } %>>ESFP</option>
                    <option value="6" <% if(filter[7] == 6) {%> selected <% } %>>ESTJ</option>
                    <option value="7" <% if(filter[7] == 7) {%> selected <% } %>>ESTP</option>
                    <option value="8" <% if(filter[7] == 8) {%> selected <% } %>>INFJ</option>
                    <option value="9" <% if(filter[7] == 9) {%> selected <% } %>>INFP</option>
                    <option value="10" <% if(filter[7] == 10) {%> selected <% } %>>INTJ</option>
                    <option value="11" <% if(filter[7] == 11) {%> selected <% } %>>INTP</option>
                    <option value="12" <% if(filter[7] == 12) {%> selected <% } %>>ISFJ</option>
                    <option value="13" <% if(filter[7] == 13) {%> selected <% } %>>ISFP</option
                    <option value="14" <% if(filter[7] == 14) {%> selected <% } %>>ISTJ</option>
                    <option value="15" <% if(filter[7] == 15) {%> selected <% } %>>ISTP</option>
                </select>
            </label></td>
            <br>
        </tr>
        <tr>
            <td><input type="checkbox" id="sharing" name="searchFilter" <%=check[8]%> disabled="disabled"><label>&nbsp;생필품 공유</label></td>
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
</form><p/><br>

<%profileList = (List<Profile>) request.getAttribute("profileList");%>
<div class="empty">
    <c:if test="${empty profileList}"><h5>검색 결과가 없습니다.</h5></c:if>
</div>

<div class="search_result">
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
                            <p class="card-text">${profile.major} (${profile.grade+1}학년)&emsp;&emsp;&emsp;&emsp;&emsp; <br>${profile.age}세&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</p>
                            <p class="card-text"><small class="text-muted"></small></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </c:forEach>
</form>
</div>
<br>
<footer id="footer">
    <hr>
    <p>데이터베이스프로그래밍 01-06 ©야-심차게<br>권민지 김유림 김은혜 박초은</p>
</footer>
<div style="position: fixed; bottom: 20px; right: 20px; cursor: pointer;">
    <a href="#top"><img src="/images/btnTop2.png" title="맨 위로" style="width: 60px; height: 63px;"></a>
</div>
</body>
</html>