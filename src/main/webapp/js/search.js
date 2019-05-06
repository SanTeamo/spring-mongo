$(function(){  //默认做一些页面初始化
    $("#keyword").blur(function(){

        var value = $(this).val();

        $(this).parent().find(".formtips").remove();
        $(this).parent().addClass("has-error");
        if(value.length == 0){
            setErrorTip($(this),"输入搜索内容");
        }else{
            setSuccessTip($(this));
        }

    }).focus(function(){
        //获得焦点也调用blur
        $(this).triggerHandler("blur");
    }).keyup(function(){
        //输入一个字符后也调用blur
        $(this).triggerHandler("blur");
    });

    $("#search").submit(function(){
        $("#keyword").trigger("focus");

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
        obj.after().after("<span class='glyphicon glyphicon-ok form-control-feedback formtips'></span>")
    }

    function setErrorTip(obj,msg) {
        obj.after().after("<span class='glyphicon glyphicon-remove form-control-feedback formtips'></span>")
        //obj.parent().after().after("<span class='formtips help-block'>"+msg+"</span>");
    }
});