
//Params

ROWS = 40;
COLUMNS = 40;
WIDTH= Math.floor($(window).width()/COLUMNS);
HEIGHT=Math.floor($(window).height()/ROWS);


function draw_board(x,y){

	var $container = $("<div></div>").css("float","left");

	for(var i = 0; i < x; i++) {
	    for (var j = 0; j < y; j++){
	        $("<div></div>").addClass("box").appendTo($container);
	    }
	    $("<div></div>").css("clear", "both").appendTo($container);
	}

	$container.appendTo($("body"));
}

$(document).ready(function(){
	draw_board(40,40);
});

