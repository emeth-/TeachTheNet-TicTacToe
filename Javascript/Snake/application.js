
//Params

ROWS = 40;
COLUMNS = 40;


function draw_board(x,y){
	var grid=[];
	for(var i=0; i<y;i++){
		for(var j=0;j<x;j++){
			grid[i][j]='xxxxxx';
		}
	}
	$('#content').html(grid);
}

$(document).ready(function(){
	$('#content').find('#logo').append('<img src="images/pizzaLogo.jpg" />');
	draw_board(ROWS,COLUMNS);
	$('#content').append('fasdfdafdf');
});

