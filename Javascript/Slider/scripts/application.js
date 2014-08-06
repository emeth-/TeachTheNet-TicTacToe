//Add the first image 

$(document).ready(function(){
	initPics();
	currentImage = $('.selected').attr('id');


	var navButton = $("li").find("img");
	//show the right image when the nav button is clicked
	$(navButton).on('click',function(){
		$("#"+currentImage).removeClass('selected');
		$("#"+currentImage).addClass('notSelected');

		//change nav button when a different one is clicked
		$('#navigation').children('li').children("img").removeClass('active');
		$('#navigation').children('li').children("img").addClass('inactive');
	
	});
	
	if ($("li img").hasClass('active')){
	    $(this).find(".active").attr('src','images/button1.png');
	} else {
		$(this).attr('src','images/button2.png');
	}


});



function initPics(){
	for (var i=1; i<5; i++){
		var img = $("<img src=images/slider"+i+".jpg>");
		$(img).attr('id',"image-"+i);
		$(img).addClass('slider').addClass('notSelected').appendTo($("#slider"));
	}
	$("#image-1").removeClass('notSelected');
	$("#image-1").addClass('selected');
	$("li #1").removeClass('inactive')
	$("li #1").addClass('active');

}