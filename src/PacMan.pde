

class PacMan {
  // Member variables 
  float x, y;       
  int radius;       
  int dirX, dirY;   
  float mouthAngle; 
  float mouthSpeed; 

  // Constructor
  PacMan(float startX, float startY, int r) {
    x = startX;
    y = startY;
    radius = r;
    dirX = 1;
    dirY = 0;
    mouthAngle = 0.5;
    mouthSpeed = 0.05;
  }

  // Display method 
  void display() {
    fill(#FFD1F4); 
    noStroke();

    pushMatrix();
    translate(x, y);

    // Rotate Pac-Man based on direction
    if (dirX == -1) { // left
      rotate(PI);
    } else if (dirY == -1) { // up
      rotate(PI + HALF_PI);
    } else if (dirY == 1) { // down
      rotate(HALF_PI);
    }

    // Draw Pac-Man body with animated mouth
    arc(0, 0, radius, radius, mouthAngle, TWO_PI - mouthAngle);
    popMatrix();
  }

  // Move method
  void move() {
    x += dirX * 2;
    y += dirY * 2;

    // mouth
    mouthAngle += mouthSpeed;
    if (mouthAngle > 0.8 || mouthAngle < 0.2) {
      mouthSpeed *= -1;
    }

    // Wrap around edges
    if (x > width + radius) x = -radius;
    if (x < -radius) x = width + radius;
    if (y > height + radius) y = -radius;
    if (y < -radius) y = height + radius;
  }

  // KeyPressed 
  void keyPressed(char key, int keyCode) {
    if (key == CODED) {
      if (keyCode == LEFT) {
        dirX = -1; dirY = 0;
      } else if (keyCode == RIGHT) {
        dirX = 1; dirY = 0;
      } else if (keyCode == UP) {
        dirX = 0; dirY = -1;
      } else if (keyCode == DOWN) {
        dirX = 0; dirY = 1;
      }
    } else {
      // WASD
      if (key == 'a' || key == 'A') {
        dirX = -1; dirY = 0;
      } else if (key == 'd' || key == 'D') {
        dirX = 1; dirY = 0;
      } else if (key == 'w' || key == 'W') {
        dirX = 0; dirY = -1;
      } else if (key == 's' || key == 'S') {
        dirX = 0; dirY = 1;
      }
    }
  }
}
