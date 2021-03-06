$(function(){

    $(".delete").click(function(){

        var pid=$(this).parent().parent().find(".pid").val();

        if(confirm("确认删除?")){
            $.ajax({
                url:"/Home/Cart/removeCartItemById",
                data:{pid:pid},
                type:"post",
                dataType:"json",
                async:false,
                success:function (result) {
                    if (result) {
                        alert("删除成功！");
                        window.location.href = "/Home/Cart";
                    }else {
                        alert("删除失败，请稍后再试！");
                    }
                }
            });
        }
    });

    //清空购物车
    $("#clear").click(function(){

        if(confirm("确认清空购物车?")){
            $.post("/Home/Cart/clearCart",
                { },
                function(data){
                    var result = data;
                    if (result) {
                        alert("删除成功！");
                        window.location.href = "/Home/Cart";
                    }else {
                        alert("删除失败，请稍后再试！");
                    }
                });
        }
    });

    //点击减号
    $(".glyphicon-minus").click(function () {
        var pid=$(this).parent().parent().parent().find(".pid").val();
        //console.log(pid)
        var num = $(this).next();
        if (num.val()>1){
            num.val(parseInt(num.val())-1);
        }
        setSubTotal(this,num);
        $.ajax({
            url:"/Home/Cart/changeCartItemNum",
            data:{pid:pid,num:num.val()},
            type:"post",
            dataType:"json",
            async:false,
            success:function (result) {
                //alert("result"+result)
            }
        });
    });

    //点击加号
    $(".glyphicon-plus").click(function () {
        var pid=$(this).parent().parent().parent().find(".pid").val();
        //console.log(pid);
        var num = $(this).prev();
        num.val(parseInt(num.val())+1);
        setSubTotal(this,num);
        $.ajax({
            url:"/Home/Cart/changeCartItemNum",
            data:{pid:pid,num:num.val()},
            type:"post",
            dataType:"json",
            async:false,
            success:function (result) {
                //alert("result"+result)
            }
        });
    });

    //计算一个商品总价
    function setSubTotal(t,num) {

        var subtotal = $(t).parent().parent().next().find(".subtotal");
        var price = $(t).parent().parent().prev().find(".price").text();
        //alert(price+"-----"+subtotal.text());
        subtotal.text((num.val()*price).toFixed(2));

    }

    //计算所有商品总价
    function setTotal() {

        var total = 0;
        var totalPrice = 0;
        $(".isChecked .num").each(function() {
            total += parseInt($(this).val());
        });
        $(".isChecked .subtotal").each(function() {
            totalPrice += parseFloat($(this).text());
        });

        $(".totalNum").text(total);
        $(".totalPrice").text(totalPrice.toFixed(2));
//}
//});
    }

    //全选
    $('.checkAll').click(function(){
        if($(".checkAll").prop("checked")){
            $(".check").prop("checked",true);
            $(".check").parent().parent().addClass("isChecked");
        }else{
            $(".check").parent().parent().removeClass("isChecked");
            $(".check").prop("checked",false);
        }
        setTotal();
    });

    //单选
    $(".check").click( function(){
        $(this).each(function(){
            if($(this).prop("checked")){
                $(this).parent().parent().addClass("isChecked");
            }else{
                $(this).parent().parent().removeClass("isChecked");
            }
            setTotal();
        });
    });

    //提交选中的商品生成订单
    $("#submitOrder").click(function () {
        var form = $('<form></form>');
        form.attr('action', '/Home/Order/createOrder');
        form.attr('method', 'post');
        form.attr('target', '_self');
        var i = 0;
        $(".check").each(function(){
            if($(this).prop("checked")){
                var tr = $(this).parent().parent();
                var num = tr.find(".num").val();
                var pid = tr.find(".pid").val();
                var sellerUserName = tr.find(".sellerUserName").val();
                var num_input = $('<input type="hidden" name="productWrappers['+i+'].num" />');
                num_input.attr('value', num);
                var pid_input = $('<input type="hidden" name="productWrappers['+i+'].pid" />');
                pid_input.attr('value', pid);
                var sellerUserName_input = $('<input type="hidden" name="productWrappers['+i+'].sellerUserName" />');
                sellerUserName_input.attr('value', sellerUserName);
                form.append(num_input);
                form.append(pid_input);
                form.append(sellerUserName_input);
                i++;
            }
        });
        var totalPrice = $('<input type="hidden" name="totalPrice" />');
        totalPrice.attr('value', $(".totalPrice").text());
        form.append(totalPrice);
        $(document.body).append(form);
        $.post(form.attr('action'),
            form.serialize(),
            function(res) {
                var obj =  res;
                if(obj){
                    alert("成功生成订单！");
                    window.location.href="/Home/Order";
                }else {
                    alert("创建失败，请稍后再试！")
                }
            }, "json");
        return false;
    });
});