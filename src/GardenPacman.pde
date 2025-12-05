/// allison langarica | nov 13 2025 | GardenPacman

ArrayList<Bug> bugs;
ArrayList<Berries> berries;
PacMan pac;
int score;
Map gameMap;
char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnStart, btnMenu, btnSettings, btnBack, btnPause, btnOver;
PImage img ,imgGameOver;
PFont myFont;

void setup() {
  size(500, 500);
  gameMap = new Map();
  pac = new PacMan(width/2, height/2);

  berries = new ArrayList<Berries>();
  berries = new ArrayList<Berries>();
  bugs = new ArrayList<Bug>();

  // example: spawn 3 bugs far away from PacMan
  for (int i = 0; i < 3; i++) {
    float bx, by;
    do {
      bx = random(width);
      by = random(height);
    } while (dist(bx, by, pac.x, pac.y) < 120);

    bugs.add(new Bug(bx, by));
  }

  for (PVector p : gameMap.generateBerrySpots()) {
    berries.add(new Berries(p.x, p.y));
  }

  score = 0;

  img = loadImage("gardenpacman.png");
  imgGameOver= loadImage("deadpac.png");
  myFont = createFont("STHeitiSC-Medium", 48);

  btnStart = new Button("PLAY GAME", 180, 230, 160, 50);
  btnOver= new Button ("Game Over",220,150,160,50);
}

void draw() {

  switch(screen) {

  case 's':
    drawStart();
    break;

  case 'g':
    drawGameOver();
    break;

  case 'p':
    background(#65C665);


    gameMap.display();
    pac.move();
    pac.display();

    for (Bug bug : bugs) {
      bug.move(pac);
      bug.display();

      if (bug.hits(pac)) {
        screen = 'g';  // game over
      }
    }



    for (int i = 0; i < berries.size(); i++) {
      Berries b = berries.get(i);
      b.display();

      if (dist(pac.x, pac.y, b.x, b.y) < 20) {
        berries.remove(b);
        score++;
        break;
      }
    }

    fill(0);
    textSize(20);
    text("Score: " + score, 60, 9);
    break;
  }
}

void keyPressed() {
  if (keyCode == UP)    pac.setDirection(0, -4);
  if (keyCode == DOWN)  pac.setDirection(0, 4);
  if (keyCode == LEFT)  pac.setDirection(-4, 0);
  if (keyCode == RIGHT) pac.setDirection(4, 0);
}

void mousePressed() {
  switch(screen) {
  case 's':
    if (btnStart.clicked()) {
      screen = 'p';
      break;
    }
      case 'g':  // Game Over screen button
      if(btnOver.clicked()){
        screen = 's';
      }
      break;
  }
}

void drawStart() {
  background(255);
  image(img, 0, 0);
  btnStart.display();
  //btnPause.display();
}

void drawPlay() {
}
void drawGameOver() {
  background(0);
  text("GAME OVER SCREEN (fill this in)", 200, 200);
  image(imgGameOver,0,0);
  btnOver.display();
}
