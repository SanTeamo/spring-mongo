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
		${chart}
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
                    type: 'column'
                };
                var title = {
                    text: chartData.title
                };
                var xAxis = {
                    categories: chartData.categories
                };
                var yAxis ={
                    min: 0,
                    title: {
                        text: '销量（单位：个）'
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
                    name: chartData.name,
                    data: chartData.data
                }];

                var json = {};
                json.chart = chart;
                json.title = title;
                json.xAxis = xAxis;
                json.yAxis = yAxis;
                json.legend = legend;
                json.tooltip = tooltip;
                json.plotOptions = plotOptions;
                json.credits = credits;
                json.series = series;
                $('#sales').highcharts(json);

            });
		</script>
	</div>

	</body>
</html>