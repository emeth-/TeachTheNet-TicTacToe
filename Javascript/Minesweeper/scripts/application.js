function draw_board(x,y){
    //first draw the background
    var header=$('.gameBoard').find("#header");
    //http://www.chezpoor.com/minesweeper/images/bordertr.gif
    header.append('<td><img id="tableBorder" src="http://www.chezpoor.com/minesweeper/images/bordertl.gif"></td>');
    for (var i=0; i<x; i++){
        //this adds in the border
        header.append('<td><img id="tableBorder" src="http://www.chezpoor.com/minesweeper/images/bordertb.gif"></td>');
    }
       header.append('<td><img id="tableBorder" src="http://www.chezpoor.com/minesweeper/images/bordertr.gif"></td></tr>');
    
    //header row finished above. Now draw the actual cells
    
     header.parent().last().append('<tr class="left" id ="cell"><td><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderlr.gif"></td>');
    for(var i=0; i<x;i++){
        header.parent().find("#cell").last().append('<td class="cell blank" id='+(i+1)+'><img src="http://www.chezpoor.com/minesweeper/images/blank.gif"</td>');
    }
    header.parent().find("#cell").last().append('<td class="right" id="cell"><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderlr.gif"></td></tr>');

    //draw body
    var counter=y+1;
    for(var j=0;j<y-1;j++){
        
         header.parent().last().append('<tr class="left" id ="cell"><td><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderlr.gif"></td>');
        for(var i=0; i<x;i++){
            var newCount=i+counter;
            header.parent().last().find(".left").last().append('<td class="cell blank" id='+newCount+'><img src="http://www.chezpoor.com/minesweeper/images/blank.gif"></td>');
        }
        counter+=y;
        header.parent().last().find(".left").last().append('<td id="right"><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderlr.gif"></td></tr>');    
    }
    
    //draw bottom border
        header.parent().last().append('<tr class="left" id ="cell"><td><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderbl.gif"></td>'); 
        for (var i=0; i<x; i++){
            //this adds in the border
            header.parent().last().find(".left").last().append('<td><img id="bottomBorder" src="http://www.chezpoor.com/minesweeper/images/bordertb.gif"></td>');
        }
       header.parent().last().find(".left").last().append('<td><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderbr.gif"></td></tr>');   
}

function makeBombs(x,y){
    //after the board is generated, randomly place bombs onto the board
    var numBombs = (x*y)/10;
    alert('Number of bombs: '+numBombs);
    (function makeBomb(){
        var rand=0;
        for (var i=1;i<numBombs+1;i++){
            rand=Math.floor(Math.random() * (x*y)) + 1;
            var cell = $('.gameBoard').find('#'+rand);
            if (cell.hasClass('bomb')){
                makeBomb();
            } else {
                cell.addClass('bomb');   
            }
            rand=0;
            
            
        }
    })();
}


function checkCell(id){
    //this function checks whether a box that was clicked contains a bomb or not
    cell = $('.gameBoard').find('#'+id);
    if (cell.hasClass('bomb')){
           
    } else if (cell.hasClass('blank')){
        $(cell).removeClass('blank');
        $(cell).text(''); 
        $(cell).addClass('clicked');
    }
}




$(document).ready(function(){
    
        
    document.oncontextmenu = function() {return false;}; // disable right click menu


    draw_board(10,10); 
    makeBombs(10,10);
    
    //play game
    //right click check
    $(".left").find('td').on('mousedown',function(e){
      if( e.button == 2 ) {
          if($(this).hasClass('blank')){
              $(this).removeClass('blank');
              $(this).addClass('flag');
              $(this).text('');
              $(this).append('<img src="http://www.chezpoor.com/minesweeper/images/bombflagged.gif">'); //add flag if it's blank
          } else if($(this).hasClass('flag')) {
              $(this).removeClass('flag');
              $(this).addClass('blank');
              $(this).text('');
              $(this).append('<img src="http://www.chezpoor.com/minesweeper/images/blank.gif">'); //back to blank
          }
      }
    });
    
    //left click check
     $(".left").find('td').on('mousedown',function(e){
          if( e.button === 0 ) {
              checkCell($(this).attr('id'));
          }
     });
   
    
    
});