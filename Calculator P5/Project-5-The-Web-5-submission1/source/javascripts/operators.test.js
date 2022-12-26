/* File created 11/1 by Gavin A 
 File edited 11/3 by Gavin A: switched to javascript 
 File edited 11/9 by Amyas D: added tests for subtraction, clear, add to history, and display history
 */
const multiply = require('./operators')[0], 
      mPush = require('./operators')[1],
      mSub = require('./operators')[2],
      add = require('./operators')[3],
      subtraction = require('./operators')[4],
      clear = require('./operators')[5],
      addToHistory = require('./operators')[6],
      displayHistory = require('./operators')[7],
      division = require('.operators')[8],
      expenontiation = require('./operators')[9];

/* Tests created 11/1 by Gavin A
Edited 11/3 by Gavin A: Switched to JS */
test('multiply 1 * 2 = 2', () => {
    expect(multiply(1, 2)).toBe(2);
});
test('multiply 1 * 0 = 0', () => {
    expect(multiply(1, 0)).toBe(0);
});
test('multiply 0 * 5 = 0', () => {
    expect(multiply(0, 5)).toBe(0);
});
test('multiply -2 * -1 = 2', () => {
    expect(multiply(-2, -1)).toBe(2);
});
test('multiply -5 * 20 = -100', () => {
    expect(multiply(-5, 20)).toBe(-100);
});
test('multiply 10 * -15 = -150', () => {
    expect(multiply(10, -15)).toBe(-150);
});

/* Tests created 11/3 by Gavin A */
test('push 0 to empty memory array', () => {
    var mem = [], num = 0;
    mPush(mem, num);
    expect(mem.length).toBe(1);
    expect(mem[0]).toBe(0);
});
test('push 1 to an array of length 1', () => {
    var mem = [0], num = 1;
    mPush(mem, num);
    expect(mem.length).toBe(2);
    expect(mem[0]).toBe(1);
});
test('push -5 to an array of length 2', () => {
    var mem = [3, 6], num = -5;
    mPush(mem, num);
    expect(mem.length).toBe(3);
    expect(mem[0]).toBe(-5);
});

/* Tests created 11/3 by Gavin A */
test('subtract 0 from 10 in the first entry in memory', () => {
    var mem = [10], num = 0;
    mSub(mem, num);
    expect(mem.length).toBe(1);
    expect(mem[0]).toBe(10);
});
test('subtract -4 from zero the first entry in memory', () => {
    var mem = [0], num = -4;
    mSub(mem, num);
    expect(mem.length).toBe(1);
    expect(mem[0]).toBe(4);
});
test('subtract 200 from the first entry in memory', () => {
    var mem = [3, 6], num = 200;
    mSub(mem, num);
    expect(mem.length).toBe(2);
    expect(mem[0]).toBe(-197);
});

/* Tests created 11/9 by Roberto D */
test('add 2 + 2 = 4', () => {
    expect(add(2, 2)).toBe(4);
});
test('add -1 + -1 = -2', () => {
    expect(add(-1, -1)).toBe(-2);
});
test('add 19 + -19 = 0', () => {
    expect(add(19, -19)).toBe(0);
});
test('add -100 + 1000 = 900', () => {
    expect(add(-100, 1000)).toBe(900);
});
test('add 0 + 0 = 0', () => {
    expect(add(0, 0)).toBe(0);
});

/* Tests created 11/9 by Roberto D */
test('powOf 3 ^ 3 = 27', () => {
    expect(powOf(3, 3)).toBe(27);
});
test('powOf -2 ^ 2 = 4', () => {
    expect(powOf(-2, -2)).toBe(-4);
});
test('powOf 4 ^ -1 = 0.25', () => {
    expect(powOf(4, -1)).toBe(0.25);
});
test('powOf 0 ^ 0 = 0', () => {
    expect(powOf(0, 0)).toBe(1);
});

/* subtraction() tests created 11/9 by Amyas D*/
test('subtract 2 - 2 = 0', () => {
    expect(subtraction(2, 2)).toBe(0);
});
test('subtract -2 - -2 = 0', () => {
    expect(subtraction(-2, -2)).toBe(0);
});
test('subtract 19 - -19 = 38', () => {
    expect(subtraction(19, -19)).toBe(38);
});
test('subtract -100 - 1000 = -1100', () => {
    expect(subtraction(-100, 1000)).toBe(-1100);
});
test('subtract 0 - 0 = 0', () => {
    expect(subtraction(0, 0)).toBe(0);
});

/* clear() tests created 11/9 by Amyas D*/
test('clear 0 + 2 = 2 should clear the display and expression', () => {
    document.getElementById("display").value = "2"; 
    document.getElementById("expdisp").innerHTML = "0+2=";
    clear();
    expect(clear().toBe(document.getElementById("display").value = "0",
    document.getElementById("expdisp").innerHTML = ""))
})
/* Tests created 11/9 by Quantez Merchant */

test('divide 2 / 2 = 1', () => {
    expect(division(2, 2)).toBe(1);
});
test('divide -2 / 2 = -1', () => {    
    expect(division(-2, 2)).toBe(-1);
});
test('divide 4.5 / 2 = 2.25', () => {
    expect(division(4.5, 2)).toBe(2.25);
});
test('divide 2 / 0 = infinity', () => {
    expect(division(2, 0)).toBe(Infinity);
});