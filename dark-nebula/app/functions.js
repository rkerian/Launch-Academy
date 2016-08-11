exports = (typeof window === 'undefined') ? global : window;

exports.functionsAnswers = {
  isPrime : function(num) {
    for(var i = 2; i < num; i++) {
      if(num % i === 0) { return false;}
      else { return true; }
    }
  },

  arraySum : function(array) {
    var sum = array.reduce(function(a,b) { return a + b; }, 0);
    return sum;
  },

  fizzBuzz : function(num) {
    var result = "";
    if (typeof num === "number") {
      if (num % 15 === 0) { result = "fizzbuzz"; }
      else if (num % 5 === 0) { result = "buzz"; }
      else if (num % 3 === 0) { result =  "fizz"; }
      else { result = num; }
    } else { result = false; }
    return result;
    // write a function that receives a number as its argument;
    // if the number is divisible by 3, the function should return 'fizz';
    // if the number is divisible by 5, the function should return 'buzz';
    // if the number is divisible by 3 and 5, the function should return
    // 'fizzbuzz';
    //
    // otherwise the function should return the number, or false if no number
    // was provided or the value provided is not a number
  }
};
