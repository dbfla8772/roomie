<%@ page import="model.Mail" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! Mail mail; String receiver; %>
<html>
<head>
    <title>쪽지내용</title>
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
        function CancelMail() {
            if (confirm("정말로 취소하시겠습니까?") == true){
                form.submit();
                alert("취소되었습니다.");
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
            margin-top: 12px;
            font-family: SBAggroL;
            font-weight: bold;
        }
        table {
            font-family: SBAggroL;
            border: black 1px solid;
            font-size: 15px;
            margin-top: 10px;
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
            margin-top: 4px;
            margin-right: 460px;
        }
        a:hover {
            font-weight: bold;
            color: #858585;
            text-decoration-line: none;
        }
        a {
            text-decoration-line: none;
            color: #858585;
        }
        .btn {
            font-family: SBAggroL;
            font-size: 15px;
            position: relative;
            top : 3px;
            left: 105px;
        }
        .btn2 {
            font-family: SBAggroL;
            font-size: 15px;
            position: relative;
            top : 3px;
            left: 142px;
        }
        .sender {
            color: black;
            font-weight: bold;
            text-decoration-line: none;
        }
        .sender:hover {
            font-weight: bold;
            color: black;
            text-decoration-line: none;
        }
    </style>
</head>
<body>
<%
    mail = (Mail) request.getAttribute("mail");
    receiver = (String) request.getAttribute("receiver");
%>
<div align="center">
    <h4>쪽지내용</h4>
    <div class="link">
        <a href="${pageContext.request.contextPath}/mail/receive/receiveList?flag=0">받은쪽지</a>&nbsp;
        <a href="${pageContext.request.contextPath}/mail/send/sendList?flag=1" class="sender">보낸쪽지</a>
    </div>
    <form name="form" method="POST" action="${pageContext.request.contextPath}/mail/delete">
        <table align="center">
            <tr>
                <td width="12%" class="title">받은사람</td>
                <td>
                    <input type="hidden" name="ch_id" value="<%=mail.getCh_id()%>">
                    <input type="text" size="51" value="<%=receiver%>" style="margin: 2px;" readonly>
                </td>
            </tr>
            <tr>
                <td width="12%" class="title">보낸시간</td>
                <td>
                    <input type="text" size="51" value="<%=mail.getDatetime()%>" style="margin: 2px;" readonly>
                </td>
            </tr>
            <tr>
                <td class="title">내용</td>
                <td>
                    <textarea cols="50" rows="17" style="margin: 2px;" readonly><%=mail.getMessage()%></textarea>
                </td>
            </tr>
        </table>
        <% if (mail.getMailCheck() == 0) {%>
            <div class="btn">
                <button type="button" value="전송취소" class="btn btn-outline-dark" onClick="CancelMail()">전송취소</button>&nbsp;
                <button type="button" value="목록" class="btn btn-outline-dark" onClick="document.location.href='${pageContext.request.contextPath}/mail/send/sendList?flag=1'">목록</button>
            </div>
        <%} else {%>
            <div class="btn2">
                <button type="button" value="목록" class="btn btn-outline-dark" onClick="document.location.href='${pageContext.request.contextPath}/mail/send/sendList?flag=1'">목록</button>
            </div>
        <%}%>
    </form>
</div>
</body>
</html>