/*
function viewGrade1(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
    let url ="http://localhost:9000/viewgrade";
    $.get(url, function(response){
        console.log(response);
       let data=response;
       let content="<br><br><br><table class='table table-hover table-bordered'><tr><th>Grade</th><th>Minimum Marks</th><th>Maximum Marks</th></tr>";
	for( let grades of data)
		{
		content +="<tr><td>"+grades.grade +"</td><td>"+grades.minMark+"</td><td>"+grades.maxMark+ "</td></tr>";
		}
       document.getElementById("viewdetails").innerHTML=content;
     });
    }
*/
function viewTop(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
    let url ="http://localhost:9000/viewtop";
    $.get(url, function(response){
        let data=response;
        let count=0;
        let total=0;
        let sid=0;
        let content= "<br><div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse'>Viewing Topper Details....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
       content+="<table class='table table-hover table-bordered'><tr><th>Registration number</th><th>Name</th></tr>";
 	for( let marks of data)
 		{
 		content +="<tr><td>"+marks.student.registrationNumber+"</td><td>"+marks.student.name+"</td></tr></table>";
 		break;
 		}
        let contents="<table class='table table-hover table-bordered'><tr><th>Subject Id</th><th>Subject Name</th><th>Marks</th></tr>";
     	for(let mark of data)
    		{
     		++count;
    		contents +="<tr><td>"+mark.subjects.id +"</td><td>"+mark.subjects.name+"</td><td>"+mark.marks+ "</td></tr>";
    		total +=mark.marks;
    		}
     	let sum=Math.ceil(total/count);
		 let grade=calgrade(sum);
		
		contents+=  "<tr><th>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
		contents+=  "<tr><th>Grade :</th><th colspan=2>"+grade  +"</th></tr></table></div></div></div></div></div>";
	
     	 document.getElementById("viewdetails").innerHTML=content+contents;
        
      });
     }
  /*    
function viewallmarks1(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
   let url ="http://localhost:9000/viewallmarks";
    $.get(url, function(response){
        console.log(response);
    });
     }
    */

function getGrade(total){
    let sum=total;
    let formData = "average=" + sum
    let data;
    let url ="http://localhost:9000/getGrade?" + formData;
    $.get(url, function(response){
       data=response; 
       gradevalue=data;
       localStorage.setItem('grade', data);
       return gradevalue;    
    }); 
   

}
     
function viewGrade(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
    let url ="http://localhost:9000/viewgrade";
    $.get(url, function(response){
        let c=0;
        let m=0;
        let globalcount=100;
       let data=response;
       let content="<br><div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse'>Available Grades....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
       content+="<div align='center' id='mesg'></div><form method='get' onsubmit='upgradeGrade()'><table class='table table-hover table-bordered'><tr><th>Grade</th><th>Minimum Marks</th><th>Maximum Marks</th></tr>";
	for( let grades of data)
		{
		if(grades.minMark!=0 && grades.maxMark!=100){
		content +="<tr><td><input type='text' value="+grades.grade +" id="+ ++globalcount +" disabled minlength='1' maxlength='1'></td><td><input type='number' value="+grades.minMark  +" id="+ ++m  +" min='0' max='100' oninput='change("+m +")' onfocusout='change("+m +")' required>"+"</td><td><input type='number' value="+grades.maxMark  +" id="+ ++m  +" min='1' max='100' oninput='change("+m +")' onfocusout='change("+m +")' required>"+"</td></tr>";
		}
		if(grades.minMark==0){
			content +="<tr><td><input type='text' value="+grades.grade +" id="+ ++globalcount +" disabled minlength='1' maxlength='1'></td><td><input type='number' disabled value="+grades.minMark  +" id="+ ++m  +" min='0' max='100' onfocusout='change("+m +")' required>"+"</td><td><input type='number' value="+grades.maxMark  +" id="+ ++m  +" min='1' max='100'  onfocusout='change("+m +")' required>"+"</td></tr>";
			}
		if(grades.maxMark==100){
			content +="<tr><td><input type='text' value="+grades.grade +" id="+ ++globalcount +" disabled minlength='1' maxlength='1'></td><td><input type='number' value="+grades.minMark  +" id="+ ++m  +" min='0' max='100' oninput='change("+m +")' onfocusout='change("+m +")' required>"+"</td><td><input type='number' disabled value="+grades.maxMark  +" id="+ ++m  +" min='1' max='100' oninput='change("+m +")' onfocusout='change("+m +")' required>"+"</td></tr>";
			}
		}
	content +="<tr><td align=center colspan=3><button type='submit' class='btn btn-primary btn-xs' id='upgradebutton'>Update</button></table></form></div></div></div></div></div>";
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
		 let previousValue =parseInt(document.getElementById(previousid).value)-1;
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
for(globalcount=100;globalcount<125;globalcount++)
{
	try{
let grade=document.getElementById(globalcount).value;
let minmark=document.getElementById(++num).value;
let maxmark=document.getElementById(++num).value;	
numb=num;
let formData = "grade=" + grade + "&minimummark=" + minmark+ "&maximummark=" + maxmark;
let url ="http://localhost:9000/updateGrade?"+ formData;
$.get(url, function(response){
	 document.getElementById("mesg").innerHTML="successfully updated....";
});
}
	catch(err){ 
		console.log(err);
}}}
    
function calgrade(sum){
    event.preventDefault();
    let url ="http://localhost:9000/viewgrade";
    $.get(url, function(response){
        localStorage.setItem('grades', JSON.stringify(response));
     });
    data=JSON.parse(localStorage.getItem('grades')); 
    let finalgrade;
    for(let grades of data)
    	{
    	if(grades.minMark<=sum && grades.maxMark>=sum)
    		{
    		finalgrade=grades.grade;
    		break;
    		}
    	}
    return finalgrade;
    }
function getMarks(){
	 event.preventDefault();
	 let studentid = document.getElementById("studentid").value;
	 let formData = "studentid=" + studentid;
	 let url ="http://localhost:9000/viewStudentMarks?"+ formData;
	    $.get(url, function(response){
	         let data=response;
	         let content;
	         content="<table class='table table-hover table-bordered'>" ;
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
				let sum=Math.ceil(total/6);
				 let grade=calgrade(sum);
				content+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
				content+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
	  document.getElementById("viewmarks").innerHTML =content;
	         }
	         else{
	        	 content+=  "<br><br><center>Marks Not Available.....</center>";
	       	  document.getElementById("viewmarks").innerHTML =content;
	         }
	         document.getElementById("viewmarks").innerHTML +="<br><center><button onclick='printMarks();'><img src='images/printer.jpg' width=50px height=50px></button></center>";

	    });  
}



function viewbyid(){
    event.preventDefault();
    let url ="http://localhost:9000/viewStudents";
    $.get(url, function(response){
    	data=response;
    	let content="";
    	content+="  <div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' >Select Student....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
    	content +="<select class='custom-select custom-select-sm' id='studentid' onchange='getMarks()'>";
    	for(let students of data)
    		{
    		content+="<option value="+students.registrationNumber+">"+students.name+"</option>";
    		}
       content+=" </select></div></div></div></div> <p id='viewmarks'></p>";
       document.getElementById("viewdetails").innerHTML=content;
    });  
}





function viewallmarks2(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
    let url ="http://localhost:9000/viewallmarks";
    $.get(url, function(response){
        let data=response;
        let content;
        content="<table class='table table-hover table-bordered'>" ;
        let sid=0;
        let count=0;
        let total=0;
        for( let mark of data){
		try{	if(sid!==parseInt(mark.student.registrationNumber)){
				if(total!=0)
					{
					let sum=Math.ceil(total/6);
					 let grade=calgrade(sum);
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
		let sum=Math.ceil(total/6);
		 let grade=calgrade(sum);
		content+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
		 localStorage.removeItem("grade");
    content+="</table>"
        content+="<center><button onclick='printMarks();'><img src='images/printer.jpg' width=50px height=50px></button></center>"
     
            document.getElementById("viewdetails").innerHTML="  <div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' >Viewing All Students Marks....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'><div id='viewmarks'></div></div></div></div></div></div>";

        	
        	
        	document.getElementById("viewmarks").innerHTML=content;
    });
     }
function printMarks() {
	let printContents ="<h3 align=center><u>Grade Management System</u></h3><br>";
	printContents += document.getElementById("viewmarks").innerHTML;
	let originalContents = document.body.innerHTML;
	document.body.innerHTML = printContents;
	window.print();
	document.body.innerHTML = originalContents;
}

function viewbygrade()
{
	event.preventDefault();
    let url ="http://localhost:9000/viewgrade";
    $.get(url, function(response){
    	data=response;
    	let content="";
    	content +="<br>Select Grade :<select class='custom-select custom-select-sm' id='bygrade' onchange='getMarksbygrade()'>";
		content+="<option value='select'>--select--</option>";
    	for(let grades of data)
    		{
    		content+="<option value="+grades.grade+">"+grades.grade+"</option>";
    		}
       content+=" </select><p id='viewdetails1'></p><br> <p id='viewmarks'></p>";
       document.getElementById("viewdetails").innerHTML=content;
    });  
}

function getMarksbygrade()
{
 	document.getElementById("viewdetails1").innerHTML="";
	 event.preventDefault();
	  document.getElementById('viewmarks').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
	 let checkgrade = document.getElementById("bygrade").value;
     let content="";
     let tempcontent="";
     var globalcount=0;
	 if(checkgrade==='select')
	 {
     	document.getElementById("viewmarks").innerHTML="<br><br><center>select grade to view Marks...</center>";
     	return 0;
	 }	
	    let url ="http://localhost:9000/viewallmarks";
	    $.get(url, function(response){
	        let data=response;
	        content+="<table class='table table-hover table-bordered'>" ;
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
						let sum=Math.ceil(total/6);
						 let grade=calgrade(sum); 
						tempcontent+=  "<tr><th colspan=2>Total Marks :</th><th colspan=2>"+total  +"</th></tr>";
						tempcontent+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
						if(grade===checkgrade){
							globalcount=globalcount+1;
					     	document.getElementById("viewdetails1").innerHTML="<br><center>Viewing Marks Based on Grade-"+checkgrade +"</center>";
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
			let sum=Math.ceil(total/count);
			 let grade=calgrade(sum);
			tempcontent+=  "<tr><th colspan=2>Grade :</th><th colspan=2>"+grade  +"</th></tr>";
			if(grade===checkgrade){
		        document.getElementById("viewmarks").innerHTML+=content+tempcontent;
		        tempcontent="";
			}
			 localStorage.removeItem("grade");
	    content+="</table>"
	        content+="<center><button onclick='printMarks();'><img src='images/printer.jpg' width=50px height=50px></button></center>"
	        	if(globalcount===0)
	      {
		        document.getElementById("viewmarks").innerHTML="<br><br><center>No student secured Grade-"+checkgrade+"</center>";
	      }
	        	document.getElementById("viewmarks").innerHTML+=content;
	    }); 
}
function viewStudents(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
var url ="http://localhost:9000/viewStudents";
    $.get(url, function(response){
       var data=response;
       var content;
       content="<div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' >Viewing All Students Details....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
       content+="<table class='table table-hover table-bordered'> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Address</th><th>Date of Birth</th></tr>";
       for( let users of data)
		{
			content+="<tr><td>"+users.registrationNumber+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.address+"</td><td>"+users.dateOfBirth+"</td></tr>";
           }
       content+="</table>"
       document.getElementById("viewdetails").innerHTML=content;
     });
    }    


function adminGetter(){
	var roles=null;
roles=(localStorage.getItem("role"));
if(roles=='New' | roles==null)
{
	 window.location.href="index.jsp";
}
if(roles=='User')
{
	 window.location.href="UserLogin.jsp";
}
}

function userGetter(){
	var roles=null;
roles=(localStorage.getItem("role"));
if(roles=='New' | roles==null)
{
	 window.location.href="index.jsp";
}
if(roles=='Admin')
{
	 window.location.href="AdminLogin.jsp";
}
}

function viewEmployees(){
    event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
var url ="http://localhost:9000/viewEmployees";
    $.get(url, function(response){
        console.log(response);
       var data=response;
       var content;
       checkDepartments();
       content="<br><br><div id='dept'> </div>";
       content+="<div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' >Viewing Available Employee's Details....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
         content+="<table class='table table-hover' border=1> <tr><th>ID</th><th>Name</th><th>Father Name</th><th>Email</th><th>Date of joining</th><th>Department</th></tr>";
       for( let users of data)
		{
    	   let date = new Date( Date.parse(users.dateOfJoining) );
    	   var days = new Array("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday");
    	    var months = new Array("January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December");
    	    	   
			content+="<tr><td>"+users.id+"</td><td>"+users.name+"</td><td>"+users.fatherName+"</td><td>"+users.email+"</td><td>"+date.getDate()+"-"+ months[date.getMonth()]+"-"+date.getFullYear()+"</td><td>"+users.department.name+"</td></tr>";
           }
       
       content+="</table>"
       document.getElementById("viewdetails").innerHTML=content;
     });
    }

function viewGrades()
{
	    event.preventDefault();
		  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
	    var url ="http://localhost:9000/viewgrade";
	    $.get(url, function(response){
	        console.log(response);
	       var data=response;
	       var content="";
		       content+="<div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse' ><center>Available Grade Range....</center></a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
		       content+="<table class='table table-hover' border=1><tr><th>Grade</th><th>Minimum Marks</th><th>Maximum Marks</th></tr>";
		for( let grades of data)
			{
			content +="<tr><td>"+grades.grade +"</td><td>"+grades.minMark+"</td><td>"+grades.maxMark+ "</td></tr>";
			}       
	       document.getElementById("viewdetails").innerHTML=content;
	     });
	    }




function viewBySubjects(){
	 event.preventDefault();
	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
 var content;
 content="<div class=container><div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse'>Search by Subject ID/Name....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
	 content+="<form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject ID/Name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div>"      
document.getElementById("viewdetails").innerHTML=content;
	     }
function viewBySubject(){
	 event.preventDefault();
	      var subjectcode = document.getElementById("subjectdetail").value;
			var n;
		         try{
		        	 n=parseInt(subjectcode);
		        	  if(!isNaN(n)){
		        		  if(n!=subjectcode){ throw "exception";}
		        	 var formData="subjectdetails=" +n; 
		       	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
		        	 var url ="http://localhost:9000/viewBySubjectCode?"+formData;}
		        	 else
			        	 {
		        		 var subjectname = document.getElementById("subjectdetail").value;
			        	 var formData="subjectdetails=" +subjectname; 
				       	  document.getElementById('viewdetails').innerHTML = '<br><br><img src="images/loader.gif" width=300px height=150px/>';
			        	 var url ="http://localhost:9000/viewBySubjectName?"+formData;
			        	 }
		        	 }
	        	 catch(err){
	        		 getSubjects();
	        		}
	    $.get(url, function(response){
	        var data=response;
	        var content;
	        content="<div class=container><div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse'>Search by Subject ID/Name....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
	  	 content+="<form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject ID/Name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div></div></div></div></div></div>"      
	        if(data.length!=0)
	       {
	       for( let mark of data)
			{ 
		       content+="<table class='table table-hover table-bordered'><tr><th>Student ID</th><th>Student Name</th><th>Subject Name</th><th>Marks</th><th>Grade</th></tr>";
			break;}
		for( let mark of data)
			{			
			content +="<tr><td>"+mark.student.registrationNumber +"</td><td>"+mark.student.name+"</td><td>"+mark.subjects.name+"</td><td>"+mark.marks+ "</td><td>"+calgrade(mark.marks);+"</td></tr>";
			}

	       document.getElementById("viewdetails").innerHTML=content;
	     }
	     else
	     {
	    	 getSubjects()
}});
	     }

function getSubjects()
{
	var url ="http://localhost:9000/viewAvailableSubjects";
    $.get(url, function(response){
        var data=response;
        var content="";
        content="<div class=container><div id='accordion'><div class='card'><div class='card-header'><a class='card-link' data-toggle='collapse'>Search by Subject ID/Name....</a></div><div id='collapseOne' class='collapse show' data-parent='#accordion'><div class='card-body'>";
	  	 content+="<form method='post' onsubmit='viewBySubject()'><div class='form-group'><input type='text' class='form-control' name='subjectdetail' id='subjectdetail' placeholder='subject ID/Name' required='required'></div><div class='form-group' align=center><button type='submit' class='btn btn-primary btn-xs'>Search</button>&nbsp<button type='reset' class='btn btn-primary btn-xs'>clear</button></div></div></div></div></div></div>"      
	        		        
    	content+="<br><h3>subject not available.....<br></h3>select from available options...";
     	content+="<table class='table table-hover table-bordered'><tr><th>Subject ID</th><th>Subject Name</th></tr>";
     	for( let subject of data)
		{
		content +="<tr><td>"+subject.id +"</td><td>"+subject.name+"</td></tr>";
		}
     	content+="</table>";	        		     	
      document.getElementById("viewdetails").innerHTML=content;
      });
}