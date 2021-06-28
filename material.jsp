<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    String uid = (String)session.getAttribute("uid");
    String userName = "";
    boolean login = false;
    String path = request.getContextPath();
    String jumpToAddMaterial = "./report.jsp";
    String chosenMaterial = request.getParameter("materialName");
    if(chosenMaterial == null)
        chosenMaterial = "RMA70-24";
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    // 查询材料
    //String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    //              + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String conStr = "jdbc:mysql://172.18.187.253:3306/kokodayo18340184"
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8";
    ArrayList<ArrayList<String>> materials = new ArrayList<>();
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
        rs.close(); 
        stmt.close(); 
        con.close();
    }
    catch (Exception e)
    {
        msg = e.getMessage();
    }
    // 查询一个材料
    ArrayList<ArrayList<String>> details = new ArrayList<>();
    try {
        Class.forName("com.mysql.jdbc.Driver");// 查找数据库驱动类
        //Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(conStr, "user", "123");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        ResultSet rs = stmt.executeQuery("select missionName,count(materialName) as missionNum,sum(materialNumber) as totalNum,sanity from report natural join mission  where materialName='" + chosenMaterial +"' group by MissionName;");
        ArrayList<String> strLine = new ArrayList<String>();
        while(rs.next()) 
        { 
            strLine.add(rs.getString("missionName"));// 任务名
            strLine.add(rs.getString("missionNum"));// 任务总量
            strLine.add(rs.getString("totalNum"));// 材料总量
            int missionNum = Integer.parseInt(rs.getString("missionNum"));
            int totalNum = Integer.parseInt(rs.getString("totalNum"));
            strLine.add(String.format("%.2f", (float)totalNum / (float)missionNum).toString());// 平均掉落率
            int sanity = Integer.parseInt(rs.getString("sanity"));
            strLine.add(String.format("%.2f", (float)sanity / (float)(totalNum / (float)missionNum)).toString());// 平均理智
            strLine.add(rs.getString("sanity"));// 消耗理智
            details.add((ArrayList<String>)strLine.clone());
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
    try {
        if(uid != null) {
            login = true;
            Class.forName("com.mysql.jdbc.Driver");// 查找数据库驱动类
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(conStr, "user", "123");
            Statement stmt = con.createStatement(); // 创建MySQL语句的对象
            ResultSet rs = stmt.executeQuery("select userName from kokoer where userId=" + uid + ";");
            if(rs.next())
                userName = rs.getString("userName");
            else
                userName = "empty";
            rs.close(); 
            stmt.close(); 
            con.close();
        }
    }
    catch (Exception e)
    {
        msg = e.getMessage();
    }
%>
<!Doctype html>
<head>
    <title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
    <link rel="stylesheet" type="text/css" href="./css/material.css">
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
        <div id="selector">
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
        <div id="shower">
            <div id="showerTitle">
                <img id="showerTitleImg" src="img/<%=chosenMaterial%>.png">
                <h2><%=chosenMaterial%> 统计结果</h2>
            </div>
            <table id="showerTable">
                <tr><th>作战</th> <th>样本数</th> <th>掉落数</th> <th>期望掉落率</th> <th>单个平均理智</th> <th>关卡消耗理智</th></tr>
                <%
                    for(int i=0; i < details.size(); i++) {
                %>
                    <tr>
                        <td><%=details.get(i).get(0)%></td>
                        <td><%=details.get(i).get(1)%></td>
                        <td><%=details.get(i).get(2)%></td>
                        <td><%=details.get(i).get(3)%></td>
                        <td><%=details.get(i).get(4)%></td>
                        <td><%=details.get(i).get(5)%></td>
                    </tr>
                <%
                    }
                %>
            </table>
            <img id="showerImg" src="./img/skadi_2.png">
        </div>
    </div>   
</body>