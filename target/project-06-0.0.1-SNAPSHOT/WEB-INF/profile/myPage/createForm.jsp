<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>프로필 등록</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <script>
        function profCreate() {
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

<h3>&nbsp;Roomie</h3>
<img src="/images/logo-font.png" id="logo" />

<br>
<h2 style="text-align: center">프로필 등록</h2>
<!-- Create Form  -->
<div style="text-align: center">
    <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/profile/create">
        <table class="table table-bordered" style="margin: auto auto; width: 1000px">
            <tr>
                <th>활성화 여부</th>
                <td>
                    <div class="form-check form-switch">
                        <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" value="1" checked >
                        <label class="form-check-label" for="flexSwitchCheckChecked">활성화/비활성화</label>
                    </div>
                </td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>
                    <input type="text" readonly style="width: 240px" name="email" value="<%=(String)request.getAttribute("email")%>">
                </td>
            </tr>
            <tr>
                <th>닉네임</th>
                <td>
                    <input type="text" style="width: 240px" name="name">
                </td>
            </tr>
            <tr>
                <th>프로필 이미지</th>
                <td>
                    <input type="radio" name="pr_img" value="0">
                        <img src="/images/man1.png" width="150px" height="150px">
                    <input type="radio" name="pr_img" value="1">
                        <img src="/images/man2.png" width="150px" height="150px">
                    <input type="radio" name="pr_img" value="2">
                        <img src="/images/woman1.png" width="150px" height="150px">
                    <input type="radio" name="pr_img" value="3">
                        <img src="/images/woman2.png" width="150px" height="150px">
                </td>
            </tr>
            <tr>
                <th>나이</th>
                <td>
                    <input type="number" style="width: 240px" name="age" min="20" max="30">
                </td>
            </tr>
            <tr>
                <th>잠버릇</th>
                <td>
                    <input type="radio" name="sleep_habit" value="0">없음
                    <input type="radio" name="sleep_habit" value="1">코골이
                    <input type="radio" name="sleep_habit" value="2">이갈이
                    <input type="radio" name="sleep_habit" value="3">몽유병
                </td>
            </tr>
            <tr>
                <th>생활패턴</th>
                <td>
                    <input type="radio" name="lifestyle" value="0">아침형
                    <input type="radio" name="lifestyle" value="1">저녁형
                </td>
            </tr>
            <tr>
                <th>흡연 여부</th>
                <td>
                    <input type="radio" name="smoking" value="0">O
                    <input type="radio" name="smoking" value="1">X
                </td>
            </tr>
            <tr>
                <th>학년</th>
                <td>
                    <input type="radio" name="grade" value="0">1학년
                    <input type="radio" name="grade" value="1">2학년
                    <input type="radio" name="grade" value="2">3학년
                    <input type="radio" name="grade" value="3">4학년
                </td>
            </tr>
            <tr>
                <th>학과</th>
                <td>
                    <input type="text" style="width: 240px" name="major">
                </td>
            </tr>
            <tr>
                <th>MBTI</th>
                <td>
                    <select name="mbti">
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
                </td>
            </tr>
            <tr>
                <th>청소주기</th>
                <td>
                    <input type="radio" name="cleaning" value="0">매일
                    <input type="radio" name="cleaning" value="1">3일
                    <input type="radio" name="cleaning" value="2">1주
                    <input type="radio" name="cleaning" value="3">2주
                </td>
            </tr>
            <tr>
                <th>실내 취식여부</th>
                <td class="commCell">
                    <input type="radio" name="indoor_eating" value="0">냄새나는 음식도 가능
                    <input type="radio" name="indoor_eating" value="1">냄새 안 나는 음식만 가능
                    <input type="radio" name="indoor_eating" value="2">불가능
                </td>
            </tr>
            <tr>
                <th>생필품 공유여부</th>
                <td class="commCell">
                    <input type="radio" name="sharing" value="0">전부 가능
                    <input type="radio" name="sharing" value="1">공용 용품만 가능
                    <input type="radio" name="sharing" value="2">전부 불가능
                </td>
            </tr>
            <tr>
                <th>체질</th>
                <td>
                    <input type="radio" name="habitude" value="0">추위를 탐
                    <input type="radio" name="habitude" value="1">더위를 탐
                    <input type="radio" name="habitude" value="2">둘 다 안탐
                </td>
            </tr>
            <tr>
                <td style="text-align: center;" colspan="2">
                    <input type="button" value="등록" class="btn btn-outline-primary" onClick="profCreate()"> &nbsp;
                </td>
            </tr>
    </table>
</form>
</div>
</body>
</html>