$(function(){  //默认做一些页面初始化
	$(".bitian").blur(function(){
		//var value = this.value;
		var value = $(this).val();
		//alert(value);
		if($(this).is("#username")){
			var checkResult = false;
			$(this).parent().find(".formtips").remove();
            $(this).parent().parent().addClass("has-error");
			if(value.length == 0){
				setErrorTip($(this),"用户名不能为空");
			}else if(value.length < 3){
                setErrorTip($(this),"用户名太短");
			}else{
				$.ajax({
					url:"/Home/checkUsername",
					data:{username:value},
					type:"post",
					dataType:"json",
					async:false,
					success:function (result) {
						checkResult = result;
					}
				});
				if (checkResult) {
                    setErrorTip($(this),"该用户已经注册");
				} else {
                    setSuccessTip($(this));
				}
			}
		}
		
		if($(this).is("#password")){
			$(this).parent().find(".formtips").remove();
            $(this).parent().parent().addClass("has-error");
			if(value.length == 0){
				setErrorTip($(this),"密码不能为空");
			}else if(value.length < 3){
                setErrorTip($(this),"密码太短");
			}else{
                setSuccessTip($(this));
			}
		}
		
		if($(this).is("#confirmpwd")){
			$(this).parent().find(".formtips").remove();
            $(this).parent().parent().addClass("has-error");
			if(value.length == 0){
                setErrorTip($(this),"请确认密码");
			}else if(value != $("#password").val()){
                setErrorTip($(this),"两次输入密码不一致");
			}else{

                setSuccessTip($(this));
            }
		}
		
		if($(this).is("#email")){
			$(this).parent().find(".formtips").remove();
            $(this).parent().parent().addClass("has-error");
			if(value.length != 0){
				var pattern = /^([A-Za-z0-9_\-\.\u4e00-\u9fa5])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,8})$/;
				if(pattern.test(value)){
					setSuccessTip($(this));
				}else{
					setErrorTip($(this),"邮箱格式不正确");
				}
			}else{
				setErrorTip($(this),"邮箱不能为空");
			}
		}
		
		if($(this).is("#name")){
			$(this).parent().find(".formtips").remove();
            $(this).parent().parent().addClass("has-error");
			if(value.length == 0){
                setErrorTip($(this),"姓名不能为空");
			}else{
                setSuccessTip($(this));
			}
		}
		
		if($(this).is("#birthday")){
			$(this).parent().find(".formtips").remove();
            $(this).parent().parent().addClass("has-error");
			if(value.length == 0){
                setErrorTip($(this),"生日不能为空");
			}else{
                setSuccessTip($(this));
			}
		}

		if($(this).is("#telephone")){
			$(this).parent().find(".formtips").remove();
            $(this).parent().parent().addClass("has-error");
			if(value.length == 11){
                setSuccessTip($(this));
			}else{
                setErrorTip($(this),"请输入11位手机号码");
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
        obj.parent().parent().removeClass("has-error");
        obj.parent().parent().addClass("has-success");
		obj.after("<span class='glyphicon glyphicon-ok form-control-feedback formtips'></span>")
    }

    function setErrorTip(obj,msg) {
        obj.after("<span class='glyphicon glyphicon-remove form-control-feedback formtips'></span><span class='formtips help-block'>"+msg+"</span>")
    }
});