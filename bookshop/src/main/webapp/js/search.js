var page=1;
var rows=5;
$(function(){
	//初始化search.html页面
	findBookInfoByPage();
})

//分页查询书籍信息
function findBookInfoByPage(){
	$.post("search/findAllByPage",{page:page,rows:rows},function(data){
		/*console.log(data);*/
		//显示总记录数和分页数据
		$("#total").text(data.total);
		$("#pageSize").text(data.pageSize);
		
		//搜索的书籍信息
		$.each(data.rows,function(index,item){
			$("#findBook").append(
	                 '<table border="0" cellspacing="0" class="searchtable">'+
	                    '<tr>'+
	                      '<td width="20%" rowspan="2"><div class="divbookpic">'+
	                        '<p><a href="page/info.html"><img src="bookcover/dayongxiaohua.jpg" width="115" height="129" border="0" /></a></p></div></td>'+
	                      '<td colspan="2"><a class="bookname" href="page/info.html">'+item.bname+'</a><br /><hr><font class="authorInfo">'+item.author+' </font>&nbsp;著<font class="authorInfo">&nbsp;&nbsp;&nbsp;&nbsp;'+item.publisher+
	                      '</font><br /><br />'+item.intro+'</td></tr><tr>'+
	                      '<td>售价：<font class="bookPrice">￥'+item.price+'</font></td><td style="text-align:right">'+
	                 '<a href="page/cart.html"><img src="images/buy.gif" width="91" height="27" border="0" style="margin-bottom:-8px"/></a></td></tr></table>'
			);
		});

		/*					var li="";
		for(var i=1;i<10;i++){
			li=li+'<li><a href="javascript:currentPage()" class="current">'+i+'</a></li>';
		}
		//上一页，下一页
		$(".disablepage").next(li);*/

	},"json");	
}
//生成页码
for(var i=0 ; i<10 ; i++){
    var lis = $('<li><a href="javascript:void(0)" class="current">'+(i+1)+'</a></li>');
    $('.nextpage').before(lis);
}
//上一页
function prepage(){
	page--;
	$("#findBook").html('');
	findBookInfoByPage();
}
//下一页
function nextpage(){
	page++;
	$("#findBook").html('');
	findBookInfoByPage();
}

/*function currentPage(){
	alert($(this).html());
}*/
//当前页
$(".current").click(function(){
	page=$(this).html();
	$("#findBook").html('');
	findBookInfoByPage();	
})
//当前页
/*$('li').on('click','a',function(){
	page=$(this).html();
	$("#findBook").html('');
	findBookInfoByPage();
	alert(page);
})	*/