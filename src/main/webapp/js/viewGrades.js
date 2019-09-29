
function viewGrade1(){
    event.preventDefault();
    var url ="http://localhost:8080/GMS-api/FrontController/viewgrade.do";
    $.get(url, function(response){
        console.log(response);
       var data=JSON.parse(response);
       var content="<br><br><br><table border=1><tr><th>Grade</th><th>Minimum Marks</th><th>Maximum Marks</th></tr>";
	for( let grades of data)
		{
		content +="<tr><td>"+grades.grade +"</td><td>"+grades.minMark+"</td><td>"+grades.maxMark+ "</td></tr>";
		}
       document.getElementById("viewdetails").innerHTML=content;
     });
    }

function viewTop(){
    event.preventDefault();
    var url ="http://localhost:8080/GMS-api/FrontController/viewtop.do";
    $.get(url, function(response){
        console.log(response);
        var data=JSON.parse(response);
      
        var content="<br><br><br><table border=1><tr><th>Registration number</th><th>Name</th></tr>";
 	for( let marks of data)
 		{
 		content +="<tr><td>"+marks.student.registrationNumber+"</td><td>"+marks.student.name+"</td></tr></table><br>";
 		break;
 		}

        var contents="<table border=1><tr><th>Subject Id</th><th>Subject Name</th><th>Marks</th></tr>";
     	for(let mark of data)
    		{
    		contents +="<tr><td>"+mark.subjects.id +"</td><td>"+mark.subjects.name+"</td><td>"+mark.marks+ "</td></tr>";
    		}
        
     	 document.getElementById("viewdetails").innerHTML=content+contents;
        
      });
     }
      
function viewallmarks1(){
    event.preventDefault();
    var url ="http://localhost:8080/GMS-api/FrontController/viewallmarks.do";
    $.get(url, function(response){
        console.log(response);
    });
     }
    

function getGrade(total){
    event.preventDefault();
    var sum=total;
    console.log("sum"+sum);
    var formData = "average=" + sum
    console.log("formData:"+formData);
    var data;
    var url ="http://localhost:8080/GMS-api/FrontController/getGrade.do?" + formData;
    $.get(url, function(response){
        console.log(response); 
       data=JSON.parse(response); 
       window.localStorage.setItem('grade', 'A');
       console.log("func:"+data);
    }); 

     }
     
function viewGrade(){
    event.preventDefault();
    var url ="http://localhost:8080/GMS-api/FrontController/viewgrade.do";
    $.get(url, function(response){
        console.log(response);
        var c=0;
        var m=0;
       var data=JSON.parse(response);
       var content="<br><br><br><div align='center' id='mesg'></div><form method='get' onsubmit='upgradeGrade()'><table class='table table-hover' border=1><tr><th>Grade</th><th>Minimum Marks</th><th>Maximum Marks</th></tr>";
	for( let grades of data)
		{
		content +="<tr><td><input type='text' value="+grades.grade+" id="+grades.grade+" disabled minlength='1' maxlength='1'></td><td><input type='number' value="+grades.minMark  +" id="+ ++m  +" min='0' max='100' onfocusout='change("+m +")' required>"+"</td><td><input type='number' value="+grades.maxMark  +" id="+ ++m  +" min='1' max='100' onfocusout='change("+m +")' required>"+"</td></tr>";
		console.log(c+":"+m);
		}
	content +="<tr><td align=center colspan=3><button type='submit' class='btn btn-primary btn-xs'>Update</button></table></form>";
       document.getElementById("viewdetails").innerHTML=content;
     });
    }
     

     

function change(num)
{
	console.log("hello:"+num);
	if(num=='last')
	{
	document.getElementById(num).value=0;
	}
var id=num;
var previous=num-1;
var after=num+1;
var maxvalue ="";


maxvalue =parseInt(document.getElementById(id).value);
if(id%2==0)
	{
	var minvalue =1;
	minvalue += parseInt(document.getElementById(previous).value);
	if(minvalue>maxvalue)
		{
		console.log(minvalue+">"+maxvalue);
		 document.getElementById("mesg").innerHTML="maximum mark should be greater than "+minvalue;
		 document.getElementById(num).focus();
		}
	else
	{
		 document.getElementById("mesg").innerHTML="";	 
		 let previousid=num-3;
		 console.log("previousid :"+previousid);
		 var previousValue =parseInt(document.getElementById(previousid).value)-1;
		 console.log(previousValue);
		if(previousValue>=maxvalue)
			{
			console.log(previousValue+"<"+maxvalue);
			 document.getElementById(previousid).value=maxvalue+1;
			}
		else
		{
			console.log(minvalue+">"+maxvalue);
			 document.getElementById("mesg").innerHTML="maximum mark should be less than "+previousValue;
			 document.getElementById(num).focus();
		}
	}
	}
else
{
	var previousid=num+3;
	console.log(previousid);
	var previousmark =parseInt(document.getElementById(previousid).value);
	 maxvalue =parseInt(document.getElementById(id).value);
	 console.log(previousmark);
	 var mark =parseInt(document.getElementById(num+1).value);
	 console.log("check:"+mark);
	 if(maxvalue<mark){
	if(previousmark<maxvalue)
		{
		 document.getElementById("mesg").innerHTML="";
		console.log(previousmark+"<"+maxvalue);
		 document.getElementById(previousid).value=maxvalue-1;
		}
	else
	{
		 document.getElementById("mesg").innerHTML="minimum mark should be greater than "+previousmark;
		 document.getElementById(num).focus();
	}
	 }
	 else
		 {
		 document.getElementById("mesg").innerHTML="minimum mark should be less than "+mark;
		 document.getElementById(num).focus();
		 }
}
}
function upgradeGrade()
{
	event.preventDefault();
var num=0;
var numb;
for(alpha=65;alpha<91;alpha++)
{
	try{
var str=String.fromCharCode(alpha);
var grade=document.getElementById(str).value;
var minmark=document.getElementById(++num).value;
var maxmark=document.getElementById(++num).value;	
numb=num;
var formData = "grade=" + grade + "&minimummark=" + minmark+ "&maximummark=" + maxmark;
console.log(formData);
var url ="http://localhost:8080/GMS-api/FrontController/updateGrade.do?"+ formData;
$.get(url, function(response){
	 document.getElementById("mesg").innerHTML="successfully updated....";
});
}
	catch(err){ 
		
		var str=String.fromCharCode(alpha);
		console.log(str);	
	var grade=document.getElementById(str).value;
	console.log(grade);
	var minmark=document.getElementById('last').value;
	console.log(minmark);
	var maxmark=document.getElementById(numb+2).value;	
	console.log(maxmark);
	var formData = "grade=" + grade + "&minimummark=" + minmark+ "&maximummark=" + maxmark;
	console.log(formData);
	var url ="http://localhost:8080/GMS-api/FrontController/updateGrade.do?"+ formData;
	$.get(url, function(response){
		 console.log(grade +":" +response);
	});
}}}
    
     
    