// bezier: a game
// by: bug creates
// start date: may 2024
// date last modified: may 2024

/********* VARIABLES *********/

// We control which screen is active by settings / updating
// gameScreen variable. We display the correct screen according
// to the value of this variable.
//
// 0: Initial Screen
// 1: Game Screen
// 2: Win Screen
// 3: Lose Screen

int gameScreen = 0;

int goalx = 900 - 10;
int goaly = 10;

int bez1_x1 = 0;
int bez1_y1 = 0;
int bez1_x2 = 900;
int bez1_y2 = 900;

int bez2_x1 = 0;
int bez2_y1 = 0;
int bez2_x2 = 900;
int bez2_y2 = 900;

int r = 255;
int g = 255;
int b = 255;

int radius = 35;

/********* SETUP BLOCK *********/

void setup() {
  size(900,900);
}

/********* DRAW BLOCK *********/

void draw() {
  // Display the contents of the current screen
  if (gameScreen == 0) {
    initScreen();
  } else if (gameScreen == 1) {
    gameScreen();
  } else if (gameScreen == 2) {
    winScreen();
  } else if (gameScreen == 3) {
    loseScreen();
  }
}


/********* SCREEN CONTENTS *********/

void initScreen() {
  background(0);
  textAlign(CENTER);
  fill(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  text("bezier: a game by bug creates",width/2,height/2);
}
void gameScreen() {
  background(0);
  
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
  
  r = int(random(100,255));
  g = int(random(100,255));
  b = int(random(100,255));
  radius = int(random(10,60));
  stroke(r,g,b);
  fill(r,g,b);
  ellipse(mouseX,mouseY,radius,radius);
  ellipse(goalx,goaly,radius,radius);
  
  if (getDistance(bez1_x1,bez1_y1,bez1_x2,bez1_y2,mouseX,mouseY).z < 5) {
    loseGame();
  } else if (getDistance(bez2_x1,bez2_y1,bez2_x2,bez2_y2,mouseX,mouseY).z < 5) {
    loseGame();
  } else if (dist(goalx,goaly,mouseX,mouseY) < 10) {
    winGame();
  }
}
void loseScreen() {
  background(0);
  textAlign(CENTER);
  fill(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  text("you lose!",width/2,height/2);
}
void winScreen() {
  background(0);
  textAlign(CENTER);
  fill(int(random(100,255)),int(random(100,255)),int(random(100,255)));
  text("you win!",width/2,height/2);
}


/********* INPUTS *********/

public void mouseReleased() {
  // if we are on the initial screen when clicked, start the game
  if (gameScreen==0) {
    startGame();
  }
  if (gameScreen==2 || gameScreen==3) {
    startGame();
  }
}

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

/********* OTHER FUNCTIONS *********/

// This method sets the necessary variables to start the game  
void startGame() {
  if (mouseX + (900-mouseY) > 900) {
      goalx = 10;
      goaly = height - 10;
    } else {
      goalx = 900 - 10;
      goaly = 10;
    }
  gameScreen=1;
}

void winGame() {
  gameScreen=2;
}

void loseGame() {
  gameScreen=3;
}
