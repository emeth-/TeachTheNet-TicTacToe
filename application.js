$(document).ready(function(){
    var turnCount=0;
    
      $('#board').find('td').on('click', function(){
            if (turnCount % 2 === 1){
                //player made a move
                $(this).text('O');
                checkVictory('O');
                turnCount++;
            } else {
                //do nothing, computer's turn
            }
          
      });

      setInterval(function(){
            if (turnCount % 2 === 1){
                //do nothing, player's turn
            } else if ($('#newGame').hasClass('invisible')){
                //do nothing, computer's turn

                //MAKE MOVE FOR COMPUTER

                //computer move 2
                var move_found = false;
                if (turnCount == 1) {
                    if ($('#board').find('#2').text() == 'O'){
                        $('#board').find('#7').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#4').text() == 'O' || $('#board').find('#6').text() == 'O'){
                        $('#board').find('#2').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#4').text() == 'O' || $('#board').find('#6').text() == 'O'){
                        $('#board').find('#2').text('X');
                        move_found = true;
                    }
                }

                //No intelligent move found, just move to the first open space
                if (move_found == false) {
                    if ($('#board').find('#1').text() == ''){
                        $('#board').find('#1').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#2').text() == ''){
                        $('#board').find('#2').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#3').text() == ''){
                        $('#board').find('#3').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#4').text() == ''){
                        $('#board').find('#4').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#5').text() == ''){
                        $('#board').find('#5').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#6').text() == ''){
                        $('#board').find('#6').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#7').text() == ''){
                        $('#board').find('#7').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#8').text() == ''){
                        $('#board').find('#8').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#9').text() == ''){
                        $('#board').find('#9').text('X');
                        move_found = true;
                    }
                }
                if (move_found) {
                    checkVictory('X');
                    turnCount++;
                }
            }
      }, 2000);
     
    
    function checkVictory(player){
       //top row check
        if ($('#board').find('#1').text() !== ''){
            if ($('#board').find('#1').text() == $('#board').find('#2').text()) {
                if ($('#board').find('#1').text() == $('#3').text()) {
                    alert('Game over! '+player+' is the winner!');
                    $('#newGame').removeClass('invisible');
                }
            }
        //left column check
            if ($('#board').find('#1').text() == $('#board').find('#4').text()) {
                if ($('#board').find('#1').text() == $('#7').text()) {
                    alert('Game over! '+player+' is the winner!');
                    $('#newGame').removeClass('invisible');
                }
            }
        //left diagonal check
            if ($('#board').find('#1').text() == $('#board').find('#5').text()) {
                if ($('#board').find('#1').text() == $('#9').text()) {
                    alert('Game over! '+player+' is the winner!');
                    $('#newGame').removeClass('invisible');
                }
            }    
        }
        
       //middle column check
        if ($('#board').find('#2').text() !== ''){
            if ($('#board').find('#2').text() == $('#board').find('#5').text()) {
                if ($('#board').find('#2').text() == $('#8').text()) {
                    alert('Game over! '+player+' is the winner!');
                    $('#newGame').removeClass('invisible');
                }
            }
        }
        
        //right column check
        if ($('#board').find('#3').text() !== ''){
            if ($('#board').find('#3').text() == $('#board').find('#6').text()) {
                if ($('#board').find('#3').text() == $('#9').text()) {
                    alert('Game over! '+player+' is the winner!');
                    $('#newGame').removeClass('invisible');
                }
            }
            //right diag check
            if ($('#board').find('#3').text() == $('#board').find('#5').text()) {
                if ($('#board').find('#3').text() == $('#7').text()) {
                    alert('Game over! '+player+' is the winner!');
                    $('#newGame').removeClass('invisible');
                }
            }
        }
        
        //middle row check
        
        if ($('#board').find('#4').text() !== ''){
            if ($('#board').find('#4').text() == $('#board').find('#5').text()) {
                if ($('#board').find('#4').text() == $('#6').text()) {
                    alert('Game over! '+player+' is the winner!');
                    $('#newGame').removeClass('invisible');
                }
            }
        }
        
        //bottom row check
        if ($('#board').find('#7').text() !== ''){
            if ($('#board').find('#7').text() == $('#board').find('#8').text()) {
                if ($('#board').find('#7').text() == $('#9').text()) {
                    alert('Game over! '+player+' is the winner!');
                    $('#newGame').removeClass('invisible');
                }
            }
        }        
  
    }
    $('#newGame').on('click',function(){
        $('.square').text('');
    });

});