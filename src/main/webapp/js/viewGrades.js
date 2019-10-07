
function viewGrade1(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
    let url ="http://localhost:8080/GMS-api/FrontController/viewgrade.do";
    $.get(url, function(response){
        console.log(response);
       let data=JSON.parse(response);
       let content="<br><br><br><table border=1><tr><th>Grade</th><th>Minimum Marks</th><th>Maximum Marks</th></tr>";
	for( let grades of data)
		{
		content +="<tr><td>"+grades.grade +"</td><td>"+grades.minMark+"</td><td>"+grades.maxMark+ "</td></tr>";
		}
       document.getElementById("viewdetails").innerHTML=content;
     });
    }

function viewTop(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
    let url ="http://localhost:8080/GMS-api/FrontController/viewtop.do";
    $.get(url, function(response){
        console.log(response);
        let data=JSON.parse(response);
        let count=0;
        let total=0;
        let sid=0;
        let content="<br><br><br><table class='table table-hover' border='1'><tr><th>Registration number</th><th>Name</th></tr>";
 	for( let marks of data)
 		{
 		content +="<tr><td>"+marks.student.registrationNumber+"</td><td>"+marks.student.name+"</td></tr></table><br>";
 		break;
 		}

        let contents="<table class='table table-hover' border=1><tr><th>Subject Id</th><th>Subject Name</th><th>Marks</th></tr>";
     	for(let mark of data)
    		{
     		++count;
    		contents +="<tr><td>"+mark.subjects.id +"</td><td>"+mark.subjects.name+"</td><td>"+mark.marks+ "</td></tr>";
    		total +=mark.marks;
    		}
     	let sum=Math.ceil(total/count);
		 let grade=calgrade(sum);
		
		console.log("return:" +grade);
		contents+=  "<tr><th>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
		contents+=  "<tr><th>Grade :</th><th colspan=2>"+grade  +"</th></tr></table>";
	
     	 document.getElementById("viewdetails").innerHTML=content+contents;
        
      });
     }
      
function viewallmarks1(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
   let url ="http://localhost:8080/GMS-api/FrontController/viewallmarks.do";
    $.get(url, function(response){
        console.log(response);
    });
     }
    

function getGrade(total){
   
    let sum=total;
   
    console.log("sum"+sum);
    let formData = "average=" + sum
    console.log("formData:"+formData);
    let data;
    let url ="http://localhost:8080/GMS-api/FrontController/getGrade.do?" + formData;
    $.get(url, function(response){
        console.log("grade :"+response); 
       data=JSON.parse(response); 
       gradevalue=data;
       console.log("gradevalue :"+gradevalue);
       localStorage.setItem('grade', data);
       console.log("func:"+data);
       return gradevalue;    
    }); 
   

}
     
function viewGrade(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
    let url ="http://localhost:8080/GMS-api/FrontController/viewgrade.do";
    $.get(url, function(response){
        console.log(response);
        let c=0;
        let m=0;
       let data=JSON.parse(response);
       let content="<br><div align='center' id='mesg'></div><form method='get' onsubmit='upgradeGrade()'><table class='table table-hover' border=1><tr><th>Grade</th><th>Minimum Marks</th><th>Maximum Marks</th></tr>";
	for( let grades of data)
		{
		if(grades.minMark!=0 && grades.maxMark!=100){
		content +="<tr><td><input type='text' value="+grades.grade+" id="+grades.grade+" disabled minlength='1' maxlength='1'></td><td><input type='number' value="+grades.minMark  +" id="+ ++m  +" min='0' max='100' oninput='change("+m +")' onfocusout='change("+m +")' required>"+"</td><td><input type='number' value="+grades.maxMark  +" id="+ ++m  +" min='1' max='100' oninput='change("+m +")' onfocusout='change("+m +")' required>"+"</td></tr>";
		console.log(c+":"+m);
		}
		if(grades.minMark==0){
			content +="<tr><td><input type='text' value="+grades.grade+" id="+grades.grade+" disabled minlength='1' maxlength='1'></td><td><input type='number' disabled value="+grades.minMark  +" id="+ ++m  +" min='0' max='100' onfocusout='change("+m +")' required>"+"</td><td><input type='number' value="+grades.maxMark  +" id="+ ++m  +" min='1' max='100'  onfocusout='change("+m +")' required>"+"</td></tr>";
			console.log(c+":"+m);
			}
		if(grades.maxMark==100){
			content +="<tr><td><input type='text' value="+grades.grade+" id="+grades.grade+" disabled minlength='1' maxlength='1'></td><td><input type='number' value="+grades.minMark  +" id="+ ++m  +" min='0' max='100' oninput='change("+m +")' onfocusout='change("+m +")' required>"+"</td><td><input type='number' disabled value="+grades.maxMark  +" id="+ ++m  +" min='1' max='100' oninput='change("+m +")' onfocusout='change("+m +")' required>"+"</td></tr>";
			console.log(c+":"+m);
			}
		}
	content +="<tr><td align=center colspan=3><button type='submit' class='btn btn-primary btn-xs' id='upgradebutton'>Update</button></table></form>";
       document.getElementById("viewdetails").innerHTML=content;
     });
    }
     

     

function change(num)
{
let id=num;
let previous=num-1;
let after=num+1;
let maxvalue ="";
maxvalue =parseInt(document.getElementById(id).value);
if(id%2==0)
	{
	let minvalue =1;
	minvalue += parseInt(document.getElementById(previous).value);
	if(minvalue>maxvalue)
		{
		document.getElementById("upgradebutton").disabled = true;
		 document.getElementById("mesg").innerHTML="maximum mark should be greater than "+minvalue;
		 document.getElementById(num).focus();
		}
	else
	{
		document.getElementById("upgradebutton").disabled = false;
		 document.getElementById("mesg").innerHTML="";	 
		 let previousid=num-3;
		 if (previousid === -1) {
			    } 
		 else{
		 console.log("previousid :"+previousid);
		 let previousValue =parseInt(document.getElementById(previousid).value)-1;
		 console.log("previousValue :"+previousValue);
		if(previousValue>=maxvalue)
			{
			 document.getElementById(previousid).value=maxvalue+1;
			}
		else
		{
			document.getElementById("upgradebutton").disabled = true;
			 document.getElementById("mesg").innerHTML="maximum mark should be less than "+previousValue;
			 document.getElementById(num).focus();
		}
	}}
	}
else
{
	let previousid=num+3;
	console.log("previousid :"+previousid);
	let previousmark =parseInt(document.getElementById(previousid).value);
	 maxvalue =parseInt(document.getElementById(id).value);
	 let mark =parseInt(document.getElementById(num+1).value);
	 if(maxvalue<mark){
	if(previousmark<maxvalue)
		{
		 document.getElementById("mesg").innerHTML="";
			document.getElementById("upgradebutton").disabled = false;
 document.getElementById(previousid).value=maxvalue-1;
		}
	else
	{
		 document.getElementById("mesg").innerHTML="minimum mark should be greater than "+previousmark;
			document.getElementById("upgradebutton").disabled = true;
		 document.getElementById(num).focus();
	}
	 }
	 else
		 {
		 document.getElementById("mesg").innerHTML="minimum mark should be less than "+mark;
			document.getElementById("upgradebutton").disabled = true;
		 document.getElementById(num).focus();
		 }
}
}

function changer(num)
{
	event.preventDefault();
	for(let i=1;i<num-1;i++)
	{
		console.log("i ="+i);
		if(i!=2 || i!=(num-1)){
		change(i);}
	}
	upgradeGrade();
}
function upgradeGrade()
{
	event.preventDefault();
let num=0;
let numb;
for(alpha=65;alpha<91;alpha++)
{
	try{
let str=String.fromCharCode(alpha);
let grade=document.getElementById(str).value;
let minmark=document.getElementById(++num).value;
let maxmark=document.getElementById(++num).value;	
numb=num;
let formData = "grade=" + grade + "&minimummark=" + minmark+ "&maximummark=" + maxmark;
console.log(formData);
let url ="http://localhost:8080/GMS-api/FrontController/updateGrade.do?"+ formData;
$.get(url, function(response){
	 document.getElementById("mesg").innerHTML="successfully updated....";
});
}
	catch(err){ 
		
		let str=String.fromCharCode(alpha);
		console.log(str);	
	let grade=document.getElementById(str).value;
	console.log(grade);
	let minmark=document.getElementById('last').value;
	console.log(minmark);
	let maxmark=document.getElementById(numb+2).value;	
	console.log(maxmark);
	let formData = "grade=" + grade + "&minimummark=" + minmark+ "&maximummark=" + maxmark;
	console.log(formData);
	let url ="http://localhost:8080/GMS-api/FrontController/updateGrade.do?"+ formData;
	$.get(url, function(response){
		 console.log(grade +":" +response);
	});
}}}
    
function calgrade(sum){
    event.preventDefault();
    let url ="http://localhost:8080/GMS-api/FrontController/viewgrade.do";
    $.get(url, function(response){
        console.log("response :"+response);
        console.log("sum :"+sum);
        localStorage.setItem('grades', response);
     });
    data=JSON.parse(localStorage.getItem('grades')); 
    let finalgrade;
    for(let g of data)
    	{
    	if(g.minMark<=sum && g.maxMark>=sum)
    		{
    		finalgrade=g.grade;
    		break;
    		}
    	}
    console.log(finalgrade);
    return finalgrade;
    }
function getMarks(){
	 event.preventDefault();
	 let studentid = document.getElementById("studentid").value;
	 let formData = "studentid=" + studentid;
	 let url ="http://localhost:8080/GMS-api/FrontController/viewStudentMarks.do?"+ formData;
	    $.get(url, function(response){
	    	 console.log(response);
	         let data=JSON.parse(response);
	         let content;
	         content="<table class='table table-hover' border=1>" ;
	         let count=0;
	         let total=0;
	         let sid=0;
	     
	         for( let mark of data){
	     			if(sid!==parseInt(mark.student.registrationNumber)){
	                 sid=parseInt(mark.student.registrationNumber);
	             	content += "<tr><th>Student ID</th><th>"+mark.student.registrationNumber +"</th><th>Name</th><th>"+mark.student.name +"</th></tr>";
	     			content+=  "<tr><th colspan=2>Subject Name</th><th colspan=2>Marks Secured</th></tr>";
	         		
	             	++count;
	     			}
	     			content+=  "<tr><th colspan=2>"+mark.subjects.name +"</th><th colspan=2>"+mark.marks  +"</th></tr>";
	     			total +=mark.marks;
	       		  }
	         if(count!=0){
	         console.log("count :"+count)
				let sum=Math.ceil(total/6);
				 let grade=calgrade(sum);
				
				console.log("return:" +grade);
				content+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
				content+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
				
	  document.getElementById("viewmarks").innerHTML =content;
	         }
	         else{
	        	 content+=  "<br><br><center>Marks Not Available.....</center>";
	       	  document.getElementById("viewmarks").innerHTML =content;
	         }
	    });  
}



function viewbyid(){
    event.preventDefault();
    let url ="http://localhost:8080/GMS-api/FrontController/viewStudents.do";
    $.get(url, function(response){
    	data=JSON.parse(response);
    	console.log(data);
    	let content="";
    	content +="<select class='custom-select custom-select-sm' id='studentid' onchange='getMarks()'>";
    	for(let students of data)
    		{
    		console.log(students.registrationNumber+students.name);
    		content+="<option value="+students.registrationNumber+">"+students.name+"</option>";
    		}
       content+=" </select> <p id='viewmarks'></p>";
       document.getElementById("viewdetails").innerHTML=content;
    });  
}





function viewallmarks2(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
    let url ="http://localhost:8080/GMS-api/FrontController/viewallmarks.do";
    $.get(url, function(response){
        console.log(response);
        let data=JSON.parse(response);
        let content;
        content="<br><table class='table table-hover' border=1>" ;
        let sid=0;
        let count=0;
        let total=0;
        for( let mark of data){
		try{	if(sid!==parseInt(mark.student.registrationNumber)){
				if(total!=0)
					{
					console.log("count :"+count)
					let sum=Math.ceil(total/6);
					 let grade=calgrade(sum);
					
					console.log("return:" +grade);
					content+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
					content+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
					 localStorage.removeItem("grade");
					total=0;
					count=0;
					}
            sid=parseInt(mark.student.registrationNumber);
        	content += "<tr><th>Student ID</th><th>"+mark.student.registrationNumber +"</th><th>Name</th><th>"+mark.student.name +"</th></tr>";
			content+=  "<tr><th colspan=2>Subject Name</th><th colspan=2>Marks Secured</th></tr>";
    		
        	++count;
			}
			content+=  "<tr><th colspan=2>"+mark.subjects.name +"</th><th colspan=2>"+mark.marks  +"</th></tr>";
			total +=mark.marks;
  		  }
		  catch(error){console.error(error);}}
        content+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
        console.log("count :"+count)
		let sum=Math.ceil(total/6);
		 let grade=calgrade(sum);
		content+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
		 localStorage.removeItem("grade");
    content+="</table>"
        content+="<center><button onclick='printMarks();'><img src='images/printer.jpg' width=50px height=50px></button></center>"
        document.getElementById("viewdetails").innerHTML=content;
    });
     }
function printMarks() {
	let printContents = document.getElementById("viewdetails").innerHTML;
	let originalContents = document.body.innerHTML;
	document.body.innerHTML = printContents;
	window.print();
	document.body.innerHTML = originalContents;
}

function viewbygrade()
{
	event.preventDefault();
    let url ="http://localhost:8080/GMS-api/FrontController/viewgrade.do";
    $.get(url, function(response){
    	data=JSON.parse(response);
    	console.log(data);
    	let content="";
    	content +="<select class='custom-select custom-select-sm' id='bygrade' onchange='getMarksbygrade()'>";
    	for(let grades of data)
    		{
    		console.log(grades.grade);
    		content+="<option value="+grades.grade+">"+grades.grade+"</option>";
    		}
       content+=" </select> <p id='viewmarks'></p>";
       document.getElementById("viewdetails").innerHTML=content;
    });  
}

function getMarksbygrade()
{
	 event.preventDefault();
	 let checkgrade = document.getElementById("bygrade").value;
	    let url ="http://localhost:8080/GMS-api/FrontController/viewallmarks.do";
	    $.get(url, function(response){
	        console.log(response);
	        let data=JSON.parse(response);
	        let content="";
	        content="<br><table class='table table-hover' border=1>" ;
	        var tempcontent="";
	        let sid=0;
	        let count=0;
	        let total=0;
	        for( let mark of data){
	        	if(count===0)
	        	{
	    	        document.getElementById("viewmarks").innerHTML="";
	        	}
			try{	if(sid!==parseInt(mark.student.registrationNumber)){
					if(total!=0)
						{
						console.log("count :"+count)
						let sum=Math.ceil(total/6);
						 let grade=calgrade(sum); 
						console.log("return:" +grade);
						tempcontent+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
						tempcontent+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
						if(grade===checkgrade){
					        document.getElementById("viewmarks").innerHTML+=content+tempcontent;
					        tempcontent="";
						}
						else{tempcontent="";}
						 localStorage.removeItem("grade");
						total=0;
						count=0;
						}
	            sid=parseInt(mark.student.registrationNumber);
	        	tempcontent += "<tr><th>Student ID</th><th>"+mark.student.registrationNumber +"</th><th>Name</th><th>"+mark.student.name +"</th></tr>";
				tempcontent+=  "<tr><th colspan=2>Subject Name</th><th colspan=2>Marks Secured</th></tr>";
	    		
	        	++count;
				}
				tempcontent+=  "<tr><th colspan=2>"+mark.subjects.name +"</th><th colspan=2>"+mark.marks  +"</th></tr>";
				total +=mark.marks;
	  		  }
			  catch(error){console.error(error);}}
	       tempcontent+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
	        console.log("count :"+count)
			let sum=Math.ceil(total/6);
			 let grade=calgrade(sum);
			tempcontent+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
			if(grade===checkgrade){
		        document.getElementById("viewmarks").innerHTML+=content+tempcontent;
		        tempcontent="";
			}
			 localStorage.removeItem("grade");
	    content+="</table>"
	        content+="<center><button onclick='printMarks();'><img src='images/printer.jpg' width=50px height=50px></button></center>"
	      if(count===0)
	      {
		        document.getElementById("viewmarks").innerHTML="<br><br>No student secured Grade-"+checkgrade;
	      }
	        	document.getElementById("viewmarks").innerHTML+=content;
	    }); 
}

