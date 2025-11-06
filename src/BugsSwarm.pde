// Pac-Man vs Bugs Game (Processing Java Mode) — multiple bugs

// --- Game constants ---
int TILE_SIZE = 40;
int cols = 15;
int rows = 15;
int WIDTH = TILE_SIZE * cols;
int HEIGHT = TILE_SIZE * rows;

PacMan pacman;
Bugs bugs;
int modeTimer = 0;
int frameLimit = 40; // roughly every 4 seconds at 10 FPS
String direction = "";
boolean gameOver = false;

// --- Base class for both entities ---
class Entity {
  int x, y;
  color c;

  Entity(int x, int y, color c) {
    this.x = x;
    this.y = y;
    this.c = c;
  }

  void display() {
    fill(c);
    noStroke();
    ellipse(x + TILE_SIZE/2, y + TILE_SIZE/2, TILE_SIZE * 0.9, TILE_SIZE * 0.9);
  }
}

// --- Pac-Man class ---
class PacMan extends Entity {
  PacMan(int x, int y, color c) {
    super(x, y, c);
  }

  void move(String dir) {
    if (dir.equals("UP") && y - TILE_SIZE >= 0) {
      y -= TILE_SIZE;
    } else if (dir.equals("DOWN") && y + TILE_SIZE < HEIGHT) {
      y += TILE_SIZE;
    } else if (dir.equals("LEFT") && x - TILE_SIZE >= 0) {
      x -= TILE_SIZE;
    } else if (dir.equals("RIGHT") && x + TILE_SIZE < WIDTH) {
      x += TILE_SIZE;
    }
  }

  void display() {
    // Draw Pac-Man shape (open mouth)
    fill(c);
    noStroke();
    float cx = x + TILE_SIZE/2;
    float cy = y + TILE_SIZE/2;
    arc(cx, cy, TILE_SIZE * 0.9, TILE_SIZE * 0.9, radians(30), radians(330), PIE);
  }
}

// --- Single Bug class ---
class Bug extends Entity {
  String mode;

  Bug(int x, int y, color c, String mode) {
    super(x, y, c);
    this.mode = mode;
  }

  void move(PacMan p) {
    int dx = p.x - x;
    int dy = p.y - y;

    if (mode.equals("chase")) {
      // Move closer to Pac-Man
      if (abs(dx) > abs(dy)) {
        x += TILE_SIZE * (dx > 0 ? 1 : -1);
      } else {
        y += TILE_SIZE * (dy > 0 ? 1 : -1);
      }
    } else if (mode.equals("run")) {
      // Move away from Pac-Man
      if (abs(dx) > abs(dy)) {
        x -= TILE_SIZE * (dx > 0 ? 1 : -1);
      } else {
        y -= TILE_SIZE * (dy > 0 ? 1 : -1);
      }
    }

    // Stay within bounds
    x = constrain(x, 0, WIDTH - TILE_SIZE);
    y = constrain(y, 0, HEIGHT - TILE_SIZE);
  }

  void display() {
    // Draw a little bug with body, head, and antennae
    float cx = x + TILE_SIZE/2;
    float cy = y + TILE_SIZE/2;

    // Body
    fill(c);
    ellipse(cx, cy, TILE_SIZE * 0.8, TILE_SIZE * 0.6);

    // Head
    fill(0);
    ellipse(cx, cy - TILE_SIZE * 0.35, TILE_SIZE * 0.4, TILE_SIZE * 0.3);

    // Antennae
    stroke(0);
    strokeWeight(2);
    line(cx - TILE_SIZE * 0.1, cy - TILE_SIZE * 0.5, cx - TILE_SIZE * 0.2, cy - TILE_SIZE * 0.7);
    line(cx + TILE_SIZE * 0.1, cy - TILE_SIZE * 0.5, cx + TILE_SIZE * 0.2, cy - TILE_SIZE * 0.7);
    noStroke();
  }

  void switchMode() {
    if (mode.equals("chase")) mode = "run";
    else mode = "chase";
  }
}

// --- Bugs class (manages multiple Bug objects) ---
class Bugs {
  ArrayList<Bug> swarm;

  Bugs(int count) {
    swarm = new ArrayList<Bug>();
    for (int i = 0; i < count; i++) {
      int bx = int(random(cols)) * TILE_SIZE;
      int by = int(random(rows)) * TILE_SIZE;
      color bc = color(random(50, 255), random(100, 255), random(50, 200));
      swarm.add(new Bug(bx, by, bc, "chase"));
    }
  }

  void moveAll(PacMan p) {
    for (Bug b : swarm) {
      b.move(p);
    }
  }

  void displayAll() {
    for (Bug b : swarm) {
      b.display();
    }
  }

  void switchAllModes() {
    for (Bug b : swarm) {
      b.switchMode();
    }
  }

  boolean checkCollision(PacMan p) {
    for (Bug b : swarm) {
      if (collides(p, b)) {
        return true;
      }
    }
    return false;
  }
}

// --- Window settings ---
void settings() {
  size(WIDTH, HEIGHT);
}

void setup() {
  frameRate(10);
  pacman = new PacMan(WIDTH/2 - TILE_SIZE/2, HEIGHT/2 - TILE_SIZE/2, color(255, 255, 0));
  bugs = new Bugs(4); // number of bugs in the swarm
}

void draw() {
  background(#77CE86);

  if (!gameOver) {
    if (!direction.equals("")) {
      pacman.move(direction);
    }

    bugs.moveAll(pacman);

    // Switch bug modes periodically
    modeTimer++;
    if (modeTimer > frameLimit) {
      bugs.switchAllModes();
      modeTimer = 0;
    }

    // Check collision with any bug
    if (bugs.checkCollision(pacman)) {
      gameOver = true;
    }
  }

  // Draw entities
  pacman.display();
  bugs.displayAll();

  // Display text
  fill(0, 255, 255);
  textSize(20);
  textAlign(LEFT, TOP);
  if (!gameOver) {
    text("Bugs chasing Pac-Man!", 10, 10);
  } else {
    fill(255, 0, 0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("💀 GAME OVER 💀", WIDTH/2, HEIGHT/2);
  }
}

void keyPressed() {
  if (gameOver) {
    // Restart game when any key is pressed after death
    setup();
    gameOver = false;
    direction = "";
    return;
  }

  if (keyCode == UP) direction = "UP";
  else if (keyCode == DOWN) direction = "DOWN";
  else if (keyCode == LEFT) direction = "LEFT";
  else if (keyCode == RIGHT) direction = "RIGHT";
}

// --- Collision detection ---
boolean collides(PacMan p, Bug b) {
  float distance = dist(p.x, p.y, b.x, b.y);
  return distance < TILE_SIZE * 0.5;
}
