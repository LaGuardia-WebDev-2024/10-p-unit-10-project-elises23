var starXPos = [];
var starYPos = [];
var star = "⭐️";
var starTotal = 100;

var planetXPos = [];
var planetYPos = [];
var planet = "🪐";
var planetTotal = 3;
var planetFound = 0;

setup = function() {
   size(600, 450); 
   reset();
};

draw = function(){   
   if(keyPressed){
    if(key == 'r'){
      reset();
    }
   }
  display();
};

// mouseClicked interaction to find planets
mouseClicked = function(){
  check(mouseX, mouseY);
};

var check = function(xClick, yClick){

  for(var i = 0; i < planetXPos.length; i++){
    if(dist(xClick - 5, yClick - 5, planetXPos[i], planetYPos[i]) < 15){
      planetXPos.splice(i, 1);
      planetYPos.splice(i, 1);
      planetFound++;
    }
  }
};

var display = function(){
  background(20, 20, 40); // Darker space background

  //Adding "Space Dust"
  var dustX = 10;
  while(dustX < 600){
    fill(255, 255, 255, 100);
    ellipse(dustX, 10, 2, 2);
    dustX += 50; // Spacing out the dust particles
  }

  textSize(20);
  for(var i = 0; i < planetXPos.length; i ++){
    text(planet, planetXPos[i], planetYPos[i]);
  }

  for(var i = 0; i < starXPos.length; i ++){
    text(star, starXPos[i], starYPos[i]);
  }

  fill(0,0,0);
  rect(0, 400, 600, 50);
  fill(255,255,255);
  text("Find The " + planet + "s   |   " + planet + " " + planetFound + "/" + planetTotal, 20, 430);

  if(planetFound == planetTotal){
    fill(0, 200, 200);
    textSize(50);
    text("YOU WON!\nPress 'r' to restart", 100, 200);
  }
};

var reset = function(){
  starXPos = [];
  starYPos = [];
  planetXPos = [];
  planetYPos = [];
  planetFound = 0;

  for(var i = 0; i < starTotal; i++){
    starXPos.push(random(0, 600));
    starYPos.push(random(0, 400));
  }

  for(var i = 0; i < planetTotal; i++){
    planetXPos.push(random(0, 600));
    planetYPos.push(random(0, 400));
  }
};