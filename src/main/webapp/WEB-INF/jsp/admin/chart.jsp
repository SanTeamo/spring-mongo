<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>商品销量</title>
		<script src="${ctx}/js/highcharts.js" type="text/javascript"></script>
	</head>

	<body>

	<div class="container-fluid">
		<div class="page-header">
			<h1>商品销量</h1>
		</div>
		<div id="sales" style="margin: 0 auto"></div>
		<script language="JavaScript">

			var chartData = "";

            $.ajax({
                url:"/Admin/getChart",
                data:{},
                type:"post",
                dataType:"json",
                async:false,
                success:function (result) {
                    chartData = result;
                }
            });

            $(document).ready(function() {
                var chart = {
                    type: 'column'//设置图标类型
                };
                var title = {
                    text: chartData.title//设置标题
                };
                var xAxis = {
                    categories: chartData.categories//设置横坐标
                };
                var yAxis ={
                    min: 0,
                    title: {
                        text: '销量（单位：个）'//设置纵坐标单位
                    }
                };
                var legend = {
                    align: 'right',
                    x: -30,
                    verticalAlign: 'top',
                    y: 25,
                    floating: true,
                    backgroundColor: (Highcharts.theme && Highcharts.theme.background2) || 'white',
                    borderColor: '#CCC',
                    borderWidth: 1,
                    shadow: false
                };
                var tooltip = {
                    formatter: function () {
                        return '<b>' + this.x + '</b><br/>' +/*
                            this.series.name + ': ' + this.y + '<br/>' +*/
                            '一共: ' + this.point.stackTotal;
                    }
                };
                var plotOptions = {
                    column: {
                        stacking: 'normal',
                        dataLabels: {
                            enabled: true,
                            color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white',
                            style: {
                                textShadow: '0 0 3px black'
                            }
                        }
                    }
                };
                var credits = {
                    enabled: false
                };
                var series= [{
                    name: chartData.name,//设置数据名称
                    data: chartData.data//设置数据
                }];

                var json = {};//定义数组
                json.chart = chart;//存入图表类型
                json.title = title;//存入图表标题
                json.xAxis = xAxis;//存入图表横坐标
                json.yAxis = yAxis;//存入图表纵坐标
                json.legend = legend;//存入图表对齐方式
                json.tooltip = tooltip;//存入鼠标提示方式
                json.plotOptions = plotOptions;//存入绘图参数
                json.credits = credits;//存入版权信息
                json.series = series;//存入图表数据
                $('#sales').highcharts(json);//根据数据绘制图表

            });
		</script>
	</div>

	</body>
</html>