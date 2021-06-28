<%@ page pageEncoding="utf-8" contentType="text/html; charset=utf-8"%>
<%@ page import="java.io.*, java.util.*,java.sql.*,org.apache.commons.io.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<html>
	<head>
		<title>Ko~Ko~Da~Yo~（三个失智博士的期末大作业）</title>
		<script>
			function jump() {
				window.location.href="./allPost.jsp";
			}
			function jumpLogIn() {
				window.location.href="./login.jsp";
			}
		</script>
		<link rel="stylesheet" type="text/css" href="./css/postUpload.css">
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
			<div id="subtitle">
				<h1>编写技巧概要</h1>
			</div>
			<div id="fileUpload">
				<%request.setCharacterEncoding("utf-8");%>
				<% 
					boolean isMultipart = ServletFileUpload.isMultipartContent(request);
					String filename = "";
					String address = "http://localhost:8080/kokodayo/files/";
					if (isMultipart) {
						FileItemFactory factory = new DiskFileItemFactory();
						ServletFileUpload upload = new ServletFileUpload(factory);
						List items = upload.parseRequest(request);
						String name="";
						String content="";
						Random r = new Random();
						String id="";
						String type="";
						boolean valid=true;
						for (int i = 0; i < items.size()&&valid; i++) {
							FileItem fi = (FileItem) items.get(i);

							if (fi.isFormField()){
								if(fi.getFieldName().equals("sub"))
									continue;
								else if(fi.getFieldName().equals("userID")){
									id = fi.getString("utf-8");
									if(id.equals("null")){
										out.print("<h3>你还未登录，请返回登录页面!</h3>");
										out.print("<button id=\"returnLogIn\" type=\"button\" onclick=\"jumpLogIn()\">登录</button>");
										valid=false;
									}
									
								}
								else if(fi.getFieldName().equals("type"))
								{
									type = fi.getString("utf-8");
								}
								else if(fi.getFieldName().equals("content")){
									try{
										String direction = "../webapps/kokodayo/files/";
										Random rand = new Random();
										String randomIndex=(rand.nextInt(100000)+1)+"";
										name = id + "_" + randomIndex + ".txt";
										content = fi.getString("utf-8");
										String fileName = direction + name;
										File file =new File( fileName );
										//out.println(fileName+"<br>");
										//if file doesnt exists, then create it
										if( !file.exists() ){
											file.createNewFile();
										}
		
										FileOutputStream fos = new FileOutputStream( file.getPath() );   
										OutputStreamWriter osw = new OutputStreamWriter(fos, "UTF-8");   
										osw.write(content);   
										osw.flush(); 
										fos.close();
										fos = null;
										System.gc();
		
									}catch( IOException e ){
										e.printStackTrace();
									}
								}
							}
							else 
							{
								String randomIndex=(r.nextInt(100000)+1)+"";
								DiskFileItem dfi = (DiskFileItem) fi;
								filename = randomIndex+ "_" + FilenameUtils.getName(dfi.getName());
								if (!dfi.getName().trim().equals("")){
									//out.print("文件被上传到服务上的实际位置：");
									String fileName = application.getRealPath("files")                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      
											+ System.getProperty("file.separator") 
											+ id + "_" + randomIndex + "_" + FilenameUtils.getName(dfi.getName());
									//out.print(new File(fileName).getAbsolutePath()+"<br>");
									dfi.write(new File(fileName));
									/*if(filename.endsWith(".png")||filename.endsWith(".jpg")||filename.endsWith(".jpeg")||filename.endsWith(".gif")||filename.endsWith(".bmp"))
										out.print("<img src=" + address + filename +" /> <br>");
									else
										out.print("<a href=" + address + filename + " >" + filename + "</a> <br>");*/
								}
							}
						}
						if(valid)
						{
							out.print("<h3>发布成功!</h3>");
							out.print("<button id=\"returnIndex\" type=\"button\" onclick=\"jump()\">返回</button>");
						}
					}
				%>
			</div>
		</div>
		<img id="postImg" src="img/kokodayo_1.png">
	</body>
</html>
