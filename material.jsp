<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    String path = request.getContextPath();
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    // 查询材料
    String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    
%>
<!Doctype html>
<head>
    <title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
    <link rel="stylesheet" type="text/css" href="./css/index.css">
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
        
    </div>   
</body>