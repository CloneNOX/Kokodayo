<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=utf-8"%>
<% 
    String uid = (String)session.getAttribute("uid");
    String userName = "";
    boolean login = false;
    request.setCharacterEncoding("utf-8");
    String jumpToAddMaterial = "./report.jsp";
    String msg = ""; 
    String table = "";
    //String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    //                + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String conStr = "jdbc:mysql://172.18.187.253:3306/kokodayo18340184"
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8";
    ArrayList<ArrayList<String>> materials = new ArrayList<>();
    ArrayList<ArrayList<String>> guideTitles = new ArrayList<>();
    ArrayList<ArrayList<String>> communicateTitles = new ArrayList<>();
    ArrayList<ArrayList<String>> creationTitles = new ArrayList<>();
    try 
    {
        Class.forName("com.mysql.jdbc.Driver"); // 查找数据库驱动类
        //Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(conStr, "user", "123");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        ResultSet rs = stmt.executeQuery("select materialName,materialType,imgURL from material order by materialOrder");
        ArrayList<String> strLine = new ArrayList<String>();
        while(rs.next()) 
        { 
            strLine.add(rs.getString("materialName"));
            strLine.add(rs.getString("materialType"));
            strLine.add(rs.getString("imgURL"));
            materials.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
        rs = stmt.executeQuery("select postId,postTitle,postTime from post where postType = 0 order by postTime desc");
        while(rs.next()) 
        { 
            if(rs == null)
                break;
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
            guideTitles.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
        rs = stmt.executeQuery("select postId,postTitle,postTime from post where postType = 1 order by postTime desc");
        while(rs.next()) 
        { 
            if(rs == null)
                break;
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
            communicateTitles.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
        rs = stmt.executeQuery("select postId,postTitle,postTime from post where postType = 2 order by postTime desc");
        while(rs.next()) 
        { 
            if(rs == null)
                break;
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
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
    <link rel="stylesheet" type="text/css" href="./css/index.css">
    <style></style>
    <script>
        function jump() {
            window.location.href="<%=jumpToAddMaterial%>";
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
    <div id="container">
        <div id="materialContainer">
            <div>
                <h1>泰拉数据库--物资</h1>
                <button id="add" type="button" onclick="jump()">提交作战记录</button>
            </div>
            <div id="material">
                <p>材料</p>
                <p>
                    <%
                    for(int i = 0; i < materials.size(); i++) {
                        if(materials.get(i).get(1).equals("0")) {
                    %>    
                        <a href='material.jsp?materialName=<%=materials.get(i).get(0)%>'><img src='<%=materials.get(i).get(2)%>' title='<%=materials.get(i).get(0)%>'></a>
                    <%
                        }
                    }
                    %>
                </p>
                <p>作战记录</p>
                <p>
                    <%for(int i = 0; i < materials.size(); i++) {
                        if(materials.get(i).get(1).equals("1")) {
                    %>    
                        <a href='material.jsp?materialName=<%=materials.get(i).get(0)%>'><img src='<%=materials.get(i).get(2)%>' title='<%=materials.get(i).get(0)%>'></a>
                    <%
                        }
                    }
                    %>
                </p>
                <p>芯片</p>
                <p>
                    <%for(int i = 0; i < materials.size(); i++) {
                        if(materials.get(i).get(1).equals("2")) {
                    %>    
                        <a href='material.jsp?materialName=<%=materials.get(i).get(0)%>'><img src='<%=materials.get(i).get(2)%>' title='<%=materials.get(i).get(0)%>'></a>
                    <%
                        }
                    }
                    %>
                </p>
                <img id="materialImg" src="img/kokodayo_2.png">
            </div>
        </div>
        <div id="textContainer">
            <a class="gotoFileIndex" href='allPost.jsp'><h1>刀客塔的演讲稿</h1></a>
            <div id="guide">
                <a class="gotoFileIndex" href='allPost.jsp'><h2>KoKoDaYo知网<span id="guideTitleSpan">（行了行了，我们知道你又来抄作业了）</span></h2></a>
                <p>
                    <%for(int i = 0; i < Math.min(guideTitles.size(),5); i++) {
                    %>    
                        <a href='readPost.jsp?pid=<%=guideTitles.get(i).get(0)%>'><%=guideTitles.get(i).get(1)%></a><br>
                    <%
                    }
                    %>
                </p>
            </div>
            <div id="communicate">
                <a class="gotoFileIndex" href='allPost.jsp'><h2>晨间逸话<span id="communicateTitleSpan">四点几嚟，泡面先啦，来看看别的刀客塔遇到了什么趣事</span></h2></a>
                <p>
                    <%for(int i = 0; i < Math.min(communicateTitles.size(),5); i++) {
                    %>    
                        <a href='readPost.jsp?pid=<%=communicateTitles.get(i).get(0)%>'><%=communicateTitles.get(i).get(1)%></a><br>
                    <%
                    }
                    %>
                </p>
            </div>
            <div id="creation">
                <a class="gotoFileIndex" href='allPost.jsp'><h2>微型故事集</h2></a>
                <p>
                    <%for(int i = 0; i < Math.min(creationTitles.size(),5); i++) {
                    %>    
                        <a href='readPost.jsp?pid=<%=creationTitles.get(i).get(0)%>'><%=creationTitles.get(i).get(1)%></a><br>
                    <%
                    }
                    %>
                </p>
            </div>
            <img id="postImg" src="img/kokodayo_1.png">
        </div>
    </div>   
</body>