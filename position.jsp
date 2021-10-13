<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Position</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <style>
   		body {
            padding: 10%;
            background-color: rgb(54, 23, 5);
        }
        #container{
        	margin: auto;
            display: table;
            width: 1050px;
            height: 410px;
        }
        #boundary{
            position: absolute;
            width: 400px;
            height: 400px;
            border: 5px chocolate;
            border-style: dashed;          
            background-color: orange;
            overflow: hidden;  
        }
        #p1{
            transform: translate3d(5px, 5px, 0);
            transition: transform .1s cubic-bezier(0, .0, .0, .0);
            width: 35px;
        }
        table{    
        	position:relative;
        	left:400px;     
            height: 410px;
            width: 650px;
            border: 5px orange;
            border-style: dashed;      
            background-color: chocolate;
            color: rgb(146, 17, 17);
            font-size: large;
            font-family: 'Times New Roman', Times, serif;
            border-collapse: collapse;
            resize: none;
        }
        th, tr, td{
            height: 55px;
            width: 130px;
            border: 2.5px orange;
            border-style: dashed;
            resize: none;
        }
        tr{ 
            text-align: center;
        }
        #trans, #pos{
            padding-left: 20px;
        }
        input[type="number"]{
            width: 100px;
            height: 55px;
            border-radius: 5%;
            border: none;
            background-color: rgb(255, 180, 110);
            color: orangered;
            text-align: center;
            font-size: large;
            resize: none;
        }
        input[type="number"]::-webkit-outer-spin-button,
        input[type="number"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        } 
        input[type="button"]{
            width: 100px;
            height: 55px;
            border-radius: 5%;
            border: none;
            background-color: rgb(255, 180, 110);
            color: orangered;
            text-align: center;
            font-size: large;
        }
        input[type="button"]::-webkit-outer-spin-button,
        input[type="button"]::-webkit-inner-spin-button {
            -webkit-appearance: none;
            margin: 0;
        }
        input[type="button"]:active{
            color: white;
            background-color: orange;
        }

    </style>
</head>

<body>

    
	<div id="container">
	    <div id="boundary">
	        <div id="p1">
	            <img src="${cp}/resources/pro-img/up_down.gif">
	        </div>      
	        
	    </div> 
	    
	    <div onkeyup="num()" class="custom">
	        <table>
	        	<tr>                            
	            <th>time (1~9)</th>
	            <th colspan="4">cubic bezier (0~100)</th>
	            </tr>
	            <tr>
	                <td>0.1~0.9</td>            
	                <td>0.00~1.00</td>
	                <td>-1.00~1.00</td>
	                <td>0.00~1.00</td>
	                <td>-1.00~1.00</td>
	            </tr>
	            <tr>
	                <td><input type="number" id="n0" maxlength="1" onkeyup="maxLengthCheck(this)" placeholder="number"></td>
	                <td><input type="number" id="n1" maxlength="2" onkeyup="maxLengthCheck(this)" placeholder="number"></td>
	                <td><input type="number" id="n2" maxlength="2" onkeyup="maxLengthCheck(this)" placeholder="number"></td>
	                <td><input type="number" id="n3" maxlength="2" onkeyup="maxLengthCheck(this)" placeholder="number"></td>
	                <td><input type="number" id="n4" maxlength="2" onkeyup="maxLengthCheck(this)" placeholder="number"></td>
	            </tr>
	
	            <!-- input type number는 maxlength를 안 먹음.... -->
	         
	            <tr>
	                <td colspan="4" style="text-align: left;"><p id="trans">transition </p></td>    
	                <td><input type="button" value="REFRESH" onclick="window.location.reload();"></td>            
	            </tr>
	            <tr>
	                <td colspan="4" style="text-align: left;"><p id="pos">position </p></td>
	                <td><input type="button" value="BACK" onclick="history.back();"></td>
	            </tr>
	        </table>
	       </div>
       </div>

    <script>
        function maxLengthCheck(object){
            /* object.maxLength = 2; */
            if (object.value.indexOf('-')==0){
                object.maxLength = 3;
            }
            else if (object.maxLength == 3){
                object.maxLength = 2;
            }
            if (object.value.length > object.maxLength){
                object.value = object.value.slice(0, object.maxLength);
            }
            // - 가 두번 들어갈 경우... 잡지 못함....
         }

        let p1 = document.querySelector("#p1");
        
        function num(){
            let n0 = document.getElementById("n0").value;
            let n1 = document.getElementById("n1").value;
            let n2 = document.getElementById("n2").value;
            let n3 = document.getElementById("n3").value;
            let n4 = document.getElementById("n4").value;      

            let cubic = "transform "+ n0*0.1 +"s cubic-bezier(" + (n1*0.01).toFixed(2) + ", " + (n2*0.01).toFixed(2) + ", " + (n3*0.01).toFixed(2) + ", " + (n4*0.01).toFixed(2) + ")";   
            p1.style.transition = cubic;  
            trans.textContent = "transition: " + cubic;
        }
        // -------------------------------------------------------------------

        let xPosition = 0;
        let yPosition = 0;


        let boundary = document.querySelector("#boundary");
        boundary.addEventListener("click", getClickPosition, false);


        let pos = document.getElementById("pos");

        function getClickPosition(e){
            let parentPosition = getPosition(boundary);            
            xPosition = e.clientX - parentPosition.x - (p1.offsetWidth / 2);
            yPosition = e.clientY - parentPosition.y - (p1.offsetWidth / 2);

            let translate3dValue = "translate3d(" + xPosition + "px," + yPosition + "px, 0)"; 
            p1.style.transform = translate3dValue;

            let xy = "X : " + xPosition.toFixed(2) + " Y: " + yPosition.toFixed(2);
            console.log(xy);
            pos.textContent = xy;
        }

        // 요소의 좌표
        function getPosition(element) {
             xPosition = 0;
             yPosition = 0;
            
            while (element) {
                xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
                yPosition += (element.offsetTop - element.scrollTop + element.clientTop);
            
                element = element.offsetParent;
            }
            return {
                x: xPosition,
                y: yPosition
            };
        }

        // -------------------------------------------------------------------

    </script>

</body>

</html>