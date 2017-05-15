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

// RELEASE 1 - FIND A KEY-VALUE MATCH
// Create function that takes parameter of two objects
// Create new variable and set to false
// Analyze key-value pairs to try to find a match
// Return true if their is a match between the two objects
// Return false if their is no match

function findMatch(obj1, obj2) {
  var matchFound = false
  for (var i in obj1) {
    if (obj1.hasOwnProperty(i) && obj1[i] === obj2[i]) {
      matchFound = true;
    }
  }
  return matchFound
}

// RELEASE 2 - GENERATE RANDOM TEST DATA
// Create a function that takes an integer as the parameter, which will be the
// number of random words that the function will create
// Create a variable and set equal to empty array
// Create alphabet string, which will be used to build the random word
// Use for loop to create as many words as equal to the length of integer parameter
// Create a random word variable and set equal to empty string
// Create random length variable (use search to figure this out)
// Once random number has been selected, iterate over alphabet string and add the
// selected letters to the random word variable
// Push the random word variable to the array created at the top of the function

function generateRandom(integer) {
  var wordsArray = [];
  var alphabet = "abcdefghijklmnopqrstuvwxyz";
  for (var i = 0; i < integer; i++) {
    var randomWord = ""
    var randomLength = (Math.floor(Math.random() * 10) + 1);
    for (var x = 1; x < randomLength; x++) {
      randomWord += alphabet[Math.floor(Math.random() * alphabet.length)]
    };
    wordsArray.push(randomWord)
  };
return wordsArray
};

// DRIVER CODE - KEEP BELOW FUNCTIONS

// console.log(findMatch({name: "Steven", age: 54}, {name: "Tamir", age: 54}))
// console.log(findMatch({animal: "Dog", legs: 4}, {animal: "Dog", legs: 3}))
// // My matchFound function only works when comparing two key-value pairs it seems like
// // I will have to come back and fix this at some point.
// var doggies = {name: "Harper", age: 1}
// var kitties = {name: "Harper", age: 4}
// console.log(findMatch(doggies, kitties))

// var puppies = ["Harper", "Fido", "Riley"]
// var languages = ["JavaScript", "Ruby", "Python", "HTML", "CSS"]
// var comedians = ["Aziz Ansari", "Dave Chappelle", "Jerry Seinfeld", "Chris Rock"]
// console.log(longestPhrase(puppies))
// console.log(longestPhrase(languages))
// // In this example Jerry and Dave are equal length, so it returns Dave - curious 
// // as to how I would get this program to return both
// console.log(longestPhrase(comedians))

// console.log(generateRandom(3))
for (var n = 0; n < 10; n++) {
  var driverCode = generateRandom(3);
  console.log(driverCode);
  console.log(longestPhrase(driverCode));
};