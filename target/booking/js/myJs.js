// JavaScript Document
window.onload=function(){
    var doc=document.getElementById("doctors").childNodes;
    for(var i=0;i<doc.length;i++){
        doc[i].index=i;
        if((i%2)==1){
            doc[i].onmouseover=function(){
                var user=doc[this.index].getElementsByClassName("doc-user")[0];
                user.style.transition="1s all";
                user.style.marginTop="-280px";
                var bg=doc[this.index].getElementsByClassName("doc-bg")[0];
                bg.style.transition="1s all";
                bg.style.marginTop="-400px";
            }
            doc[i].onmouseout=function(){
                var user=doc[this.index].getElementsByClassName("doc-user")[0];
                user.style.transition="1s all";
                user.style.marginTop="-110px";
                var bg=doc[this.index].getElementsByClassName("doc-bg")[0];
                bg.style.transition="1s all";
                bg.style.marginTop="-310px";
            }
        }else{
            continue;
        }
    }
    var img = document.getElementsByClassName("img-heal");
    var childimg=document.getElementsByClassName("img-heals");
    for(var i = 0;i<img.length;i++){
        img[i].index=i;
        img[i].onmouseover = function(){
            childimg[this.index].style.marginLeft="40px";
            childimg[this.index].style.transform="scale(1.2,1.2)";
            childimg[this.index].style.transition="0.5s all";

        }
        img[i].onmouseout = function(){
            childimg[this.index].style.marginLeft="0px";
            childimg[this.index].style.transform="scale(1,1)";
            childimg[this.index].style.transition="0.5s all";
        }
    }
    var intContent = document.getElementsByClassName("int-content");
    for(var i=0;i<intContent.length;i++){
        intContent[i].index=i;
        intContent[i].onclick=function(){
            for(var j=0;j<intContent.length;j++){
                intContent[j].getElementsByClassName("ind-head")[0].style.backgroundColor="#58BEEE";
                intContent[j].getElementsByClassName("ind-head")[0].style.backgroundImage="none";
                intContent[j].getElementsByClassName("ind-head")[0].style.transition="background-color 1.5s";
                intContent[j].getElementsByClassName("int-btn")[0].style.backgroundColor="#58BEEE";
                intContent[j].getElementsByClassName("int-btn")[0].style.transition="background-color 2s";
            }

            this.getElementsByClassName("ind-head")[0].style.backgroundImage="url(images/huawen.jpg)";
            this.getElementsByClassName("int-btn")[0].style.backgroundColor="#0385D1";
        }
    }

}
