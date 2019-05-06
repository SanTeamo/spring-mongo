$(function(){  //默认做一些页面初始化
    $(".bitian").blur(function(){

        var value = $(this).val();

        if($(this).is("#pname")){
            $(this).parent().find(".formtips").remove();
            $(this).parent().addClass("has-error");
            if(value.length == 0){
                setErrorTip($(this),"商品名不能为空");
            }else{
                setSuccessTip($(this));
            }
        }

        if($(this).is("#price")){
            $(this).parent().find(".formtips").remove();
            $(this).parent().addClass("has-error");
            if(value.length != 0){
                var pattern = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
                if(pattern.test(value)){
                    setSuccessTip($(this));
                }else{
                    setErrorTip($(this),"价格格式不正确");
                }
            }else{
            	setErrorTip($(this),"价格不能为空");
            }
        }

        if($(this).is("#pdesc")){
            $(this).parent().find(".formtips").remove();
            $(this).parent().addClass("has-error");
            if(value.length == 0){
                setErrorTip($(this),"商品描述不能为空");
            }else{
                setSuccessTip($(this));
            }
        }

    }).focus(function(){
        //获得焦点也调用blur
        $(this).triggerHandler("blur");
    }).keyup(function(){
        //输入一个字符后也调用blur
        $(this).triggerHandler("blur");
    });

    $("form").submit(function(){
        $(".bitian").trigger("focus");

        //找出onError的个数
        var length = $(".has-error").length;
        if(length>0){
            return false;
        }else{
            return true;
        }
    });

    function setSuccessTip(obj) {
        obj.parent().removeClass("has-error");
        obj.parent().addClass("has-success");
        obj.after("<span class='glyphicon glyphicon-ok form-control-feedback formtips'></span>")
    }

    function setErrorTip(obj,msg) {
        obj.after("<span class='glyphicon glyphicon-remove form-control-feedback formtips'></span><span class='formtips help-block'>"+msg+"</span>")
    }
});