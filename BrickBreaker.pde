Ball b;
Paddle p;
ArrayList<Obstacle> obstacles;



void setup() {
  size(600, 600);
  b = new Ball(width/2, height/2);
  p = new Paddle();
  obstacles = new ArrayList<Obstacle>();
  for (int i = 0; i<6; i++) {

    obstacles.add(new Obstacle(i*100+1, 50, 1, 0));
  }
}

void mousePressed() {
  b.applyForce(new PVector (0, 4)) ;
}
void draw() {
  background(51);
  stroke(0);
  noFill();
  b.update();
  b.paddleCollision(p);
  b.show();
  p.update();
  p.show();
  for (int i = obstacles.size()-1; i>=0; i--) {
    obstacles.get(i).show();
    obstacles.get(i).isHit(b);

    if (obstacles.get(i).isDead) {
      obstacles.remove(i);
    }
  }
  if (obstacles.size() == 0) {
    println("YOU WIN");
  }
}
