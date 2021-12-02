<%@page contentType="text/html; charset=utf-8" %>
<%@page import="model.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>프로필 등록</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
          crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
            crossorigin="anonymous"></script>
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
            alert("회원가입되었습니다.");
        }
    </script>
    <style>
        .dv {
            margin-top: 0%;
        }
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
            margin: 0;
            width: auto;
            height: auto;
            margin-bottom: 4%;
        }

        h3 {
            font-family: SBAggroB;
            float: left;
            padding-top: 30px;
            padding-left: 100px;
            color: black;
        }

        h4 {
            font-family: SBAggroL;
        }

        #logo {
            width: 70px;
            margin-left: 5px;
        }

        .dv {
            margin-top: 50px;
            margin-bottom: 30px;
        }

        td {
            padding-left: 10px;
            padding-bottom: 15px;
            font-family: SBAggroL;
        }

        ul.space_list li {
            margin-bottom: 1em;
        }

        ul.none {
            margin-bottom: 1em;
            list-style: none;
        }

        .layer {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%)
        }

        .button {
            border: 0px;
            border-radius: 10px;
            background-color: lightgray;
            padding: 7px 50px 7px 50px;
        }
    </style>
</head>
<body>

<a href="${pageContext.request.contextPath}/student/main" style="color: black"><h3>&nbsp;Roomie</h3></a>
<a href="${pageContext.request.contextPath}/student/main"><img src="/images/logo-font.png" id="logo"/></a>

<div class="container">
    <header class="blog-header py-3">
        <div class="row flex-nowrap justify-content-between align-items-center">
            <div class="col-4 pt-1">
                <a class="blog-header-logo text-dark" href="${pageContext.request.contextPath}/student/main"><h1>Roomie 루미</h1></a>
            </div>
            <div class="col-4 text-center">
            </div>
            <div class="col-4 d-flex justify-content-end align-items-center">
                <h4>프로필 등록</h4><br>
                <form><input type="button" value="등록" class="btn btn-outline-primary" onClick="profCreate()"></form> &nbsp
            </div>
        </div>
        <br>
    </header>
</div>
<!-- Create Form  -->
<%--<div style="text-align: center">--%>
<%--    <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/profile/create">--%>
<%--        <table class="table table-bordered" style="margin: auto auto; width: 1000px">--%>
<%--            <tr>--%>
<%--                <th>이메일</th>--%>
<%--                <td>--%>
<%--                    <input type="text" readonly style="width: 240px" name="email"--%>
<%--                           value="<%=(String)request.getAttribute("email")%>">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>프로필 이미지</th>--%>
<%--                <td>--%>
<%--                    <input type="radio" name="pr_img" value="0">--%>
<%--                    <img src="/images/man1.png" width="150px" height="150px">--%>
<%--                    <input type="radio" name="pr_img" value="1">--%>
<%--                    <img src="/images/man2.png" width="150px" height="150px">--%>
<%--                    <input type="radio" name="pr_img" value="2">--%>
<%--                    <img src="/images/woman1.png" width="150px" height="150px">--%>
<%--                    <input type="radio" name="pr_img" value="3">--%>
<%--                    <img src="/images/woman2.png" width="150px" height="150px">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>닉네임</th>--%>
<%--                <td>--%>
<%--                    <input type="text" style="width: 240px" name="name">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>전공</th>--%>
<%--                <td>--%>
<%--                    <input type="text" style="width: 240px" name="major">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>학년</th>--%>
<%--                <td>--%>
<%--                    <input type="radio" name="grade" value="0">1학년--%>
<%--                    <input type="radio" name="grade" value="1">2학년--%>
<%--                    <input type="radio" name="grade" value="2">3학년--%>
<%--                    <input type="radio" name="grade" value="3">4학년--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>나이</th>--%>
<%--                <td>--%>
<%--                    <input type="number" style="width: 240px" name="age" min="20" max="30">--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>흡연 여부</th>--%>
<%--                <td>--%>
<%--                    <input type="radio" name="smoking" value="0">O--%>
<%--                    <input type="radio" name="smoking" value="1">X--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>잠버릇</th>--%>
<%--                <td>--%>
<%--                    <input type="radio" name="sleep_habit" value="0">없음--%>
<%--                    <input type="radio" name="sleep_habit" value="1">코골이--%>
<%--                    <input type="radio" name="sleep_habit" value="2">이갈이--%>
<%--                    <input type="radio" name="sleep_habit" value="3">몽유병--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>생활패턴</th>--%>
<%--                <td>--%>
<%--                    <input type="radio" name="lifestyle" value="0">아침형--%>
<%--                    <input type="radio" name="lifestyle" value="1">저녁형--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>청소주기</th>--%>
<%--                <td>--%>
<%--                    <input type="radio" name="cleaning" value="0">매일--%>
<%--                    <input type="radio" name="cleaning" value="1">3일--%>
<%--                    <input type="radio" name="cleaning" value="2">1주--%>
<%--                    <input type="radio" name="cleaning" value="3">2주--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>실내 취식</th>--%>
<%--                <td class="commCell">--%>
<%--                    <input type="radio" name="indoor_eating" value="0">가능--%>
<%--                    <input type="radio" name="indoor_eating" value="1">불가능--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>생필품 공유</th>--%>
<%--                <td class="commCell">--%>
<%--                    <input type="radio" name="sharing" value="0">가능--%>
<%--                    <input type="radio" name="sharing" value="1">불가능--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>체질</th>--%>
<%--                <td>--%>
<%--                    <input type="radio" name="habitude" value="0">추위를 탐--%>
<%--                    <input type="radio" name="habitude" value="1">더위를 탐--%>
<%--                    <input type="radio" name="habitude" value="2">둘 다 탐--%>
<%--                    <input type="radio" name="habitude" value="3">상관없음--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <th>MBTI</th>--%>
<%--                <td>--%>
<%--                    <select name="mbti">--%>
<%--                        <option value="0">ENFJ</option>--%>
<%--                        <option value="1">ENFP</option>--%>
<%--                        <option value="2">ENTJ</option>--%>
<%--                        <option value="3">ENTP</option>--%>
<%--                        <option value="4">ESFJ</option>--%>
<%--                        <option value="5">ESFP</option>--%>
<%--                        <option value="6">ESTJ</option>--%>
<%--                        <option value="7">ESTP</option>--%>
<%--                        <option value="8">INFJ</option>--%>
<%--                        <option value="9">INFP</option>--%>
<%--                        <option value="10">INTJ</option>--%>
<%--                        <option value="11">INTP</option>--%>
<%--                        <option value="12">ISFJ</option>--%>
<%--                        <option value="13">ISFP</option>--%>
<%--                        <option value="14">ISTJ</option>--%>
<%--                        <option value="15">ISTP</option>--%>
<%--                    </select>--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--            <tr>--%>
<%--                <td style="text-align: center;" colspan="2">--%>
<%--                    <input type="button" value="등록" class="btn btn-outline-primary" onClick="profCreate()"> &nbsp;--%>
<%--                </td>--%>
<%--            </tr>--%>
<%--        </table>--%>
<%--    </form>--%>
<%--</div>--%>


<div class="dv" align="center">
    <form name="form" method="POST" action="${pageContext.servletContext.contextPath}/profile/create">
    <table style="border-radius: 10px; align: center;">
        <tr>
            <td colspan="2" rowspan="2">
                <input type="radio" name="pr_img" value="0">
                <img src="/images/man1.png" width="50px" height="50px">
                <input type="radio" name="pr_img" value="1">
                <img src="/images/man2.png" width="50px" height="50px">
                <input type="radio" name="pr_img" value="2">
                <img src="/images/woman1.png" width="50px" height="50px">
                <input type="radio" name="pr_img" value="3">
                <img src="/images/woman2.png" width="50px" height="50px">
            </td>
<%--            <td colspan="3" style="width:400px; text-align: center; font-size: x-large; font-weight: 800; padding-top: 5px;">--%>
<%--                &nbsp;&nbsp;프로필 옵션<br><br>--%>
<%--            </td>--%>
        </tr>
        <tr>
            <td width="100"></td>
            <td width="400" rowspan="3">
                <table style="font-size: large; width:400px;">
                    <tr>
                        <td style="width: 100px">이메일</td>
                        <td>
                            <input type="text" readonly style="width: 240px" name="email" readonly
                                   value="<%=(String)request.getAttribute("email")%>">
                        </td>
                    </tr>
                    <tr>
                        <td>닉네임</td>
                        <td>
                            <input type="text" style="width: 240px" name="name">
                        </td>
                    </tr>
                    <tr>
                        <td>전공</td>
                        <td>
                            <input type="text" style="width: 240px" name="major">
                        </td>
                    </tr>
                    <tr>
                        <td>학년</td>
                        <td>
                            <input type="radio" name="grade" value="0">1학년
                            <input type="radio" name="grade" value="1">2학년
                            <input type="radio" name="grade" value="2">3학년
                            <input type="radio" name="grade" value="3">4학년
                        </td>
                    </tr>
                    <tr>
                        <td>나이</td>
                        <td>
                            <input type="number" style="width: 240px" name="age" min="20" max="30">
                        </td>
                    </tr>
                    <tr>
                        <td>흡연유무</td>
                        <td>
                            <input type="radio" name="smoking" value="0">O
                            <input type="radio" name="smoking" value="1">X
                        </td>
                    </tr>
                    <tr>
                        <td>잠버릇</td>
                        <td>
                            <input type="radio" name="sleep_habit" value="0">없음
                            <input type="radio" name="sleep_habit" value="1">코골이
                            <input type="radio" name="sleep_habit" value="2">이갈이
                            <input type="radio" name="sleep_habit" value="3">몽유병
                        </td>
                    </tr>
                    <tr>
                        <td>생활 패턴</td>
                        <td>
                            <input type="radio" name="lifestyle" value="0">아침형
                            <input type="radio" name="lifestyle" value="1">저녁형
                        </td>
                    </tr>
                    <tr>
                        <td>청소 주기</td>
                        <td>
                            <input type="radio" name="cleaning" value="0">매일
                            <input type="radio" name="cleaning" value="1">3일
                            <input type="radio" name="cleaning" value="2">1주
                            <input type="radio" name="cleaning" value="3">2주
                        </td>
                    </tr>
                    <tr>
                        <td>실내취식</td>
                        <td class="commCell">
                            <input type="radio" name="indoor_eating" value="0">가능
                            <input type="radio" name="indoor_eating" value="1">불가능
                        </td>
                    </tr>
                    <tr>
                        <td>생필품 공유</td>
                        <td class="commCell">
                            <input type="radio" name="sharing" value="0">가능
                            <input type="radio" name="sharing" value="1">불가능
                        </td>
                    </tr>
                    <tr>
                        <td>체질</td>
                        <td>
                            <input type="radio" name="habitude" value="0">추위를 탐
                            <input type="radio" name="habitude" value="1">더위를 탐
                            <input type="radio" name="habitude" value="2">둘 다 탐
                            <input type="radio" name="habitude" value="3">상관없음
                        </td>
                    </tr>
                    <tr>
                        <td>MBTI</td>
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
                </table>
            </td>
        </tr>
        <tr>
            <td align="center">
                <input type="text" style="width: 240px" name="name">
            </td>
        </tr>
<%--        <tr>--%>
<%--            <td colspan="2" align="center">--%>
<%--                <button class="button">나의 루미로 pick!</button>--%>
<%--            </td>--%>
<%--            <td width="100"></td>--%>
<%--        </tr>--%>
    </table>
    </form>
</div>
</body>
</html>