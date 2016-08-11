exports = (typeof window === 'undefined') ? global : window;

exports.stringsAnswers = {
  reduceString: function(str, amount) {
    var re = new RegExp("(.)(?=\\1{" + amount + "})","g");
    return str.replace(re, "");
  },

  wordWrap: function(str, cols) {
    var formatted_string = "";
    var word_array = [];

    word_array = str.split(' ');
    formatted_string = word_array[0];

    for(var i = 1; i< word_array.length; i++) {
      if (word_array[i].length > cols) {
        formatted_string += "\n" + word_array[i];
      } else {
        if ((formatted_string.length + word_array[i].length) > cols) {
          formatted_string += "\n" + word_array[i];
        } else {
          formatted_string += " " + word_array[i];
        }
      }
    }
    return formatted_string;

  },
  reverseString: function(str) {
    var reversed = "";

    for (var i = str.length - 1; i >= 0; i--) {
      reversed += str[i];
    }
  return reversed;
  }
};
