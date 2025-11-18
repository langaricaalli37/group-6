//Sadikshya Kuikel | Map Class |

class Map {
  int x, y, w, h;
  color wallColor = color(38, 150, 38);
  color bgColor = color(101, 198, 101);
  ArrayList<float[]> wallList = new ArrayList<float[]>();

  Map() {
    setupWalls();
  }

  void display() {
    background(bgColor);
    fill(wallColor);
    noStroke();

    // Borders
    rect(0, 0, 500, 20);
    rect(0, 480, 500, 20);
    rect(0, 0, 20, 500);
    rect(480, 0, 20, 500);

    // Maze
    rect(60, 0, 20, 40);
    rect(30, 40, 30, 20);
    rect(30, 100, 50, 20);
    rect(60, 100, 20, 40);
    rect(110, 120, 20, 20);
    rect(160, 120, 20, 20);
    rect(180, 75, 20, 40);
    rect(200, 55, 20, 20);
    rect(250, 40, 20, 100);
    rect(300, 80, 80, 20);
    rect(380, 40, 20, 60);
    rect(100, 180, 300, 20);
    rect(100, 220, 20, 100);
    rect(380, 220, 20, 100);
    rect(160, 300, 200, 20);
    rect(240, 320, 20, 100);
    rect(60, 400, 100, 20);
    rect(340, 400, 100, 20);
    rect(200, 440, 100, 20);

    // Small flowers
    fill(#FF69B4);
    ellipse(100, 60, 10, 10);
    ellipse(200, 150, 10, 10);
    ellipse(400, 350, 10, 10);
    ellipse(120, 400, 10, 10);
    fill(#FFFF00);
    ellipse(100, 60, 5, 5);
    ellipse(200, 150, 5, 5);
    ellipse(400, 350, 5, 5);
    ellipse(120, 400, 5, 5);

    // Stones
    fill(#CFCFCF);
    ellipse(50, 460, 8, 5);
    ellipse(70, 460, 8, 5);
    ellipse(430, 40, 8, 5);
    ellipse(450, 40, 8, 5);

    // Mushrooms
    fill(#D13A3A);
    ellipse(160, 420, 12, 10);
    fill(#FFF1C1);
    rect(158, 420, 4, 8);
    fill(#D13A3A);
    ellipse(440, 60, 12, 10);
    fill(#FFF1C1);
    rect(438, 60, 4, 8);

    // Vines
    stroke(#1F7A1F);
    strokeWeight(2);
    noFill();
    beginShape();
    vertex(10, 50);
    bezierVertex(5, 100, 15, 150, 10, 200);
    endShape();
    beginShape();
    vertex(490, 100);
    bezierVertex(495, 150, 485, 200, 490, 250);
    endShape();
    beginShape();
    vertex(50, 10);
    bezierVertex(100, 5, 150, 15, 200, 10);
    endShape();
    beginShape();
    vertex(300, 490);
    bezierVertex(350, 495, 400, 485, 450, 490);
    noStroke();

    // Starting screen in images
  }
  void setupWalls() {
    wallList.add(new float[]{0, 0, 500, 20});
    wallList.add(new float[]{0, 480, 500, 20});
    wallList.add(new float[]{0, 0, 20, 500});
    wallList.add(new float[]{480, 0, 20, 500});

    // ADD ALL the same wall rects you use in display()
    wallList.add(new float[]{60, 0, 20, 40});
    wallList.add(new float[]{30, 40, 30, 20});
    wallList.add(new float[]{30, 100, 50, 20});
    wallList.add(new float[]{60, 100, 20, 40});
    wallList.add(new float[]{110, 120, 20, 20});
    wallList.add(new float[]{160, 120, 20, 20});
    wallList.add(new float[]{180, 75, 20, 40});
    wallList.add(new float[]{200, 55, 20, 20});
    wallList.add(new float[]{250, 40, 20, 100});
    wallList.add(new float[]{300, 80, 80, 20});
    wallList.add(new float[]{380, 40, 20, 60});
    wallList.add(new float[]{100, 180, 300, 20});
    wallList.add(new float[]{100, 220, 20, 100});
    wallList.add(new float[]{380, 220, 20, 100});
    wallList.add(new float[]{160, 300, 200, 20});
    wallList.add(new float[]{240, 320, 20, 100});
    wallList.add(new float[]{60, 400, 100, 20});
    wallList.add(new float[]{340, 400, 100, 20});
    wallList.add(new float[]{200, 440, 100, 20});
  }
  boolean isInsideWall(float x, float y) {
    for (float[] r : wallList) {
      if (x >= r[0] && x <= r[0] + r[2] &&
        y >= r[1] && y <= r[1] + r[3]) {
        return true;
      }
    }
    return false;
  }
  ArrayList<PVector> generateBerrySpots() {
    ArrayList<PVector> spots = new ArrayList<PVector>();
    int gridSize = 20;
    for (int x = 0; x < 500; x += gridSize) {
      for (int y = 0; y < 500; y += gridSize) {
        float cx = x + gridSize / 2;
        float cy = y + gridSize / 2;
        if (!isInsideWall(cx, cy)) {
          spots.add(new PVector(cx, cy));
        }
      }
    }
    return spots;
  }
}
