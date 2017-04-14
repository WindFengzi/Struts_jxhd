<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html>
<html>
<head>
<title>公告列表的展示</title>
<link href="/jxhd/img/basic.css" type="text/css" rel="stylesheet" />
<link href="/jxhd/img/style.css" type="text/css" rel="stylesheet" />
<script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
<script  src="/jxhd/js/PageCtrl.js"></script>
<style type="text/css">
.text-flow-omit {  
    width:200px;  
    white-space:nowrap;  
    word-break:keep-all;  
    overflow:hidden;  
    text-overflow:ellipsis;  
}  
#hidden_menu{
}
</style>
<script type="text/javascript">
/*删除新闻*/
function deleteStation(stationId){
	if(window.confirm('你确定要删除吗？')){
		form1.action="DeleteArticle.action";
		form1.noticeId.value = stationId;
		form1.submit();
	}
}
/*添加*/
function addStation(){
	form1.action="ToInsert.action";
	form1.submit();
}
/*修改*/
function updateStation(id){
	form1.noticeId.value=id;
	form1.action="ArticleById.action";
	form1.submit();
}
/*查看具体新闻页*/
function viewStation(id){
	form1.noticeId.value=id;
	form1.action="ArticleByIdView.action";
	form1.submit();
}

/*搜索*/
function look(){
	form1.submit();
}

$(function(){
	var names = "";
	$(".notice_title").each(function(){
		var str = $(this).text();
        if(str.length > 41) {//左右各11个字符串长度
			var s=str.substr(0,31)+"...";// 只显示20个字符串
			$(this).html(s);
		}
        /* if(str.length > 41) {
	         $(this).mouseover(function(){
	        	$("#hidden_menu").show();
	        	$("#hidden_menu").css("display","block");
	        	$("#hidden_menu").css("left", event.clientX);
	        	$("#hidden_menu").css("top", event.clientY + 10);
	        	$("#hidden_menu").html(str);
	        });
	        $(this).mouseout(function(){
	        	$("#hidden_menu").hide();
	        	$("#hidden_menu").css("display", "none");
	        }); 
        } */
    });
});
/* function show(obj,id) {
	$("#hidden_menu").css("display","block");
	$("#hidden_menu").css("left", event.clientX);
	$("#hidden_menu").css("top", event.clientY + 10);
} 
function hide(obj,id) {
	$("#hidden_menu").css("display", "none");
}  */
</script>
</head>

<body>
	<form id="form1" name="form1" action="Articles.action" method="post" >
		<input type="hidden" name="notice.noticeId" id="noticeId" /><!-- 根据id查看或修改具体的新闻页面 -->
		<div class="w170 fl">
			<img src="img/gggl.png" width="170" height="43" alt="公告管理" />
		</div>
		<div class="w800 fr" style="height:100%">
			<div class="postion lh28 mb15">
				<span class="fb green">您的位置：</span><a href="#">首页</a> > <a href="#">公告管理</a>
			</div>
			<div class="w800_con ">
				<div class="tit2">
					<h2 class="lh32 pl30">
						<span class="fb f14">公告列表</span> Bulletin List
					</h2>
				</div>

				<div class="form1 " style="padding-left:10px">
					公告标题：<input name="notice.title" type="text" style="width:350px;" value="<s:property value='notice.title'/>" class="text" /> 
							<input name="input" type="button" value=" 搜  索" onclick="look()" class="bt1 fb grey1 ml10" /> 
							<input name="input" type="button" value=" 添 加" onclick="addStation()" class="bt1 fb grey1 ml10" />
				</div>
				
				<div class="table4 table3">
					<table style="width: 100%;border: 1px; border-color:#d7d7d7;">
						<tr>
							<td style="width:20%" class="bghui fb">序号</td>
							<td style="width:40%" class="bghui fb">公告标题</td>
							<td style="width:20%" class="bghui fb">时间</td>
							<td style="width:20%" class="bghui fb">操作<br /></td>
						</tr>
						<s:iterator value="notice.data" status="stat">
							<tr style="border-bottom:1px solid #E5EFF0">
								<td><s:property value="#stat.index+1"/></td>
								<td style="text-align: left;">
									<a href="#" style="padding-top:10px;padding-bottom: 10px" class="notice_title"
										onclick="viewStation(<s:property value='noticeId'/>)">
										<s:property value='title' /> 
									</a>
									<div id="hidden_menu" style="position:absolute;display:none;border:1px solid gray;background:white;"></div>
								</td>
								<td class="dateTime"><s:date name="updateTime" format="yyyy-MM-dd" /></td>
								<td>
									<a href="#" onclick="updateStation(<s:property value='noticeId'/>)">编辑</a>
									<a href="#" style="margin-left: 10px" onclick="javascript:deleteStation(<s:property value='noticeId'/>)" class="grey">删除</a>
								</td>
							</tr>
						</s:iterator>
					</table>
					<div class="pages mt20 tc">
						当前是第
						<s:property value="notice.pageNo" />
						页 共
						<s:property value="notice.pageNum" />
						页 <a
							href="javascript:firstPage(<s:property value="notice.pageNo"/>,<s:property value="notice.pageNum"/>);">第一页</a>
						<a
							href="javascript:prevPage(<s:property value="notice.pageNo"/>,<s:property value="notice.pageNum"/>);">上一页</a>
						<a class="blue12_33"
							href="javascript:nextPage(<s:property value="notice.pageNo"/>,<s:property value="notice.pageNum"/>);">下一页</a>
						<a class="blue12_33"
							href="javascript:lastPage(<s:property value="notice.pageNo"/>,<s:property value="notice.pageNum"/>);">最后一页</a>
						转到 <input id="inputPageNo" type="text" size="1" name="notice.pageNo"/> 页 
						<a class="blue12_33" href="javascript:checkInputPageNo1('inputPageNo',<s:property value="notice.pageNum"/>)">go</a>
					</div>
				</div>
			</div>
		</div>
		
	</form>
</body>
</html>
