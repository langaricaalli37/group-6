/// allison langarica | nov 13 2025 | GardenPacman

char screen = 's';   // s = start, m = menu, t = settings, p = play, u = pause, g = game over, a = app stats
Button btnStart, btnMenu, btnSettings, btnBack, btnPause;
PImage img;
PFont myFont;

ArrayList<Berries> berries;
ArrayList<Flowers> flowers;
PacMan pac;
int score;
Map gameMap;

void setup() {
  size(500, 500);
  gameMap = new Map();
  pac = new PacMan(width/2, height/2);
  img = loadImage("gardenpacman.png");
  myFont = createFont("STHeitiSC-Medium", 48);

  btnStart = new Button("PLAY GAME", 180, 230, 160, 50);
  
  berries = new ArrayList<Berries>();
  berries.add(new Berries(100, 100));
  berries.add(new Berries(200, 150));

flowers = new ArrayList<Flowers>();
  flowers.add(new Flowers(100, 60));
  flowers.add(new Flowers(300, 50));
  flowers.add(new Flowers(200, 150));
  flowers.add(new Flowers(400, 350));
  flowers.add(new Flowers(120, 400));
  
  score = 0;
}

void draw() {
  background(#65C665);

  gameMap.display();
  pac.move();
  pac.display();

  switch(screen) {
  case 's':
    drawStart();
    break;
  case 'p':
    drawPlay();
    break;



  for (int i = 0; i < berries.size(); i++) {
    Berries b = berries.get(i);
    b.display();

    if (dist(pac.x, pac.y, b.x, b.y) < 20) {
      berries.remove(b);
      score++;
      break;
    }
  }
for (Flowers f : flowers) {
    f.display();
  }
  
  fill(0);
  textSize(20);
  text("Score: " + score, 10, 30);
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
  }
}
// Sadikshya Kuikel Start Screen
void drawStart() {
  background(255);
  image(img, 0, 0);
  btnStart.display();
  //btnPause.display();
}
