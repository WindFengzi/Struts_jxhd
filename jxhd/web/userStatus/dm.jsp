<!DOCTYPE html >
<html>
<head>
<title>右下角浮动窗口</title>
<meta http-equiv="content-type" content="text/html;charset=utf-8">
<style type="text/css">
#msg_win{
    position:absolute;
    right:0px;
    overflow:hidden;
    z-index:99;
    border:1px solid #c00;
    background:#F9EFFC;
    width:240px;
    font-size:12px;
    margin:0px;
    display:block;
    top:503px;
    visibility:visible;
    opacity:1;
    }
#msg_win .icos{
    position:absolute;
    top:2px;
    right:2px;
    z-index:9;
    }
.icos a{
    float:left;
    color:#FFFFFF;
    margin:1px;
    text-align:center;
    font-weight:bold;
    width:14px;
    height:22px;
    line-height:22px;
    padding:1px;
    text-decoration:none;
    font-family:webdings;
    }
.icos a:hover{
    color:#FFCC00;
    }
#msg_title{
    background:#AC19E3;
    border-bottom:1px solid #710B97;
    border-top:1px solid #FFF;
    border-left:1px solid #FFF;
    color:#FFFFFF;
    height:25px;
    line-height:25px;
    text-indent:5px;
    font-weight:bold;
    }
#msg_content{
    margin:5px;
    margin-right:0;
    width:230px;
    height:126px;
    overflow:hidden;
    }
</style>
</head>
<body>
<div style="height:0px;">dsfasfsf</div>
<div id="msg_win" style="border:1px solid red">
  <div class="icos">
    <a id="msg_min" title="最小化" href="javascript:void 0">_</a><a id="msg_close" title="关闭" href="javascript:void 0">×</a>
  </div>
  <div id="msg_title">浮动窗口标题：</div>
  <div id="msg_content">浮动窗口内容：欢迎提出宝贵意见，谢谢！</div>
</div>
<script>
var Message={
    set: function() {//最小化与恢复状态切换
        var set=this.minbtn.status == 1?[0,1,'block',this.char[0],'最小化']:[1,0,'none',this.char[1],'恢复'];
        this.minbtn.status=set[0];
        this.win.style.borderBottomWidth=set[1];
        this.content.style.display =set[2];
        this.minbtn.innerHTML =set[3];
        this.minbtn.title = set[4];
        this.win.style.top = this.getY().top;
    },
    close: function() {//关闭
        this.win.style.display = 'none';
        window.onscroll = null;
    },
    setOpacity: function(x) {//设置透明度
        var v = x >= 100 ? '': 'Alpha(opacity=' + x + ')';
        this.win.style.visibility = x<=0?'hidden':'visible';//IE有绝对或相对定位内容不随父透明度变化的bug
        this.win.style.filter = v;
        this.win.style.opacity = x / 100;
    },
    show: function() {//渐显
        clearInterval(this.timer2);
        var me = this,fx = this.fx(0, 100, 0.1),t = 0;
        this.timer2 = setInterval(function() {
            t = fx();
            me.setOpacity(t[0]);
            if (t[1] == 0) {
                clearInterval(me.timer2) 
            }
        },6);//10 to 6
    },
    fx: function(a, b, c) {//缓冲计算
            var cMath = Math[(a - b) > 0 ? "floor": "ceil"],c = c || 0.1;
            return function() {
                return [a += cMath((b - a) * c), a - b]
            }
    },
    getY: function() {//计算移动坐标
        var d = document,b = document.body, e = document.documentElement;
        var s = Math.max(b.scrollTop, e.scrollTop);
        var h = /BackCompat/i.test(document.compatMode)?b.clientHeight:e.clientHeight;
        var h2 = this.win.offsetHeight;
        return {foot: s + h + h2 + 2+'px',top: s + h - h2 - 2 + 300+'px'}
    },
    moveTo: function(y) {//移动动画
        clearInterval(this.timer);
        var me = this,a = parseInt(this.win.style.top)||0;
        var fx = this.fx(a, parseInt(y));
        var t = 0 ;
        this.timer = setInterval(function() {
            t = fx();
            me.win.style.top = t[0]+'px';
            if (t[1] == 0) {
                clearInterval(me.timer);
                me.bind();
            }
        },6);//10 to 6
    },
    bind:function (){//绑定窗口滚动条与大小变化事件
        var me=this,st,rt;
        window.onscroll = function() {
            clearTimeout(st);
            clearTimeout(me.timer2);
            me.setOpacity(0);
            st = setTimeout(function() {
                me.win.style.top = me.getY().top;
                me.show();
            },100);//600 mod 100
        };
        window.onresize = function (){
            clearTimeout(rt);
            rt = setTimeout(function() {me.win.style.top = me.getY().top},100);
        }
    },
    init: function() {//创建HTML
        function $(id) {return document.getElementById(id)};
        this.win=$('msg_win');
        var set={minbtn: 'msg_min',closebtn: 'msg_close',title: 'msg_title',content: 'msg_content'};
        for (var Id in set) {this[Id] = $(set[Id])};
        var me = this;
        this.minbtn.onclick = function() {me.set();this.blur()};
        this.closebtn.onclick = function() {me.close()};
        this.char=navigator.userAgent.toLowerCase().indexOf('firefox')+1?['_','::','×']:['0','2','r'];//FF不支持webdings字体
        this.minbtn.innerHTML=this.char[0];
        this.closebtn.innerHTML=this.char[2];
        setTimeout(function() {//初始化最先位置
            me.win.style.display = 'block';
            me.win.style.top = me.getY().foot;
            me.moveTo(me.getY().top);
        },0);
        return this;
    }
};
Message.init();
</SCRIPT>
</body>
</html>