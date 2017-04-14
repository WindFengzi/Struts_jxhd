//手机
function isMobil(s)
	{
	var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;
	if (!patrn.exec(s)) return false
		return true;
	}
//姓名
function isTrueName(s)   
{   
var patrn=/^[a-zA-Z]{1,30}$/;   
if (!patrn.exec(s)) return false  
return true  
}   
//密码
function isPasswd(s)   
{   
var patrn=/^(\w){6,20}$/;   
if (!patrn.exec(s)) return false  
return true  
}   
//电话
function isTel(s)   
{   
//var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?(\d){1,12})+$/;   
var patrn=/^[+]{0,1}(\d){1,3}[ ]?([-]?((\d)|[ ]){1,12})+$/;   
if (!patrn.exec(s)) return false  
return true  
}   
//邮编
function isPostalCode(s)   
{   
//var patrn=/^[a-zA-Z0-9]{3,12}$/;   
var patrn=/^[a-zA-Z0-9 ]{3,12}$/;   
if (!patrn.exec(s)) return false  
return true  
}   
//IP
function isIP(s) //by zergling   
{   
var patrn=/^[0-9.]{1,20}$/;   
if (!patrn.exec(s)) return false  
return true  
}    