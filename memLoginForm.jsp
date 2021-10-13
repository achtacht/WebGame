<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<title>Login</title>


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
	height: 200px;
	border: 3px dashed orange;
	border-radius: 8px;
	text-align: center;
	z-index: 8;
}
#innerBox{
	margin: auto;
	background-color: orange;
	border: 3px dashed chocolate;
	border-radius: 8px;
	width: 280px;
	height: 130px;
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
}

input{
	 width: 90%;
     height: 90%;
     border-radius: 5%;
     border: none;
     background-color: chocolate;
     color: orange;
     text-align: center;
     font-size: large;
}
input[type="submit"]{
	cursor: pointer;
	margin-top: 5%;
	color: chocolate;
	background-color: orange;
	border: 3px dashed chocolate;
}
input[type="submit"]:hover{
	opacity: 0.5;
}
.swal-overlay {
  background-color: rgba(255, 165, 0, 0.45);
}
.swal-modal {
  background-color: rgba(255, 165, 0, 0.69);
  border: 4px dashed chocolate;
}
.swal-text {
  text-align: center;
  color: chocolate;
  font-family: "Times new Roman";
  font-size: x-large;  
}
.swal-button {
  border-radius: 8px;
  background-color: orange;
  font-size: 12px;
  border: 4px dashed chocolate;
  text-shadow: 0px -1px 0px rgba(255, 165, 0, 0.3);
}
.swal-button:hover{
	opacity: 0.3;
}

</style>

</head>


<body>

	<c:if test="${res == 'fail'}">
		<script>
			swal("[WRONG ID/PW]")
		</script>
	</c:if>


	
	<div class="container">		
		<div id="form">
			<h1>Login</h1>
			<div id="innerBox">	
			<form action="${cp}/mem/memLogin" method="post">
			<table id="tableS">
				<tr>
					<th></th>
				</tr>
				<tr>
					<td>ID</td>
					<td>: <input type="text" name="memId" ></td>
				</tr>
				<tr>
					<td>PW</td>
					<td>: <input type="password" name="memPw"></td>
				</tr>
				<tr>
				<td colspan="2"><input type="submit" value="Login" >
				</td>
				</tr>
			</table>
			</form>
			</div>
			<a href="#" onclick="history.back();">Go Back</a>
		</div>
		
		<div class="cliff">
	 	<img src="${cp}/resources/pro-img/cliff.gif">
		</div>	
	</div>	

</body>
</html>