<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    String path = request.getContextPath();
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    String userIDContent=(String)session.getAttribute("uid");
%>

<!Doctype html>
<head>
    <title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
    <link rel="stylesheet" type="text/css" href="./css/postPost.css">
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
    <div id="textContainer">
        <div id="subtitle">
            <h1>编写技巧概要</h1>
        </div>
        <div id="fileBody">
            <form name="fileupload" action="postUpload.jsp" method="post" enctype="multipart/form-data" multiple="multiple">
                <input type="hidden" name="userID" value="<%=userIDContent%>">
                板块：<select name="type">
				<option value="0">KoKoDaYo知网</option>
				<option value="1">晨间逸话</option>
				<option value="2" >微型故事集</option>
                </select>
                <br><br>
                标题：<input type="text" name="title"><br><br>
                <textarea rows="10" cols="50" name="content" placeholder="请输入要发布的内容~"></textarea><br><br>
                文件名：<input type="file" name="file" size="50" multiple="multiple"><br><br>
                <input type="submit" name="sub" value="发布">
            </form>
        </div>
        <img id="postImg" src="img/kokodayo_1.png">
    </div>
</body>
