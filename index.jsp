<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    String table = "";
    String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    ArrayList<ArrayList<String>> materials = new ArrayList<>();
    try 
    {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 查找数据库驱动类
        Connection con = DriverManager.getConnection(conStr, "root", "YJX20000505");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        ResultSet rs = stmt.executeQuery("select materialName,materialType,imgURL from material order by materialOrder");//执行查询，返回结果集
        ArrayList<String> materialLine = new ArrayList<String>();
        while(rs.next()) 
        { 
            materialLine.add(rs.getString("materialName"));
            materialLine.add(rs.getString("materialType"));
            materialLine.add(rs.getString("imgURL"));
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
    for(int i = 0;i < materials.size();i++)
    {
        for(int j = 0;j < 3;j++)
            table += (materials.get(i)).get(j).toString();
    }
%>
<!Doctype html>
<head>
    <link type="text/css" href="./css/index.css" rel="stylesheet">
    <style></style>
</head>
<body>
    <div id="header">
        <div id="title">
            <h1>KO~KO~DA~YO~</h1>
        </div>
    </div>
    <div id="container">
        <div id="materialContainer">
            <h1>素材掉率统计</h1>
            <div id="material">
                <p>材料</p>
                <p>
                    <%for(int i = 0; i < materials.size(); i++) {
                        if(materials.get(i).get(2).equals("0")) {
                    %>    
                        <a href='index.jsp'><img src='<%=materials.get(i).get(1)%>'></a>
                    <%
                        }
                    }
                    %>
                    <a href='index.jsp'><img src='img/源岩.png'></a>
                </p>
                <p>作战记录</p>
                <p>
                    <%for(int i = 0; i < materials.size(); i++) {
                        if(materials.get(i).get(2).equals("1")) {
                    %>    
                        <a href='index.jsp'><img src='<%=materials.get(i).get(1)%>'></a>
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
                        <a href='index.jsp'><img src='<%=materials.get(i).get(1)%>'></a>
                    <%
                        }
                    }
                    %>
                </p>
            </div>
            
        </div>
        <div id="textContainer">
            <h1>论坛热帖</h1>
            <div id="guide">
                攻略
            </div>
            <div id="communite">
                交流
            </div>
            <div id="creation">
                二创
            </div>
        </div>
    </div>   
</body>
