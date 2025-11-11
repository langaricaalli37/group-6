// Sadikshya Kuikel Map

void setup() {
  size(500, 500);
}

void draw() {
  background(#65C665);

  // Walls
  fill(#269626);

  // Top border
  rect(0, 0, 500, 20);

  // Bottom border
  rect(0, 480, 500, 20);

  // Left border
  rect(0, 0, 20, 500);

  // Right border
  rect(480, 0, 20, 500);

  // Inner maze walls
  rect(60, 0, 20, 40);
  rect(30, 40, 30, 20);
  rect(30, 100, 50, 20);
  rect(60, 100, 20, 40);
  rect(110, 120, 20, 20);
  rect(160, 120, 20, 20);
  rect(180, 75, 20, 40);
  rect(200, 55, 20, 20);
 
  // Added walls for a more complete maze
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
}
