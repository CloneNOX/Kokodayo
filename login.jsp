<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    String path = request.getContextPath();
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
%>
<!Doctype html>
<head>
    <title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
    <link rel="stylesheet" type="text/css" href="./css/login.css">
    <style></style>
</head>
<body>
    <div id="header">
        <a id="home" href="./index.jsp"><img src="./img/Logo_rhodesOverride.png"></a>
        <div id="title">
            <h1>Ko~Ko~Da~Yo~</h1>
            <img id="titleKokodayo" src="./img/kokodayo_sit.png">
        </div>
    </div>
    <div id="container">
        <h2>Login</h2>
        <div id = "input">
            <form action = "checkLogin.jsp" method="post">
            UserId: <input type = text name = "userId"> <br><br>
            Password: <input type = password name = "password"> <br><br>
            <input type = "submit" name = "submit" value = "提交">
            </form>
        </div>
    </div>   
</body>
