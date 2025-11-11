//Kayla Langarica | 3B 
class Pac {
  float x, y;        
  int r;             // Radius
  float mouth = 0.5; // Mouth angle
  float mouthSpeed = 0.05;
  int dirX = 1, dirY = 0; // Direction

  // Constructor
  Pac(float x, float y, int r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }

  // Display method
  void display() {
    mouth += mouthSpeed;
    if (mouth > 0.8 || mouth < 0.2) mouthSpeed *= -1;

    pushMatrix();
    translate(x, y);
    if (dirX == -1) rotate(PI);
    else if (dirY == -1) rotate(PI + HALF_PI);
    else if (dirY == 1) rotate(HALF_PI);
    fill(#FFD1F4);
    noStroke();
    arc(0, 0, r, r, mouth, TWO_PI - mouth);
    popMatrix();
  }

  // Move method
  void move() {
    x += dirX * 2;
    y += dirY * 2;

    // Wrap around screen
    if (x > width + r) x = -r;
    if (x < -r) x = width + r;
    if (y > height + r) y = -r;
    if (y < -r) y = height + r;
  }
}
