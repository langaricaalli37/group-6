// Camilla | Nov 14 25 | Berries and Grid
ArrayList<float[]> walls = new ArrayList<float[]>();

void setup() {
  size(500, 500);

  // Border
  Wall(0, 0, 500, 20); 
  Wall(0, 480, 500, 20);
  Wall(0, 0, 20, 500);
  Wall(480, 0, 20, 500);
  // top left
  Wall(20, 100, 50, 20);
  Wall(60, 100, 20, 40);
  Wall(120, 120, 20, 20);
  Wall(160, 120, 20, 20);
  Wall(180, 80, 20, 40);
  Wall(200, 60, 20, 20);
// bottom half
  Wall(260, 60, 20, 100);
  Wall(300, 80, 80, 20);
  Wall(380, 40, 20, 60);
  Wall(100, 180, 300, 20);
  Wall(100, 220, 20, 100);
  Wall(380, 220, 20, 100);
  Wall(160, 300, 200, 20);
  Wall(240, 320, 20, 100);
  Wall(60, 400, 100, 20);
  Wall(340, 400, 100, 20);
  Wall(200, 440, 100, 20);
}

void draw() {
  background(#65C665);

  // Draw walls
  fill(#269626);
  for (float[] r : walls) {
    rect(r[0], r[1], r[2], r[3]);
  }

  // Grid
  int gridSize = 20;
  stroke(0,100);

for (int x = 0; x <= width; x += gridSize) {
    line(x, 0, x, height);
  }
  for (int y = 0; y <= height; y += gridSize) {
    line(0, y, width, y);
  }
  //for (int x = 0; x <= width; x += gridSize) line(x, 0, x, height);
  //for (int y = 0; y <= height; y += gridSize) line(0, y, width, y);
  // Berries
  fill(255, 0, 0);
  noStroke();
  float berrySize = 7;

  for (int x = 0; x < width; x += gridSize) {
    for (int y = 0; y < height; y += gridSize) {

      float cx = x + gridSize / 2.0;
      float cy = y + gridSize / 2.0;

      if (!isInsideWall(cx, cy)) {
        ellipse(cx, cy, berrySize, berrySize);
      }
    }
  }
}

void Wall(float x, float y, float w, float h) {
  walls.add(new float[]{x, y, w, h});
}

boolean isInsideWall(float x, float y) {
  for (float[] r : walls) {
    if (x >= r[0] && x <= r[0] + r[2] &&
      y >= r[1] && y <= r[1] + r[3]) {
      return true;
    }
  }
  return false;
}
