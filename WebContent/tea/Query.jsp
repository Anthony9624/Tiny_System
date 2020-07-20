<%@ page language="java" import="java.util.*,com.ten.dao.DaoSc,com.ten.user.Teacher,com.ten.user.QueryResult" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta charset="UTF-8">
	<title>学生网上报名系统-信息查询</title>
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
		<div class="main_left_class01"><a href="tea/selectCou.jsp">报名管理</a></div>
		<div class="main_left_class02"><a href="tea/selectStu.jsp">报名信息</a></div>
		<div class="main_left_class03"><a href="tea/Query.jsp">信息查询</a></div>
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
		<div class="box">
			<div class="function"><p>[通知]报名系统已开放</p></div>
			<div class="form">
			<div class="form_1">
				<form action="servlet/serQuerySc" method="post" >
  				<table class="form_1_table">
    		<tr><td><input class="text" type="text" name="queryKey" placeholder="请输入查询项" /></td><td></td><td></td><td></td><td></td><td></td><td></td>
    		<td>
    			<select name="type" >	
    				<option value="1">编号</option>
    				<option value="2">姓名</option>
    				<option value="3">班级</option>
    				<option value="4">课程名</option>
    				<option value="5">报名科目</option>
    				<option value="6">报名院校</option>
    			</select>
    		</td>
    		<td><input class="btn" type="submit" value="查询"/></td> 
    	</tr>
  
  <%
  		if(request.getAttribute("queryResult")==null){
  		%>
  </table>
  </form>
  		<%
  			
			}else{
				int type = Integer.parseInt(request.getParameter("type"));
				String queryKey = request.getParameter("querykey");
				List<QueryResult> list = (List<QueryResult>)request.getAttribute("queryResult");
				Iterator<QueryResult> ite = list.iterator();
				if(ite.hasNext()&&type!=20){//查询结果不为空，输出表格
					QueryResult tem = null;%>
					<table>
					<tr><td>编号</td><td>学生姓名</td><td>学生班级</td><td>课程名</td><td>报考科目</td><td>报考院校</td><td>修改报名</td></tr>
					
					<%
					while(ite.hasNext()){
					tem = ite.next();
				%> 
						
						<tr><td><%=tem.getSNo() %></td>
						<td><%=tem.getSname() %></td>
						<td><%=tem.getSclass() %></td>
						<td><%=tem.getCNo() %></td>
						<td><%=tem.getCname() %></td>
						<td><%=tem.getClassroom() %></td>
						<td><input class="btn" type="button" value="修改报名" onclick="window.location.href=('/Ten/servlet/serUpdateClass?sno=<%=tem.getSNo() %>&cno=<%=tem.getCNo() %>&type=<%= type %>&key=<%=queryKey%> ')"/></td></tr>
						
				<%	}%>
				</table>
				
				<%
					
				}else if(type!=20){
				%>
				<table><p>结果为空，报名关系不存在 或输入项错误</p></table>
				
				
				<%
				}			
			}
  	
   %>		
   </div>
			</div>
			<%} %>
		</div>
	</div>
</div>
</body>
</html>

