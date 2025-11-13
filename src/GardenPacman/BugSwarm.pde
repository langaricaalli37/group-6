// allison langarica | BugSwarm | nov 13 2025

int TILE_SIZE = 40;
int BUG_COUNT = 5;  
int BUG_SPEED = 2;


class Bug {
  float x, y;
  color c;
  String mode; 

  Bug(float x_, float y_, color c_, String mode_) {
    x = x_;
    y = y_;
    c = c_;
    mode = mode_;
  }

  void move(Pacman p) {
    float dx = p.x - x;
    float dy = p.y - y;

    if (mode.equals("chase")) {
      
      if (abs(dx) > abs(dy)) x += BUG_SPEED * (dx > 0 ? 1 : -1);
      else y += BUG_SPEED * (dy > 0 ? 1 : -1);
    } else if (mode.equals("run")) {
     
      if (abs(dx) > abs(dy)) x -= BUG_SPEED * (dx > 0 ? 1 : -1);
      else y -= BUG_SPEED * (dy > 0 ? 1 : -1);
    }

    
    x = constrain(x, 0, width - TILE_SIZE);
    y = constrain(y, 0, height - TILE_SIZE);
  }

  void display() {
    float cx = x + TILE_SIZE/2;
    float cy = y + TILE_SIZE/2;

   
    fill(c);
    ellipse(cx, cy, TILE_SIZE * 0.8, TILE_SIZE * 0.6);

    
    fill(0);
    ellipse(cx, cy - TILE_SIZE * 0.35, TILE_SIZE * 0.4, TILE_SIZE * 0.3);

    
    stroke(0);
    strokeWeight(2);
    line(cx - TILE_SIZE*0.1, cy - TILE_SIZE*0.5, cx - TILE_SIZE*0.2, cy - TILE_SIZE*0.7);
    line(cx + TILE_SIZE*0.1, cy - TILE_SIZE*0.5, cx + TILE_SIZE*0.2, cy - TILE_SIZE*0.7);
    noStroke();
  }

  void switchMode() {
    if (mode.equals("chase")) mode = "run";
    else mode = "chase";
  }

  boolean checkCollision(Pacman p) {
    float d = dist(x + TILE_SIZE/2, y + TILE_SIZE/2, p.x, p.y);
    return d < TILE_SIZE * 0.5;
  }
}


class Bugs {
  ArrayList<Bug> swarm;

  Bugs(int count) {
    swarm = new ArrayList<Bug>();
    for (int i = 0; i < count; i++) {
      float bx = random(width - TILE_SIZE);
      float by = random(height - TILE_SIZE);
      color bc = color(random(50, 255), random(50, 255), random(50, 255));
      swarm.add(new Bug(bx, by, bc, "chase"));
    }
  }

  void moveAll(Pacman p) {
    for (Bug b : swarm) b.move(p);
  }

  void displayAll() {
    for (Bug b : swarm) b.display();
  }

  void switchAllModes() {
    for (Bug b : swarm) b.switchMode();
  }

  boolean checkCollisions(Pacman p) {
    for (Bug b : swarm) {
      if (b.checkCollision(p)) return true;
    }
    return false;
  }
}
