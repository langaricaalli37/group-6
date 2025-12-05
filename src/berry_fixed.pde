ArrayList<float[]> walls = new ArrayList<float[]>();
Player player;

void setup() {
  size(500, 500);
  player = new Player(width/2, height-50, 25);

  // Border
  addWall(0, 0, 500, 20);
  addWall(0, 480, 500, 20);
  addWall(0, 0, 20, 500);
  addWall(480, 0, 20, 500);

  // top left
  addWall(20, 100, 50, 20);
  addWall(60, 100, 20, 40);
  addWall(120, 120, 20, 20);
  addWall(160, 120, 20, 20);
  addWall(180, 80, 20, 40);
  addWall(200, 60, 20, 20);

  // bottom half
  addWall(260, 60, 20, 100);
  addWall(300, 80, 80, 20);
  addWall(380, 40, 20, 60);
  addWall(100, 180, 300, 20);
  addWall(100, 220, 20, 100);
  addWall(380, 220, 20, 100);
  addWall(160, 300, 200, 20);
  addWall(240, 320, 20, 100);
  addWall(60, 400, 100, 20);
  addWall(340, 400, 100, 20);
  // spot for ghosts
  addWall(120, 200, 260, 100);
}

void draw() {
  background(#65C665);

  float prevX = player.x;
  float prevY = player.y;

  if (keyPressed) {
    if (key == 'w' || key == 'W') player.y -= player.speed;
    if (key == 's' || key == 'S') player.y += player.speed;
    if (key == 'a' || key == 'A') player.x -= player.speed;
    if (key == 'd' || key == 'D') player.x += player.speed;
  }

  player.x = constrain(player.x, player.r, width  - player.r);
  player.y = constrain(player.y, player.r, height - player.r);

  if (playerCollides()) {
    player.x = prevX;
    player.y = prevY;
  }

  player.display();

  fill(#269626);
  for (float[] r : walls) rect(r[0], r[1], r[2], r[3]);

  // grid
  int gridSize = 20;
  stroke(0, 100);
  for (int x = 0; x <= width; x += gridSize) line(x, 0, x, height);
  for (int y = 0; y <= height; y += gridSize) line(0, y, width, y);

  // berry
  fill(255, 0, 0);
  noStroke();
  float berrySize = 7;

  for (int x = 0; x < width; x += gridSize) {
    for (int y = 0; y < height; y += gridSize) {
      float cx = x + gridSize/2.0;
      float cy = y + gridSize/2.0;
      if (!InWall(cx, cy)) ellipse(cx, cy, berrySize, berrySize);
    }
  }

  fill(#65C665);
  rect(121, 201, 259, 99);
}

// ---------------------------------------------------------------------------
// WALL FUNCTIONS
// ---------------------------------------------------------------------------
void addWall(float x, float y, float w, float h) {
  walls.add(new float[]{x, y, w, h});
}

boolean InWall(float x, float y) {
  for (float[] r : walls) {
    if (x >= r[0] && x <= r[0] + r[2] &&
      y >= r[1] && y <= r[1] + r[3]) {
      return true;
    }
  }
  return false;
}

// Circle–rectangle collision for the player
boolean playerCollides() {
  float px = player.x;
  float py = player.y;
  float pr = player.r;

  for (float[] r : walls) {
    float rx = r[0], ry = r[1], rw = r[2], rh = r[3];

    float closestX = constrain(px, rx, rx + rw);
    float closestY = constrain(py, ry, ry + rh);

    float dx = px - closestX;
    float dy = py - closestY;

    if (dx*dx + dy*dy < pr*pr) return true;
  }
  return false;
}
