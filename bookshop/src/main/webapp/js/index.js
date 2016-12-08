//搜索框的点击事件
$("#searchBox").click(function(){
	$(this).attr("placeholder","");
})
//搜索框的失焦事件
$("#searchBox").blur(function(){
	$(this).attr("placeholder","300万种图书随你挑");
})
//搜索按钮点击事件
$("#searchButton").click(function(){
	var seachVal=$("#searchBox").val();
	if(seachVal=="" || searchVal==null){
		location.href="page/search.html";
	}else{
		
	}
})