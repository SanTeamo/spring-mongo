$(function(){  //默认做一些页面初始化
	$(".bitian").after("<span class='formtips'>*必填</span>");
	
	$(".bitian").blur(function(){
		var value = $(this).val();
		if($(this).is("#pname")){
            $(this).parent().find(".formtips").remove();
            if(value.length == 0){
                $(this).parent().append("<span class='formtips onError'>商品名不能为空</span>")
            }else{
                $(this).parent().append("<span class='formtips onSuccess'>商品名可以使用</span>")
            }
		}

		if($(this).is("#price")){
			$(this).parent().find(".formtips").remove();
			if(value.length != 0){
				var pattern = /(^[1-9]\d*(\.\d{1,2})?$)|(^0(\.\d{1,2})?$)/;
				if(pattern.test(value)){
					$(this).parent().append("<span class='formtips onSuccess'>价格格式正确</span>");
				}else{
					$(this).parent().append("<span class='formtips onError'>价格格式不正确</span>");
				}
			}else{
				$(this).parent().append("<span class='formtips onError'>价格不能为空</span>");
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