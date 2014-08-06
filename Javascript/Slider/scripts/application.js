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

		$(this).removeClass('inactive');
		$(this).addClass('active');
	
		$("li img.active").attr('src','images/button1.png');
		$("li img.inactive").attr('src','images/button2.png');

		//show the correct image in the slider, corresponding to the nav button
		var navID = $(this).attr('id');
		$('#slider').children('img').removeClass('selected');
		$('#slider').children('img').addClass('notSelected');

		$("#image-"+navID).removeClass('notSelected');
		$("#image-"+navID).addClass('selected');
	});
	



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

	$("li img.active").attr('src','images/button1.png');
	$("li img.inactive").attr('src','images/button2.png');

}