/*
File created 11/1 by Gavin A
File edited 11/2 by Gavin A: Added the evaluate expression function
File edited 11/2 by Roberto D: Added add, mAdd, exponentiation functions
File edited 11/3 by Gavin A: Removed the evaluateExpr function and added the modules export as an array, added javadoc styled comments
File edited 11/3 by Quantez Merchant: Added memory methods and memory array  
File edited 11/9 by Gavin A: Added event listeners for each button
File edited 11/3 by Amyas Dawson: added formal comments and worked on history, subtraction, and clear methods
File edited 11/9 by Quantez Merchant: Made numberOps show up on display 
File edited 11/9 by Roberto D: Fixed mAdd mSub not updating memory display
File edited 11/9 by Gavin A: Removed duplicate method
File edited 11/9 by Amyas D: added methods to module export for testing
*/

/* Created 11/3 by Quantez Merchant 
*/
var memarr = [];
var historyarr = [];

// Regular operators

/* Created 11/2 by Roberto D
        @requires: operand1 and operand2 are numbers
        @param operand1: first operand in addition operation
        @param operand2: second operand in addition operation
        @return: the sum of operand1 and operand2
    Adds operand1 + operand2 and returns the sum */
function add(operand1, operand2) {
    return operand1 + operand2;
}

/* Created 11/2 by Amyas D 
    Performs subtraction operation. Takes two real numbers (from GUI button presses) as formal parameters
    @requires: num1 and num2 are numbers
    @param num1: first number in expression
    @param num2: second number in express
    @return: the difference of num1-num2
*/
function subtraction (num1, num2) {
    return num1 - num2;
}

/* Created 11/2 by Roberto D
        Edited 11/9 by Roberto D: Fixing mAdd not updating memory display
        @requires: base and exponent are numbers
        @param base: base operand in exponenientaiton operation
        @param exponent: exponent operand in exponentiation operation
        @return: the power of base ^ exponent   
    Raises base to exponent and returns the power */
function powOf(base, exponent) {
    return base ** exponent;
}

/* Created 11/1 by Gavin A
    Multiplies two values together and returns the product
        @requires: x and y are numbers
        @param x: The first number to be multiplied
        @param y: The second number to be multiplied
        @return: the product of x and y
*/
function multiply(x, y) {
    return x * y;
}

/* Created 11/9 by Quantez Merchant 
  Performs division operation.
      @requires: leftOp and rightOp are numbers
      @param leftOp: first number in expression
      @param rightOp: second number in expression
      @return: the result of leftOp/rightOp
*/
function division(leftOp,rightOp){
  return leftOp/rightOp;
}

/* Created 11/8 by Roberto D
    Clears the current entry on the calculator
*/
function clearEntry () {
    document.getElementById("display").value = "0";
}

/* Created 11/3 by Amyas D 
    Edited 11/9 by Gavin A: Removed the display param
    Clears the calculator display
*/
function clear () {
    document.getElementById("display").value = "0";
    document.getElementById("expdisp").innerHTML = "";
}

// Memory functions

/* Created 11/2 by Gavin A 
    Edited 11/3 by Quantez M: 
    Adds a number to the memory array such that memarr[0] = num
        @requires: num and each entry in memarr are numbers
        @param num: The number to be pushed to the 0th index of the memory array    */
function mPush() {
    memarr.unshift(document.getElementById("display").value);
    document.getElementById("memory").innerHTML =  memarr[0] + " <br>" + document.getElementById("memory").innerHTML; 
}

/* Created 11/2 by Gavin A 
   Edited 11/3 by Gavin A: Fixed error returning an undefined value 
   Edited 11/9 by Gavin A: Removed unnecessary return val
   Edited 11/9 by Roberto D: Fixing mSub not changing display
   
   Replaces the first value of the memory array with itself minus 
        @requires: num and each entry in memarr are numbers
        @param num: The number to be pushed to the 0th index of the memory array*/
function mSub(num) {
    memarr.unshift(memarr.shift() - num);
    document.getElementById("memory").innerHTML = memarr[0] + " <br>" + document.getElementById("memory").innerHTML;
}

/* Created 11/3 by Amyas D
    Will add every entered equation to the history
        @param historyArray: array holding strings of equations that will be stored
        @param expression: a string representing an expression of two numbers
        @param answer: a string representing the solution to an expression once the '=' sign has been pressed
*/
function addToHistory () {
    var str = document.getElementById("expdisp").innerHTML + " = " + document.getElementById("display").value;
    historyarr.push(str);
    document.getElementById("history").innerHTML += str + " <br>"; 
}

/* Created 11/3 by Quantez Merchant 
    Clears all of the memory currently being stored  
*/
 function memoryClear(){
    memarr.length = 0;
    document.getElementById("memory").innerHTML = "";
  }

    /* Created 11/2 by Roberto D
        Edited 11/9 by Roberto D: Fixing mAdd not doing anything
        @requires: memarr length > 0 and currentOperand is number
        @param currentOperand: operand being added to first value in memarr
        @return: the sum of currentOperand and first value in memarr
    Adds most recent memory number to current num */
    function mAdd(currentOperand) {
        memarr.unshift(parseFloat(currentOperand) + parseFloat(memarr.shift()));
        document.getElementById("memory").innerHTML = memarr[0] +  " <br>" + document.getElementById("memory").innerHTML; 
    }
    
/* Created 11/3 by Quantez Merchant 
  Edited 11/9 by Gavin A: Switched index to 0 as that is where the most recent stored val is kept
    Displays the most recently stored value in memory 
*/
  function memoryRecall(){
    document.getElementById("display").value = memarr[0];
  }

 
  /* Created 11/9 by Quantez Merchant 
    Decides which operator function to call */  
function equate(){
    var str = document.getElementById("display").value;
    document.getElementById("expdisp").innerHTML = str;
    var oparr = str.match(/(?<=\D|)\/|\+|\*|\^|\b\-/g);
    var numarr = str.match(/(?<=\D|^)-?[0-9.]+/g);
    var left = parseFloat(numarr[0],10);
    for(let i = 1; i < numarr.length; i++){
        var right = parseFloat(numarr[i],10);
        if(oparr[i-1] == "/"){
            left = division(left,right);
        }else if (oparr[i-1] == "+"){
            left = add(left,right);
        }else if (oparr[i-1] == "*"){
            left = multiply(left,right);
        }else if (oparr[i-1] == "-"){
            left = subtraction(left,right);
        }else{
            left = powOf(left,right);
        }
    }
    document.getElementById("display").value = left;
    addToHistory();
}


// Backend functions

/* Created 11/9 by Gavin A 
   Concats a digit to the end of the display string
        @requires: @digit is a single digit integer
        @param digit: The first number to be multiplied */
function appendDigit(button) {
    value = button.innerHTML
    if(document.getElementById("display").value[0] == 0) { document.getElementById("display").value = ""; }
    document.getElementById("display").value += value;
}

/* Created 11/9 by Quantez Merchant 
      Edited 11/9 by Roberto D: Fixed mButtons not updating memory display
    Sets up event listeners for the memory operator buttons to respond when clicked
*/
var mButtons = document.getElementsByName('memory');
mButtons[0].addEventListener('click', memoryClear);
mButtons[1].addEventListener('click', memoryRecall);
mButtons[2].addEventListener('click', mPush);
mButtons[3].addEventListener('click', function() { mAdd(document.getElementById("display").value)});
mButtons[4].addEventListener('click', function() { mSub(document.getElementById("display").value)});

/* Created 11/9 by Gavin A 
    Sets up an event listener for the digit and non-memory operator buttons */
var digits = document.getElementsByName("digit");
for (let e of digits) { 
    e.addEventListener('click', function() { 
        appendDigit(this); 
    });
}
var numOps = document.getElementsByName("operator");
for (let e of numOps) { 
    e.addEventListener('click', function() { 
        appendDigit(this); 
    });
}
document.getElementsByName("eval")[0].addEventListener("click", equate);
document.getElementsByName("clear")[0].addEventListener("click", clear);
document.getElementsByName("clearE")[0].addEventListener("click", clearEntry);

// Module for jest testing
module.exports = [multiply, mPush, mSub, add, subtraction, clear, addToHistory, displayHistory, division, exponentiation];
