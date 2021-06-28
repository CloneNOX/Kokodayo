<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    String uid = (String)session.getAttribute("uid");
    String userName = "";
    boolean login = false;
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    String table = "";
    //String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    //                + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String conStr = "jdbc:mysql://172.18.187.253:3306/kokodayo18340184"
                    + "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8";
    ArrayList<ArrayList<String>> guideTitles = new ArrayList<>();
    ArrayList<ArrayList<String>> communicateTitles = new ArrayList<>();
    ArrayList<ArrayList<String>> creationTitles = new ArrayList<>();
    try 
    {
        Class.forName("com.mysql.jdbc.Driver"); // 查找数据库驱动类
        //Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(conStr, "user", "123");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        ResultSet rs = stmt.executeQuery("select postId,postTitle,postTime from post where postType = 0 order by postTime desc");
        ArrayList<String> strLine = new ArrayList<String>();
        while(rs.next()) 
        { 
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
            strLine.add(rs.getString("postTime"));
            guideTitles.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
        rs = stmt.executeQuery("select postId,postTitle,postTime from post where postType = 1 order by postTime desc");
        while(rs.next()) 
        { 
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
            strLine.add(rs.getString("postTime"));
            communicateTitles.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
        rs = stmt.executeQuery("select postId,postTitle,postTime from post where postType = 2 order by postTime desc");
        while(rs.next()) 
        { 
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
            strLine.add(rs.getString("postTime"));
            creationTitles.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
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
    <link rel="stylesheet" type="text/css" href="./css/allPost.css">
    <script>
        function post() 
        {
            window.location.href = "./postPost.jsp";   
        }
    </script>
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
        <div id="guide" class="titleBox">
            <a class="gotoFileIndex"><h2>KoKoDaYo知网</h2></a>
            <button class = "post" type = "button" onclick = "post()">发帖</button>
            <p>
                <%for(int i = 0; i < guideTitles.size(); i++) {
                %>    
                    <a href='readPost.jsp?pid=<%=guideTitles.get(i).get(0)%>'><%=guideTitles.get(i).get(1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + guideTitles.get(i).get(2)%></a><br>
                <%
                }
                %>
            </p>
        </div>
        <div id="communicate" class="titleBox">
            <a class="gotoFileIndex"><h2>晨间逸话</h2></a>
            <button class = "post" type = "button" onclick = "post()">发帖</button>
            <p>
                <%for(int i = 0; i < communicateTitles.size(); i++) {
                %>    
                    <a href='readPost.jsp?pid=<%=guideTitles.get(i).get(0)%>'><%=communicateTitles.get(i).get(1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + communicateTitles.get(i).get(2)%></a><br>
                <%
                }
                %>
            </p>
        </div>
        <div id="creation" class="titleBox">
            <a class="gotoFileIndex"><h2>微型故事集</h2></a>
            <button class = "post" type = "button" onclick = "post()">发帖</button>
            <p>
                <%for(int i = 0; i < creationTitles.size(); i++) {
                %>    
                    <a href='readPost.jsp?pid=<%=guideTitles.get(i).get(0)%>'><%=creationTitles.get(i).get(1) + "&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" + creationTitles.get(i).get(2)%></a><br>
                <%
                }
                %>
            </p>
        </div>
        <img id="postImg" src="./img/kokodayo_1.png">
    </div> 
</body>