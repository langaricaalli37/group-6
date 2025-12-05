// ========================
// COMMON CLASSES (used by both examples)
// ========================

class Wall {
  float x, y, r;
  
  Wall(float x, float y, float r) {
    this.x = x;
    this.y = y;
    this.r = r;
  }
  
  // Returns true if this Wall collides with the player
  boolean intersects(Player p) {
    return dist(x, y, p.x, p.y) < r + p.r;
  }
  
  // Optional: Wall-Wall intersection
  boolean intersects(Wall other) {
    return dist(x, y, other.x, other.y) < r + other.r;
  }
  
  void display() {
    fill(255, 0, 0);
    noStroke();
    rect(x, y, r*2, r*2);
  }
}
