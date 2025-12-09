//Maya Hadlock 

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
  // Small flowers
fill(#FF69B4); // pink color for petals
noStroke();
ellipse(100, 60, 10, 10);

ellipse(200, 150, 10, 10);
ellipse(400, 350, 10, 10);
ellipse(120, 400, 10, 10);

fill(#FFFF00); // yellow center
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
fill(#D13A3A); // red cap
ellipse(160, 420, 12, 10);
fill(#FFF1C1); // stem
rect(158, 420, 4, 8);
// Mushroom at top-right corner
fill(#D13A3A); // red cap
ellipse(440, 60, 12, 10); // cap
fill(#FFF1C1); // stem
rect(438, 60, 4, 8); // stem

}
