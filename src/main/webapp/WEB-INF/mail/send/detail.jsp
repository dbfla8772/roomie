<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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
</head>
<body>
<div align="center">
    <h3>쪽지쓰기</h3>
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
        <button type="button" value="취소" class="btn btn-outline-dark" onClick="SendCancel('${pageContext.request.contextPath}/mail/receive/receiveList')">취소</button>
    </form>
</div>
</body>
</html>
