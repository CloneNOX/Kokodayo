<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    String uid = (String)session.getAttribute("uid");
    String userName = "";
    boolean login = false;
    String path = request.getContextPath();
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    String userIDContent=(String)session.getAttribute("uid");
    //String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    //                + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String conStr = "jdbc:mysql://172.18.187.253:3306/kokodayo18340184"
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8";
    try 
    {
        Class.forName("com.mysql.jdbc.Driver"); // 查找数据库驱动类
        //Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(conStr, "user", "123");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        ResultSet rs = stmt.executeQuery("select materialName,materialType,imgURL from material order by materialOrder");
        if(uid != null) {
            login = true;
            rs = stmt.executeQuery("select userName from kokoer where userId=" + uid + ";");
            if(rs.next())
                userName = rs.getString("userName");
            else
                userName = "empty";
        }
        rs.close(); 
        stmt.close(); 
        con.close();
    }
    catch (Exception e)
    {
        msg = e.getMessage();
    }
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
        <%if(login) {%>
            <p id="userName">user：<%=userName%></p>
        <%} else {%>
            <a id="gotoLogin" href="./login.jsp">登录</a>
        <%}%>
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