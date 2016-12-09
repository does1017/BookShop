var totalPage;//总页数
var page=1;//页数
var rows=24;//每页显示数据量
$(function(){
	//初始化search.html页面
	findBookInfoByPage();
	
	//生成页码
	$(".pagination").createPage({
	    pageCount:totalPage,
	    current:1,
	    backFn:function(p){
	        page=p;
	        $("#findBook").html('');
	        findBookInfoByPage();
	    }
	});
})

//分页查询书籍信息
function findBookInfoByPage(){
	$.post("search/findAllByPage",{page:page,rows:rows},function(data){
		//显示总记录数和分页数据
		$("#total").text(data.total);//总记录数
		$("#pageSize").text(rows);//每页的数据量
		totalPage=data.totalPage;//总页数
		
		var num=0;
		var index=0;
		while(index>data.total){
			$("#productlist_bar").after('<table cellspacing="0" class="booklist"><tr id="booklist'+num+'"></tr></table>');
			for(var i=0;i<4;i++){
				if(data.rows==null||data.rows==""){return}
				$("#booklist"+num).append(
	              '<td><div class="divbookpic"><p><a href="info.html"><img src="bookcover/dayongxiaohua.jpg" width="115" height="129" border="0" /></a></p>'+
	              '</div><div class="divlisttitle"><a href="info.html">'+data.rows[index].bname+'<br />售价： '+data.rows[index].price+' </a></div></td>'						
				);
				index++;
			}
			num++;
		}
		
		//搜索的书籍信息
/*		var num=0;
		$.each(data.rows,function(index,item){
			$("#productlist_bar").after('<table cellspacing="0" class="booklist"><tr id="booklist'+num+'"></tr></table>');
			for(var i=0;i<4;i++){
				if(item==null||item==""){return}
				$("#booklist"+num).append(
	              '<td><div class="divbookpic"><p><a href="info.html"><img src="bookcover/dayongxiaohua.jpg" width="115" height="129" border="0" /></a></p>'+
	              '</div><div class="divlisttitle"><a href="info.html">'+item.bname+'<br />售价： '+item.price+' </a></div></td>'						
				);
			}
		});*/
		
	},"json");	
}

