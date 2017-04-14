/*
container:滚动的容器ID
btnPrevious：上一步按钮的ID
btnNext：下一步按钮的ID
eventType：上一个和下一个按钮事件的触发方式:click为点击触发滚动 否则就是 鼠标按住按钮触发滚动
*/
function ScrollText(container,btnPrevious,btnNext,eventType)
{
    this.Speed = 10; //滚动速度:值越大滚动越慢
	this.QuickStep = 1; //快速滚动的步长
    this.interval = 1000;//滚动间隔
	this.stopscroll =false;//是否停止滚动的标志位
	this.isSmoothScroll= true;//是否平滑连续滚动
    this.LineSpace = 24;//默认间距，每一条的宽度或高度
	this.Direction = "V"; //滚动方向.横向：H，纵向：V
	
	this.EventType = "click";//上一个和下一个按钮事件的触发方式:click为点击触发滚动 否则就是 鼠标按住按钮触发滚动
	if(eventType) this.EventType = eventType 
	
	this.BackCall = null;//回调函数
	
    this.NextButton = this.$(btnNext);
    this.PreviousButton = this.$(btnPrevious);
    this.ScrollContent = this.$(container);

	if(this.PreviousButton)
	{
		if(this.EventType=="click"){
			this.PreviousButton.onclick = this.GetFunction(this,"Previous");
		}
		else
		{
			this.PreviousButton.onmousedown = this.GetFunction(this,"MouseDown","pre");
			this.PreviousButton.onmouseup = this.GetFunction(this,"MouseUp");
		} 
		this.PreviousButton.onmouseover = this.GetFunction(this,"MouseOver");
		this.PreviousButton.onmouseout = this.GetFunction(this,"MouseOut");
	}
	if(this.NextButton){
		if(this.EventType=="click"){
			this.NextButton.onclick = this.GetFunction(this,"Next");
		}
		else
		{
			this.NextButton.onmousedown = this.GetFunction(this,"MouseDown","next");
			this.NextButton.onmouseup = this.GetFunction(this,"MouseUp");
		} 
		this.NextButton.onmouseover = this.GetFunction(this,"MouseOver");
		this.NextButton.onmouseout = this.GetFunction(this,"MouseOut");
    }
    this.ScrollContent.onmouseover = this.GetFunction(this,"MouseOver");
    this.ScrollContent.onmouseout = this.GetFunction(this,"MouseOut");
}

ScrollText.prototype = {
	lastpos:0,
	$:function(element)
	{
		return document.getElementById(element);
	},
	Previous:function()
	{
		if(this.Direction=="V")	//纵向滚动
			this.lastpos =  parseInt(this.ScrollContent.scrollTop);
		else
			this.lastpos =  parseInt(this.ScrollContent.scrollLeft);	
		clearTimeout(this.ScrollTimer);
		this.stopscroll = true;
		this.Scroll("pre");
	},
	Next:function()
	{
		if(this.Direction=="V")	//纵向滚动
			this.lastpos =  parseInt(this.ScrollContent.scrollTop);
		else
			this.lastpos =  parseInt(this.ScrollContent.scrollLeft);	
			
		clearTimeout(this.ScrollTimer);
		this.stopscroll = true;
		this.Scroll("next");
	},
	Start:function()
	{
		if(this.isSmoothScroll)
		{
			this.AutoScrollInterval = setInterval(this.GetFunction(this,"SmoothScroll"), this.interval);
		}
		else
		{		
			this.AutoScrollInterval = setInterval(this.GetFunction(this,"IntervalScroll"), this.interval);
		}
	},
	Stop:function()
	{
		clearInterval(this.AutoScrollInterval);
	},
	MouseOver:function()
	{	
		clearTimeout(this.ScrollTimer);
		this.stopscroll = true;
	},
	MouseOut:function()
	{
		this.MouseUp();
		this.stopscroll = false;
	},
	MouseDown:function(direction)
	{
		this.MouseDownInterval = setInterval(this.GetFunction(this,"QuickScroll",direction), this.interval);
	},
	MouseUp:function()
	{
		clearInterval(this.MouseDownInterval);
	},
	IntervalScroll:function()
	{
		if(this.stopscroll) 
		{
			return;
		}
		if(this.Direction=="V"){	//纵向滚动
			this.ScrollContent.scrollTop++;
			if(parseInt(this.ScrollContent.scrollTop) % this.LineSpace != 0)
			{
				this.AutoScrollTimer = setTimeout(this.GetFunction(this,"IntervalScroll"), this.Speed);
			}
			else
			{
				if(parseInt(this.ScrollContent.scrollTop) >= parseInt(this.ScrollContent.scrollHeight) / 2)
				{
					this.ScrollContent.scrollTop = 0;
				}
				clearTimeout(this.AutoScrollTimer);
				//如果存在回调函数，则执行回调函数
				if(this.BackCall)	this.CallBack();
			}
		}
		else	//横向滚动
		{
			this.ScrollContent.scrollLeft++;
			if(parseInt(this.ScrollContent.scrollLeft) % this.LineSpace != 0)
			{
				this.AutoScrollTimer = setTimeout(this.GetFunction(this,"IntervalScroll"), this.Speed);
			}
			else
			{
				if(parseInt(this.ScrollContent.scrollLeft) >= parseInt(this.ScrollContent.scrollWidth) / 2)
				{
					this.ScrollContent.scrollLeft = 0;
				}
				clearTimeout(this.AutoScrollTimer);
				//如果存在回调函数，则执行回调函数
				if(this.BackCall)	this.CallBack();
			}
		}
	},
	SmoothScroll:function()
	{
		if(this.stopscroll) 
		{
			return;
		}
		if(this.Direction=="V"){	//纵向滚动
			this.ScrollContent.scrollTop++;
			if(parseInt(this.ScrollContent.scrollTop) >= parseInt(this.ScrollContent.scrollHeight) / 2)
			{
				this.ScrollContent.scrollTop = 0;
			}
		}
		else	//横向滚动
		{
			this.ScrollContent.scrollLeft++;
			if(parseInt(this.ScrollContent.scrollLeft) >= parseInt(this.ScrollContent.scrollWidth) / 2)
			{
				//alert(this.ScrollContent.scrollLeft + "  " + this.ScrollContent.scrollWidth);//cds
				this.ScrollContent.scrollLeft = 0;
			}
		}
	},
	Scroll:function(direction)
	{
		if(this.Direction=="V"){	//纵向滚动
			if(direction=="pre")
			{
				this.ScrollContent.scrollTop-=this.QuickStep;
			}
			else
			{
				this.ScrollContent.scrollTop+=this.QuickStep;
			}
			if(parseInt(this.ScrollContent.scrollTop) >= parseInt(this.ScrollContent.scrollHeight) / 2)
			{
				this.lastpos -=parseInt(this.ScrollContent.scrollHeight) / 2;//重新设置起点位置
				this.ScrollContent.scrollTop = 0;
			}
			else if(parseInt(this.ScrollContent.scrollTop)<=0)
			{
				this.lastpos +=parseInt(this.ScrollContent.scrollHeight) / 2;//重新设置起点位
				this.ScrollContent.scrollTop = parseInt(this.ScrollContent.scrollHeight) / 2;
			}
			if(this.LineSpace - Math.abs(parseInt(this.ScrollContent.scrollTop) -this.lastpos) > this.QuickStep)
			{
				this.ScrollTimer = setTimeout(this.GetFunction(this,"Scroll",direction), this.Speed);
			}
		}
		else
		{
			if(direction=="pre")
			{
				this.ScrollContent.scrollLeft-=this.QuickStep;
			}
			else
			{
				this.ScrollContent.scrollLeft+=this.QuickStep;
			}
			if(parseInt(this.ScrollContent.scrollLeft) >= parseInt(this.ScrollContent.scrollWidth) / 2)
			{
				this.lastpos -=parseInt(this.ScrollContent.scrollWidth) / 2;//重新设置起点位
				this.ScrollContent.scrollLeft = 0;
			}
			else if(parseInt(this.ScrollContent.scrollLeft)<=0)
			{
				this.lastpos +=parseInt(this.ScrollContent.scrollWidth) / 2;//重新设置起点位
				this.ScrollContent.scrollLeft = parseInt(this.ScrollContent.scrollWidth) / 2;
			}
			if(this.LineSpace - Math.abs(parseInt(this.ScrollContent.scrollLeft) -this.lastpos) > this.QuickStep)
			{
				this.ScrollTimer = setTimeout(this.GetFunction(this,"Scroll",direction), this.Speed);
			}		
		}
	},
	QuickScroll:function(direction)
	{
		if(this.Direction=="V"){	//纵向滚动
			if(direction=="pre")
			{
				this.ScrollContent.scrollTop-=this.QuickStep;
			}
			else
			{
				this.ScrollContent.scrollTop+=this.QuickStep;
			}
			if(parseInt(this.ScrollContent.scrollTop) >= parseInt(this.ScrollContent.scrollHeight) / 2)
			{
				this.ScrollContent.scrollTop = 0;
			}
			else if(parseInt(this.ScrollContent.scrollTop)<=0)
			{
				this.ScrollContent.scrollTop = parseInt(this.ScrollContent.scrollHeight) / 2;
			}
		}
		else
		{
			if(direction=="pre")
			{
				this.ScrollContent.scrollLeft-=this.QuickStep;
			}
			else
			{
				this.ScrollContent.scrollLeft+=this.QuickStep;
			}
			if(parseInt(this.ScrollContent.scrollLeft) >= parseInt(this.ScrollContent.scrollWidth) / 2)
			{
				this.ScrollContent.scrollLeft = 0;
			}
			else if(parseInt(this.ScrollContent.scrollLeft)<=0)
			{
				this.ScrollContent.scrollLeft = parseInt(this.ScrollContent.scrollWidth) / 2;
			}	
		}
	},
	GetFunction:function(variable,method,param)
	{
		return function()
		{
			variable[method](param);
		}
	},
	Bind:function(el,myEvent,fun,range,params){
		var _params = params == null || params.constructor != Array  ? [params] : params;
		if (el.addEventListener)
			el.addEventListener(myEvent,function(){fun.apply(range,_params)}, false);
		else
			el.attachEvent("on"+myEvent, function(){fun.apply(range,_params)});
	}
}