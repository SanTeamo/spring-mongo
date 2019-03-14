$(function(){  //默认做一些页面初始化
	$(".bitian").after("<span class='formtips'>*必填</span>");
	
	$(".bitian").blur(function(){
		//var value = this.value;
		var value = $(this).val();
		//alert(value);
		if($(this).is("#username")){
			var checkResult = false;
			$(this).parent().find(".formtips").remove();
			if(value.length == 0){
				$(this).parent().append("<span class='formtips onError'>用户名不能为空</span>")
			}else if(value.length < 3){
				$(this).parent().append("<span class='formtips onError'>用户名太短</span>")
			}else{
				//$(this).parent().append("<span class='formtips onSuccess'>用户名可以使用</span>")
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
					$(this).parent().append("<span class='formtips onError'>该用户已经注册</span>");
				} else {
					$(this).parent().append("<span class='formtips onSuccess'>用户名可以使用</span>")
				}
			}
		}
		
		if($(this).is("#password")){
			$(this).parent().find(".formtips").remove();
			if(value.length == 0){
				$(this).parent().append("<span class='formtips onError'>密码不能为空</span>")
			}else if(value.length < 3){
				$(this).parent().append("<span class='formtips onError'>密码太短</span>")
			}else{
				$(this).parent().append("<span class='formtips onSuccess'>密码可以使用</span>")
			}
		}
		
		if($(this).is("#confirmpwd")){
			$(this).parent().find(".formtips").remove();
			if(value.length == 0){
				$(this).parent().append("<span class='formtips onError'>密码不能为空</span>")
			}else if(value != $("#password").val()){
				$(this).parent().append("<span class='formtips onError'>两次输入密码不一致</span>")
			}else{
				$(this).parent().append("<span class='formtips onSuccess'>密码可以使用</span>")
			}
		}
		
		if($(this).is("#inputEmail")){
			$(this).parent().find(".formtips").remove();
			if(value.length != 0){
				var pattern = /^([A-Za-z0-9_\-\.\u4e00-\u9fa5])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,8})$/;
				if(pattern.test(value)){
					$(this).parent().append("<span class='formtips onSuccess'>邮箱可以使用</span>");
				}else{
					$(this).parent().append("<span class='formtips onError'>邮箱格式不正确</span>");
				}
			}else{
				$(this).parent().append("<span class='formtips onError'>邮箱不能为空</span>");
			}
		}
		
		if($(this).is("#usercaption")){
			$(this).parent().find(".formtips").remove();
			if(value.length == 0){
				$(this).parent().append("<span class='formtips onError'>姓名不能为空</span>")
			}else{
				$(this).parent().append("<span class='formtips onSuccess'>姓名可以使用</span>")
			}
		}
		
		if($(this).is("#birthday")){
			$(this).parent().find(".formtips").remove();
			if(value.length == 0){
				$(this).parent().append("<span class='formtips onError'>生日不能为空</span>")
			}else{
				$(this).parent().append("<span class='formtips onSuccess'></span>")
			}
		}
		
		if($(this).is("#telephone")){
			$(this).parent().find(".formtips").remove();
			if(value.length == 11){
				$(this).parent().append("<span class='formtips onSuccess'></span>")
			}else{
				$(this).parent().append("<span class='formtips onError'>手机号码格式不正确</span>")
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
		var length = $(".onError").length;
		if(length>0){
			return false;
		}else{
			return true;
		}
	});
});