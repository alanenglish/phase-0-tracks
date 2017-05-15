// RELEASE 0 - FIND THE LONGEST PHRASE
// Create function that has parameter to take array
// Analyze the length of each string in the array
// Compare these lengths to the other strings
// Return the longest string

function longestPhrase(array) {
  phrase = array[0]
  for (i = 1; i < array.length; i ++) {
    if (array[i].length > phrase.length) {
      phrase = array[i];
    }
  }
  return phrase
};


var puppies = ["Harper", "Fido", "Riley"]
var languages = ["JavaScript", "Ruby", "Python", "HTML", "CSS"]
var comedians = ["Aziz Ansari", "Dave Chappelle", "Jerry Seinfeld", "Chris Rock"]
console.log(longestPhrase(puppies))
console.log(longestPhrase(languages))
// In this example Jerry and Dave are equal length, so it returns Dave - curious 
// as to how I would get this program to return both
console.log(longestPhrase(comedians))