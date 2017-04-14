//Chrome Drop Down Menu- Author: Dynamic Drive (http://www.dynamicdrive.com)
//Last updated: June 14th, 06'

var cssdropdown={
disappeardelay: 250, //set delay in miliseconds before menu disappears onmouseout
disablemenuclick: true, //when user clicks on a menu item with a drop down menu, disable menu item's link?
enableswipe: 1, //enable swipe effect? 1 for yes, 0 for no

//No need to edit beyond here////////////////////////
dropmenuobj: null, ie: document.all, firefox: document.getElementById&&!document.all, swipetimer: undefined, bottomclip:0,

getposOffset:function(what, offsettype){
var totaloffset=(offsettype=="left")? what.offsetLeft : what.offsetTop;
var parentEl=what.offsetParent; 
while (parentEl!=null){
totaloffset=(offsettype=="left")? totaloffset+parentEl.offsetLeft : totaloffset+parentEl.offsetTop;
parentEl=parentEl.offsetParent;
}
return totaloffset;
},

swipeeffect:function(){
if (this.bottomclip<parseInt(this.dropmenuobj.offsetHeight)){
this.bottomclip+=10+(this.bottomclip/10) //unclip drop down menu visibility gradually
this.dropmenuobj.style.clip="rect(0 auto "+this.bottomclip+"px 0)"
}
else
return
this.swipetimer=setTimeout("cssdropdown.swipeeffect()", 10)
},

showhide:function(obj, e){
if (this.ie || this.firefox)
this.dropmenuobj.style.left=this.dropmenuobj.style.top="-500px"
if (e.type=="click" && obj.visibility==hidden || e.type=="mouseover"){
if (this.enableswipe==1){
if (typeof this.swipetimer!="undefined")
clearTimeout(this.swipetimer)
obj.clip="rect(0 auto 0 0)" //hide menu via clipping
this.bottomclip=0
this.swipeeffect()
}
obj.visibility="visible"
}
else if (e.type=="click"){
obj.visibility="hidden"
}
},

iecompattest:function(){
return (document.compatMode && document.compatMode!="BackCompat")? document.documentElement : document.body
},

clearbrowseredge:function(obj, whichedge){
var edgeoffset=0
if (whichedge=="rightedge"){
var windowedge=this.ie && !window.opera? this.iecompattest().scrollLeft+this.iecompattest().clientWidth-15 : window.pageXOffset+window.innerWidth-15
this.dropmenuobj.contentmeasure=this.dropmenuobj.offsetWidth
if (windowedge-this.dropmenuobj.x < this.dropmenuobj.contentmeasure)  //move menu to the left?
edgeoffset=this.dropmenuobj.contentmeasure-obj.offsetWidth
}
else{
var topedge=this.ie && !window.opera? this.iecompattest().scrollTop : window.pageYOffset
var windowedge=this.ie && !window.opera? this.iecompattest().scrollTop+this.iecompattest().clientHeight-15 : window.pageYOffset+window.innerHeight-18
this.dropmenuobj.contentmeasure=this.dropmenuobj.offsetHeight
if (windowedge-this.dropmenuobj.y < this.dropmenuobj.contentmeasure){ //move up?
edgeoffset=this.dropmenuobj.contentmeasure+obj.offsetHeight
if ((this.dropmenuobj.y-topedge)<this.dropmenuobj.contentmeasure) //up no good either?
edgeoffset=this.dropmenuobj.y+obj.offsetHeight-topedge
}
}
return edgeoffset
},

dropit:function(obj, e, dropmenuID){
if (this.dropmenuobj!=null) //hide previous menu
this.dropmenuobj.style.visibility="hidden" //hide menu
this.clearhidemenu()
if (this.ie||this.firefox){
obj.onmouseout=function(){cssdropdown.delayhidemenu()}
//obj.onclick=function(){return !cssdropdown.disablemenuclick} //disable main menu item link onclick?
this.dropmenuobj=document.getElementById(dropmenuID)
this.dropmenuobj.onmouseover=function(){cssdropdown.clearhidemenu()}
this.dropmenuobj.onmouseout=function(){cssdropdown.dynamichide(e)}
this.dropmenuobj.onclick=function(){
var v=document.getElementsByTagName('a'); 
	for (var j=0;j<v.length;j++){ 
		v[j].className="";
	}
cssdropdown.delayhidemenu()
}
this.showhide(this.dropmenuobj.style, e)
this.dropmenuobj.x=this.getposOffset(obj, "left")
this.dropmenuobj.y=this.getposOffset(obj, "top")
this.dropmenuobj.style.left=this.dropmenuobj.x-this.clearbrowseredge(obj, "rightedge")+"px"
this.dropmenuobj.style.top=this.dropmenuobj.y-this.clearbrowseredge(obj, "bottomedge")+obj.offsetHeight+1+"px"
}
},

contains_firefox:function(a, b) {
while (b.parentNode)
if ((b = b.parentNode) == a)
return true;
return false;
},

dynamichide:function(e){
var evtobj=window.event? window.event : e
if (this.ie&&!this.dropmenuobj.contains(evtobj.toElement))
this.delayhidemenu()
else if (this.firefox&&e.currentTarget!= evtobj.relatedTarget&& !this.contains_firefox(evtobj.currentTarget, evtobj.relatedTarget))
this.delayhidemenu()
},

delayhidemenu:function(){
this.delayhide=setTimeout("cssdropdown.dropmenuobj.style.visibility='hidden'",this.disappeardelay) //hide menu
},

clearhidemenu:function(){
if (this.delayhide!="undefined")
clearTimeout(this.delayhide)
},

startchrome:function(){
for (var ids=0; ids<arguments.length; ids++){
var menuitems=document.getElementById(arguments[ids]).getElementsByTagName("a")
for (var i=0; i<menuitems.length; i++){
if (menuitems[i].getAttribute("rel")){
var relvalue=menuitems[i].getAttribute("rel")
menuitems[i].onmouseover=function(e){
var event=typeof e!="undefined"? e : window.event
cssdropdown.dropit(this,event,this.getAttribute("rel"))
}
}
}
}
}

}



document.writeln("<meta http-equiv=\'Content-Type\' content=\'text\/html; charset=gb2312\' \/>");
document.write('<div class="chromestyle" id="chromemenu">');
document.write('<ul>');
document.write('<li style="border:0px;"><a href="javascript:gonggao()" class="licss" onclick="ChangeBg(this)" >&nbsp;&nbsp;&nbsp;公告管理&nbsp;&nbsp;&nbsp;&nbsp;</a></li>');
document.write('<li><a href="javascript:jxkj()" onclick="ChangeBg(this)" rel="dropmenu3">&nbsp;&nbsp;&nbsp;教学互动&nbsp;&nbsp;&nbsp;&nbsp;</a></li>');
//document.write('<li><a href="javascript:account()" onclick="ChangeBg(this)" >&nbsp;&nbsp;&nbsp;报警短信管理&nbsp;&nbsp;&nbsp;&nbsp;</a></li>');
document.write('<li><a href="javascript:jxgzl()" onclick="ChangeBg(this)" rel="dropmenu4">&nbsp;&nbsp;&nbsp;评价管理&nbsp;&nbsp;&nbsp;&nbsp;</a></li>');
document.write('<li><a href="javascript:xcgljx()" onclick="ChangeBg(this)" rel="dropmenu7">&nbsp;&nbsp;&nbsp;文字图片标注比对&nbsp;&nbsp;&nbsp;&nbsp;</a></li>');
document.write('<li><a href="javascript:ktyj()" onclick="ChangeBg(this)" rel="dropmenu5">&nbsp;&nbsp;&nbsp;统计分析&nbsp;&nbsp;&nbsp;&nbsp;</a></li>');
document.write('<li><a href="javascript:cjgl()" onclick="ChangeBg(this)" rel="dropmenu9">&nbsp;&nbsp;&nbsp;积分统计&nbsp;&nbsp;&nbsp;&nbsp;</a></li>');
document.write('<li><a href="javascript:yhgl()" id="menu6" onclick="ChangeBg(this)" rel="dropmenu6">&nbsp;&nbsp;&nbsp;系统设置&nbsp;&nbsp;&nbsp;&nbsp;</a></li>');


//document.write('<li><a href="http://www.hzepb.gov.cn/col/col2406/index.html" rel="dropmenu11">系统管理</a></li>');
//document.write('<li><a href="http://www.hzepb.gov.cn/col/col2406/index.html" rel="dropmenu12">系统管理</a></li>');		
document.write('</ul>');
document.write('</div>');

document.write('<!--1st drop down menu -->');                                                   
//document.write('<div id="dropmenu1" class="dropmenudiv" style="width: 150px;" >');
//document.write('<a href="http://www.hzepb.gov.cn/col/col2384/index.html">主要领导</a>');
//document.write('<a href="http://www.hzepb.gov.cn/col/col2385/index.html">领导讲话</a>');
//document.write('<a href="http://www.hzepb.gov.cn/col/col2386/index.html">政务公开</a>');
//document.write('<a href="http://www.hzepb.gov.cn/col/col2387/index.html">环保发文</a>');
//document.write('<a href="http://www.hzepb.gov.cn/col/col2388/index.html">环保信息</a>');
//document.write('</div>');


document.write('<!--2rd drop down menu -->');                                                  
document.write('<div id="dropmenu2" class="dropmenudiv" style="width: 80px;">');
document.write('<a href="javascript:intakes()" onclick="hidden()">基本信息</a>');
document.write('<a href="javascript:warning()" onclick="hidden()">家庭信息</a>');
document.write('</div>');

document.write('<!--3rd drop down menu -->');                                                  
document.write('<div id="dropmenu3" class="dropmenudiv" style="width: 130px;">');
document.write('<a href="javascript:jxkj()" onclick="hidden()">点名机制</a>');
document.write('<a href="javascript:ktwd()" onclick="hidden()">即问即答</a>');
document.write('<a href="javascript:ktwd()" onclick="hidden()">抢答活动</a>');
document.write('<a href="javascript:ktwd()" onclick="hidden()">挑人作答</a>');
document.write('<a href="javascript:fzzd()" onclick="hidden()">挑组做答</a>');
document.write('</div>');

document.write('<!--4rd drop down menu -->');                                                  
document.write('<div id="dropmenu4" class="dropmenudiv" style="width: 100px;">');
document.write('<a href="javascript:xshp()" onclick="hidden()">学生互评</a>');
document.write('<a href="javascript:kcb()" onclick="hidden()">组间互评</a>');
document.write('<a href="javascript:jxjh()" onclick="hidden()">互评统计表</a>');	
document.write('</div>');

document.write('<!--4th drop down menu -->');                                                   
document.write('<div id="dropmenu5" class="dropmenudiv" style="width: 100px;">');
document.write('<a href="javascript:ktyj()" onclick="hidden()">问答统计</a>');
document.write('<a href="javascript:kkjl()" onclick="hidden()">考勤统计</a>');
document.write('</div>');

document.write('<!--5rd drop down menu -->');                                                   
document.write('<div id="dropmenu6" class="dropmenudiv" style="width: 120px;">');
document.write('<a href="javascript:yhgl()" onclick="hidden()">&nbsp;&nbsp;&nbsp;&nbsp;教师信息管理</a>');
document.write('<a href="javascript:xsxx()" onclick="hidden()">&nbsp;&nbsp;&nbsp;&nbsp;学生信息管理</a>');
document.write('<a href="javascript:notsel()" onclick="hidden()">&nbsp;&nbsp;&nbsp;&nbsp;试题管理</a>');
document.write('<a href="javascript:pjxm()" onclick="hidden()">&nbsp;&nbsp;&nbsp;&nbsp;评价项目管理</a>');
document.write('<a href="javascript:pjjb()" onclick="hidden()">&nbsp;&nbsp;&nbsp;&nbsp;评价级别管理</a>');
document.write('<a href="javascript:sjzd()" onclick="hidden()">&nbsp;&nbsp;&nbsp;&nbsp;数据字典</a>');
document.write('<a href="javascript:logs()" onclick="hidden()">&nbsp;&nbsp;&nbsp;&nbsp;日志管理</a>');
document.write('</div>');



cssdropdown.startchrome("chromemenu")