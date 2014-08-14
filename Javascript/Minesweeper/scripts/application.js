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
    
     header.parent().last().append('<tr id ="cell"><td><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderlr.gif"></td>');
    for(var i=0; i<x;i++){
        header.parent().find("#cell").last().append('<td class="cell blank" id='+i+'><img src="http://www.chezpoor.com/minesweeper/images/blank.gif"</td>');
    }
    header.parent().find("#cell").last().append('<td class="right" id="cell"><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderlr.gif"></td></tr>');

    //draw body
    for(var j=0;j<y-1;j++){
         header.parent().last().append('<tr class="left" id ="cell"><td><img id="leftRightBorder" src="http://www.chezpoor.com/minesweeper/images/borderlr.gif"></td>');
        for(var i=0; i<x;i++){
            header.parent().last().find(".left").last().append('<td class="cell blank" id='+i+'><img src="http://www.chezpoor.com/minesweeper/images/blank.gif"></td>');
        }
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





$(document).ready(function(){
    
        
    document.oncontextmenu = function() {return false;}; // disable right click menu


    draw_board(10,10); 
    
    //play game
    //right click check
    $(".left").find('td').on('mousedown',function(e){
      if( e.button == 2 ) {
          if($(this).hasClass('blank')){
              $(this).removeClass('blank');
              $(this).addClass('flag');
              $(this).text('');
              $(this).append('<img src="http://www.chezpoor.com/minesweeper/images/bombflagged.gif">'); //add flag if it's blank
          } else {
              $(this).removeClass('flag');
              $(this).addClass('blank');
              $(this).text('');
              $(this).append('<img src="http://www.chezpoor.com/minesweeper/images/blank.gif">'); //back to blank
          }
      }
    });
   
    
    
});