class Player {
  float x, y, r, speed;

  Player(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
    this.speed = 3;
  }

  void display() {
    fill(255, 255, 0);
    ellipse(x, y, r*2, r*2);
  }
}
