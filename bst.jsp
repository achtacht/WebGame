<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Binary Search Tree</title>
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
        table{           
            position: relative;
            left: 400px; 
            height: 410px;
            width: 650px;
            border: 5px orange;
            border-style: dashed;      
            background-color: chocolate;
            color: rgb(146, 17, 17);
            font-size: large;
            font-family: 'Times New Roman', Times, serif;
            border-collapse: collapse;
        }
        th, tr, td{
            height: 55px;
            width: 130px;
            border: 2.5px orange;
            border-style: dashed;
        }
        tr{ 
            text-align: center;
        }
        #sort, #order{
            padding-left: 20px;
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
            transition-duration: 0.3s;
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

        #ranNum{
            visibility: hidden;
        }
      
        #rootI {
            position: absolute;  
            padding-top: 78%;
            padding-left: 40%;
            width: 80px;
            height: 90px;
            background-repeat: no-repeat;
            background-size: contain;
        }               
    </style>
</head>

<body>
<div id="container">
    <div id="boundary">
        <div id="rootDiv" value="">
            <img src="${cp}/resources/pro-img/tree.png" id="rootI">
        </div>   
        
    </div> 

    <table> 
    	<tr>                           
        <th><input type="button" value="RANDOM" id="ran" onclick="random();"></input></th>
        <th><input type="button" value="REFRESH" onclick="window.location.reload();"></th>
        <th colspan="3"></th>
        </tr>
        <tr>
            <td id="s0">0</td>            
            <td id="s1">0</td>
            <td id="s2">0</td>
            <td id="s3">0</td>
            <td id="s4">0</td>
        </tr>

        <tr id="ranNum">
            <td><input type="button" id="n0" value="1" onclick="clickD(this.id); nums(value);"></input></td>
            <td><input type="button" id="n1" value="1" onclick="clickD(this.id); nums(value);"></input></td>
            <td><input type="button" id="n2" value="1" onclick="clickD(this.id); nums(value);"></input></td>
            <td><input type="button" id="n3" value="1" onclick="clickD(this.id); nums(value);"></input></td>
            <td><input type="button" id="n4" value="1" onclick="clickD(this.id); nums(value);"></input></td>
        </tr>
     
        <tr>
            <td colspan="4" style="text-align: left;"><p id="sort">Sort </p></td>   
            <td><input type="button" value="SORT" onclick="sortN();" id="sortC"></td>        
        </tr>
        <tr>
            <td colspan="4" style="text-align: left;"><p id="order">Order </p></td>
            <td><input type="button" value="BACK" onclick="history.back();"></td>
        </tr>
    </table>
</div>
    <script>

        let arr = [];
        function nums(value){
            arr.push(value);
            let clickO =  arr[0] + " - " + arr[1] + " - " + arr[2] + " - " + arr[3] + " - " + arr[4]; 
            order.textContent = "Order: " + clickO;
        }

        let sortClr = document.getElementById("sortC");
        let sorting = 0;
        function sortN(){
            if(randomArr.indexOf('0')==-1){
                if(sorting == 0){
                    randomArr.sort(function(a, b)  {
                    return b - a;
                  });
                  sorting = 1;
                  sortClr.style.backgroundColor = "orange";
                  sortClr.style.color = "white";
                }
                else if (sorting == 1){
                    randomArr.sort(function(a, b)  {
                    return a - b;
                  });
                  sorting = 0;
                  sortClr.style.backgroundColor = "rgb(255, 180, 110)";
                  sortClr.style.color = "orangered";
                }
                for(i = 0; i < randomArr.length; i ++){
                    let sI = document.getElementById("s"+i);
                    
                    sI.textContent = randomArr.indexOf(orginArr[i]) + 1;
                }



            let sorted = randomArr[0] + " - " + randomArr[1] + " - " + randomArr[2] + " - " + randomArr[3] + " - " + randomArr[4]; 
            sort.textContent = "Sort: " + sorted;
            }
        }


        let level = 1;
        class Node {
            constructor(data, branch, level) {
                    this.data = data;
                    this.left = null;
                    this.right = null;
                    this.branch = branch;
                    this.level = level;
            }
        }
            
        class BinarySearchTree {
           constructor() {
                this.root = null;
            }
            
            insert(data) {
                let branch = document.createElement("div");
                let newNode = new Node(data, branch, level);
                if (this.root === null)  {
                    this.root = newNode; 
                    root.appendChild(newNode.branch);
                    newNode.branch.style.width = "50px";
                    newNode.branch.style.heigth = "250px";
                    newNode.branch.style.left = "160px";
                    newNode.branch.style.bottom = "50px";
                    newNode.branch.style.position = "absolute";
                    newNode.branch.style.backgroundSize = "contain";
                    newNode.branch.style.backgroundRepeat = "no-repeat";
                }
                else this.insertNode(this.root, newNode);
            }

            insertNode(node, newNode) { 
                if (parseInt(newNode.data) < parseInt(node.data)) {
                    if (node.left === null){ 
                        node.left = newNode;
                        newNode.level = node.level + 1;

                        console.log(newNode.level);

                        node.branch.appendChild(newNode.branch);
                        newNode.branch.style.backgroundImage = "url('${cp}/resources/pro-img/branch.png')";
                        newNode.branch.style.backgroundSize = "contain";
                        newNode.branch.style.backgroundRepeat = "no-repeat";
                        newNode.branch.style.position = "absolute";

                        newNode.branch.style.width = (80/newNode.level) + "px";
                        newNode.branch.style.height = (80/newNode.level) + "px";

                        newNode.branch.style.right = (90/newNode.level) + "px";
                        newNode.branch.style.bottom = (120/newNode.level) + "px";
                    }
                    else {
                        this.insertNode(node.left, newNode);          
                    }
                }
                else {
                    if (node.right === null){ 
                        
                        node.right = newNode;
                        newNode.level = node.level + 1;

                        console.log(newNode.level);

                        node.branch.appendChild(newNode.branch);
                        newNode.branch.style.backgroundImage = "url('${cp}/resources/pro-img/branch.png')";
                        newNode.branch.style.backgroundSize = "contain";
                        newNode.branch.style.backgroundRepeat = "no-repeat";
                        newNode.branch.style.position = "absolute";

                        newNode.branch.style.width = (80/newNode.level) + "px";
                        newNode.branch.style.height = (80/newNode.level) + "px";

                        newNode.branch.style.left = (135/newNode.level) + "px";
                        newNode.branch.style.bottom = (120/newNode.level) + "px";
                    }
                    else{
                        this.insertNode(node.right, newNode); 
                    }
                } 

            }
        }
        
        let orginArr = [];
        let randomArr = [];
        let num;
        function random() {
            randomArr = [];
            for (let i = 0; i < 5; i++) {
                num = Math.floor(Math.random() * 100) + 1;
                if (randomArr.indexOf(num) == -1) {
                    randomArr.push(parseInt(num));
                    orginArr.push(parseInt(num));
                    document.getElementById("n" + i).style.visibility = "visible";
                    document.getElementById("n" + i).value = randomArr[i];
                    document.getElementById("ran").style.visibility = "hidden";
                    console.log(randomArr);
                }
                else {
                    i--;
                }
            }
        } 

        let root = document.getElementById("rootDiv");
        let tree = new BinarySearchTree();
        function clickD(id) {
            let dis = document.getElementById(id);
            dis.disabled = "true";
            dis.style.opacity = "0.5";
            tree.insert(dis.value); 
            // div의 요소값을 insert하면서 string으로 변경됨.
            // 숫자 string의 값이 사전순서로 비교됨 
            // ex) 6 > 12
        }
    </script>
    
</body>

</html>