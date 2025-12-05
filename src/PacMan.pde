// Kayla Langarica | PacMan | nov 2025
class PacMan {
  float x, y;
  float w=20, h=20;
  float xSpeed=0;
  float ySpeed=0;

  boolean pacmanDead = false;

  PacMan( float x, float y) {
    this.x=x;
    this.y=y;
  }

  void display () {
    if (!pacmanDead) {
      fill (#FA90DA);
      ellipse (x, y, w, h);
    }
  }

  void move () {
     if (pacmanDead) return;

    // Try new intended positions
    float newX = x + xSpeed;
    float newY = y + ySpeed;

    // Check horizontal movement
    if (!gameMap.isInsideWall(newX, y)) {
      x = newX;
    }

    // Check vertical movement
    if (!gameMap.isInsideWall(x, newY)) {
      y = newY;
    }
    x = constrain(x, w/2, width - w/2 );
    y = constrain(y, h/2, height - h/2);
  }
  void setDirection (float dx, float dy ) {
    if (!pacmanDead) {
      xSpeed = dx;
      ySpeed = dy;
    }
  }
  void die() {
    pacmanDead = true;
  }
}
