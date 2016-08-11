exports = (typeof window === 'undefined') ? global : window;

exports.arraysAnswers = {

  removeWithoutCopy : function(arr, item) {
    for(var i = arr.length - 1; i >= 0; i--) {
      if(arr[i] === item) {
        arr.splice(i, 1);
      }
    }
    return arr;
  },

  append : function(arr, item) {
    arr.push(item);
    return arr;
  },

  truncate : function(arr) {
    arr.pop();
    return arr;
  },

  prepend : function(arr, item) {
    arr.unshift(item);
    return arr;
  },

  curtail : function(arr) {
    arr.shift();
    return arr;
  },

  concat : function(arr1, arr2) {
    return arr1.concat(arr2);
  },

  insert : function(arr, item, index) {
    arr.splice(index, 0, item);
    return arr;
  },

  count : function(arr, item) {
    var count = 0;
    for(var i = 0; i < arr.length; i++) {
      if (arr[i] === item) { count += 1;}
    }
    return count;
  },

  duplicates : function(arr) {
    var sorted_arr = arr.slice().sort();

    var results = [];
    for (var i = 0; i < arr.length - 1; i++) {
      if (sorted_arr[i + 1] == sorted_arr[i]) {
        results.push(sorted_arr[i]);
      }
    }
    return Array.from(new Set(results));
  },

  square : function(arr) {
    return arr.map(function (x) {
      return Math.pow(x, 2);
    });
  },

  findAllOccurrences : function(arr, target) {
    var indexes = [], i;
    for(i=0; i < arr.length; i++)
      if (arr[i] === target)
          indexes.push(i);
      return indexes;
  }
};
