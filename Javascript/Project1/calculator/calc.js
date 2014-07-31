var numbers=[];
var calc=[];
var result=0;

var add = function(n1,n2){
    return n1+n2;
};
var subtract = function(n1,n2){
    return n1-n2;
};
var multiply = function(n1,n2){
    return n1*n2;
};
var divide = function(n1,n2){
    return n1/n2;
};


var buttonPress = function(){
    var text= $(this).text();
    numbers.push(text);
};

var symPress = function(){
    getNum();
    var text = $(this).text();
    calc.push(text);
};

var getNum = function(){
    if (numbers.length > 0){
        var n = parseFloat(numbers.join(''));
        calc.push(n);
        numbers=[];
    }
};

var pressEqual = function(){
    getNum();
    //After the above getNum, you hsave something like:
    //[83,*,2] , [1, +, 3], etc.
   
    if (calc[1] === '+'){
        result = add(calc[0], calc[2]);
    } else if (calc[1] === '_'){
        result = subtract(calc[0], calc[2]);
    } else if (calc[1] === '*'){
        result = multiply(calc[0], calc[2]);
    } else if (calc[1] === '/'){
        result = divide(calc[0], calc[2]);
    }      
    var output = (calc[0] + " " + calc[1] + " " + calc[2] + " " + "=" + " " + result);   
    var answer = document.getElementById('answer');
    answer.style.visibility='visible';
    answer.innerHTML = output;
    pressClear();
    
};

var pressClear=function(){
    numbers=[];
    calc=[];
    result=0;
};


$('.num').click(buttonPress);
$('.sym').click(symPress);
$('#equal').click(pressEqual);
$('#clear').click(pressClear);

/*
$(document).ready(function() {
    $('button[id=num]').each(function() {
        var tmp=$(this).text();
        $(this).click(function(){
            console.log(tmp);
        });   
    });
});
*/