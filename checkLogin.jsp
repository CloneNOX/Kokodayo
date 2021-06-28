<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%
    boolean check = false;
    String userName = "";
    String msg = ""; 
    String userId = "";
    String backUrl = "./allPost.jsp";
    String message = "";
    if(request.getMethod().equalsIgnoreCase("post"))
    {
        request.setCharacterEncoding("utf-8");
        userId = request.getParameter("userId");
        String password = request.getParameter("password");

        String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
        + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
        try 
        {
            Class.forName("com.mysql.cj.jdbc.Driver"); // 查找数据库驱动类
            Connection con = DriverManager.getConnection(conStr, "root", "YJX20000505");
            Statement stmt = con.createStatement(); // 创建MySQL语句的对象
            String query = "select userName,userPassword from kokoer where userId = " + userId;
            ResultSet rs = stmt.executeQuery(query);
            if(rs.next()) 
            { 
                check = password.equals(rs.getString("userPassword"));
                userName = rs.getString("userName");
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
        message = "<div> Welcome back! "+ userName +"</div><br>";
        backUrl += "?uid=" + userId;
    }
    else
    {
        message = "<div> Incorrect userId or Password! </div><br>";
    }
%>
<!Doctype html>
<head>
    <title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
    <link rel="stylesheet" type="text/css" href="./css/login.css">
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
            <img id="titleKokodayo" src="./img/kokodayo_sit.png">
        </div>
    </div>
    <div id="container">
        <%=message%>

        <button id = "button" type = "button" onclick = "jump()">返回</button>
    </div>   
</body>
