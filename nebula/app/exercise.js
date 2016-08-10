exports = (typeof window === 'undefined') ? global : window;

/**
 * This file defines an object with some methods. Some of these methods are
 * populated incorrectly; your job is to fix them. Other methods are not
 * populated at all; your job is to fill them out.
 */

exports.eveningExerciseAnswers = {
  indexOf : function(arr, item) {
    return arr.indexOf(item);
  },

  sum : function(arr) {
    return arr.reduce( (prev, curr) => prev + curr );
  },

  remove : function(arr, item) {
    return arr.filter(function(itm){return itm!==item});
  },

  reverseString : function(str) {
    return str.split('').reverse().join('');
  },

  longestSubString : function(str) {
    function longer(short, long) {
      return (short.length > long.length) ? short: long;
    }

    var words = str.split(' ');
    return words.reduce(longer);
  },

  letterMoveForward : function(str) {
    var alphabet = "a b c d e f g h i j k l m n o p q r s t u v w x y z";
    var alpha_arry = alphabet.split(" ");

    var str_arry = str.split("");
    var new_arry = [];
    for (i = 0; i < str_arry.length; i++) {
      var check_character = str_arry[i];

      if (check_character == "z") {
        new_arry.push("a");
      }

      else if (alpha_arry.includes(check_character)) {
        var check_index = alpha_arry.indexOf(check_character);
        new_arry.push(alpha_arry[check_index + 1]);
      }
      else {
        new_arry.push(check_character);
      }
    }
    return new_arry.join('');
  },

  capitalizeWords : function(str) {
    return str.replace(/\w\S*/g, function(txt){return txt.charAt(0).toUpperCase() + txt.substr(1).toLowerCase();});
  }
};
