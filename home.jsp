<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page import="com.run.pjt.member.Member" %>
<%Member member = (Member)session.getAttribute("mem");%>
<html>
<head>
<title>Start Page</title>

<style>
* {
	margin: 0%;
}
body {
	padding: 10%;
	background-color: rgb(54, 23, 5);
}
.container {
	background-image: linear-gradient(25deg, rgb(211, 187, 83) 35%,	rgb(99, 60, 60));
	margin: auto;
	border: 8px chocolate solid;
	display: table;
	width: 1200px;
	height: 600px;
	table-layout: fixed;
}
.cliff img {
	margin-top: 310px;
	display: table-cell;
	table-layout: fixed;
	width: 100%;
	filter: brightness(75%);
	opacity: 0.8;
}

a {
	font-family: "Times new Roman";
	font-size: 50px;
	font-weight: bolder;
	text-decoration: none;
}
a:link {
	color: orange;
	text-shadow: 4px 4px chocolate;
}
a:visited {
	color: orange;
	text-shadow: 4px 4px chocolate;
}
a:active {
	color: chocolate;
	text-shadow: 4px 4px orange;
}
#form{
	margin-top: 150px;
	margin-left: 450px;
	position: absolute;
	width: 300px;
	height: 220px;
	border: 3px dashed orange;
	border-radius: 8px;
	text-align: center;
	z-index: 8;
}
#tableS{
	margin: auto;
	color: chocolate;
    margin-top: 4%;
    font-weight: bold;
}
img{
	padding-right: 10px;
}


</style>
</head>
<body>
	<div class="container">		
		<div id="form">
				<form action="/pjt/mem/memJoin" method="post">
				<table id="tableS">
					<tr>
					
					<% if(member == null){ %>
						 <td><img src="${cp}/resources/pro-img/up_down0.png"><a href="${cp}/mem/memLoginForm">Login</a></td>
					<% } %>	
					</tr>
					<tr>
					<% if(member == null){ %>
						<td><img src="${cp}/resources/pro-img/up_down0.png"><a href="${cp}/mem/memJoinForm">Join</a></td>
					<% } %>	
					</tr>
					
					<tr>
					<% if(member != null){ %>
						<td><img src="${cp}/resources/pro-img/up_down0.png"><a href="${cp}/mem/start">Go!</a></td> 
					<% } %>
					</tr>
					<tr>
					<% if(member != null){ %>
						<td><img src="${cp}/resources/pro-img/up_down0.png"><a href="${cp}/mem/memLogout">LogOut</a></td> 					 
					<% } %>
					</tr>					
					<tr>
					<% if(member != null){ %>
						<td><img src="${cp}/resources/pro-img/up_down0.png"><a href="${cp}/mem/memOthers">Others</a></td> 
					<% } %>
					</tr>
					
				</table>
				</form>		
		</div>	
		
		
		<div class="cliff">
			<img src="${cp}/resources/pro-img/cliff.gif">
		</div>	
	</div>	
	
</body>
</html>
