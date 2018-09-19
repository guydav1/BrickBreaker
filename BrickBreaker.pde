Ball ball;
Paddle paddle;
ArrayList<Brick> bricks;
boolean isWin;
boolean isLose;
int lives;
int rows, cols;
Brick b = new Brick(0, 0, 0, 0);

float playableAreaX;
float playableAreaY;
float hitTimer;

void init() {
  ball = new Ball(width/2, height/2 -100);
  paddle = new Paddle();
  bricks = new ArrayList<Brick>();
  print(playableAreaY, rows, cols);

  for (int i = 0; i<rows; i++) {
    for (int j =0; j<cols; j++) {      
      bricks.add(new Brick(j*b.w, i*b.h+50, (int)random(1, 4), color(255)));
    }
  }

  isWin = false;
  isLose = false;
  lives = 3;
}

void setup() {
  size(600, 600);
  playableAreaX = width;
  playableAreaY = height/3;
  rows = floor(playableAreaY/b.h);
  cols = floor(width/b.w);

  init();
  hitTimer = 0;
  noStroke();
}

void mousePressed() {
  if (ball.vel.x == 0 && ball.vel.y == 0)
    ball.vel.set(0, ball.speed);// = (new PVector (mouseX, mouseY)) ;
  if (isLose) {
    init();
  }
}
void draw() {

  background(51);
  drawLives(lives);
  if (lives == -1 && !isLose) {
    isLose = true; 
    println("GAME OVER");
    return;
  } else if (isWin) {
    return;
  }

  ball.update();
  ball.paddleCollision(paddle);
  ball.show();

  paddle.update();
  paddle.show();

  for (int i = bricks.size()-1; i>=0; i--) {
    Brick brick = bricks.get(i);
    if (ball.brickCollision(brick) && millis() - hitTimer > 50) {
      hitTimer = millis();
      brick.level--;
      if (brick.level == 0) {
        brick.isDead = true;
      }
      ball.vel.y *= -1;
    }

    brick.show();
    if (brick.isDead) {
      bricks.remove(i);
    }
  }
  if (bricks.size() == 0 && !isWin) {
    isWin = true;
    println("YOU WIN");
  }
}

void drawLives(int lives) { 
  int r = (int)ball.r;
  color col = ball.col;
  for (int i=0; i<lives; i++) {
    fill(col);
    ellipse( i*(r*2+r)+r, r*2, r*2, r*2);
  }
}
