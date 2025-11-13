// allison langarica | main tab | nov 13 2025
Pacman player;
Bugs bugs;
int modeTimer = 0;
int frameLimit = 120; 
boolean gameOver = false;
String direction = "";


void setup() {
  size(600, 600);
  player = new Pacman(width/2, height/2, 80);
   bugs = new Bugs(5); 
}

void draw() {
  background(#77CE86);
  if (!gameOver) {
    player.move(direction);
    player.display();

    bugs.moveAll(player);
    bugs.displayAll();

    
    modeTimer++;
    if (modeTimer > frameLimit) {
      bugs.switchAllModes();
      modeTimer = 0;
    }

    
    if (bugs.checkCollisions(player)) {
      gameOver = true;
    }
  } else {
    fill(255,0,0);
    textSize(50);
    textAlign(CENTER, CENTER);
    text("💀 GAME OVER 💀", width/2, height/2);
  }
}

void keyPressed() {
  if (gameOver) {
    
    setup();
    gameOver = false;
    direction = "";
    return;
  }

  if (keyCode == UP) direction = "UP";
  else if (keyCode == DOWN) direction = "DOWN";
  else if (keyCode == LEFT) direction = "LEFT";
  else if (keyCode == RIGHT) direction = "RIGHT";
}

void keyReleased() {
  direction = ""; 
  }
