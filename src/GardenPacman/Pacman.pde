// kayla langarica | Pacman |nov 13 2025
class Pacman {
  float x, y;       
  float size;        
  float speed;       
  color c;          
  float mouthAngle;  
  boolean mouthOpening; 

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
    
    x += speed;
    if (x > width + size/2) {
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
    fill(c);
    noStroke();
    arc(x, y, size, size, mouthAngle, TWO_PI - mouthAngle, PIE);
  }
  void move(String dir) {
  if (dir.equals("UP") && y - size/2 > 0) y -= speed;
  else if (dir.equals("DOWN") && y + size/2 < height) y += speed;
  else if (dir.equals("LEFT") && x - size/2 > 0) x -= speed;
  else if (dir.equals("RIGHT") && x + size/2 < width) x += speed;
}
}
