<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Others</title>
<style>
* {
	margin: 0%;

}
body {
	padding: 10%;
	background-color: rgb(54, 23, 5);
	box-sizing: border-box;
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
	position: relative;
	font-family: "Times new Roman";
	font-size: 18px;
	font-weight: bolder;
	text-decoration: none;	
}

a:link {
	color: white;
	text-shadow: 4px 4px chocolate;
}
a:visited {
	color: white;
	text-shadow: 4px 4px chocolate;
}
a:active {
	color: chocolate;
	text-shadow: 4px 4px orange;
}
a:hover {
	opacity: 0.5;
}
#form{
	margin-top: 150px;
	margin-left: 450px;
	position: absolute;
	background-color: chocolate;
	width: 300px;
	height: 250px;
	border: 3px dashed orange;
	border-radius: 8px;
	text-align: center;
	z-index: 8;
}
#innerBox{
	margin:auto;
	background-color: orange;
	border: 3px dashed chocolate;
	border-radius: 8px;
	width: 280px;
	height: 180px;
}
h1{
	font-family: "Times new Roman";
	color: orange;

}
#tableS{
	margin: auto;
	color: chocolate;
    margin-top: 4%;
    font-weight: bold;
    text-align: left;
}
img{
	padding-right: 10px;
}
</style>
</head>
<body>
	
<div class="container">		
	<div id="form">
		<h1>Welcome ${mem.getMemId()} !</h1>
		<div id="innerBox">	
			<table id="tableS">
				<tr>
					<td><img src="${cp}/resources/pro-img/up_down0.png"><a href="${cp}/mem/bst">Binary Search Tree</a></td> 
				</tr>
				<tr>
					<td><img src="${cp}/resources/pro-img/up_down0.png"><a href="${cp}/mem/position">Position Function</a></td> 
				</tr>					
				<tr>
					<td><img src="${cp}/resources/pro-img/up_down0.png"><a href="${cp}/mem/memDeleteForm">Delete Account</a></td> 
				</tr>
			</table>
		</div>
		<a href="${cp}/mem/memLogout">Log Out</a>&nbsp;&nbsp;&nbsp;<a href="${cp}" >Go Back</a> 
		
	</div>
		
		<div class="cliff">
	 	<img src="${cp}/resources/pro-img/cliff.gif">
		</div>	
	</div>	
	
	
</body>
</html>