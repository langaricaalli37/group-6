class Bug {
  float x, y;
  float speed = 1.5;

  Bug(float startX, float startY) {
    x = startX;
    y = startY;
  }

  void move(PacMan pac) {
    // Move toward PacMan
    float dx = pac.x - x;
    float dy = pac.y - y;

    float d = dist(x, y, pac.x, pac.y);

    // Avoid divide-by-zero
    if (d != 0) {
      x += (dx / d) * speed;
      y += (dy / d) * speed;
    }
  }

  void display() {
    fill(255, 0, 0);   // red bug
    ellipse(x, y, 20, 20);
  }

  boolean hits(PacMan pac) {
    return dist(x, y, pac.x, pac.y) < 20;
  }
}
