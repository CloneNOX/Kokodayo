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
            boolean valid=true;
            if(valid)
            {
                String title="hjhjhjhj";
                String userName="45456456";
                int i=0;
                ArrayList< ArrayList< String > > fileList = new ArrayList<>();
                ArrayList <String> add1 = new ArrayList<>();
                add1.add("files/2_21554.txt");
                add1.add("0");
                ArrayList <String> add2 = new ArrayList<>();
                add2.add("files/2_45273_Arknights.jpg");
                add2.add("1");
                ArrayList <String> add3 = new ArrayList<>();
                add3.add("files/2_91650.txt");
                add3.add("2");
                fileList.add(add1);
                fileList.add(add2);
                fileList.add(add3);
                fileList.add(add1);
                fileList.add(add2);
                fileList.add(add3);
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