class Ball {

  PVector pos;
  PVector vel;
  PVector acc;
  PVector jump = new PVector(0, -2);
  float r = 10;

  float speed = 7;

  Ball(PVector pos) {
    this.pos = pos;
    vel = new PVector(0, 0);
    acc = new PVector(0, 0);
  }

  Ball(float x, float y) {
    pos = new PVector();
    pos.x = x;
    pos.y = y;
    vel = new PVector(3, speed);
    acc = new PVector(0, 0);
  }

  void applyForce(PVector force) {
    acc.add(force);
  }

  void update() {
    vel.add(acc);
    pos.add(vel);
    acc.set(0, 0);

    if (this.pos.x>width-r || pos.x<r) {
      vel.x *= -1;
    } else if (pos.y<r || pos.y>height-r) {
      vel.y *= -1;
    }
  }

  void show() {
    //fill(255);
    //noStroke();
    ellipse(pos.x, pos.y, r*2, r*2);
  }

  void paddleCollision(Paddle p) {
    if (pos.y > p.pos.y-r && pos.x > p.pos.x-r && pos.x < p.pos.x+p.w+r && vel.y>0){
      float dif = pos.x - (p.pos.x + p.w/2);
      float angle = map(dif,-p.w/2,p.w/2,220,320);      
      angle = radians(angle);
      vel.x = speed * cos(angle);
      vel.y = speed * sin(angle);
    }
  }
  
  
}
