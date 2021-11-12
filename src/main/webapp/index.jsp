<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<html>
<head>
    <script>
        function search(targetUri) {
            form.action = targetUri;
            form.method="POST";		// register form 요청
            form.submit();
        }
    </script>

    <style>
        body {
            margin: 5%;
            align-content: center;
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
    </style>

</head>
<body>
<h4>&nbsp;Roomie 루미</h4>

</body>
</html>
