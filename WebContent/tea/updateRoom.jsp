<%@ page language="java" import="java.util.*,com.ten.user.SC,com.ten.user.Teacher,com.ten.user.QueryResult" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="UTF-8">
	<title>学生网上报名系统-修改发布课程内容</title>
	<link href="style_1.css" type="text/css" rel="stylesheet"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body>
<div class="top">
	<div class="title"><p> 学生网上报名系统 </p></div>
</div>
<div class="main">
	<div class="main_left">
		<div class="main_left_class00"><img src=img/touxiang.png></div>
		<div class="main_left_class01"><a href="stu/choiceCou.jsp">报名课程</a></div>
		<div class="main_left_class02"><a href="stu/showCou.jsp">课程查询</a></div>
		<div class="main_left_class03"><a href="stu/stuInfo.jsp">学籍信息</a></div>
		<div class="main_left_class100">
		<input class="reset" type="button" value="注销" onClick="window.location.href=('/Ten/servlet/serDoLogout')">
		</div>
	</div>
					<%
			    	Teacher tea = null;
			    	if(session.getAttribute("teacher")==null){
			    		response.sendRedirect("/Ten/Login.jsp");
			    	}else{
			    		tea = (Teacher)session.getAttribute("teacher");%>
	<div class="main_right">
		<div class="info">
			<p>亲爱的<%= tea.getTname() %>老师，下午好</p>
		</div>
		<%
			SC sc = (SC)request.getAttribute("room");
		 %>
		<div class="box">
			<div class="function"><p>[通知]报名系统已开放</p></div>
			<div class="form">
			<div class="form_1">
			<form action="servlet/serDoUpdateClass?type=<%=request.getParameter("type") %>&key=<%=request.getParameter("key") %>" method="post" >
 			 <table class="form_1_table">
  			<caption>修改报名课程内容</caption>
			<tr><td>编号：</td><td><input class="text" type="text" name="sno" value="<%=sc.getSNo() %>" readonly="true" /></td></tr>
			<tr><td>课程号：</td><td><input class="text" type="text" name="cno" value="<%=sc.getCNo() %>" readonly="true" /></td></tr>
			<tr><td>报名内容：</td><td><input class="text" type="text" name="classroom" value="<%= sc.getClassroom() %>"  /></td></tr>
			<tr><td></td><td><input class="btn" type="submit" value="确认修改发布信息"/></td></tr>

  </table>
  </form>	
  			</div>
			</div>
			<%} %>
		</div>
	</div>
</div>
</body>
</html>
