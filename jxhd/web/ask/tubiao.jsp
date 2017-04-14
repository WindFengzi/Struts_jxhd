<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML>
<html>
 <head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<title>查看图表</title>
		<script type="text/javascript" src="/jxhd/js/jquery-1.3.2.min.js"></script>
		<script type="text/javascript">
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'column'
            },
            colors:[ 
                  '#3f7db2',//第一个颜色  
                  '#ba284a',//第二个颜色 
                  '#e38629'//第三个颜色 
            ],
            title: {
                text: '答题统计'
            },
            credits: {
          enabled:false
			},
            xAxis: {
                categories: [
                    '人数'
                ]
            },
            yAxis: {
                min: 0,
                title: {
                    text: '人数 (个)'
                }
            },
            legend: {
                layout: 'vertical',
                backgroundColor: '#FFFFFF',
                align: 'left',
                verticalAlign: 'top',
                x: 100,
                y: 70,
                floating: true,
                shadow: true
            },
            tooltip: {
                formatter: function() {
                    return ''+
                        this.x +': '+ this.y +' 个';
                }
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
            },
                series: [{
                name: '答对',
                data: [<s:property value='isRight'/>]
    
            }, {
                name: '答错',
                data: [<s:property value='isWrong'/>]
    
            }, {
                name: '未答',
                data: [<s:property value='qingjia'/>]
    
            }]
        });
    });
    
});
		</script>
	</head>
	<body>
<script src="/jxhd/js/highcharts.js"></script>
<script src="/jxhd/js/modules/exporting.js"></script>

<div id="container" style="min-width: 400px; height: 400px; margin: 0 auto"></div>

	</body>
</html>
