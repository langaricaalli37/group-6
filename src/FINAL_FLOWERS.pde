float x = 0;          
float y = 250;       
float mouthAngle = 0; 
boolean opening = true;

void setup() {
  size(800, 500);
  smooth();
}

void draw() {
  background(0);

 
  x += 3;
  if (x > width + 50) {
    x = -50;  
  }

 
  if (opening) {
    mouthAngle += 2;
    if (mouthAngle >= 45) opening = false;
  } else {
    mouthAngle -= 2;
    if (mouthAngle <= 0) opening = true;
  }

  drawPacman(x, y, 80, mouthAngle);
}

void drawPacman(float px, float py, float r, float angle) {
  fill(255, 255, 0);
  noStroke();
  arc(px, py, r, r, radians(angle), radians(360 - angle), PIE);
}
