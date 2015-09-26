$(document).ready(function(){
    var turnCount=0;
    var o_move_two = "";
    
        //PLAYER MOVE
      $('#board').find('td').on('click', function(){
            if (turnCount % 2 === 1){
                //player made a move
                if (turnCount == 1) {
                    o_move_two = $(this).attr('id');
                }
                $(this).text('O');
                checkVictory('O');
                turnCount++;
            } else {
                //do nothing, computer's turn
            }
          
      });

      //COMPUTER AI MOVE
      setInterval(function(){
            if (turnCount % 2 === 1){
                //do nothing, player's turn
            } else if ($('#newGame').hasClass('invisible')){
                //do nothing, computer's turn

                //MAKE MOVE FOR COMPUTER

                
                
                console.log("turnCount", turnCount)
                //computer move 2
                var move_found = false;
                
                
                
                //TRY TO GET 3 IN A ROW
                    
                //Horitzontal, top row [X, X, blank]
                if ($('#board').find('#1').text() == "X" && $('#board').find('#2').text() == "X" && $('#board').find('#3').text() == "") {
                    $('#board').find('#3').text('X');
                    move_found = true;
                }
                
                //Horitzontal, top row [X, blank, X]
                else if ($('#board').find('#1').text() == "X" && $('#board').find('#3').text() == "X" && $('#board').find('#2').text() == "") {
                    $('#board').find('#2').text('X');
                    move_found = true;
                }
                
                //Horitzontal, top row [blank, X, X]
                else if ($('#board').find('#2').text() == "X" && $('#board').find('#3').text() == "X" && $('#board').find('#1').text() == "") {
                    $('#board').find('#1').text('X');
                    move_found = true;
                }
                
                //Horitzontal, middle row [blank, X, X]
                else if ($('#board').find('#4').text() == "" && $('#board').find('#5').text() == "X" && $('#board').find('#6').text() == "X") {
                    $('#board').find('#4').text('X');
                    move_found = true;
                }
                //Horitzontal, middle row [X, blank, X]
                else if ($('#board').find('#4').text() == "X" && $('#board').find('#5').text() == "" && $('#board').find('#6').text() == "X") {
                    $('#board').find('#5').text('X');
                    move_found = true;
                }
                //Horitzontal, middle row [X, X, blank]
                else if ($('#board').find('#4').text() == "X" && $('#board').find('#5').text() == "X" && $('#board').find('#6').text() == "") {
                    $('#board').find('#6').text('X');
                    move_found = true;
                }
                
                //Horitzontal, bottom row [blank, X, X]
                else if ($('#board').find('#7').text() == "" && $('#board').find('#8').text() == "X" && $('#board').find('#9').text() == "X") {
                    $('#board').find('#7').text('X');
                    move_found = true;
                }
                
                //Horitzontal, bottom row [X, blank, X]
                else if ($('#board').find('#7').text() == "X" && $('#board').find('#8').text() == "" && $('#board').find('#9').text() == "X") {
                    $('#board').find('#8').text('X');
                    move_found = true;
                }
                
                //Horitzontal, bottom row [X, X, blank]
                else if ($('#board').find('#7').text() == "X" && $('#board').find('#8').text() == "X" && $('#board').find('#9').text() == "") {
                    $('#board').find('#9').text('X');
                    move_found = true;
                }
                    
                //Vertical, first column [X, X, blank]
                else if ($('#board').find('#1').text() == "X" && $('#board').find('#4').text() == "X" && $('#board').find('#7').text() == "") {
                    $('#board').find('#7').text('X');
                    move_found = true;
                }
                
                //Vertical, first column [X, blank, X]
                else if ($('#board').find('#1').text() == "X" && $('#board').find('#4').text() == "" && $('#board').find('#7').text() == "X") {
                    $('#board').find('#4').text('X');
                    move_found = true;
                }
                
                //Vertical, first column [blank, X, X]
                else if ($('#board').find('#1').text() == "" && $('#board').find('#4').text() == "X" && $('#board').find('#7').text() == "X") {
                    $('#board').find('#1').text('X');
                    move_found = true;
                }
                
                //Vertical, second column [X, X, blank]
                else if ($('#board').find('#2').text() == "X" && $('#board').find('#5').text() == "X" && $('#board').find('#8').text() == "") {
                    $('#board').find('#8').text('X');
                    move_found = true;
                }
                
                //Vertical, second column [X, blank, X]
                else if ($('#board').find('#2').text() == "X" && $('#board').find('#5').text() == "" && $('#board').find('#8').text() == "X") {
                    $('#board').find('#5').text('X');
                    move_found = true;
                }
                
                //Vertical, second column [blank, X, X]
                else if ($('#board').find('#2').text() == "" && $('#board').find('#5').text() == "X" && $('#board').find('#8').text() == "X") {
                    $('#board').find('#2').text('X');
                    move_found = true;
                }
                
                //Vertical, third column [X, X, blank]
                else if ($('#board').find('#3').text() == "X" && $('#board').find('#6').text() == "X" && $('#board').find('#9').text() == "") {
                    $('#board').find('#9').text('X');
                    move_found = true;
                }
                
                //Vertical, third column [X, blank, X]
                else if ($('#board').find('#3').text() == "X" && $('#board').find('#6').text() == "" && $('#board').find('#9').text() == "X") {
                    $('#board').find('#6').text('X');
                    move_found = true;
                }
                
                //Vertical, third column [blank, X, X]
                else if ($('#board').find('#3').text() == "" && $('#board').find('#6').text() == "X" && $('#board').find('#9').text() == "X") {
                    $('#board').find('#3').text('X');
                    move_found = true;
                }
                
                //diaganol, starting top left, [blank, x, x]
                else if ($('#board').find('#1').text() == "" && $('#board').find('#5').text() == "X" && $('#board').find('#9').text() == "X") {
                    $('#board').find('#1').text('X');
                    move_found = true;
                }
                
                //diaganol, starting top left, [x, blank, x]
                else if ($('#board').find('#1').text() == "X" && $('#board').find('#5').text() == "" && $('#board').find('#9').text() == "X") {
                    $('#board').find('#5').text('X');
                    move_found = true;
                }
                
                //diaganol, starting top left, [x, x, blank]
                else if ($('#board').find('#1').text() == "X" && $('#board').find('#5').text() == "X" && $('#board').find('#9').text() == "") {
                    $('#board').find('#9').text('X');
                    move_found = true;
                }
                
                //diaganol, starting top right, [blank, x, x]
                else if ($('#board').find('#3').text() == "" && $('#board').find('#5').text() == "X" && $('#board').find('#7').text() == "X") {
                    $('#board').find('#3').text('X');
                    move_found = true;
                }
                
                //diaganol, starting top right, [x, blank, x]
                else if ($('#board').find('#3').text() == "X" && $('#board').find('#5').text() == "" && $('#board').find('#7').text() == "X") {
                    $('#board').find('#5').text('X');
                    move_found = true;
                }
                
                //diaganol, starting top right, [x, x, blank]
                else if ($('#board').find('#3').text() == "X" && $('#board').find('#5').text() == "X" && $('#board').find('#7').text() == "") {
                    $('#board').find('#7').text('X');
                    move_found = true;
                }
                
                
                //BLOCK O
                if (!move_found) {
                    //Horitzontal, top row [X, X, blank]
                    if ($('#board').find('#1').text() == "O" && $('#board').find('#2').text() == "O" && $('#board').find('#3').text() == "") {
                        $('#board').find('#3').text('X');
                        move_found = true;
                    }
                    
                    //Horitzontal, top row [X, blank, X]
                    else if ($('#board').find('#1').text() == "O" && $('#board').find('#3').text() == "O" && $('#board').find('#2').text() == "") {
                        $('#board').find('#2').text('X');
                        move_found = true;
                    }
                    
                    //Horitzontal, top row [blank, X, X]
                    else if ($('#board').find('#2').text() == "O" && $('#board').find('#3').text() == "O" && $('#board').find('#1').text() == "") {
                        $('#board').find('#1').text('X');
                        move_found = true;
                    }
                    
                    //Horitzontal, middle row [blank, X, X]
                    else if ($('#board').find('#4').text() == "" && $('#board').find('#5').text() == "O" && $('#board').find('#6').text() == "O") {
                        $('#board').find('#4').text('X');
                        move_found = true;
                    }
                    //Horitzontal, middle row [X, blank, X]
                    else if ($('#board').find('#4').text() == "O" && $('#board').find('#5').text() == "" && $('#board').find('#6').text() == "O") {
                        $('#board').find('#5').text('X');
                        move_found = true;
                    }
                    //Horitzontal, middle row [X, X, blank]
                    else if ($('#board').find('#4').text() == "O" && $('#board').find('#5').text() == "O" && $('#board').find('#6').text() == "") {
                        $('#board').find('#6').text('X');
                        move_found = true;
                    }
                    
                    //Horitzontal, bottom row [blank, X, X]
                    else if ($('#board').find('#7').text() == "" && $('#board').find('#8').text() == "O" && $('#board').find('#9').text() == "O") {
                        $('#board').find('#7').text('X');
                        move_found = true;
                    }
                    
                    //Horitzontal, bottom row [X, blank, X]
                    else if ($('#board').find('#7').text() == "O" && $('#board').find('#8').text() == "" && $('#board').find('#9').text() == "O") {
                        $('#board').find('#8').text('X');
                        move_found = true;
                    }
                    
                    //Horitzontal, bottom row [X, X, blank]
                    else if ($('#board').find('#7').text() == "O" && $('#board').find('#8').text() == "O" && $('#board').find('#9').text() == "") {
                        $('#board').find('#9').text('X');
                        move_found = true;
                    }
                        
                    //Vertical, first column [X, X, blank]
                    else if ($('#board').find('#1').text() == "O" && $('#board').find('#4').text() == "O" && $('#board').find('#7').text() == "") {
                        $('#board').find('#7').text('X');
                        move_found = true;
                    }
                    
                    //Vertical, first column [X, blank, X]
                    else if ($('#board').find('#1').text() == "O" && $('#board').find('#4').text() == "" && $('#board').find('#7').text() == "O") {
                        $('#board').find('#4').text('X');
                        move_found = true;
                    }
                    
                    //Vertical, first column [blank, X, X]
                    else if ($('#board').find('#1').text() == "" && $('#board').find('#4').text() == "O" && $('#board').find('#7').text() == "O") {
                        $('#board').find('#1').text('X');
                        move_found = true;
                    }
                    
                    //Vertical, second column [X, X, blank]
                    else if ($('#board').find('#2').text() == "O" && $('#board').find('#5').text() == "O" && $('#board').find('#8').text() == "") {
                        $('#board').find('#8').text('X');
                        move_found = true;
                    }
                    
                    //Vertical, second column [X, blank, X]
                    else if ($('#board').find('#2').text() == "O" && $('#board').find('#5').text() == "" && $('#board').find('#8').text() == "O") {
                        $('#board').find('#5').text('X');
                        move_found = true;
                    }
                    
                    //Vertical, second column [blank, X, X]
                    else if ($('#board').find('#2').text() == "" && $('#board').find('#5').text() == "O" && $('#board').find('#8').text() == "O") {
                        $('#board').find('#2').text('X');
                        move_found = true;
                    }
                    
                    //Vertical, third column [X, X, blank]
                    else if ($('#board').find('#3').text() == "O" && $('#board').find('#6').text() == "O" && $('#board').find('#9').text() == "") {
                        $('#board').find('#9').text('X');
                        move_found = true;
                    }
                    
                    //Vertical, third column [X, blank, X]
                    else if ($('#board').find('#3').text() == "O" && $('#board').find('#6').text() == "" && $('#board').find('#9').text() == "O") {
                        $('#board').find('#6').text('X');
                        move_found = true;
                    }
                    
                    //Vertical, third column [blank, X, X]
                    else if ($('#board').find('#3').text() == "" && $('#board').find('#6').text() == "O" && $('#board').find('#9').text() == "O") {
                        $('#board').find('#3').text('X');
                        move_found = true;
                    }
                    
                    //diaganol, starting top left, [blank, x, x]
                    else if ($('#board').find('#1').text() == "" && $('#board').find('#5').text() == "O" && $('#board').find('#9').text() == "O") {
                        $('#board').find('#1').text('X');
                        move_found = true;
                    }
                    
                    //diaganol, starting top left, [x, blank, x]
                    else if ($('#board').find('#1').text() == "O" && $('#board').find('#5').text() == "" && $('#board').find('#9').text() == "O") {
                        $('#board').find('#5').text('X');
                        move_found = true;
                    }
                    
                    //diaganol, starting top left, [x, x, blank]
                    else if ($('#board').find('#1').text() == "O" && $('#board').find('#5').text() == "O" && $('#board').find('#9').text() == "") {
                        $('#board').find('#9').text('X');
                        move_found = true;
                    }
                    
                    //diaganol, starting top right, [blank, x, x]
                    else if ($('#board').find('#3').text() == "" && $('#board').find('#5').text() == "O" && $('#board').find('#7').text() == "O") {
                        $('#board').find('#3').text('X');
                        move_found = true;
                    }
                    
                    //diaganol, starting top right, [x, blank, x]
                    else if ($('#board').find('#3').text() == "O" && $('#board').find('#5').text() == "" && $('#board').find('#7').text() == "O") {
                        $('#board').find('#5').text('X');
                        move_found = true;
                    }
                    
                    //diaganol, starting top right, [x, x, blank]
                    else if ($('#board').find('#3').text() == "O" && $('#board').find('#5').text() == "O" && $('#board').find('#7').text() == "") {
                        $('#board').find('#7').text('X');
                        move_found = true;
                    }
                }



                //Clinch Attack
                if (!move_found) {
                    if (turnCount == 0) {
                        $('#board').find('#1').text('X');
                        move_found = true;
                    }
                    else if (turnCount == 2) {
                        //X's second turn
                        if ($('#board').find('#4').text() == 'O'){
                            $('#board').find('#3').text('X');
                            move_found = true;
                        }
                        else if ($('#board').find('#6').text() == 'O'){
                            $('#board').find('#3').text('X');
                            move_found = true;
                        }
                        else if ($('#board').find('#7').text() == 'O'){
                            $('#board').find('#3').text('X');
                            move_found = true;
                        }
                        else if ($('#board').find('#2').text() == 'O'){
                            $('#board').find('#7').text('X');
                            move_found = true;
                        }
                        else if ($('#board').find('#3').text() == 'O'){
                            $('#board').find('#7').text('X');
                            move_found = true;
                        }
                        else if ($('#board').find('#5').text() == 'O'){
                            $('#board').find('#7').text('X');
                            move_found = true;
                        }
                        else if ($('#board').find('#8').text() == 'O'){
                            $('#board').find('#7').text('X');
                            move_found = true;
                        }
                        else if ($('#board').find('#9').text() == 'O'){
                            $('#board').find('#7').text('X');
                            move_found = true;
                        }
    
                    }
                    else if (turnCount == 4) {
                        if (o_move_two == 8) {
                            $('#board').find('#3').text('X');
                            move_found = true;
                        }
                        else if (o_move_two == 9) {
                            $('#board').find('#3').text('X');
                            move_found = true;
                        }else if (o_move_two == 8) {
                            $('#board').find('#3').text('X');
                            move_found = true;
                        }else if (o_move_two == 6) {
                            $('#board').find('#7').text('X');
                            move_found = true;
                        }else if (o_move_two == 2) {
                            $('#board').find('#9').text('X');
                            move_found = true;
                        }else if (o_move_two == 3) {
                            $('#board').find('#9').text('X');
                            move_found = true;
                        }else if (o_move_two == 4) {
                            $('#board').find('#9').text('X');
                            move_found = true;
                        }else if (o_move_two == 7) {
                            $('#board').find('#9').text('X');
                            move_found = true;
                        }
                    }
                }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                

                //No intelligent move found, just move to the first open space
                if (!move_found) {
                    if ($('#board').find('#1').text() == ''){
                        $('#board').find('#1').text('X');
                        move_found = true;
                    }
                    else if ($('#board').find('#2').text() == ''){
                        $('#board').find('#3').text('X');
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
      }, 200);
     
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
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
        document.location.href=document.location.href;
    });

});