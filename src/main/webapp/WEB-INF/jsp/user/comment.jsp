<!doctype html>
<html>

<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>填写订单</title>
    <style>
        /* 向左的箭头 */
        .glyphicon{
            cursor: pointer;
        }
        .dot-left {
            font-size: 0;
            line-height: 0;
            border-width: 5px;
            border-color: #f37a0e;
            border-left-width: 0;
            border-style: dashed;
            border-right-style: solid;
            border-top-color: transparent;
            border-bottom-color: transparent;
            display: inline-block;
        }
        /* 文字提示框 */
        .tip{
            background: #f37a0e;
            padding: 0 5px;
            display: inline-block;
            border-radius: 5px;
        }
    </style>
</head>

<body>

<%@ include file="/WEB-INF/jsp/header.jsp" %>


<div class="container">

    <form id="comment" method="post" action="${pageContext.request.contextPath}/Evaluation/writeComment">
        <input type="hidden" name="pid" value="${product.id}">
        <div class="page-header">
            <h1>评价商品 <%--<small>全部订单</small>--%></h1>
        </div>
        <div class="form-group">
            <table class="table table-bordered table-hover table-striped table-condensed">
                <tr>
                    <td colspan='3'>
                        <img style="display: inline-block;" src="${pageContext.request.contextPath}/products/${product.catId}/${product.pimage}" height="60">
                        <a target="_blank">${product.pname}</a>
                    </td>
                </tr>
                <tr>
                    <td colspan="1">
                        评论
                    </td>
                    <td colspan='2'>
                        <textarea class="form-control" id="description" rows="3" name="comments[0].description"></textarea>
                    </td>
                </tr>
                <tr>
                    <th width="20%">评价项目</th>
                    <th width="50%">星星</th>
                    <th width="30%">分数</th>
                </tr>
                <tr class="tr">
                    <td>描述相符</td>
                    <td>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                    </td>
                    <td class="score"></td>
                    <input type="hidden" name="comments[0].descScore">
                </tr>
                <tr class="tr">
                    <td>卖家服务</td>
                    <td>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                    </td>
                    <td class="score"></td>
                    <input type="hidden" name="comments[0].serviceScore">
                </tr>
                <tr class="tr">
                    <td>物流服务</td>
                    <td>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                        <span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
                    </td>
                    <td class="score"></td>
                    <input type="hidden" name="comments[0].logisticsScore">
                </tr>
                <tr>
                    <td colspan="3" style="text-align: center;">
                        <button type="submit" class="btn btn-success">提交</button>
                        <button type="button" class="btn btn-info" onclick="javascript:location.reload();">重选</button>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</div>

<%@ include file="/WEB-INF/jsp/footer.jsp" %>

</body>
<script>
    $(function(){
        var tip_text = '',$parent = {};
        $(".glyphicon").bind({
            mouseout: function () {
                $parent.children('.extra').remove();
                var score = $parent.siblings('.score').html();
                if(score){//有星星选中时
                    $parent.children(":lt("+ parseInt(score) +")").removeClass('glyphicon-star-empty').addClass('glyphicon-star');//PS:此处应该加上parseInt进行整型转换，否则会没有效果
                    $parent.children(":gt("+ eval(parseInt(score)-1) + ")").removeClass('glyphicon-star').addClass('glyphicon-star-empty');//PS:此处要记得加eval，进行js计算，不然会报“jquery.min.js:2 Uncaught Error: Syntax error, unrecognized expression: NaN)”的错误
                }else{
                    $(this).prevAll().andSelf().removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }
            },
            mouseover: function () {
                $parent = $(this).parent();//把父节点存放起来
                var score = $parent.siblings('.score').html();
                $parent.append('<span class="extra dot-left"></span><span class="extra tip"></span>');//添加提示框
                tip_text = indexText($(this).index());//得到相应的文字提示
                $(this).siblings('.tip').html(tip_text);//显示文字提示
                $(this).prevAll().andSelf().removeClass('glyphicon-star-empty').addClass('glyphicon-star');
                if(score){//当有星星选中时，为了解决鼠标移到选中星星的的前面星星时的小bug，此时会出现前面星星鼠标滑动时，星星颜色不变化现象
                    $(this).nextAll().not('.extra').removeClass('glyphicon-star').addClass('glyphicon-star-empty');
                }
            },
            click: function(){
                var score = $(this).index() + 1;
                $parent.siblings('.score').html(score+'(' + tip_text + ')');
                $parent.siblings('.score').next().val(score);
                $(this).prevAll().andSelf().removeClass('glyphicon-star-empty').addClass('glyphicon-star');
            }
        });

        /*$('.btn-success').click(function(){*/
            $("#comment").submit(function () {
                //var allScore = '';
                var error = 0;
                $('.score').each(function(){
                    var text = $(this).html();
                    if(text == ''){
                        error++;
                        //alert('请完成每项的评分后再提交!');
                        //throw "请完成每项的评分后再提交!";//向浏览器抛出异常，终止程序运行，用了return false试了下，还是会继续执行下面的弹窗，这里用throw刚好恰到好处,如果想继续用return false则可以改成if...else...进行判断处理也可以。
                        //return false;
                    }
                    //allScore += $(this).siblings(":first").html() + ':' + text + '\n';
                })
                //alert(allScore);
                var description = $("#description").val();
                //console.log(text);
                if (description == ""){
                    error++;
                    //alert('请填写评论!');
                    //return false;
                }

                if(error>0){
                    alert('请完成每项的评分后再提交!');
                    return false;
                }else{
                    return true;
                }
            })
        /*})*/
    })

    //封装文字提示函数
    function indexText(i){
        switch(i){
            case 0:
                return '非常不满意';
            case 1:
                return '不满意';
            case 2:
                return '一般';
            case 3:
                return '满意';
            case 4:
                return '非常满意';
        }
    }
</script>

</html>