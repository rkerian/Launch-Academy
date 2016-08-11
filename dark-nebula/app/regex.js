exports = (typeof window === 'undefined') ? global : window;

exports.regexAnswers = {
  containsNumber : function(str) {
    var matches = str.match(/\d+/g);
      if (matches != null) {
        return true;
      } else { return false; }
  },

  containsRepeatingLetter : function(str) {
    var repeats = (/([a-z])\1/i);
    return repeats.test(str);
  },

  endsWithVowel : function(str) {
    var char = str.slice(-1);
    return (/^[aeiou]$/i).test(char);
  },

  captureThreeNumbers : function(str) {
    var regex = (/\d{3}?/gi);
    var result = regex.exec(str);
    if (result != null && result != "undefined") {
      return String(result[0]);
    } else { return false; }
  },

  matchesPattern : function(str) {
    var phoneNumber = str.match(/^[(]{0,1}[0-9]{3}[)]{0,1}[-\s\.]{0,1}[0-9]{3}[-\s\.]{0,1}[0-9]{4}$/);
      if(phoneNumber != null){
        phoneNumber = true;
      }
      else{
       phoneNumber = false;
      }
      return phoneNumber;
 },

  isUSD : function(str) {
    return (/^[$](\d{1,3}([,]\d{3})*)+(([.]\d{2}$)|$)/).test(str);
  }
};
