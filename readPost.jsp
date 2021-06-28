<%@ page language="java" import="java.util.*,java.sql.*,java.io.*" contentType="text/html; charset=utf-8"%>
<% 
    String path = request.getContextPath();
    request.setCharacterEncoding("utf-8");
    String msg = ""; 
%>
<!Doctype html>
<head>
    <title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
    <link rel="stylesheet" type="text/css" href="./css/readPost.css">
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
    <div id="textContainer">
        <div id="textBody">
        <%
            String conStr = "jdbc:mysql://172.18.187.253:3306/kokodayo18340184"
                    + "?autoReconnect=true&useUnicode=true"
					+ "&characterEncoding=UTF-8";
            Class.forName("com.mysql.jdbc.Driver");
            String postId = request.getParameter("pid");
            boolean valid = (postId == null)?false:true;
            String userName = "";
            String title = "";
            ArrayList<ArrayList<String>> fileList = new ArrayList<>();
            ArrayList<String> strLine = new ArrayList<String>();
            if(valid)
            {
                try
                {
                    Connection con = DriverManager.getConnection(conStr, "user", "123");
                    Statement stmt = con.createStatement();
                    String query = "select userName from kokoer where userId in ( select userId from post wher postId = " 
                    + postId + ")";
                    ResultSet rs = stmt.executeQuery(query);
                    if(rs.next())
                        userName = rs.getString("userName")
                    query = "select postTitle from post where postId = " + postId;
                    rs = stmt.executeQuery(query);
                    if(rs.next())
                        title = rs.getString("postTitle");
                    query = "select fileURL,fileType from kokoFile where fileId in ( select fileId from postFile where postId = " + postId + ")";
                    rs = stmt.executeQuery(query);
                    while(rs.next())
                    {
                        strLine.add(rs.getString("fileURL"));
                        strLine.add(rs.getString("fileType"));
                        fileList.add((ArrayList<String>)strLine.clone());
                        strLine.clear();
                    }
                    rs.close();
                    stmt.close();
                    con.close();
                }
                catch( Exception e )
                {
                    out.print(e.getMessage()+"<br>");
                }
            }
            if(valid)
            {
                int i=0;
                out.print("<h1>"+title+"</h1>");
                out.print("<h4>"+userName+"</h4>");
                
                if( fileList.size()>0&&fileList.get(0).get(1).equals("0") ){
                    i++;
                    String fileName="../webapps/kokodayo/"+fileList.get(0).get(0);
                    FileInputStream fis = new FileInputStream( fileName );   
                    InputStreamReader isr = new InputStreamReader(fis, "UTF-8");   
                    BufferedReader br = new BufferedReader(isr);   
                    String result="";
                    String line = null;   
                    while ((line = br.readLine()) != null) {   
                        result += line;   
                        result += "<br>";  
                    } 
                    out.print("<div id=\"textBoarder\">");
                    out.print("<div id=\"textShow\">"+result+"</div>");
                    out.print("</div>");
                    fis.close();
                    fis = null;
                    System.gc();
                }
                out.print("<div id=\"fileShow\">");
                for(; i < fileList.size() ; i++ ){
                    
                    String fileName=fileList.get(i).get(0);
                    String fileType=fileList.get(i).get(1);
                    if(fileType.equals("1"))
                    	out.print("<img src=" + fileName +" /> <br>");
                    else
                        out.print("<a href="  + fileName + " >" + fileName + "</a> <br>");
                } 
                out.print("</div>");
            }
        %>
        </div>
        <img id="postImg" src="img/kokodayo_1.png">
    </div>   
</body>
