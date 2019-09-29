function ajax(url, method, data, successcallback, errorCallback) {
    var xhr = new XMLHttpRequest();
    xhr.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            var response = this.responseText;
            //successcallback(JSON.parse(response));
            successcallback(response);
        }
        else if (this.readyState == 4 && this.status != 200) { 
            //errorCallback(JSON.parse(this.responseText));
            errorCallback(this.responseText);
        }
    }
   
    if (method == "POST"){
    	console.log("Send Post Request");
    	xhr.open("POST", url, true);
    	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
    	xhr.send(data);
    }
    else{
    	console.log("Send GET Request");
    	xhr.open("GET", url + "?"+ data, true);
    	xhr.send();	
    }
    
}

function ajaxPromise(url, method, data) {
    var promiseObj = new Promise(function (resolve, reject) {
        var xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function () {
            if (this.readyState == 4 && this.status == 200) {
                var response = this.responseText;
                resolve(JSON.parse(response));
            }
            else if (this.readyState == 4 && this.status != 200) {
                reject(JSON.parse(this.responseText));
            }
        }
        if (method == "POST"){
        	console.log("Send Post Request");
        	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded; charset=UTF-8");
        	xhr.send(data);
        }
        else{
        	console.log("Send GET Request");
        	xhr.send();	
        }
    });
    return promiseObj;
}