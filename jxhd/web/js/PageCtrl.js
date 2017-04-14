	/** 下一页 */
	function nextPage(pageNo,pageNum){
		var pgno = pageNo+1;
		if(pgno<=pageNum&&pageNum>0){
			document.getElementById("inputPageNo").value = pgno;
			//alert(document.getElementById("inputPageNo").value);
			//if(checkInputParams())
				window.document.forms[0].submit();
			//else
				//return;
		}
		else
			return;
	}
	
	/** 上一页 */
	function prevPage(pageNo,pageNum){
		var pgno = pageNo-1;
		if(pgno>=1&&pageNum>0){
			document.getElementById("inputPageNo").value = pgno;
			//if(checkInputParams())
				window.document.forms[0].submit();
			//else
				//return;
		}
		else
			return;
	}
	
	/** 首页 */
	function firstPage(pageNo,pageNum){
		var pgno = 1;
		if(pageNo!=1&&pageNum>0){
			document.getElementById("inputPageNo").value = pgno;
			//if(checkInputParams())
				window.document.forms[0].submit();
			//else
				//return;
		}
		else
			return;
	}
	
	/** 尾页 */
	function lastPage(pageNo,pageNum){
		var pgno = pageNum;
		if(pageNo!=pageNum&&pageNum>0){
			document.getElementById("inputPageNo").value = pgno;
			//if(checkInputParams())
				window.document.forms[0].submit();
			//else
				//return;
		}
		else
			return;
	}
	
	/** 离开文本框时页数输入检查,输入错误则清空 */
	function doPropertychange(thisid,pageNum){
		var text1 = document.getElementById(thisid).value;
		if(!/^[1-9]\d*$/.test(text1)){
			document.getElementById(thisid).value = "";
			return;
		} 
		else if(text1>pageNum||text1<1){
			document.getElementById(thisid).value = "";
			return;
		} 
		else
			document.getElementById(thisid).runtimeStyle.color='black';
    }
	
	/** 提交时页数输入检查 */
	function checkInputPageNo(thisid,pageNum){
		var text1 = document.getElementById(thisid).value.replace(/^\s+|\s+$/g,"");
		if(text1==""){
			document.getElementById(thisid).value = text1;
			return; 
		}
		if(!/^[1-9]\d*$/.test(text1)){
			alert("请输入合法的正整数");
			window.document.getElementById(thisid).select();
			return; 
		} 
		if(text1>pageNum||text1<1){
			alert("输入值不在有效页数范围");
			window.document.getElementById(thisid).select();
			return;
		} 
		document.getElementById("inputPageNo").value = text1;
		if(checkInputParams())
			window.document.forms[0].submit();
		else
			return;
    }
    
    /** 提交时页数输入检查 用于报表 */
	function checkInputPageNo1(thisid,pageNum){
		var text1 = document.getElementById(thisid).value.replace(/^\s+|\s+$/g,"");
		if(text1==""){
			document.getElementById(thisid).value = text1;
			return; 
		}
		if(!/^[1-9]\d*$/.test(text1)){
			alert("请输入合法的正整数");
			window.document.getElementById(thisid).select();
			return; 
		} 
		if(text1>pageNum||text1<1){
			alert("输入值不在有效页数范围");
			window.document.getElementById(thisid).select();
			return;
		} 
		document.getElementById("inputPageNo").value = text1;
		//if(checkInputParams())
			window.document.forms[0].submit();
		//else
			//return;
    }
    
    /** 模糊查询 */
    function doSearch2(){
    	document.getElementById("inputPageNo").value = "1";
    	document.getElementById("sqlParam.param1").value=document.getElementById("sqlParam.param1").value.replace(/^\s+|\s+$/g,"");
    	document.getElementById("sqlParam.param2").value=document.getElementById("sqlParam.param2").value.replace(/^\s+|\s+$/g,"");
    	window.document.forms[0].submit();
    }
    
    /** 实时验证 */
    function checkInputPageNo2(thisid,pageNum){
	    var text1 = document.getElementById(thisid).value.replace(/^\s+|\s+$/g,"");
		if(!/^[1-9]\d*$/.test(text1)){
			document.getElementById(thisid).runtimeStyle.color='red';
		} 
		else if(text1>pageNum||text1<1){
			document.getElementById(thisid).runtimeStyle.color='red';
		} 
		else{
			document.getElementById(thisid).runtimeStyle.color='black';
		}
    }
 function hide_left(){
         	var mainTable = document.getElementById("mainTable");
         	var bar_img = document.getElementById("bar_img");
         	if(mainTable.rows[0].cells[0].style.display=="none"){
         		mainTable.rows[0].cells[0].style.display = "";
         		bar_img.src = "images/index02.jpg";
         	}else if(mainTable.rows[0].cells[0].style.display==""){
         		mainTable.rows[0].cells[0].style.display = "none";
         		bar_img.src = "images/index03.jpg";
         	}
    }