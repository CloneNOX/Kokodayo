<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
    boolean check = false;
    String userName = "";
    String msg = ""; 
    String userId = "";
    String backUrl = "./login.jsp";
    String message = "";
    if(request.getMethod().equalsIgnoreCase("post"))
    {
        request.setCharacterEncoding("utf-8");
        userId = request.getParameter("userId");
        String password = request.getParameter("password");
        String conStr = "jdbc:mysql://172.18.187.253:3306/kokodayo18340184"
                    + "?autoReconnect=true&useUnicode=true"
                    + "&characterEncoding=UTF-8";
        try 
        {
            Class.forName("com.mysql.jdbc.Driver"); // 查找数据库驱动类
            Connection con = DriverManager.getConnection(conStr, "user", "123");
            Statement stmt = con.createStatement(); // 创建MySQL语句的对象
            String query = "select userName,userPassword from kokoer where userId = " + userId;
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()) 
            { 
                check = password.equals(rs.getString("userPassword"));
                userName = rs.getString("userName");
                backUrl = check ? "./allPost.jsp" : "./login.jsp"
            }
            else
            {
                check = false;
            }
            rs.close(); 
            stmt.close(); 
            con.close();
        }
        catch (Exception e)
        {
            msg = e.getMessage();
        }
    }
    if(check)
    {
        message = "<div> 已连接到泰拉大陆 "+ userName +"</div><br>";
        session.setAttribute("uid",userId);
    }
    else
    {
        message = "<div> 账号或密码错误 </div><br>";
    }
%>
<!Doctype html>
<head>
    <title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
    <link rel="stylesheet" type="text/css" href="./css/checkLogin.css">
    <script>
        function jump() 
        {
            window.location.href = "<%=backUrl%>";
        }
    </script>
</head>
<body>
    <div id="header">
        <a id="home" href="./index.jsp"><img src="./img/Logo_rhodesOverride.png"></a>
        <div id="title">
            <h1>Ko~Ko~Da~Yo~</h1>
            <img id="titleKokodayo" src = "./img/kokodayo_sit.png">
        </div>
    </div>
    <div id = "container">
        <div id = "hint" ><%=message%></div>
        <button id = "button" type = "button" onclick = "jump()">返回</button>
    </div>   
</body>