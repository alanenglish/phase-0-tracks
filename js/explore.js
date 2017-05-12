// Define a function that takes a string as a parameter
// Create a new variable inside the method, set equal to an empty string
// Create a for loop that will start at the end of the string
// For each letter, add them to the new variable
// Once each letter has been looped over, return the new variable

function reverse(string) {
  stringReverse = ''
  for (i = (string.length-1); i>=0; i--) {
    stringReverse += string[i]
  }
  return stringReverse
}

// console.log(reverse("hello"))

var newVariable = reverse("Alan")

console.log(newVariable)

