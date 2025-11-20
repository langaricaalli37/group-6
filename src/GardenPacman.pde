/// allison langarica | nov 13 2025 | GardenPacman

ArrayList<Berries> berries;
PacMan pac;
int score;
Map gameMap;

void setup() {
  size(500, 500);
  gameMap = new Map();
  pac = new PacMan(width/2, height/2);
  
  berries = new ArrayList<Berries>();

berries = new ArrayList<Berries>();

for (PVector p : gameMap.generateBerrySpots()) {
  berries.add(new Berries(p.x, p.y));
}

  score = 0;

img = loadImage("gardenpacman.png");
  myFont = createFont("STHeitiSC-Medium", 48);

 btnStart = new Button("PLAY GAME", 180, 230, 160, 50);
}

void draw() {
  background(#65C665);

  gameMap.display();
  pac.move();
  pac.display();

background(230);
  switch(screen) {
  case 's':
    drawStart();
    break;
  case 'p':
    drawPlay();
    break;
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

void drawStart() {
  background(255);
  image(img, 0, 0);
  btnStart.display();
  //btnPause.display();
}
