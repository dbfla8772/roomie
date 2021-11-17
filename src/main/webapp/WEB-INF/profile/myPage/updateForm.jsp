<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    Profile profile = (Profile) request.getAttribute("profile");
%>
<!DOCTYPE html>
<html>
<head>
    <title>프로필 수정</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script>
        function profModify() {
            if (form.name.value == "") {
                alert("이름을 입력하십시오.");
                form.name.focus();
                return false;
            }
            if (form.age.value == "") {
                alert("나이를 입력하십시오.");
                form.age.focus();
                return false;
            }
            if (form.major.value == "") {
                alert("학과를 입력하십시오.");
                form.major.focus();
                return false;
            }
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
        #logo {
            margin-top: -2.5%;
            width: 70px;
        }
        h3 {
            font-family: SBAggroB;
            float: left;
        }
        th {
            width: 200px;
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body>

<div>
    <h3>&nbsp;Roomie</h3>
    <img src="/images/logo-font.png" id="logo" />
</div>
<br>
<h2 style="text-align: center">마이 페이지 수정</h2>
<!-- Update Form  -->
<form name="form" method="POST" action="${pageContext.servletContext.contextPath}/profile/update">
    <input type="hidden" name="s_id" value="${profile.s_id}"/>
    <table class="table table-bordered" style="margin: auto auto; width: 1000px">
        <tr>
            <th>활성화 여부</th>
            <td>
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" <%if (profile.getActivation()) {%> checked <%} %>>
                    <label class="form-check-label" for="flexSwitchCheckChecked">활성화 여부</label>
                </div>
            </td>
        </tr>
        <tr>
            <th>닉네임</th>
            <td>
                <input type="text" style="width: 240px" name="name" value="${profile.name}">
            </td>
        </tr>
        <tr>
            <th>프로필 이미지</th>
            <td>
                <input type="radio" name="pr_img" value="0"
                    <%if (profile.getPr_img() == 0) {%> checked <%} %>>
                <img src="/images/man1.png" width="150px" height="150px">
                <input type="radio" name="pr_img" value="1"
                    <%if (profile.getPr_img() == 1) {%> checked <%} %>>
                <img src="/images/man2.png" width="150px" height="150px">
                <input type="radio" name="pr_img" value="2"
                    <%if (profile.getPr_img() == 2) {%> checked <%} %>>
                <img src="/images/woman1.png" width="150px" height="150px">
                <input type="radio" name="pr_img" value="3"
                    <%if (profile.getPr_img() == 3) {%> checked <%} %>>
                <img src="/images/woman2.png" width="150px" height="150px">
            </td>
        </tr>
        <tr>
            <th>나이</th>
            <td>
                <input type="number" style="width: 240px" name="age" value="${profile.age}" min="20" max="30">
            </td>
        </tr>
        <tr>
            <th>잠버릇</th>
            <td>
                <input type="radio" name="sleep_habit" value="0"
                    <%if (profile.getSleep_habit() == 0) {%> checked <%} %>>없음
                <input type="radio" name="sleep_habit" value="1"
                    <%if (profile.getSleep_habit() == 1) {%> checked <%} %>>코골이
                <input type="radio" name="sleep_habit" value="2"
                    <%if (profile.getSleep_habit() == 2) {%> checked <%} %>>이갈이
                <input type="radio" name="sleep_habit" value="3"
                    <%if (profile.getSleep_habit() == 3) {%> checked <%} %>>몽유병
            </td>
        </tr>
        <tr height="40">
            <th>생활형</th>
            <td>
                <input type="radio" name="lifestyle" value="0"
                    <%if (profile.getLifestyle() == 0) {%> checked <%} %>>아침형
                <input type="radio" name="lifestyle" value="1"
                    <%if (profile.getLifestyle() == 1) {%> checked <%} %>>저녁형
            </td>
        </tr>
        <tr>
            <th>흡연 여부</th>
            <td>
                <input type="radio" name="smoking" value="0"
                    <%if (profile.getSmoking() == 0) {%> checked <%} %>>O
                <input type="radio" name="smoking" value="1"
                    <%if (profile.getSmoking() == 1) {%> checked <%} %>>X
            </td>
        </tr>
        <tr>
            <th>학년</th>
            <td>
                <input type="radio" name="grade" value="0"
                    <%if (profile.getGrade() == 0) {%> checked <%} %>>1학년
                <input type="radio" name="grade" value="1"
                    <%if (profile.getGrade() == 1) {%> checked <%} %>>2학년
                <input type="radio" name="grade" value="2"
                    <%if (profile.getGrade() == 2) {%> checked <%} %>>3학년
                <input type="radio" name="grade" value="3"
                    <%if (profile.getGrade() == 3) {%> checked <%} %>>4학년
            </td>
        </tr>
        <tr>
            <th>학과</th>
            <td>
                <input type="text" style="width: 240px" name="major" value="${profile.major}">
            </td>
        </tr>
        <tr>
            <th>MBTI</th>
            <td>
                <select name="mbti">
                    <option value="0" <% if(profile.getMbti() == 0) {%> selected <% } %>>ENFJ</option>
                    <option value="1" <% if(profile.getMbti() == 1) {%> selected <% } %>>ENFP</option>
                    <option value="2" <% if(profile.getMbti() == 2) {%> selected <% } %>>ENTJ</option>
                    <option value="3" <% if(profile.getMbti() == 3) {%> selected <% } %>>ENTP</option>
                    <option value="4" <% if(profile.getMbti() == 4) {%> selected <% } %>>ESFJ</option>
                    <option value="5" <% if(profile.getMbti() == 5) {%> selected <% } %>>ESFP</option>
                    <option value="6" <% if(profile.getMbti() == 6) {%> selected <% } %>>ESTJ</option>
                    <option value="7" <% if(profile.getMbti() == 7) {%> selected <% } %>>ESTP</option>
                    <option value="8" <% if(profile.getMbti() == 8) {%> selected <% } %>>INFJ</option>
                    <option value="9" <% if(profile.getMbti() == 9) {%> selected <% } %>>INFP</option>
                    <option value="10" <% if(profile.getMbti() == 10) {%> selected <% } %>>INTJ</option>
                    <option value="11" <% if(profile.getMbti() == 11) {%> selected <% } %>>INTP</option>
                    <option value="12" <% if(profile.getMbti() == 12) {%> selected <% } %>>ISFJ</option>
                    <option value="13" <% if(profile.getMbti() == 13) {%> selected <% } %>>ISFP</option
                    <option value="14" <% if(profile.getMbti() == 14) {%> selected <% } %>>ISTJ</option>
                    <option value="15" <% if(profile.getMbti() == 15) {%> selected <% } %>>ISTP</option>
                </select>
            </td>
        </tr>
        <tr>
            <th>청소주기</th>
            <td>
                <input type="radio" name="cleaning" value="0"
                    <%if (profile.getCleaning() == 0) {%> checked <%} %>>매일
                <input type="radio" name="cleaning" value="1"
                    <%if (profile.getCleaning() == 1) {%> checked <%} %>>3일
                <input type="radio" name="cleaning" value="2"
                    <%if (profile.getCleaning() == 2) {%> checked <%} %>>1주
                <input type="radio" name="cleaning" value="3"
                    <%if (profile.getCleaning() == 3) {%> checked <%} %>>2주
            </td>
        </tr>
        <tr>
            <th>실내 취식여부</th>
            <td>
                <input type="radio" name="indoor_eating" value="0"
                    <%if (profile.getIndoor_eating() == 0) {%> checked <%} %>>냄새 나는 음식도 가능
                <input type="radio" name="indoor_eating" value="1"
                    <%if (profile.getIndoor_eating() == 1) {%> checked <%} %>>냄새 안나는 음식만 가능
                <input type="radio" name="indoor_eating" value="2"
                    <%if (profile.getIndoor_eating() == 2) {%> checked <%} %>>불가능
            </td>
        </tr>
        <tr>
            <th>생필품 공유여부</th>
            <td>
                <input type="radio" name="sharing" value="0"
                    <%if (profile.getSharing() == 0) {%> checked <%} %>>전부 가능
                <input type="radio" name="sharing" value="1"
                    <%if (profile.getSharing() == 1) {%> checked <%} %>>공용 용품만 가능
                <input type="radio" name="sharing" value="2"
                    <%if (profile.getSharing() == 2) {%> checked <%} %>>전부 불가능
            </td>
        </tr>
        <tr>
            <th>체질</th>
            <td>
                <input type="radio" name="habitude" value="0"
                    <%if (profile.getHabitude() == 0) {%> checked <%} %>>추위를 탐
                <input type="radio" name="habitude" value="1"
                    <%if (profile.getHabitude() == 1) {%> checked <%} %>>더위를 탐
                <input type="radio" name="habitude" value="2"
                    <%if (profile.getHabitude() == 2) {%> checked <%} %>>둘 다 안탐
            </td>
        </tr>
        <tr>
            <td style="text-align: center;" colspan="2">
                <input type="button" value="수정" class="btn btn-outline-primary" onClick="profModify()"> &nbsp;
                <input type="button" value="취소" class="btn btn-outline-primary" onClick="history.back()">
            </td>
        </tr>
    </table>
</form>
</body>
</html>