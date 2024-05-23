// bezier: a game
// by: bug creates
// start date: may 2024
// date last modified: may 2024

/********* VARIABLES *********/

// 0: Initial Screen
// 1: Game Screen
// 2: Win Screen
// 3: Lose Screen

int gameScreen = 0;

// goal changes with where the mouse is clicked

int goalx = 720 - 20;
int goaly = 20;

// collision lines

int bez1_x1 = 0;
int bez1_y1 = 0;
int bez1_x2 = 720;
int bez1_y2 = 720;

int bez2_x1 = 0;
int bez2_y1 = 0;
int bez2_x2 = 720;
int bez2_y2 = 720;

// mouse and goal color and size

int r = 255;
int g = 255;
int b = 255;

int radius = 35;

// time

float seconds = 0;
float last = 0;
float best = -1;

// import and sound setup

import processing.sound.*;
Sound s;

TriOsc tri1 = new TriOsc(this);
TriOsc tri2 = new TriOsc(this);
TriOsc tri3 = new TriOsc(this);
TriOsc tri4 = new TriOsc(this);
WhiteNoise noise = new WhiteNoise(this);

/********* SETUP BLOCK *********/

void setup() {
  size(720,720);
}

/********* DRAW BLOCK *********/

void draw() {
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    winScreen();
  } else if (gameScreen == 3) {
    loseScreen();
  }
  
  noise.play();
  noise.amp(10/getDistance(bez1_x1,bez1_y1,bez1_x2,bez1_y2,mouseX,mouseY).z);
  tri1.play(mouseX/2+100,.05);
  tri2.play(mouseY/2+100,.05);
  tri3.play(mouseX/2+125,.05);
  tri4.play(mouseY/2+125,.05);
}

/********* SCREEN CONTENTS *********/

void initScreen() {
  background(0);
  
  // text
  textAlign(CENTER);
  fill(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  text("bezier: a game by bug creates",width/2,height/2);
  
  // outline
  stroke(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  strokeWeight(2);
  line(5,5,width-5,5);
  line(width-5,5,width-5,height-5);
  line(width-5,height-5,5,height-5);
  line(5,height-5,5,5);
  
  // option to save opening screen still:
  //noLoop();
  //save("bezierStillOpen4.png");
}

void gameScreen() {
  background(0);
  strokeWeight(2);
  
  // beziers
  stroke(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  fill(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  bezier(bez1_x1,bez1_y1,int(random(width)),int(random(height)),int(random(width)),int(random(height)),bez1_x2,bez1_y2);
  if (bez1_x1 > 0 && bez1_x1 < width) {
    bez1_x1 += int(random(-10,10));
  } else if (bez1_x1 <= 0) {
    bez1_x1 += int(random(1,10));
  } else {
    bez1_x1 += int(random(-10,-1));
  }
  if (bez1_y1 > 0 && bez1_y1 < height) {
    bez1_y1 += int(random(-10,10));
  } else if (bez1_y1 <= 0) {
    bez1_y1 += int(random(1,10));
  } else {
    bez1_y1 += int(random(-10,-1));
  }
  if (bez1_x2 > 0 && bez1_x2 < width) {
    bez1_x2 += int(random(-10,10));
  } else if (bez1_x2 <= 0) {
    bez1_x2 += int(random(1,10));
  } else {
    bez1_x2 += int(random(-10,-1));
  }
  if (bez1_y2 > 0 && bez1_y2 < height) {
    bez1_y2 += int(random(-10,10));
  } else if (bez1_y2 <= 0) {
    bez1_y2 += int(random(1,10));
  } else {
    bez1_y2 += int(random(-10,-1));
  }
  
  stroke(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  fill(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  bezier(bez2_x1,bez2_y1,int(random(width)),int(random(height)),int(random(width)),int(random(height)),bez2_x2,bez2_y2);
  if (bez2_x1 > 0 && bez2_x1 < width) {
    bez2_x1 += int(random(-10,10));
  } else if (bez2_x1 <= 0) {
    bez2_x1 += int(random(1,10));
  } else {
    bez2_x1 += int(random(-10,-1));
  }
  if (bez2_y1 > 0 && bez2_y1 < height) {
    bez2_y1 += int(random(-10,10));
  } else if (bez2_y1 <= 0) {
    bez2_y1 += int(random(1,10));
  } else {
    bez2_y1 += int(random(-10,-1));
  }
  if (bez2_x2 > 0 && bez2_x2 < width) {
    bez2_x2 += int(random(-10,10));
  } else if (bez2_x2 <= 0) {
    bez2_x2 += int(random(1,10));
  } else {
    bez2_x2 += int(random(-10,-1));
  }
  if (bez2_y2 > 0 && bez2_y2 < height) {
    bez2_y2 += int(random(-10,10));
  } else if (bez2_y2 <= 0) {
    bez2_y2 += int(random(1,10));
  } else {
    bez2_y2 += int(random(-10,-1));
  }
  
  // outline
  stroke(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  line(5,5,width-5,5);
  line(width-5,5,width-5,height-5);
  line(width-5,height-5,5,height-5);
  line(5,height-5,5,5);
  
  // mouse
  r = int(random(100,255));
  g = int(random(100,255));
  b = int(random(100,255));
  radius = int(random(10,60));
  stroke(r,g,b);
  fill(r,g,b);
  ellipse(mouseX,mouseY,radius,radius);
  ellipse(goalx,goaly,radius,radius);
  
  // end game
  if (getDistance(bez1_x1,bez1_y1,bez1_x2,bez1_y2,mouseX,mouseY).z < 10 || mouseX < 5 || mouseX > width - 5 || mouseY < 5 || mouseY > height - 5) {
    loseGame();
  } else if (getDistance(bez2_x1,bez2_y1,bez2_x2,bez2_y2,mouseX,mouseY).z < 10 || mouseX < 5 || mouseX > width - 5 || mouseY < 5 || mouseY > height - 5) {
    loseGame();
  } else if (dist(goalx,goaly,mouseX,mouseY) < 10) {
    seconds = millis() - last;
    if (best == -1 || seconds < best) {
      best = seconds;
    }
    winGame();
  }
  
  // option to save screenshot:
  //noLoop();
  //save("bezierStill4.png");
}

void loseScreen() {
  background(0);
  
  // text
  textAlign(CENTER);
  fill(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  text("you lose!",width/2,height/2);
  
  // outline
  stroke(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  strokeWeight(2);
  line(5,5,width-5,5);
  line(width-5,5,width-5,height-5);
  line(width-5,height-5,5,height-5);
  line(5,height-5,5,5);
}
void winScreen() {
  background(0);
  
  // text
  textAlign(CENTER);
  fill(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  text("you win!",width/2,height/2);
  text(nfc(round(seconds))+" seconds",width/2,height*2/3);
  text("best: "+nfc(round(best)),width/2,height*3/4);
  
  // outline
  stroke(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  strokeWeight(2);
  line(5,5,width-5,5);
  line(width-5,5,width-5,height-5);
  line(width-5,height-5,5,height-5);
  line(5,height-5,5,5);
}

/********* INPUTS *********/

public void mouseReleased() {
  if (gameScreen == 0 || gameScreen == 2 || gameScreen == 3) {
    startGame();
    last = millis();
  }
}

/********* OTHER FUNCTIONS *********/

// get distance from mouse to bezier base line
PVector getDistance( float x1, float y1, float x2, float y2, float x, float y ){
  PVector result = new PVector(); 
  
  float dx = x2 - x1; 
  float dy = y2 - y1; 
  float d = sqrt( dx*dx + dy*dy ); 
  float ca = dx/d; // cosine
  float sa = dy/d; // sine 
  
  float mX = (-x1+x)*ca + (-y1+y)*sa; 
  
  if( mX <= 0 ){
    result.x = x1; 
    result.y = y1; 
  }
  else if( mX >= d ){
    result.x = x2; 
    result.y = y2; 
  }
  else{
    result.x = x1 + mX*ca; 
    result.y = y1 + mX*sa; 
  }
  
  dx = x - result.x; 
  dy = y - result.y; 
  result.z = sqrt( dx*dx + dy*dy );
  
  return result;   
}

// This method sets the necessary variables to start the game  
void startGame() {
  if (mouseX + (height-mouseY) > width) {
      goalx = 20;
      goaly = height - 20;
    } else {
      goalx = width - 20;
      goaly = 20;
    }
  gameScreen=1;
}

void winGame() {
  gameScreen=2;
}

void loseGame() {
  gameScreen=3;
}
