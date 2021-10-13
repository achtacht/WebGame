<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Game</title>
    <style>
        * {
            margin: 0%;
        }

        body {
            padding: 10%;
            background-color: rgb(54, 23, 5);
            overflow: hidden;
        }

        #container {
            background-image: linear-gradient(25deg, rgb(211, 187, 83) 35%, rgb(99, 60, 60));
            margin: auto;
            border: 8px solid black;
            display: table;
            width: 1200px;
            height: 600px;
            table-layout: fixed;
        }
        .endA{
            animation-name: endAni;
            animation-iteration-count: 1;
            animation-delay: 2s;
            animation-duration: 3s;
            animation-timing-function: ease-in;
            animation-fill-mode: forwards;
        }
        @keyframes endAni{
            100%{
                filter: saturate(3) blur(1px);
            }
        }


        #cliff {
            margin-top: 310px;
            vertical-align: center;
            display: table-cell;
            table-layout: fixed;
            width: 100%;
            filter: brightness(75%);
            opacity: 0.95;
        }     
        /*--------------------------------------------*/
        
        .numbers {
            padding-top:500px;
            padding-left: 20px;
            position: absolute;
            display: table-cell;
            visibility: hidden;
            z-index: 1;
        }

        input[type="button"]{
            width: 150px;
            height: 75px;
            border-radius: 6px;
            border: 6px dashed chocolate;
            font-family: Georgia, 'Times New Roman', Times, serif;
            font-size: x-large;
            font-weight: 800;
            color: chocolate;
            text-align: center;
            background-color: orange;
            
        }     
        input[type="button"]:disabled{
            opacity: 0.6;
            color: orange;
            border: 6px dashed orange;
            background-color: chocolate;
        }

        /*--------------------------------------------*/       

        #boundary{
            position: absolute;
            margin-left: 10px;
            padding-top: 285px;
            width: 400px;
            background-color: transparent;
            cursor: pointer;
            z-index: 5;
        }  

        #root {
            position: absolute;
            text-align: center;
            padding-top: 325px;
            width: 680px;
        }         
        .treeA{
            animation-name: flyB;
            animation-iteration-count: 1;
            animation-delay: 2s;
            animation-duration: 4s;
            animation-timing-function: ease-in;
            animation-fill-mode: forwards;
        }
        @keyframes flyB{  
            100%{
                opacity: 0%;
                transform-origin: 60% 100%;
                transform: scale(50%) translate(600px,-300px) rotate(1440deg);
            }
        }

        /*--------------------------------------------*/    

        #rootI {
            position: absolute;            
            bottom: 0px;            
            width: 80px;
            height: 100px;
            background-repeat: no-repeat;
            background-size: contain; 
            }
        #root div{
            animation-name: floatingB;
            animation-duration: 2s;
            animation-iteration-count: infinite;
        }        
        @keyframes floatingB{
            0%, 100%{
                transform: translateY(0px);
                animation-timing-function: ease-out;
            }
            50%{
                transform: translateY(16px);
                animation-timing-function: ease-in;
            }
        }  

        #water {
            position: absolute;
            left: 25px;            
            width: 35px;   
            animation-name: waterAni;
            animation-duration: 1s;  
            animation-iteration-count: infinite;
        }
        @keyframes waterAni{
            0%, 100%{
                top: 290px;
                animation-timing-function: ease-out;
            }
            50%{
                top: 285px;
                animation-timing-function: ease-in;
            }
        }
            
        /*--------------------------------------------*/
        #magi{
            position: absolute;
            margin-left: 580px;
            padding-top: 320px;
            width: 500px;
        }
        #mag{
            position: absolute; 
            left: 250px;     
            width: 55px;   
            cursor: pointer;
            animation-name: branchFloatAni;
            animation-duration: 1s;  
            animation-iteration-count: infinite;
            
            cursor: pointer;
        }
        @keyframes branchFloatAni{
            0%, 100%{
                top: 250px;
                animation-timing-function: ease-out;
            }
            50%{
                top: 245px;
                animation-timing-function: ease-in;
            }
        }

        #words{            
            position: absolute; 
            width: 120px;
            left: 80px;  
            top: -240px;
            cursor: pointer;
        }
        #clouds{
            position: absolute; 
            width: 200px;
            left: 50px;  
            top: -280px;
        }

        #sORf{
            position: absolute;
            visibility: hidden;
        }

        #refresh{            
            position: absolute; 
            width: 80px;
            left: 100px;  
            top: -240px;
            cursor: pointer;
            visibility: hidden;
            z-index: 8;

            animation-name: refreshAni;
            animation-iteration-count: infinite;
            animation-delay: 0s;
            animation-duration: 1s;
            animation-timing-function: ease-in;
            animation-fill-mode: forwards;
        }
        @keyframes refreshAni{
            0%, 100%{
                transform: scale(105%);
            }
            50%{
                transform: scale(100%);
            }
        }


        #bridge {
            position: absolute;            
            bottom: 150px; 
            left: 20px;           
            width: 200px;
            height: 50px;
            opacity: 0%;
            background-repeat: no-repeat;
            background-size: contain; 
            z-index: 4;
        }
        .bridgeA{
            animation-name: bridgeAni;
            animation-iteration-count: 1;
            animation-delay: 2s;
            animation-duration: 3s;
            animation-timing-function: ease-in;
            animation-fill-mode: forwards;
        }
         @keyframes bridgeAni{ 
         	0%{
	         	transform-origin: 60% 100%;
	         	transform: scale(0%);
         	}           
            50%{
                transform-origin: 60% 100%;
            }
            100%{
                opacity: 100%;
                transform-origin: 60% 100%;
                transform: scale(200%) translate(-45px, 83px) rotate(1440deg);
            }
        }

        #magical{
            position: absolute; 
            bottom: 100px;
            left: 80px;
            width: 120px; 
            visibility: hidden;
        }
        .magicalA{
            animation-name: magicalAni;
            animation-iteration-count: 1;
            animation-delay: 0s;
            animation-duration: 6s;
            animation-timing-function: ease-in;
            animation-fill-mode: forwards;
        }
        @keyframes magicalAni{
            0%{
                opacity: 0%;
            }
            100%{
                opacity: 100%;
                transform: scale(100%) rotate(1440deg);
            } 
        }

        .magicalB{
            animation-name: magicalStop;
            animation-delay: 1s;
            animation-duration: 5s;
            animation-timing-function: ease-in;
            animation-fill-mode: forwards;
        }
        @keyframes magicalStop{ 
            50%{
                opacity: 50%;
                transform: scale(200%) rotate(1440deg);
            }
            100%{
                opacity: 0%;
                transform: scale(0%) rotate(1440deg);
            }
        }

        #rocket{
            position: absolute; 
            left: 315px;    
            top: 180px; 
            width: 80px;   
            cursor: pointer;  
            animation-fill-mode: forwards;
            z-index: 6;
        }
        .rocketA{
            animation-name: rocketShake;
            animation-delay: 2s;
            animation-duration: 1s;
            animation-timing-function: ease-in;
            animation-fill-mode: forwards;
            animation-iteration-count: 4;
        }
        @keyframes rocketShake{
            10%, 90% {
                transform: translate3d(-1px, 0, 0);
              }
              
              20%, 80% {
                transform: translate3d(2px, 0, 0);
              }
            
              30%, 50%, 70% {
                transform: translate3d(-4px, 0, 0);
              }
            
              40%, 60% {
                transform: translate3d(4px, 0, 0);
              }
        }

        .rocketB{
            animation-name: rocketFire;
            animation-delay: 2s;
            animation-duration: 0.5s;
            animation-timing-function: ease-in;
            animation-fill-mode: forwards;
            animation-iteration-count: 1;
        }
        @keyframes rocketFire{
              100%{
                transform: translateY(-500%);
              }
        }

        /*--------------------------------------------*/

        #p2{
            width: 35px;
            transform: translate3d(0px, 0px, 0);
            transition: all ease-in-out 4.5s;
            filter: brightness(35%);
            z-index: 7;
        } 

        /*--------------------------------------------*/
       
        #clear{
            position: absolute;
            margin: auto;
            visibility: hidden;
            z-index: 8;
        }
        a {
            font-family: "Times new Roman";
            font-size: 50px;
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
            text-shadow: 4px 4px white;
        }

    </style>
</head>
<body>
    <div id="container"> 
        <div class="numbers">
            <table>
                <tr>
                    <td><input type="button" value="RANDOM" id="ran" onclick="random();"></input></td>
                    <td><input type="button" id="n0" value="1" onclick="clickD(this.id);"></input></td>
                    <td><input type="button" id="n1" value="1" onclick="clickD(this.id);"></input></td>
                    <td><input type="button" id="n2" value="1" onclick="clickD(this.id);"></input></td>
                    <td><input type="button" id="n3" value="1" onclick="clickD(this.id);"></input></td>
                    <td><input type="button" id="n4" value="1" onclick="clickD(this.id);"></input></td>                    
                </tr>
            </table>
        </div>
        <a href="${cp}" id="clear">CLEAR</a>
        <div id="magi">
            <img src="${cp}/resources/pro-img/magic.png" id="magical">
            <img src="${cp}/resources/pro-img/bridge.png" id="bridge">
            <img src="${cp}/resources/pro-img/magi.png" id="mag" onclick="magi();">
            <img src="${cp}/resources/pro-img/rocket.png" id="rocket" onclick="fire();">
            <div id="sORf">
                <img src="${cp}/resources/pro-img/cloud0.png" id="clouds">
                <img src="${cp}/resources/pro-img/word0.png" id="words">
                <img src="${cp}/resources/pro-img/refresh.png" id="refresh" onclick="window.location.reload();">
            </div>
        </div>

        <div id="boundary">
            <div id="p1"><img src="${cp}/resources/pro-img/up_down.gif" id="p2"></div>
            <div><img src="${cp}/resources/pro-img/watering_can_rec.png" id="water" onclick="ranvis();"></div>
        </div>
        <div id="root" value="">
            <img src="${cp}/resources/pro-img/tree.png" id="rootI">
        </div>
        <div><img src="${cp}/resources/pro-img/cliff.gif" id="cliff"></div>
    </div>


    <script>

        let wat = document.getElementById("water");

        let walk = [];
        let walkL = [];
        let curWalk = 0;
        let start = 0;
        let pr = document.getElementById("p2");
        
        for (let i = 0; i < 4; i ++){ 
            walk[i] = new Image();
            walk[i].src = "${cp}/resources/pro-img/walk" + i + ".png";  
            
            walkL[i] = new Image();
            walkL[i].src = "${cp}/resources/pro-img/walkL" + i + ".png";
        }
            
        let st = 0;
        let walkP = [0];
        let timer = 0; 
        function walking(){ 
            clearInterval(timer);
            clearTimeout(st);
            walkP.push(xPosition);
            if(walkP[0] < walkP[1]){            
                timer = setInterval(() => walkA(), 400);      
            }else if (walkP[0] > walkP[1]){
                timer = setInterval(() => walkB(), 400);
            }
            st = setTimeout(() => {clearInterval(timer); stand();}, 4500);
            walkP.shift();   
        }

        function walkA(){
            if(curWalk == 3){
                curWalk = 0;
                pr.src = walk[curWalk].src;
            }else {
                ++curWalk;
                pr.src = walk[curWalk].src;
            }            
        }

        function walkB(){
            if(curWalk == 3){
                curWalk = 0;
                pr.src = walkL[curWalk].src;
            }else {
                ++curWalk;
                pr.src = walkL[curWalk].src;
            }            
        }

        function stand() {
        	pr.src = "${cp}/resources/pro-img/up_down.gif";
        }

        // -------------------------------------------------------------------
                
        let p1 = document.querySelector("#p2");
        let xPosition = 0;
        let boundary = document.querySelector("#boundary");            
        let parentPosition = getPosition(boundary);

        boundary.addEventListener("click", getClickPosition, false);

        function getClickPosition(e){
            xPosition = e.clientX - parentPosition.x - (p1.offsetWidth / 2);
            let translate3dValue = "translate3d(" + xPosition + "px," + 0 + "px, 0)"; 
            p1.style.transform = translate3dValue;
            walking();     
            return{
                x: xPosition
            };
        }
        function getPosition(element) {
            while (element) {
                xPosition += (element.offsetLeft - element.scrollLeft + element.clientLeft);
                element = element.offsetParent;               
            }
            return {
                x: xPosition
            };
        }

        // -------------------------------------------------------------------
        
        let bLev = [];
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
                    newNode.branch.style.left = "320px";
                    newNode.branch.style.top = "320px";
                    newNode.branch.style.width = "120px";
                    newNode.branch.style.heigth = "100px";
                    newNode.branch.style.position = "absolute";
                }
                else this.insertNode(this.root, newNode);
            }

            insertNode(node, newNode) { 
                if (parseInt(newNode.data) < parseInt(node.data)) {
                    if (node.left === null){ 
                        node.left = newNode;
                        newNode.level = node.level + 1;
                        node.branch.appendChild(newNode.branch);
                        newNode.branch.style.backgroundImage = "url('${cp}/resources/pro-img/branch.png')";
                        newNode.branch.style.backgroundSize = "contain";
                        newNode.branch.style.backgroundRepeat = "no-repeat";
                        newNode.branch.style.position = "absolute";

                        newNode.branch.style.width = (144/newNode.level) + "px";
                        newNode.branch.style.height = (144/newNode.level) + "px";

                        newNode.branch.style.right = (150/newNode.level) + "px";
                        newNode.branch.style.bottom = (180/newNode.level) + "px";
                        
                        let a = newNode.level;
                        bLev.push("A");
                    }
                    else {
                        this.insertNode(node.left, newNode);          
                    }
                }
                else {
                    if (node.right === null){ 
                        node.right = newNode;
                        newNode.level = node.level + 1;
                        node.branch.appendChild(newNode.branch);
                        newNode.branch.style.backgroundImage = "url('${cp}/resources/pro-img/branch.png')";
                        newNode.branch.style.backgroundSize = "contain";
                        newNode.branch.style.backgroundRepeat = "no-repeat";
                        newNode.branch.style.position = "absolute";

                        newNode.branch.style.width = (144/newNode.level) + "px";
                        newNode.branch.style.height = (144/newNode.level) + "px";

                        newNode.branch.style.left = (150/newNode.level) + "px";
                        newNode.branch.style.bottom = (180/newNode.level) + "px";

                        let b = newNode.level;
                        bLev.push("B");
                    }
                    else{
                        this.insertNode(node.right, newNode); 
                    }
                } 
            }
        }

        let ranBcnt = 0;
        function ranvis(){
            let ranB = document.getElementById('ran');
            if (xPosition < 50 && ranBcnt == 0){  
                ranB.style.visibility = "visible";  
                ranBcnt = -1;              
            }    
        }

        let randomArr = [];
        let num;
        function random() {
            randomArr = [];
            for (let i = 0; i < 5; i++) {
                num = Math.floor(Math.random() * 100) + 1;
                if (randomArr.indexOf(num) == -1) {
                    randomArr.push(num);
                    document.getElementById("n" + i).style.visibility = "visible";
                    document.getElementById("n" + i).value = randomArr[i];
                    document.getElementById("ran").style.visibility = "hidden";
                }
                else {
                    i--;
                }
            }

            // let randomArrLength = 0;
            // while(true){
            //     if(randomArrLength == 5) break;

            //     num = Math.floor(Math.random() * 100) + 1;
            //     if (randomArr.indexOf(num) == -1) {
            //         randomArr.push(num);
            //         document.getElementById("n" + randomArrLength).style.visibility = "visible";
            //         document.getElementById("n" + randomArrLength).value = randomArr[randomArrLength];
            //         document.getElementById("ran").style.visibility = "hidden";
            //         console.log(randomArr);
            //     }
            //     randomArrLength ++;
            // }
        } 

        let root = document.getElementById("root");
        let tree = new BinarySearchTree();
        let bCnt = 0;
        function clickD(id) {
            let dis = document.getElementById(id);
            dis.disabled = "true";
            bCnt++;

            tree.insert(dis.value); 
            // div의 요소값을 insert하면서 string으로 변경됨.
            // 숫자 string의 값이 사전순서로 비교됨 
            // ex) 6 > 12
        }

        let wordsCh = document.getElementById("words");
        let sORf = document.getElementById("sORf");
        let clouds = document.getElementById("clouds");
        let wNxt = -1;
        let beforeT =[];
        let failT = [];
        let wordCloud = [];
        let ref = document.getElementById("refresh");

        for (let i = 0; i < 3; i ++){ 
            wordCloud[i] = new Image();
            wordCloud[i].src = "${cp}/resources/pro-img/cloud" + i + ".png";

            beforeT[i] = new Image();
            beforeT[i].src = "${cp}/resources/pro-img/word" + i + ".png";

            failT[i] = new Image();
            failT[i].src = "${cp}/resources/pro-img/wordN" + i + ".png";
        }

        function nextW1(){
            wordsCh.style.visibility = "visible";
            ref.style.visibility = "hidden";
            sORf.style.visibility = "visible";
            if (wNxt == 3){
                wordsCh.style.visibility = "hidden";
                ref.style.visibility = "hidden";
                sORf.style.visibility = "hidden";
                wNxt = -1;
            }
            else if(wNxt == 2){
                wordsCh.style.visibility = "hidden";
                ref.style.visibility = "visible";
                wNxt++;
            }else{
                wNxt++;
                wordsCh.src = beforeT[wNxt].src;
                clouds.src = wordCloud[wNxt].src;
            }
        }

        function nextW2(){
            wordsCh.style.visibility = "visible";
            ref.style.visibility = "hidden";
            sORf.style.visibility = "visible";
            if (wNxt == 3){
                wordsCh.style.visibility = "hidden";
                ref.style.visibility = "hidden";
                sORf.style.visibility = "hidden";
                wNxt = -1;
            }
            else if(wNxt == 2){
                wordsCh.style.visibility = "hidden";
                ref.style.visibility = "visible";
                wNxt++;
            }else{
                wNxt++;
                wordsCh.src = failT[wNxt].src;
                clouds.src = wordCloud[wNxt].src;
            }
        }

        let magicTrigger = document.getElementById("magical");
        let briTrigger = document.getElementById("bridge");
        
        function magi(){
            let cntA = bLev.filter(e => 'A' === e).length;
            let cntB = bLev.filter(e => 'B' === e).length;
    
            function eA (e) {
                return 'A' === e;
            }       
            function eB (e) {
                return 'B' === e;
            }
            if(bLev.length < 4){
                // introduction
                nextW1();
            }
            else if(cntA == 4 || cntB == 4){
                // success                
                magicTrigger.classList.add("magicalA");
                magicTrigger.style.visibility = "visible";
                document.getElementById("root").className = "treeA";
                
                root.addEventListener('animationend', () => {
                   bridgeM();
                  });

                magicTrigger.addEventListener("animationend", () => {
                    magicTrigger.classList.add("magicalB");
                });
            }
            else{
                // failed
                nextW2();
            }
        };

        function bridgeM(){
            document.getElementById("bridge").className = "bridgeA";         
        };
        
        briTrigger.addEventListener("animationend", () => {
            boundary.style.width = "900px";
        });


    	let bound = document.getElementById("boundary");
        let rocketGo = document.getElementById("rocket");
        function fire(){
            if(bound.offsetWidth > 400){
                boundary.style.width = "0px"; 
                rocketGo.classList.add("rocketA");
                rocketGo.addEventListener("animationstart", () => {
                    pr.style.visibility = "hidden";
                });      
            };
        };
        rocketGo.addEventListener("animationend", () => {
            rocketGo.classList.remove("rocketA");            
            rocketGo.classList.add("rocketB");
            rocketGo.addEventListener("animationend", () => {
                    let contain = document.getElementById("container");
                    contain.classList.add("endA");
                    contain.addEventListener("animationend", () => {
                        let clear1 = document.getElementById("clear"); 
                        clear1.style.visibility = "visible";
                    });
                });
        });

    </script>

</body>

</html>