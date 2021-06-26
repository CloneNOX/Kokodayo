<%@ page language="java" import="java.util.*,java.sql.*" contentType="text/html; charset=utf-8"%>
<%!
ArrayList<ArrayList<String>> getMaterialList()
{
    static String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    Class.forName("com.mysql.cj.jdbc.Driver"); // 查找数据库驱动类
    Connection con = DriverManager.getConnection(conStr, "root", "YJX20000505");
    Statement stmt = con.createStatement(); // 创建MySQL语句的对象
    ResultSet rs = stmt.executeQuery("select materialName,materialType,imgURL from material order by materialOrder");//执行查询，返回结果集
    ArrayList<ArrayList<String>> material = new ArrayList<>();
    ArrayList<String> materialLine = new ArrayList<String>();
    while(rs.next()) 
    { 
        materialLine.add(rs.getString("materialName"));
        materialLine.add(rs.getString("materialType"));
        materialLine.add(rs.getString("imgURL"));
        material.add(materialLine);
        materialLine.clear();
    }
    rs.close(); 
    stmt.close(); 
    con.close();
    return material;
}
%>
<% 
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
    String table = "";
    String conStr = "jdbc:mysql://localhost:3306/kokodayo18340184?useSSL=false&allowPublicKeyRetrieval=true&serverTimezone=UTC"
    + "&autoReconnect=true&useUnicode=true&characterEncoding=UTF-8";
    try 
    {
        Class.forName("com.mysql.cj.jdbc.Driver"); // 查找数据库驱动类
        Connection con = DriverManager.getConnection(conStr, "root", "xsr990925,.LOL");
        Statement stmt = con.createStatement(); // 创建MySQL语句的对象
        ResultSet rs = stmt.executeQuery("select materialName,imgURL,materialType from report");//执行查询，返回结果集
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
                <p>作战记录</p>
                <a href="./indexTest.html"><img src="./image/源岩.png"></a>
                <p>芯片</p>
            </div>
            
        </div>
        <div id="textContainer">
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
