<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    ArrayList<ArrayList<String>> materials = new ArrayList<>();
    ArrayList<ArrayList<String>> guideTitles = new ArrayList<>();
    ArrayList<ArrayList<String>> communicateTitles = new ArrayList<>();
    ArrayList<ArrayList<String>> creationTitles = new ArrayList<>();
    try 
    {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 查找数据库驱动类
        Connection con = DriverManager.getConnection(conStr, "root", "xsr990925,.LOL");
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
        rs = stmt.executeQuery("select distinct(postId),postTitle from post where postId in (select postId from post group by postId having postType = 0 order by avg(postTime) desc )");
        while(rs.next()) 
        { 
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
            guideTitles.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
        rs = stmt.executeQuery("select distinct(postId),postTitle from post where postId in (select postId from post group by postId having postType = 1 order by avg(postTime) desc )");
        while(rs.next()) 
        { 
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
            communicateTitles.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
        rs = stmt.executeQuery("select distinct(postId),postTitle from post where postId in (select postId from post group by postId having postType = 2 order by avg(postTime) desc )");
        while(rs.next()) 
        { 
            strLine.add(rs.getString("postId"));
            strLine.add(rs.getString("postTitle"));
            creationTitles.add((ArrayList<String>)strLine.clone());
            strLine.clear();
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
        <div id="materialContainer">
            <h1>泰拉数据库--物资</h1>
            <div id="material">
                <p>材料</p>
                <p>
                    <%
                    for(int i = 0; i < materials.size(); i++) {
                        if(materials.get(i).get(1).equals("0")) {
                    %>    
                        <a href='index.jsp'><img src='<%=materials.get(i).get(2)%>' title='<%=materials.get(i).get(0)%>'></a>
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
                        <a href='index.jsp'><img src='<%=materials.get(i).get(2)%>' title='<%=materials.get(i).get(0)%>'></a>
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
                        <a href='index.jsp'><img src='<%=materials.get(i).get(2)%>' title='<%=materials.get(i).get(0)%>'></a>
                    <%
                        }
                    }
                    %>
                </p>
                <img id="materialImg" src="img/kokodayo_2.png">
            </div>
        </div>
        <div id="textContainer">
            <a class="gotoFileIndex" href='index.jsp'><h1>刀客塔的演讲稿</h1></a>
            <div id="guide">
                <a class="gotoFileIndex" href='index.jsp'><h2>KoKoDaYo知网<span id="guideTitleSpan">（行了行了，我们知道你又来抄作业了）</span></h2></a>
                <p>
                    <%for(int i = 0; i < Math.min(guideTitles.size(),5); i++) {
                    %>    
                        <a href='index.jsp'><%=guideTitles.get(i).get(1)%></a><br>
                    <%
                    }
                    %>
                </p>
            </div>
            <div id="communicate">
                <a class="gotoFileIndex" href='index.jsp'><h2>晨间逸话<span id="communicateTitleSpan">四点几嚟，泡面先啦，来看看别的刀客塔遇到了什么趣事</span></h2></a>
                <p>
                    <%for(int i = 0; i < Math.min(communicateTitles.size(),5); i++) {
                    %>    
                        <a href='index.jsp'><%=communicateTitles.get(i).get(1)%></a><br>
                    <%
                    }
                    %>
                </p>
            </div>
            <div id="creation">
                <a class="gotoFileIndex" href='index.jsp'><h2>微型故事集</h2></a>
                <p>
                    <%for(int i = 0; i < Math.min(creationTitles.size(),5); i++) {
                    %>    
                        <a href='index.jsp'><%=creationTitles.get(i).get(1)%></a><br>
                    <%
                    }
                    %>
                </p>
            </div>
            <img id="postImg" src="img/kokodayo_1.png">
        </div>
    </div>   
</body>
