<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<% 
    String uid = (String)session.getAttribute("uid");
    String userName = "";
    boolean login = false;
    boolean posted = request.getMethod().equalsIgnoreCase("post");
    String jumpToMaterial = "./material.jsp";
    String mission = request.getParameter("mission");
    String material = request.getParameter("material");
    String number = request.getParameter("number");
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    //String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    //              + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    String conStr = "jdbc:mysql://172.18.187.253:3306/kokodayo18340184"
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8";
    boolean insertSuccess = false;
    if(posted) {
        try {
            Class.forName("com.mysql.jdbc.Driver"); // 查找数据库驱动类
            //Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(conStr, "user", "123");
            Statement stmt = con.createStatement(); // 创建MySQL语句的对象
            // 向数据库中插入数据
            int insertRs = stmt.executeUpdate("insert into report values(0,'" + mission + "','" + material + "'," + number + ");");
            if(insertRs > 0)
                insertSuccess = true;
        }
        catch (Exception e)
        {
            msg = e.getMessage();
        }
    }
    ArrayList<ArrayList<String>> missions = new ArrayList<>();
    ArrayList<ArrayList<String>> materials = new ArrayList<>();
    try {
        Class.forName("com.mysql.jdbc.Driver"); // 查找数据库驱动类
        //Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection(conStr, "user", "123");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        // 查询数据库现有关卡
        ResultSet rs = stmt.executeQuery("select missionName from mission");
        ArrayList<String> strLine = new ArrayList<String>();
        while(rs.next()) 
        { 
            strLine.add(rs.getString("missionName"));
            missions.add((ArrayList<String>)strLine.clone());
            strLine.clear();
        }
        // 查询数据库中的材料目录
        rs = stmt.executeQuery("select materialName,materialType,imgURL from material order by materialOrder");
        while(rs.next()) 
        { 
            strLine.add(rs.getString("materialName"));
            strLine.add(rs.getString("materialType"));
            strLine.add(rs.getString("imgURL"));
            materials.add((ArrayList<String>)strLine.clone());
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
    catch (Exception e) {
        msg = e.getMessage();
    }
%>
<!Doctype html>
<head>
    <title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
    <link rel="stylesheet" type="text/css" href="./css/report.css">
    <style></style>
    <script>
        function jump() {
            window.location.href="<%=jumpToMaterial%>";
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
        <div id="adder">
            <div id="adderTitle">
                <button id="turnBack" type="button" onclick="jump()">
                    &nbsp;<&nbsp;&nbsp;数据库
                </button>
                <h2>同步作战记录</h2>
            </div>
            
            <div id="endPoint">
                <p>PRTS ENDPOINT</p>
                <p>
                    <%if(insertSuccess) {%>
                        作战记录同步成功: 在任务<%=mission%>中获得了<%=number%>个<img src="img/<%=material%>.png">
                    <%} else if(posted) {%>
                        神经递质丢失，同步失败...
                    <%}%>
                </p>
            </div>
            
            <form id="adderForm" action="report.jsp" method="post">
                <p>
                    选择任务：
                    <select name="mission" id="missionSelector">
                    <%
                        for(int i = 0; i < missions.size(); i++) {
                    %>
                        <option value="<%=missions.get(i).get(0)%>" <%=missions.get(i).get(0).equals("1-7")?"selected":""%> ><%=missions.get(i).get(0)%></option>
                    <%
                        }
                    %>
                    </select>
                    <br>
                </p>
                <p>
                    选择材料：
                    <select name="material" id="materialSelector">
                    <%
                        for(int i = 0; i < materials.size(); i++) {
                    %>
                        <option value="<%=materials.get(i).get(0)%>" <%=materials.get(i).get(0).equals("固源岩")?"selected":""%> ><%=materials.get(i).get(0)%></option>
                    <%
                        }
                    %>
                    </select>
                    <br>
                </p>
                <p>
                    输入数量：
                    <input type="text" name="number" value="1"><br>
                </p>
                <input type="submit" id="submit" value="同步"> 
            </form>
            <img id="adderImg" src="./img/kaltsit_2.png">
        </div>
    </div>   
</body>