// kayla langarica |       | Pacman
class Pacman {
  float x, y;        // position
  float size;        // diameter
  float speed;       // movement speed
  color c;           // color
  float mouthAngle;  // mouth opening angle
  boolean mouthOpening; // track mouth animation state

  Pacman(float x_, float y_, float size_) {
    x = x_;
    y = y_;
    size = size_;
    speed = 3;
    c = color(255, 105, 180); // pink!
    mouthAngle = PI / 6;
    mouthOpening = true;
  }

  void update() {
    // move right across the screen
    x += speed;
    if (x > width + size/2) {
      x = -size/2; // wrap around
    }

    // animate mouth opening and closing
    if (mouthOpening) {
      mouthAngle += 0.02;
      if (mouthAngle > PI / 3) mouthOpening = false;
    } else {
      mouthAngle -= 0.02;
      if (mouthAngle < PI / 10) mouthOpening = true;
    }
  }

  void display() {
    fill(c);
    noStroke();
    arc(x, y, size, size, mouthAngle, TWO_PI - mouthAngle, PIE);
  }
}
