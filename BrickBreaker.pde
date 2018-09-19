Ball ball;
Paddle paddle;
ArrayList<Brick> bricks;
boolean isWin = false;
boolean isLose = false;
int lives = 3;

void init() {
  ball = new Ball(width/2, height/2);
  paddle = new Paddle();
  bricks = new ArrayList<Brick>();

  for (int i = 0; i<6; i++) {
    bricks.add(new Brick(i*101, 50, 3, color(125, 35, 74)));
  }
  
  isWin = false;
  isLose = false;
  lives = 3;
}

void setup() {
  size(600, 600);
  init();
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
  
  ball.update();
  ball.paddleCollision(paddle);
  ball.show();
  
  paddle.update();
  paddle.show();
  
  for (int i = bricks.size()-1; i>=0; i--) {
    bricks.get(i).isHit(ball);   
    bricks.get(i).show();
    if (bricks.get(i).isDead) {
      bricks.remove(i);
    }
  }
  if (bricks.size() == 0 && !isWin) {
    isWin = true;
    println("YOU WIN");
  }
  if (lives == 0 && !isLose) {
    isLose = true; 
    println("GAME OVER");
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
