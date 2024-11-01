<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! String receiver_name;
    int receiver; %>
<html>
<head>
    <title>쪽지쓰기</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
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
        function SendMessage() {
            if (form.message.value == "") {
                alert("내용을 입력하세요.");
                form.message.focus();
                return false;
            }
            if (confirm("정말로 전송하시겠습니까?") == true){
                form.submit();
                alert("전송되었습니다.");
            } else {
                return;
            }
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

        h4 {
            margin-top: 3%;
            font-family: SBAggroL;
            font-weight: bold;
        }

        table {
            font-family: SBAggroL;
            border: black 1px solid;
            font-size: 15px;
            margin-top: 1%;
        }

        td {
            border: black 1px solid;
        }

        .title {
            text-align: center;
        }

        button {
            margin-top: 1%;
            font-family: SBAggroL;
            font-size: 15px;
        }

        .link {
            font-family: SBAggroL;
            font-size: 14px;
            margin-left: 2%;
        }

        a:hover {
            font-weight: bold;
            color: #858585;
        }

        a:link {
            color: #858585;
        }

        a {
            text-decoration-line: none;
            color: #858585;
        }
    </style>
</head>
<body>
<%
    receiver_name = (String) request.getAttribute("receiver_name");
    receiver = (int) request.getAttribute("receiver");
%>
<div align="center">
    <h4>쪽지쓰기</h4>
    <div class="link" align="left">
        <a href="${pageContext.request.contextPath}/mail/receive/receiveList?flag=0">받은쪽지</a>&nbsp;
        <a href="${pageContext.request.contextPath}/mail/send/sendList?flag=1">보낸쪽지</a>
    </div>
    <form name="form" method="POST" action="${pageContext.request.contextPath}/mail/send">
        <table align="center">
            <tr>
                <td width="12%" class="title">받는사람</td>
                <td>
                    <input type="hidden" name="receiver" value="<%=receiver%>">
                    <input type="text" size="51" name="name" value="<%=receiver_name%>" style="margin: 2px;" readonly>
                </td>
            </tr>
            <tr>
                <td class="title">내용</td>
                <td>
                    <textarea name="message" cols="50" rows="17" style="margin: 2px;"></textarea>
                </td>
            </tr>
        </table>
        <button type="button" value="전송" onClick="SendMessage()" class="btn btn-outline-dark">전송</button>&nbsp;
        <button type="button" value="취소" class="btn btn-outline-dark"
                onClick="location.href='${pageContext.request.contextPath}/mail/receive/receiveList?flag=0';">취소</button>
    </form>
</div>
</body>
</html>