<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    String path = request.getContextPath();
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    // 查询材料
    String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    ArrayList<ArrayList<String>> materials = new ArrayList();
    try 
    {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 查找数据库驱动类
        Connection con = DriverManager.getConnection(conStr, "root", "xsr990925,.LOL");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        ResultSet rs = stmt.executeQuery("select materialName,materialType,imgURL from material order by materialOrder");//执行查询，返回结果集
        ArrayList<String> materialLine = new ArrayList<String>();
        while(rs.next()) 
        { 
            materialLine.add(rs.getString("materialName"));
            materialLine.add(rs.getString("imgURL"));
            materialLine.add(rs.getString("materialType"));
            materials.add((ArrayList<String>)materialLine.clone());
            materialLine.clear();
        }
        rs.close(); 
        stmt.close(); 
        con.close();
    }
    catch (Exception e)
    {
        msg = e.getMessage();
    }
    // 查询推荐帖子的标题
    ArrayList<ArrayList<String>> guideTitles = new ArrayList();
    for(int i = 0; i < 4; i++) {
        ArrayList<String> l = new ArrayList();
        l.add("1");
        l.add("这是一个post标题的测试");
        guideTitles.add(l);
    }
    ArrayList<String> l = new ArrayList();
    l.add("1");
    l.add("这是一个长长长长长长长长长长post标题的测试");
    guideTitles.add(l);
    ArrayList<ArrayList<String>> communicateTitles = new ArrayList(guideTitles);
    ArrayList<ArrayList<String>> creationTitles = new ArrayList(guideTitles);
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
                        if(materials.get(i).get(2).equals("0")) {
                    %>    
                        <a href='index.jsp'><img src='<%=materials.get(i).get(1)%>' title='<%=materials.get(i).get(0)%>'></a>
                    <%
                        }
                    }
                    %>
                </p>
                <p>作战记录</p>
                <p>
                    <%for(int i = 0; i < materials.size(); i++) {
                        if(materials.get(i).get(2).equals("1")) {
                    %>    
                        <a href='index.jsp'><img src='<%=materials.get(i).get(1)%>' title='<%=materials.get(i).get(0)%>'></a>
                    <%
                        }
                    }
                    %>
                </p>
                <p>芯片</p>
                <p>
                    <%for(int i = 0; i < materials.size(); i++) {
                        if(materials.get(i).get(2).equals("2")) {
                    %>    
                        <a href='index.jsp'><img src='<%=materials.get(i).get(1)%>' title='<%=materials.get(i).get(0)%>'></a>
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
                    <%for(int i = 0; i < guideTitles.size(); i++) {
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
                    <%for(int i = 0; i < guideTitles.size(); i++) {
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
                    <%for(int i = 0; i < guideTitles.size(); i++) {
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