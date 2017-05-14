// 7.2 Pair Session with Kristina Vragovic

var colors = ["green", "pink", "blue", "yellow"]

var names = ["Ed", "Murray", "Charlie", "Brownie"]

colors.push("orange")
console.log(colors)

names.push("Stardust")
console.log(names)

// Create an object of horses

rainbow_horses = {}

function combine(name, color) {
  rainbow_horses[name] = color
}

// combine("Stardust", "orange")
// console.log(rainbow_horses)

for (var i=0; i < names.length; i++) {
  combine(names[i], colors[i])
}

console.log(rainbow_horses)

// Write a constructor function for a car

function Car(model, color) {
  console.log("New car:", this)
  this.model = model;
  this.color = color; 
  this.age = 0;
  this.vroom = function() { console.log("Vvvvrrrrrrooooooooooom!"); };
};

var firstCar = new Car("Porsche", "sporty red");
firstCar.age = 2
console.log(firstCar);
firstCar.vroom();

var anotherCar = new Car("Station wagon", "wood-paneled");
anotherCar.age = 26
console.log(anotherCar);
anotherCar.vroom();

var thirdCar = new Car("Toyota Camry", "champagne");
thirdCar.age = 10
console.log(thirdCar);
thirdCar.vroom();

var fourthCar = new Car("Prius", "blue");
fourthCar.age = 2
console.log(fourthCar);
fourthCar.vroom();

// If you wanted to loop thru the keys and values of an object, how would you do that?

function showObject(obj) {
  for (var p in obj) {
    if( obj.hasOwnProperty(p) ) {
      console.log(p + ", " + obj[p])
    } 
  }              
}

showObject(rainbow_horses)

// Advantages/disadvantages to using constructor functions to create objects? 

// Advantage: Can create multiple instances, as with a class in Ruby
// Advantage: Can act as a blueprint (again, like Ruby)
// Advantage: Can have variables that are NOT read/writeable -- in a literal constructor, anything can be rewritten 