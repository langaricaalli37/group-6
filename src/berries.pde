// camilla codell | Nov 12 25 | Berries and grid
class Berries {
  float x, y;      // berry position
  float size = 7;  // berry size

  Berries(float x, float y) {
    this.x = x;
    this.y = y;
  }

  void display() {
    fill(255, 0, 0);
    noStroke();
    ellipse(x, y, size, size);
  }
}
