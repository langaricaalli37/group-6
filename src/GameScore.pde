// Simple Score Display Example with Top-Left Scores

int bugsEaten = 0;
int pelletsEaten = 0;

void setup() {
  size(600, 400);
  textSize(15);
  fill(0);
}

void draw() {
  background(200, 220, 255);

  // Display scores in top-left
  fill(0);
  textAlign(LEFT, TOP);
  text("Bugs Eaten: " + bugsEaten, 20, 20);
  text("Pellets Eaten: " + pelletsEaten, 20, 60);
}

// Example: Increase scores with keys
void keyPressed() {
  if (key == 'b' || key == 'B') {
    bugsEaten++;
  } else if (key == 'p' || key == 'P') {
    pelletsEaten++;
  } else if (key == 'r' || key == 'R') {
    // Reset scores
    bugsEaten = 0;
    pelletsEaten = 0;
  }
}
