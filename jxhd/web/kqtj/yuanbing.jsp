<%@ page language="java" import="java.util.*,com.dt.jxhd.domain.*,java.text.SimpleDateFormat,java.text.DateFormat" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html >
<html>
  <head>
 <script type="text/javascript" src="/jxhd/js/jquery-1.11.0.min.js"></script>
  <script type="text/javascript">
$(function () {
    var chart;
    $(document).ready(function() {
        chart = new Highcharts.Chart({
            chart: {
                renderTo: 'container',
                type: 'column'
            },
            title: {
                text: '考勤统计'
            },
            subtitle: {
                text: ''
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
                min: 0,
                title: {
                    text: '人数（个）'
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
                        this.x +': '+ this.y +' mm';
                }
            },
            plotOptions: {
                column: {
                    pointPadding: 0.2,
                    borderWidth: 0
                }
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
