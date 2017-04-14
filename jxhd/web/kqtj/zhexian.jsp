<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html>
  <head>
 <script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">
$(function () {
    var chart;
    var className;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'line',
                marginRight: 130,
                marginBottom: 35
            },
            title: {
                text: '考勤统计',
                x: -20 //center
            },
            subtitle: {
                text: '',
                x: -20
            },
            xAxis: {
                categories: [
                    <s:iterator value="attendance.data" status="stat">
                <s:if test="#stat.last">
                '<s:property value='createTime1'/>'
                </s:if><s:else>
                '<s:property value='createTime1'/>',
                </s:else>
                 </s:iterator>
                    ]
            },
            yAxis: {
                title: {
                    text: '人数（个）'
                },
                plotLines: [{
                    value: 0,
                    width: 1,
                    color: '#808080'
                }]
            },
            tooltip: {
                formatter: function() {
                        return '<b>'+ this.series.name +'</b><br/>'+
                        this.x +': '+ this.y +'个';
                }
            },
            legend: {
                layout: 'vertical',
                align: 'right',
                verticalAlign: 'top',
                x: -10,
                y: 100,
                borderWidth: 0
            },
            series: [
            <s:iterator value="list" status="stat"  id="inner">
            	//className = "aa"
                <s:if test="#stat.last">
                {
                name: '<s:property value='className'/>',
                data: [
                <s:iterator value="attendance.data" status="stat1"  id="inner1">
                <s:if test="#inner1.className==#inner.className">
                <s:property value='num'/>,
                </s:if>
                </s:iterator>
                ]
            }
                </s:if><s:else>
                {
                name: '<s:property value='className'/>',
                data: [
				<s:iterator value="attendance.data" status="stat2"  id="inner2">
                <s:if test="#inner2.className==#inner.className">
                <s:property value='num'/>,
                </s:if>
                </s:iterator>
				]
            },
                </s:else>
                 </s:iterator>
            ]
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
