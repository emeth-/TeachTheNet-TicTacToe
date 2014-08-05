
//Params
LEFT=37;
RIGHT=39;
UP=38;
DOWN=40;
SNAKE=[];

function draw_board(x,y){
	var count=0;
	var $container = $("<div></div>").css("float","left");

	for(var i = 0; i < x; i++) {
	    for (var j = 0; j < y; j++){
	        $("<div id="+(j+1+count)+"></div>").addClass("box").appendTo($container);
	    }
	    count+=40;
	    $("<div id="+(i+1)+"></div>").css("clear", "both").appendTo($container);
	}

	$container.appendTo($("#content"));
}

function draw_snake(){
	//initialize the snake on div #580 (pretty close to center)
	$("#content").find("#580").addClass('snakeHead');
	//Initialize a 3 unit snake
	$("#content").find("#579").addClass('snake');
	$("#content").find("#578").addClass('snake');

	//push divs into SNAKE array
	SNAKE.push(578);
	SNAKE.push(579);
	SNAKE.push(580);
}

function play_game(){
	genFruit();
	move_snake();
}

function genFruit(){
	var fruitID = Math.floor(Math.random()*1600)+1;
	$("#content").find("#"+fruitID).addClass('fruit');
}

function move_snake(){
	$(document).keydown(function(event) {
		if(event.which == RIGHT){
			move('r');
		} else if (event.which == LEFT) {
			move('l');
		} else if (event.which == UP){
			move('u');
		} else if (event.which == DOWN){
			move('d');
		}
	});
	var move = function(dir){
		var currentID = SNAKE[SNAKE.length-1];

		switch(dir) {
			case 'r':
				var nextID = currentID+1;
				break;
			case 'l':
				var nextID = currentID-1;
				break;
			case 'u':
				var nextID = currentID-40;
				break;
			case 'd':
				var nextID = currentID+40;
				break;
		}

		var tail = 0;
		//check whether the SNAKE has hit a 'fruit'
		if ($("#"+nextID).hasClass("fruit")){
			tail = SNAKE[0];
			$("#"+nextID).removeClass('fruit');
			genFruit();	 //generate a new fruit piece
		}

		//update SNAKE array
		for (var i=0;i<SNAKE.length;i++){
			//remove snake from [i]
			$("#"+SNAKE[i]).removeClass('snake');
			SNAKE[i]=SNAKE[i+1];
		}
		if (tail !== 0){
			SNAKE.unshift(tail);
		}

		for (var i=0; i<SNAKE.length; i++){
			$("#"+SNAKE[i]).addClass('snake');
		}
		SNAKE[SNAKE.length-1] = nextID;
		$("#"+nextID).addClass('snakeHead');
		$("#"+currentID).removeClass('snakeHead');	
	};
}



$(document).ready(function(){
	draw_board(40,40);
	draw_snake();
	play_game();
});

