<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>detail profile</title>
    <style>
        html, body {
            margin: 0;
            width: auto;
            height: auto;
            background-color: lemonchiffon;
        }
        .container {
            padding-top: 30px;
            text-align: center;
            width: auto;
            height: 50px;
            /*background: lightcyan;*/
        }
        .layer {
            position: absolute;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%)
        }
    </style>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</head>
<body style="background-color: lemonchiffon;">
    <%!
    int totalCount;
    int countList;
    int totalPage;
    int i;
    String profileCard = " <div class=\"layer\">\n" +
            "      <div class=\"card mb-3 w-1200\">\n" +
            "            <div class=\"row g-0\">\n" +
            "                <div class=\"col-md-4\">\n" +
            "                    <img src=\"/images/jjang.jpg\" class=\"img-fluid rounded-start\" alt=\"...\">\n" +
            "                </div>\n" +
            "                <div class=\"col-md-8\">\n" +
            "                    <div class=\"card-body\">\n" +
            "                        <h5 class=\"card-title\">Card title</h5>\n" +
            "                        <p class=\"card-text\">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>\n" +
            "                        <p class=\"card-text\"><small class=\"text-muted\">Last updated 3 mins ago</small></p>\n" +
            "                    </div>\n" +
            "                </div>\n" +
            "            </div>\n" +
            "        </div>\n" +
            "     </div>";
%>
<div class="w-auto p-3" style="background-color: lightcyan; text-align: center;"><h4>당신의 루미를 찾아보세요! <button class="btn btn-outline-success" type="submit">자동매칭 하러가기</button></h4></div>

<a href = "../student/search.jsp"><h3 style="padding-top: 30px; padding-left: 100px; color: black;">Roomie 루미</h3></a>
<div style="padding-top: 50px;">
    <table align="center" style="border-radius: 10px; background-color: lemonchiffon;">
        <tr>
            <td colspan="2" rowspan="2"><img style="border-radius: 10px;" width="300" height="400" src="/images/jjang.jpg"/></td>
            <td width="100"></td>
            <td width="400"colspan="2" style="font-size: x-large; font-weight: 800;"> &emsp;&emsp;프로필 옵션 </td>
        </tr>
        <tr>
            <td width="100"></td>
            <td rowspan="3" style="font-size: large;">
                <ul>
                    <li>흡연 유무: Y</li>
                    <li>전공: 컴퓨터학과 </li>
                    <li>생필품 공유: Y</li>
                    <li>생활 패턴: 아침형</li>
                    <li>학년: 3</li>
                    <li>체질: 더위 탐</li>
                    <li>잠버릇: Y</li>
                    <li>청소주기: 매일</li>
                    <li>나이: 21</li>
                    <li>실내 취식: Y</li>
                    <li>MBTI: ESFJ</li>
                </ul>
            </td>
        </tr>
        <tr>
            <td align="center"><button style="border: 0px; border-radius: 10px; background-color: antiquewhite; padding: 7px 50px 7px 50px; ">스크랩</button></td>
            <td align="center"><button style="border: 0px; border-radius: 10px; background-color: antiquewhite; padding: 7px 50px 7px 50px; ">쪽지</button></td>
            <td width="100"></td>
        </tr>
        <tr>
            <td colspan="2" align="center"><button style="border: 0px; border-radius: 10px; background-color: antiquewhite; padding: 7px 50px 7px 50px; ">나의 루미 pick!</button></td>
            <td width="100"></td>
        </tr>
    </table>
</div>

