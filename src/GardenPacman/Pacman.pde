// kayla langarica | Pacman |nov 13 2025
class Pacman {
  float x, y, w, h, speed;
  float  size;
  float mouthAngle;
  boolean mouthOpening;

  Pacman(float x,float  y,float  size) {
    this. x = x;
    this.y = y;
    this. size = size;
    w= 45;
    h=45;
    speed = 3;
      mouthAngle = PI / 6;
    mouthOpening = true;
  }

  void update() {

    x += speed;
    if (x > width  + size/2) {
      x = -size/2;
    }
    
    if (mouthOpening) {
      mouthAngle += 0.02;
      if (mouthAngle > PI / 3) mouthOpening = false;
    } else {
      mouthAngle -= 0.02;
      if (mouthAngle < PI / 10) mouthOpening = true;
    }
  }

  void display() {
    fill(#FFCEF0);
    TnoStroke();
   arc(x, y, w, h, mouthAngle, TWO_PI - mouthAngle, PIE);
    
  }
  void move(String dir) {
    if (dir.equals("UP") && y - size/2 > 0) y -= speed;
    else if (dir.equals("DOWN") && y + size/2 < height) y += speed;
    else if (dir.equals("LEFT") && x - size/2 > 0) x -= speed;
    else if (dir.equals("RIGHT") && x + size/2 < width) x += speed;
  }
}
