<%@page contentType="text/html; charset=utf-8" language="java" %>
<%@page import="model.*" %>
<%@ page import="com.sun.org.apache.xpath.internal.operations.Bool" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%! Profile profile; String activation, img_url, smoking, sharing, lifestyle, grade, habitude, sleep_habit, cleaning, indoor_eating, mbti; %>
<html>
<head>
    <title>마이페이지</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
          rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script>
        function update() {
            form2.submit();
        }
        function drop() {
            if (confirm("정말 탈퇴하시겠습니까?") == true){
                form1.submit();
                alert("탈퇴되었습니다.");
            } else {
                return;
            }
        }
    </script>
    <style>
        .dv {
            margin-top: -1%;
            position:relative;
        }
        .dvv {
            margin-top: 3%;
            position:relative;
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
        td {
            font-family: SBAggroL;
            padding-left: 10px;
            padding-bottom: 15px;
        }
        ul.space_list li {
            margin-bottom: 1em;
        }
        .button {
            border: 0px;
            border-radius: 10px;
            background-color: lightgray;
            padding: 7px 50px 7px 50px;
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
    </style>
</head>
<body>
<div class="dvv">
    <a href = "${pageContext.request.contextPath}/student/main" style="color: black;"><h3>&nbsp;Roomie</h3></a>
    <a href = "${pageContext.request.contextPath}/student/main"><img src="/images/logo-font.png" id="logo"/></a>
</div>

<% profile = (Profile) request.getAttribute("profile");
    if (profile.getActivation()==1)
        activation = "활성화";
    else
        activation = "비활성화";
    img_url = "/images/";
    if (profile.getPr_img()==0)
        img_url += "man1.png";
    else if (profile.getPr_img()==1)
        img_url += "man2.png";
    else if (profile.getPr_img()==2)
        img_url += "woman1.png";
    else
        img_url += "woman2.png";
    if (profile.getSmoking()==0)
        smoking = "O";
    else
        smoking = "X";
    if (profile.getSharing()==0)
        sharing = "가능";
    else
        sharing = "불가능";
    if (profile.getLifestyle()==0)
        lifestyle = "아침형";
    else
        lifestyle = "저녁형";
    if (profile.getGrade()==0)
        grade = "1학년";
    else if (profile.getGrade()==1)
        grade = "2학년";
    else if (profile.getGrade()==2)
        grade = "3학년";
    else if (profile.getGrade()==3)
        grade = "4학년";
    if (profile.getHabitude()==0)
        habitude = "추위를 탐";
    else if (profile.getHabitude()==1)
        habitude = "더위를 탐";
    else if (profile.getHabitude()==2)
        habitude = "둘 다 탐";
    else
        habitude = "상관없음";
    if (profile.getSleep_habit()==0)
        sleep_habit = "없음";
    else if (profile.getSleep_habit()==1)
        sleep_habit = "코골이";
    else if (profile.getSleep_habit()==2)
        sleep_habit = "이갈이";
    else
        sleep_habit = "몽유병";
    if (profile.getCleaning()==0)
        cleaning = "매일";
    else if (profile.getCleaning()==1)
        cleaning = "3일";
    else if (profile.getCleaning()==2)
        cleaning = "1주";
    else
        cleaning = "2주";
    if (profile.getIndoor_eating()==0)
        indoor_eating = "가능";
    else
        indoor_eating = "불가능";
    if (profile.getMbti()==0)
        mbti = "ENFJ";
    else if (profile.getMbti()==1)
        mbti = "ENFP";
    else if (profile.getMbti()==2)
        mbti = "ENTJ";
    else if (profile.getMbti()==3)
        mbti = "ENTP";
    else if (profile.getMbti()==4)
        mbti = "ESFJ";
    else if (profile.getMbti()==5)
        mbti = "ESFP";
    else if (profile.getMbti()==6)
        mbti = "ESTJ";
    else if (profile.getMbti()==7)
        mbti = "ESTP";
    else if (profile.getMbti()==8)
        mbti = "INFJ";
    else if (profile.getMbti()==9)
        mbti = "INFP";
    else if (profile.getMbti()==10)
        mbti = "INTJ";
    else if (profile.getMbti()==11)
        mbti = "INTP";
    else if (profile.getMbti()==12)
        mbti = "ISFJ";
    else if (profile.getMbti()==13)
        mbti = "ISFP";
    else if (profile.getMbti()==14)
        mbti = "ISTJ";
    else
        mbti = "ISTP";
%>
<br>
<div class="dv" align="center">
    <table style="border-radius: 10px; align: center;">
        <tr>
            <td colspan="2" rowspan="2">
                <img style="border-radius: 10px; width:300px; height:400px; object-fit: contain" src="<%=img_url%>"/>
            </td>
            <td colspan="3" style="width:400px; text-align: left; font-size: x-large; font-weight: 800; padding-top: 5px;">
                &nbsp;&nbsp;프로필 옵션<br><br>
            </td>
            <td/>
        </tr>
        <tr>
            <td width="100"></td>
            <td width="400" rowspan="3">
                <table style="font-size: large; width:400px;">
                    <tr>
                        <td>활성화 여부</td>
                        <td>: &emsp;&emsp;&emsp;<%=activation%></td>
                    </tr>
                    <tr>
                        <td>전공</td>
                        <td>: &emsp;&emsp;&emsp;${profile.major}</td>
                    </tr>
                    <tr>
                        <td>학년</td>
                        <td>: &emsp;&emsp;&emsp;<%=grade%></td>
                    </tr>
                    <tr>
                        <td>나이</td>
                        <td>: &emsp;&emsp;&emsp;${profile.age}</td>
                    </tr>
                    <tr>
                        <td>흡연유무</td>
                        <td>: &emsp;&emsp;&emsp;<%=smoking%></td>
                    </tr>
                    <tr>
                        <td>잠버릇</td>
                        <td>: &emsp;&emsp;&emsp;<%=sleep_habit%></td>
                    </tr>
                    <tr>
                        <td>생활 패턴</td>
                        <td>: &emsp;&emsp;&emsp;<%=lifestyle%></td>
                    </tr>
                    <tr>
                        <td>청소 주기</td>
                        <td>: &emsp;&emsp;&emsp;<%=cleaning%></td>
                    </tr>
                    <tr>
                        <td>실내취식</td>
                        <td>: &emsp;&emsp;&emsp;<%=indoor_eating%></td>
                    </tr>
                    <tr>
                        <td>생필품 공유</td>
                        <td>: &emsp;&emsp;&emsp;<%=sharing%></td>
                    </tr>
                    <tr>
                        <td>체질</td>
                        <td>: &emsp;&emsp;&emsp;<%=habitude%></td>
                    </tr>
                    <tr>
                        <td>MBTI</td>
                        <td>: &emsp;&emsp;&emsp;<%=mbti%></td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td align="center" style="font-size: large">${profile.name}</td>
            <td align="center">
                <div class="form-check form-switch">
                    <input class="form-check-input" type="checkbox" role="switch" id="flexSwitchCheckChecked" name="activation" value="1"
                           disabled <%if (profile.getActivation()==1) {%> checked <%} %>>
                </div>
            </td>
        </tr>
        <tr>
            <td align="center">
                <form name="form1" method="POST" action="${pageContext.servletContext.contextPath}/student/delete">
                    <input type="button" class="button" value="탈퇴하기" onclick="drop()">
                </form>
            </td>
            <td align="center">
                <form name="form2" action="${pageContext.servletContext.contextPath}/profile/update">
                    <input type="hidden" name="s_id" value="${profile.s_id}"/>
                    <input type="button" class="button" value="수정하기" onclick="update()">
                </form>
            </td>
        </tr>
    </table>
</div>
<footer id="footer">
    <hr>
    <p>데이터베이스프로그래밍 01-06 ©야-심차게<br>권민지 김유림 김은혜 박초은</p>
</footer>
</body>
</html>