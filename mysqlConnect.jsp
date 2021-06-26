<%@ page language="java" import="java.util.*,java.sql.*"
contentType="text/html; charset=utf-8"%>
<% 
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    String table = "";
    String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8"; 
    try 
    {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 查找数据库驱动类
        Connection con = DriverManager.getConnection(conStr, "root", "YJX20000505");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        ResultSet rs = stmt.executeQuery("select * from report");//执行查询，返回结果集
        if(rs.next()) 
        { //把游标(cursor)移至第一个或下一个记录
            table += rs.getString("missionName"); //如果还有记录，则得到数据域name的值
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
<!DOCTYPE HTML>
<html>
    <head>
        <title>mysql</title>
    </head>
    <body> 
        <div>
            table:<%=table%><br>
            msg:<%=msg%>
        </div>
    </body>
</html>